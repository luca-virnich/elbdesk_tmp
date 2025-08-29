import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/generic_crud.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork_template/artwork_template_utils.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork_template/endpoints/artwork_template_endpoint.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';

class ArtworkTemplateHandler {
  const ArtworkTemplateHandler._();

  static Future<ArtworkTemplateDTO> create(
    Session session, {
    required int? customerId,
    required int preSelectionId,
    required int selectionId,
    required String sessionId,
  }) async {
    final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);
    final initialEntity = ArtworkTemplateUtils.getInitialDTO(
      userId: userId,
      sessionId: sessionId,
      customerId: customerId,
      preSelectionId: preSelectionId,
      selectionId: selectionId,
      now: now,
    );
    return GenericCrud.create(
      session,
      ArtworkTemplateDTO.db.insertRow(session, initialEntity),
    );
  }

  static Future<ArtworkTemplateDTO?> _fetchById(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return ArtworkTemplateDTO.db.findById(
      session,
      id,
      include: ArtworkTemplateUtils.includeAll,
      transaction: transaction,
    );
  }

  static Future<ArtworkTemplateDTO> _updateRow(
    Session session,
    ArtworkTemplateDTO entity,
    Transaction transaction,
  ) async {
    return ArtworkTemplateDTO.db
        .updateRow(session, entity, transaction: transaction);
  }

  static Future<ArtworkTemplateDTO> update(
    Session session, {
    required ArtworkTemplateDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    return GenericCrud.update(
      session,
      fetchById: _fetchById,
      sessionId: sessionId,
      newEntity: entity,
      updateEntity: _updateRow,
      tableType: ArtworkTemplateUtils.tableType,
      streamController: artworkTemplateStreamController,
      release: release,
      logFields: [],
    );
  }

  static Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    await GenericCrud.releaseEntity<ArtworkTemplateDTO>(
      session,
      entityId: entityId,
      sessionId: sessionId,
      fetchById: _fetchById,
      updateEntity: _updateRow,
      tableType: ArtworkTemplateUtils.tableType,
      streamController: artworkTemplateStreamController,
      deleteDraft: null,
    );
  }

  static Future<ArtworkTemplateDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return GenericCrud.fetchAndLockEntity<ArtworkTemplateDTO>(
      session,
      id: id,
      tableType: ArtworkTemplateUtils.tableType,
      editingSessionId: editingSessionId,
      fetchById: _fetchById,
      tableName: ArtworkTemplateDTOTable().tableName,
      streamController: artworkTemplateStreamController,
    );
  }
}
