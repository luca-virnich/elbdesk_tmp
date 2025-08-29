import 'dart:convert';

import 'package:archive/archive.dart';
import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/ae_pilot/services/ae_upload_mock.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine_group/utils/xfile_ext.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ae_upload_controller.g.dart';

/// Provider for the AE Upload Controller
/// Handles PDF file uploads and processing
@riverpod
Future<AEUploadController> aeUploadController(Ref ref) async {
  final globalSettings =
      await ref.watch(fetchAndWatchGlobalSettingsProvider.future);
  return AEUploadController(globalSettings: globalSettings);
}

/// Response data from the PDF upload endpoint
class AEUploadResponse {
  AEUploadResponse({required this.thumbnailPath, required this.xmlPath});

  factory AEUploadResponse.fromJson(Map<String, dynamic> json) {
    final paths = json['pathes'] as Map<String, dynamic>;
    return AEUploadResponse(
      thumbnailPath: paths['thumbnail'] as String,
      xmlPath: paths['xmpinfo'] as String,
    );
  }
  final String thumbnailPath;
  final String xmlPath;
}

/// Service to handle PDF file uploads
class AEUploadController {
  /// Creates a new instance of AEUploadController with GlobalSettings
  AEUploadController({required this.globalSettings});

  final GlobalSettings globalSettings;

  /// Sends an ArtworkQuarantineGroup to AEPilot
  /// Creates a zip file containing all PDF files from the group and sends
  // it to the AE endpoint
  // Returns all quarantines that were sent to the AE
  Future<List<ArtworkQuarantine>?> sendArtworkQuarantineGroupToAE(
    ArtworkQuarantineGroup artworkQuarantineGroup,
    String userName,
  ) async {
    // Check if group has artwork quarantines
    if (artworkQuarantineGroup.artworkQuarantines == null ||
        artworkQuarantineGroup.artworkQuarantines!.isEmpty) {
      throw ElbException(
        exceptionType: ElbExceptionType.conflict,
        message: 'No artwork quarantines found'.hc,
      );
    }

    // Clear all artwork quarantines that aren't set to status "open"
    final clearedArtworkQuarantineGroup = artworkQuarantineGroup.copyWith(
      artworkQuarantines: artworkQuarantineGroup.artworkQuarantines!
          .where(
            (quarantine) =>
                quarantine.general.status == ArtworkQuarantineGroupStatus.open,
          )
          .toList(),
    );

    // Check if group has artwork quarantines with status "open"
    if (clearedArtworkQuarantineGroup.artworkQuarantines == null ||
        clearedArtworkQuarantineGroup.artworkQuarantines!.isEmpty) {
      throw ElbException(
        exceptionType: ElbExceptionType.conflict,
        message: 'No artwork quarantines with status "open" found'.hc,
      );
    }

    // Collect all valid file paths and metadata
    final filePaths = <String>[];
    final artworkMetadata = <ArtworkQuarantine>[];

    try {
      for (final quarantine
          in clearedArtworkQuarantineGroup.artworkQuarantines!) {
        final originalFilePath = quarantine.artworkData.originalFilePath;
        if (originalFilePath != null && originalFilePath.isNotEmpty) {
          // Check if file exists using the extension
          final xFile = XFile(originalFilePath);
          final fileExists = await xFile.exists;
          if (fileExists) {
            filePaths.add(originalFilePath);
            artworkMetadata.add(quarantine);
          } else {
            throw ElbException(
              exceptionType: ElbExceptionType.conflict,
              message: 'Kein valider Dateipfad für Quarantäne '
                      '${quarantine.general.description}'
                  .hc,
            );
          }
        }
      }
    } catch (e) {
      throw ElbException(
        exceptionType: ElbExceptionType.conflict,
        message: 'Fehler beim Validieren der Dateien'.hc,
      );
    }

    if (filePaths.isEmpty) {
      throw ElbException(
        exceptionType: ElbExceptionType.conflict,
        message: 'Keine gültigen Dateipfade gefunden'.hc,
      );
    }

    // Create zip file in memory with PDFs and XML metadata
    final zipBytes = await _createZipWithMetadata(
      filePaths: filePaths,
      clearedArtworkQuarantines: artworkMetadata,
      originalArtworkQuarantines: artworkQuarantineGroup.artworkQuarantines!,
      group: clearedArtworkQuarantineGroup,
      userName: userName,
    );

    // Save zip to Downloads in debug mode or send to AE endpoint
    if (useMockData) {
      await AEUploadMock.saveZipToDownloads(
        zipBytes: zipBytes,
        fileName: '${artworkQuarantineGroup.meta.id}.zip',
      );
    } else {
      await _sendZipToAEEndpoint(
        zipBytes: zipBytes,
        primaryKey: clearedArtworkQuarantineGroup.meta.id?.toString() ?? '',
      );
    }

    // Update cleared quarantines to status "todo"
    final clearedQuarantines = clearedArtworkQuarantineGroup.artworkQuarantines!
        .map(
          (quarantine) => quarantine.copyWith(
            general: quarantine.general.copyWith(
              status: ArtworkQuarantineGroupStatus.todo,
            ),
          ),
        )
        .toList();

    return clearedQuarantines;
  }

