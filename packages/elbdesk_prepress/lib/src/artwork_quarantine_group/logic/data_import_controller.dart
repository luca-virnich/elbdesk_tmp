import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_prepress/src/ae_pilot/services/ae_upload_controller.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine/repositories/artwork_quarantine_repository.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine_group/utils/file_utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'data_import_controller.g.dart';

/// Provider for the Data Import Controller
@riverpod
Future<DataImportController> dataImportController(Ref ref) async {
  return DataImportController(
    aeUploadController: await ref.watch(aeUploadControllerProvider.future),
    artworkQuarantineRepository: ref.watch(artworkQuarantineRepositoryProvider),
    artworkQuarantineGroupRepository:
        ref.watch(artworkQuarantineGroupRepositoryProvider),
  );
}

/// Controller for handling complex data import operations
class DataImportController {
  DataImportController({
    required this.aeUploadController,
    required this.artworkQuarantineRepository,
    required this.artworkQuarantineGroupRepository,
  });

  final AEUploadController aeUploadController;
  final ArtworkQuarantineRepository artworkQuarantineRepository;
  final ArtworkQuarantineGroupRepository artworkQuarantineGroupRepository;

  static const String _attachmentsFolder = 'attachments';
  static const String _attachmentPrefix = 'attachment_';
  static const String _artworkPrefix = 'artwork_';

  /// Constructs the moved file path for an artwork
  static String _constructMovedFilePath({
    required String groupPath,
    required String artworkId,
    required ArtworkType type,
  }) {
    final typeSuffix = type == ArtworkType.front
        ? 'f'
        : type == ArtworkType.back
            ? 'b'
            : '';
    return p.join(groupPath, artworkId, '$_artworkPrefix$typeSuffix.pdf');
  }

  /// Sets up the folder structure for a group and returns the group path
  Future<String> setupGroupFolder(
    String outputPath,
    String uniqueGroupId,
  ) async {
    try {
      final groupPath = p.join(outputPath, uniqueGroupId);
      final attachmentsPath = p.join(groupPath, _attachmentsFolder);
      await FileUtils.ensureDirectoryExists(attachmentsPath);

      return groupPath;
    } catch (e) {
      throw ElbException(
        message: 'Failed to setup group folder: $e'.hc,
        exceptionType: ElbExceptionType.fileOperationException,
      );
    }
  }

  /// Copy artwork and its analysis files to the group directory
  Future<void> copyArtworkToGroup({
    required String groupPath,
    required String artworkId,
    required String originalPath,
    required ArtworkType type,
    required String thumbnailPath,
    required String xmlPath,
  }) async {
    try {
      final artworkPath = p.join(groupPath, artworkId);
      await FileUtils.ensureDirectoryExists(artworkPath);

      // Get the target file path using the centralized method
      final targetFilePath = _constructMovedFilePath(
        groupPath: groupPath,
        artworkId: artworkId,
        type: type,
      );

      // Copy all files to artwork directory
      await Future.wait([
        FileUtils.copyFile(originalPath, targetFilePath),
        FileUtils.copyFile(
          thumbnailPath,
          p.join(artworkPath, 'thumbnail${p.extension(thumbnailPath)}'),
        ),
        FileUtils.copyFile(
          xmlPath,
          p.join(artworkPath, 'metadata${p.extension(xmlPath)}'),
        ),
      ]);
    } catch (e) {
      throw ElbException(
        message: 'Failed to copy artwork to group: $e'.hc,
        exceptionType: ElbExceptionType.fileOperationException,
      );
    }
  }

  /// Copy all attachments to the group's attachment folder
  Future<void> copyAttachmentsToGroup({
    required String groupPath,
    required List<SystemFile> attachments,
  }) async {
    try {
      if (attachments.isEmpty) return;

      final attachmentsPath = p.join(groupPath, _attachmentsFolder);

      await Future.wait(
        attachments.asMap().entries.map((entry) {
          final extension = p.extension(entry.value.path);
          final newFileName = '$_attachmentPrefix${entry.key + 1}$extension';
          return FileUtils.copyFile(
            entry.value.path,
            p.join(attachmentsPath, newFileName),
          );
        }),
      );
    } catch (e) {
      throw ElbException(
        message: 'Failed to copy attachments to group: $e'.hc,
        exceptionType: ElbExceptionType.fileOperationException,
      );
    }
  }

  /// Create empty artworks for immediate UI feedback
  List<ArtworkQuarantine> createEmptyArtworks(
    List<String> filePaths,
    ArtworkQuarantineGroup group,
  ) {
    try {
      return filePaths.map((filePath) {
        return ArtworkQuarantine.initial(filePath, group);
      }).toList();
    } catch (e) {
      throw ElbException(
        message: 'Failed to create empty artworks: $e'.hc,
        exceptionType: ElbExceptionType.unknown,
      );
    }
  }

  /// Process files and return what should be added
  Future<({List<ArtworkQuarantine> artworks, List<SystemFile> attachments})>
      processFiles(
    List<String> filePaths,
    ArtworkQuarantineGroup group, {
    SystemFileAttachmentType? attachmentType,
  }) async {
    try {
      final artworks = <ArtworkQuarantine>[];
      final attachments = <SystemFile>[];

      for (final filePath in filePaths) {
        final extension = p.extension(filePath).toLowerCase();

        if (extension == '.pdf' && attachmentType == null) {
          artworks.addAll(createEmptyArtworks([filePath], group));
        } else if (extension != '.pdf' && attachmentType == null) {
          throw ElbException(
            message: 'Artworks müssen PDF-Dateien sein'.hc,
            exceptionType: ElbExceptionType.fileOperationException,
          );
        } else {
          final attachment = await _createAttachment(
            filePath,
            attachmentType ?? SystemFileAttachmentType.general,
          );
          attachments.add(attachment);
        }
      }

      return (artworks: artworks, attachments: attachments);
    } catch (e) {
      if (e is ElbException) {
        rethrow;
      }

      throw ElbException(
        message: 'Failed to process files: $e'.hc,
        exceptionType: ElbExceptionType.fileOperationException,
      );
    }
  }

  /// Helper method to create attachment
  Future<SystemFile> _createAttachment(
    String filePath,
    SystemFileAttachmentType attachmentType,
  ) async {
    try {
      final fileSize = await FileUtils.getFileSize(filePath);

      return SystemFile(
        id: const Uuid().v4(),
        path: filePath,
        filename: p.basename(filePath),
        originalPath: filePath,
        attachmentType: attachmentType,
        fileSize: fileSize,
        mimeType: null,
        createdAt: DateTime.now(),
      );
    } catch (e) {
      throw ElbException(
        message: 'Failed to create attachment: $e'.hc,
        exceptionType: ElbExceptionType.unknown,
      );
    }
  }
}
