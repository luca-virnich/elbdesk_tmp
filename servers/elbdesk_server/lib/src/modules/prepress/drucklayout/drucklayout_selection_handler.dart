import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/generic_crud.dart';
import 'package:elbdesk_server/src/modules/prepress/drucklayout/drucklayout_selection_utils.dart';
import 'package:elbdesk_server/src/modules/prepress/drucklayout/endpoints/drucklayout_selection_endpoint.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';

class DrucklayoutSelectionHandler {
  const DrucklayoutSelectionHandler._();

  static Future<DrucklayoutSelectionDTO> create(
    Session session, {
    required DrucklayoutSelectionDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    final (:inserted) = await session.db.transaction((transaction) async {
      final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);
      final initialEntity = DrucklayoutSelectionUtils.initialDto(
        userId: userId,
        sessionId: sessionId,
        entity: entity,
        release: release,
        now: now,
      );
      final inserted = await GenericCrud.create(
        session,
        DrucklayoutSelectionDTO.db
            .insertRow(session, initialEntity, transaction: transaction),
      );
      return (inserted: inserted);
    });

    drucklayoutSelectionStreamController.add(inserted);
    return inserted;
  }

  static Future<DrucklayoutSelectionDTO?> _fetchById(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return DrucklayoutSelectionDTO.db
        .findById(session, id, transaction: transaction);
  }

  static Future<DrucklayoutSelectionDTO> _updateRow(
    Session session,
    DrucklayoutSelectionDTO entity,
    Transaction transaction,
  ) async {
    return DrucklayoutSelectionDTO.db
        .updateRow(session, entity, transaction: transaction);
  }

  static Future<DrucklayoutSelectionDTO> update(
    Session session, {
    required DrucklayoutSelectionDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    final (:updated) = await session.db.transaction((transaction) async {
      final updated = await GenericCrud.update<DrucklayoutSelectionDTO>(
        session,
        sessionId: sessionId,
        fetchById: _fetchById,
        newEntity: entity,
        updateEntity: _updateRow,
        tableType: DrucklayoutSelectionUtils.tableType,
        streamController: drucklayoutSelectionStreamController,
        release: release,
        logFields: [],
        transaction: transaction,
      );
      return (updated: updated);
    });
    return updated;
  }

  static Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    await GenericCrud.releaseEntity<DrucklayoutSelectionDTO>(
      session,
      entityId: entityId,
      sessionId: sessionId,
      fetchById: _fetchById,
      updateEntity: _updateRow,
      tableType: DrucklayoutSelectionUtils.tableType,
      streamController: drucklayoutSelectionStreamController,
      deleteDraft: null,
    );
  }

  static Future<DrucklayoutSelectionDTO> createDefaultSelection(
    Session session, {
    required int drucklayoutPreSelectionId,
    required Transaction transaction,
    required int userId,
    required DateTime now,
  }) async {
    final defaultSelection = DrucklayoutSelectionDTO(
      description: 'Standard',
      drucklayoutPreSelectionId: drucklayoutPreSelectionId,
      isDraft: false,
      createdAt: now,
      createdById: userId,
    );
    return DrucklayoutSelectionDTO.db
        .insertRow(session, defaultSelection, transaction: transaction);
  }

  static Future<DrucklayoutSelectionDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return GenericCrud.fetchAndLockEntity<DrucklayoutSelectionDTO>(
      session,
      id: id,
      tableType: DrucklayoutSelectionUtils.tableType,
      editingSessionId: editingSessionId,
      fetchById: _fetchById,
      tableName: DrucklayoutSelectionDTOTable().tableName,
      streamController: drucklayoutSelectionStreamController,
    );
  }
}