  /// Creates a zip file in memory from file paths and includes XML metadata
  Future<List<int>> _createZipWithMetadata({
    required List<String> filePaths,
    required List<ArtworkQuarantine> clearedArtworkQuarantines,
    required List<ArtworkQuarantine> originalArtworkQuarantines,
    required ArtworkQuarantineGroup group,
    required String userName,
  }) async {
    try {
      final archive = Archive();

      // Generate and add general XML metadata file
      final generalXmlContent = _generateGeneralXmlMetadata(group, userName);
      final generalXmlBytes = utf8.encode(generalXmlContent);
      final generalXmlArchiveFile = ArchiveFile(
        'dateneingang.xml',
        generalXmlBytes.length,
        generalXmlBytes,
      );
      archive.addFile(generalXmlArchiveFile);

      // Process PDF files and generate XML metadata in a single loop
      for (var i = 0; i < filePaths.length; i++) {
        final filePath = filePaths[i];
        final artwork = clearedArtworkQuarantines[i];
        final artworkUUID = artwork.general.quarantineUuid;

        final actualGroupIndex = originalArtworkQuarantines.indexWhere(
          (a) => a.general.quarantineUuid == artworkUUID,
        );

        final finalIndex = actualGroupIndex + 1;

        // Add PDF file to archive with indexed naming
        // (This uses the index of the actual group)
        // ArtworkPDFName: <index>_<artworkUUID>.pdf
        try {
          final xFile = XFile(filePath);
          final bytes = await xFile.readAsBytes();
          final indexedFileName = '${finalIndex}_$artworkUUID.pdf';

          // Add file to archive with indexed name
          final archiveFile = ArchiveFile(indexedFileName, bytes.length, bytes);
          archive.addFile(archiveFile);
        } catch (e) {
          // Skip file if it can't be read
          continue;
        }

        // Generate and add individual XML metadata file for this artwork
        final xmlContent = _generateXmlMetadata(artwork, group, finalIndex);
        final xmlBytes = utf8.encode(xmlContent);

        // Create iterated filename for each XML file
        final xmlFileName = '${finalIndex}_$artworkUUID.xml';

        final xmlArchiveFile =
            ArchiveFile(xmlFileName, xmlBytes.length, xmlBytes);
        archive.addFile(xmlArchiveFile);
      }

      // Add all attachments to the zip file in separate folders based on type
      if (group.attachments != null && group.attachments!.isNotEmpty) {
        for (final attachment in group.attachments!) {
          try {
            final xFile = XFile(attachment.path);
            final bytes = await xFile.readAsBytes();
            final fileName = attachment.filename;

            // Determine folder based on attachment type
            String folderName;
            switch (attachment.attachmentType) {
              case SystemFileAttachmentType.order:
                folderName = 'Bestellung';
              case SystemFileAttachmentType.email:
                folderName = 'Email';
              case SystemFileAttachmentType.general:
                folderName = 'Allgemein';
              case null:
                folderName = 'Allgemein';
            }

            // Add file to appropriate folder
            final attachmentPath = '$folderName/$fileName';
            final archiveFile =
                ArchiveFile(attachmentPath, bytes.length, bytes);
            archive.addFile(archiveFile);
          } catch (e) {
            // Skip attachment if it can't be read
            debugPrint('Failed to add attachment ${attachment.filename}: $e');
            continue;
          }
        }
      }

      // Print all archive files in debug console
      for (final file in archive.files) {
        debugPrint('Archive file: ${file.name}');
      }

      // Encode the archive to bytes
      return ZipEncoder().encode(archive);
    } catch (e) {
      throw ElbException(
        exceptionType: ElbExceptionType.conflict,
        message: 'Failed to create zip file',
      );
    }
  }

