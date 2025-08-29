import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork_quarantine/artwork_quarantine_xml_service.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork_quarantine_group/artwork_quarantine_group_handler.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork_quarantine_group/endpoints/artwork_quarantine_group_endpoint.dart';
import 'package:serverpod/serverpod.dart';

/// Handles the parsing of artwork XML files and updating the
/// ArtworkQuarantine object with the parsed data.
///
/// The XML data is saved into a QuarantineArtworkXmlDataDTO object during
/// runtime.
/// This object is then used to create the ArtworkQuarantine object
class ArtworkQuarantineXmlHandler {
  const ArtworkQuarantineXmlHandler._();

  /// Updates an existing ArtworkQuarantine object with provided XML data.
  /// The xml is parsed and the data is then written to the ArtworkQuarantine
  /// object
  static Future<void> updateArtworkWithAnalysis(
    Session session,
    String xmlContent,
  ) async {
    try {
      // Transaction
      final updatedGroup = await session.db.transaction((transaction) async {
        // Parse the XML data first to get the quarantine ID
        final (:artworkQuarantineUuid, :analysisData) =
            await ArtworkQuarantineXmlService.parseXmlFile(
          xmlContent,
          session,
        );

        // Fetch the artwork quarantine by uuid
        final artworkQuarantine = await ArtworkQuarantineDTO.db.findFirstRow(
          session,
          where: (q) => q.quarantineUuid.equals(artworkQuarantineUuid),
          transaction: transaction,
        );

        if (artworkQuarantine == null) {
          throw ElbException(
            message:
                'ArtworkQuarantine not found with UUID: $artworkQuarantineUuid',
            exceptionType: ElbExceptionType.notFound,
          );
        }

        if (artworkQuarantine.status ==
            ArtworkQuarantineGroupStatus.canceled.name) {
          // If quarantine is canceled -> Ignore
          return null;
        }

        // get database colors
        final databaseColors = await _findDatabaseColors(
          session,
          transaction,
          analysisData.colorSpecifications,
        );

        // Update the artwork quarantine with the parsed XML data
        final updatedArtworkQuarantine = _updateArtworkWithAnalysis(
          artworkQuarantine,
          analysisData,
          databaseColors,
        );

        // Save the updated artwork quarantine
        await ArtworkQuarantineDTO.db.updateRow(
          session,
          updatedArtworkQuarantine,
          transaction: transaction,
        );

        // * Update Quarantine and Group Status
        // The status of the Quarantine is set to done since it was analyzed
        // The group status is updated according to the status of the quarantine
        final updatedGroup =
            await ArtworkQuarantineGroupHandler.updateAfterXmlAnalysis(
          session,
          artworkQuarantine.id!,
          transaction,
        );

        return updatedGroup;
      });

      // Notify user after transaction is completed
      if (updatedGroup != null) {
        artworkQuarantineGroupStreamController.add(updatedGroup);

        await ArtworkQuarantineGroupHandler
            .notifyUserAfterGroupStatusIsSetToDone(
          session,
          updatedGroup.id!,
        );
      }
    } catch (e) {
      session.log(
        'Failed to update artwork quarantine with analysis: $e',
        level: LogLevel.error,
      );
      rethrow;
    }
  }

  /// Helper method to update artwork quarantine with analysis results
  static ArtworkQuarantineDTO _updateArtworkWithAnalysis(
    ArtworkQuarantineDTO artworkQuarantine,
    ArtworkQuarantineAnalysisDataDTO analysisData,
    List<ArtworkColorDTO> databaseColors,
  ) {
    try {
      // Update the artwork quarantine with new data
      return artworkQuarantine.copyWith(
        // set quarantine status to done
        status: ArtworkQuarantineGroupStatus.done.name,

        // Basic metadata
        description: artworkQuarantine.description,

        // Dimensions
        width: analysisData.width ?? artworkQuarantine.width,
        height: analysisData.height ?? artworkQuarantine.height,

        colors: databaseColors,
        analysisData: analysisData,
        // Update timestamp
        lastModifiedAt: DateTime.now(),
      );
    } catch (e) {
      throw ElbException(
        message: 'Failed to update artwork quarantine with analysis: $e',
        exceptionType: ElbExceptionType.fileOperationException,
      );
    }
  }
}

Future<List<ArtworkColorDTO>> _findDatabaseColors(
  Session session,
  Transaction transaction,
  List<ColorSpecificationDTO> anaysisColorSpecifications,
) async {
  if (anaysisColorSpecifications.isEmpty) {
    return const <ArtworkColorDTO>[];
  }
  // creating a future wait to have a sync call to the database
  // and to be sure that the colors are added in the correct order
  final futures = anaysisColorSpecifications.map((spec) {
    return ArtworkColorDTO.db.findFirstRow(
      session,
      where: (t) => t.colorName.equals(spec.name),
      transaction: transaction,
    );
  }).toList();

  // executing the futures
  final found = await Future.wait(futures);

  // removing all nulls and duplicates (checking colorName)
  final seen = <String>{};
  final result = <ArtworkColorDTO>[];

  for (final item in found) {
    if (item == null) continue;
    final name = item.colorName;
    if (seen.add(name)) {
      result.add(item);
    }
  }

  return result;
}
