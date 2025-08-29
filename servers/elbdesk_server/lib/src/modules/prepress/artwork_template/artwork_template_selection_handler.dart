import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/generic_crud.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork_template/artwork_template_selection_utils.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork_template/endpoints/artwork_template_selection_endpoint.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';

class ArtworkTemplateSelectionHandler {
  const ArtworkTemplateSelectionHandler._();

  static Future<ArtworkTemplateSelectionDTO> create(
    Session session, {
    required ArtworkTemplateSelectionDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);
    final initialEntity = ArtworkTemplateSelectionUtils.initialDto(
      userId: userId,
      sessionId: sessionId,
      entity: entity,
      release: release,
      now: now,
    );
    final inserted = await GenericCrud.create(
      session,
      ArtworkTemplateSelectionDTO.db.insertRow(session, initialEntity),
    );
    artworkTemplateSelectionStreamController.add(inserted);
    return inserted;
  }

  static Future<ArtworkTemplateSelectionDTO?> _fetchById(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return ArtworkTemplateSelectionDTO.db
        .findById(session, id, transaction: transaction);
  }

  static Future<ArtworkTemplateSelectionDTO> _updateRow(
    Session session,
    ArtworkTemplateSelectionDTO entity,
    Transaction transaction,
  ) async {
    return ArtworkTemplateSelectionDTO.db
        .updateRow(session, entity, transaction: transaction);
  }

  static Future<ArtworkTemplateSelectionDTO> update(
    Session session, {
    required ArtworkTemplateSelectionDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    return GenericCrud.update(
      session,
      sessionId: sessionId,
      fetchById: _fetchById,
      newEntity: entity,
      updateEntity: _updateRow,
      tableType: ArtworkTemplateSelectionUtils.tableType,
      streamController: artworkTemplateSelectionStreamController,
      release: release,
      logFields: [],
    );
  }

  static Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    await GenericCrud.releaseEntity<ArtworkTemplateSelectionDTO>(
      session,
      entityId: entityId,
      sessionId: sessionId,
      fetchById: _fetchById,
      updateEntity: _updateRow,
      tableType: ArtworkTemplateSelectionUtils.tableType,
      streamController: artworkTemplateSelectionStreamController,
      deleteDraft: null,
    );
  }

  static Future<ArtworkTemplateSelectionDTO> createDefaultSelection(
    Session session, {
    required int artworkTemplatePreSelectionId,
    required Transaction transaction,
    required int userId,
    required DateTime now,
  }) async {
    final defaultSelection = ArtworkTemplateSelectionDTO(
      description: 'Standard',
      artworkTemplatePreSelectionId: artworkTemplatePreSelectionId,
      isDraft: false,
      createdAt: now,
      createdById: userId,
    );
    return ArtworkTemplateSelectionDTO.db
        .insertRow(session, defaultSelection, transaction: transaction);
  }

  static Future<ArtworkTemplateSelectionDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return GenericCrud.fetchAndLockEntity<ArtworkTemplateSelectionDTO>(
      session,
      id: id,
      tableType: ArtworkTemplateSelectionUtils.tableType,
      editingSessionId: editingSessionId,
      fetchById: _fetchById,
      tableName: ArtworkTemplateSelectionDTOTable().tableName,
      streamController: artworkTemplateSelectionStreamController,
    );
  }
}