  /// Generates general XML metadata for the group
  String _generateGeneralXmlMetadata(
    ArtworkQuarantineGroup group,
    String userName,
  ) {
    final buffer = StringBuffer()

      // XML header
      ..writeln('<?xml version="1.0" encoding="UTF-8" standalone="no" ?>')
      ..writeln('<dataentry>')

      // Assigned User ID
      ..writeln(
        '\t<assignedUserID>${group.assignedUser?.userInfoId ?? ""}</assignedUserID>',
      )

      // Assigned User name
      ..writeln(
        '\t<assignedUserName>${group.assignedUser?.fullName ?? ""}</assignedUserName>',
      )

      // Customer name
      ..writeln(
        '\t<customerName>${group.customer?.contact?.general.name ?? ""}</customerName>',
      )

      // Customer ID
      ..writeln('\t<customerID>${group.customer?.customId ?? ""}</customerID>')

      // Customer primary ID
      ..writeln(
        '\t<customerPrimaryID>${group.customer?.meta.id ?? ""}</customerPrimaryID>',
      )

      // Group series number
      ..writeln(
        '\t<serie>${group.selectedProductSeriesId ?? ""}</serie>',
      )

      // Primary key
      ..writeln(
        '\t<dataEntryPrimaryKey>${group.meta.id ?? ""}</dataEntryPrimaryKey>',
      )

      // Unique ID
      // ..writeln('\t<uuID>${group.uniqueFolderId}</uuID>')

      // Created by ID
      ..writeln('\t<createdById>${group.meta.createdById ?? ""}</createdById>')

      // Created by name
      ..writeln('\t<createdBy>$userName</createdBy>')

      // Created at
      ..writeln(
        '\t<createdAt>${group.meta.createdAt?.toIso8601String() ?? ""}</createdAt>',
      )

      // Sent at
      ..writeln(
        '\t<sentAt>${DateTime.now().toIso8601String()}</sentAt>',
      )
      ..writeln('</dataentry>');

    return buffer.toString();
  }

  /// Generates XML metadata for a single artwork
  String _generateXmlMetadata(
    ArtworkQuarantine artwork,
    ArtworkQuarantineGroup group,
    int finalIndex,
  ) {
    final buffer = StringBuffer()

      // XML header
      ..writeln('<?xml version="1.0" encoding="UTF-8" standalone="no" ?>')
      ..writeln('<Dataentry>')

      // * Meta node
      ..writeln('\t<meta>')
      // Assigned User ID
      ..writeln(
        '\t\t<assignedUserID>${group.assignedUser?.userInfoId ?? ""}</assignedUserID>',
      )
      // Assigned User Name
      ..writeln(
        '\t\t<assignedUserName>${group.assignedUser?.fullName ?? ""}</assignedUserName>',
      )
      // Customer ID
      ..writeln(
        '\t\t<customerID>${group.customer?.customId ?? ""}</customerID>',
      )

      // Customer primary ID
      ..writeln(
        '\t\t<customerPrimaryID>${group.customer?.meta.id ?? ""}</customerPrimaryID>',
      )

      // Customer Name
      ..writeln(
        '\t\t<customerName>${group.customer?.contact?.general.name ?? ""}</customerName>',
      )
      // Data Entry Primary Key
      ..writeln(
        '\t\t<dataEntryPrimaryKey>${group.meta.id ?? ""}</dataEntryPrimaryKey>',
      )
      // ArtworkQuarantine-UUID
      ..writeln(
        '\t\t<artworkQuarantineUUID>${artwork.general.quarantineUuid}</artworkQuarantineUUID>',
      )
      ..writeln(
        '\t\t<artworkQuarantinePrimaryKey>${artwork.meta.id}</artworkQuarantinePrimaryKey>',
      )
      // Index+1
      ..writeln('\t\t<index>$finalIndex</index>')
      // FileName (original filename)
      ..writeln('\t\t<fileName>${artwork.fileName ?? ""}</fileName>')
      ..writeln('\t</meta>')

      // * Artwork node
      ..writeln('\t<artwork>')
      // Series
      ..writeln('\t\t<series>${group.selectedProductSeriesId ?? ""}</series>')
      // Height
      ..writeln('\t\t<height>${artwork.artworkData.height}</height>')
      // Width
      ..writeln('\t\t<width>${artwork.artworkData.width}</width>')
      // Corner Radius
      ..writeln(
        '\t\t<cornerRadius>${artwork.artworkData.cornerRadius}</cornerRadius>',
      )
      // Product Type
      ..writeln('\t\t<productType>${group.type?.name ?? ""}</productType>')
      // Main Print Process
      ..writeln(
        '\t\t<mainPrintProcess>${artwork.general.printProcessType?.name ?? ""}</mainPrintProcess>',
      )
      // Front/Back
      ..writeln(
        '\t\t<frontBack>${artwork.general.type?.name ?? ""}</frontBack>',
      )
      // Keywords
      ..writeln(
        '\t\t<keywords>${artwork.general.keywords ?? ""}</keywords>',
      )
      // createdAt
      ..writeln(
        '\t\t<createdAt>${artwork.meta.createdAt?.toIso8601String() ?? ""}</createdAt>',
      )
      // sentAt
      ..writeln('\t\t<sentAt>${DateTime.now().toIso8601String()}</sentAt>')
      ..writeln('\t</artwork>')
      ..writeln('</Dataentry>');

    return buffer.toString();
  }

  /// Sends a zip file to the AE endpoint
  Future<void> _sendZipToAEEndpoint({
    required List<int> zipBytes,
    required String primaryKey,
  }) async {
    // Get endpoint URL from GlobalSettings
    final endpointUrl = globalSettings.data.aeEndpointPath;

    if (endpointUrl.isEmpty) {
      throw ElbException(
        exceptionType: ElbExceptionType.conflict,
        message: 'AE Endpoint URL not configured',
      );
    }

    try {
      // Create a multipart request
      final request = http.MultipartRequest('POST', Uri.parse(endpointUrl));

      // Add the zip file to the request
      final multipartFile = http.MultipartFile.fromBytes(
        'file',
        zipBytes,
        filename: '$primaryKey.zip',
      );

      request.files.add(multipartFile);

      // Send the request
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode != 200) {
        debugPrint('Failed to send zip to AE: ${response.body}');
        throw ElbException(
          exceptionType: ElbExceptionType.conflict,
          message: 'Failed to send zip to AE',
        );
      }
    } catch (e) {
      debugPrint('Failed to send zip to AE: $e');
      throw ElbException(
        exceptionType: ElbExceptionType.conflict,
        message: 'Failed to send zip to AE',
      );
    }
  }

  /// Uploads a PDF file to the server
  /// Returns the thumbnail and XML paths from the response
  Future<AEUploadResponse> uploadPdf(String filePath) async {
    // Use mock response in debug mode
    if (useMockData) {
      return AEUploadMock.getMockResponse();
    }

    // Real implementation
    // Get endpoint URL from GlobalSettings
    final endpointUrl = globalSettings.data.aeEndpointPath;

    if (endpointUrl.isEmpty) {
      throw ElbException(
        exceptionType: ElbExceptionType.conflict,
        message: 'Endpoint URL not configured',
      );
    }

    try {
      // Create a multipart request
      final request = http.MultipartRequest('POST', Uri.parse(endpointUrl));

      // Add the file to the request using XFile
      final xFile = XFile(filePath);
      final fileStream = http.ByteStream(xFile.openRead());
      final fileLength = await xFile.length();

      final multipartFile = http.MultipartFile(
        'file',
        fileStream,
        fileLength,
        filename: path.basename(filePath),
      );

      request.files.add(multipartFile);

      // Send the request
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode != 200) {
        throw ElbException(
          exceptionType: ElbExceptionType.conflict,
          message: 'Failed to upload PDF: HTTP ${response.statusCode}',
        );
      }

      // Parse the response
      final responseData = jsonDecode(response.body) as Map<String, dynamic>;
      return AEUploadResponse.fromJson(responseData);
    } catch (e) {
      throw ElbException(
        exceptionType: ElbExceptionType.conflict,
        message: 'Failed to upload PDF: $e',
      );
    }
  }
}
