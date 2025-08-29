import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/generic_crud.dart';
import 'package:elbdesk_server/src/modules/crm/crm_event/crm_event_utils.dart';
import 'package:elbdesk_server/src/modules/crm/crm_event/endpoints/crm_event_endpoint.dart';
import 'package:serverpod/serverpod.dart';

class CrmEventHandler {
  const CrmEventHandler._();

  static Future<CrmEventDTO?> _fetchById(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return CrmEventDTO.db.findById(
      session,
      id,
      include: CrmEventUtils.includeAll,
      transaction: transaction,
    );
  }

  static Future<CrmEventDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return GenericCrud.fetchAndLockEntity<CrmEventDTO>(
      session,
      id: id,
      tableType: CrmEventUtils.tableType,
      editingSessionId: editingSessionId,
      fetchById: _fetchById,
      tableName: CrmEventDTOTable().tableName,
      streamController: eventStreamController,
    );
  }

  static Future<CrmEventDTO> create(
    Session session, {
    required CrmEventDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    final (:inserted) = await session.db.transaction((transaction) async {
      final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);

      // updated meta
      entity = entity.copyWith(
        editingSession: sessionId,
        createdById: userId,
        createdAt: now,
      );

      final inserted = await GenericCrud.create(
        session,
        CrmEventDTO.db.insertRow(session, entity, transaction: transaction),
      );

      return (inserted: inserted);
    });
    eventStreamController.add(inserted);
    return inserted;
  }

  static Future<CrmEventDTO> update(
    Session session, {
    required CrmEventDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    final (:updated) = await session.db.transaction((transaction) async {
      final updated = await GenericCrud.update(
        session,
        fetchById: _fetchById,
        sessionId: sessionId,
        newEntity: entity,
        updateEntity: _updateRow,
        tableType: CrmEventUtils.tableType,
        streamController: eventStreamController,
        release: release,
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
    await GenericCrud.releaseEntity<CrmEventDTO>(
      session,
      entityId: entityId,
      sessionId: sessionId,
      fetchById: _fetchById,
      updateEntity: _updateRow,
      tableType: CrmEventUtils.tableType,
      streamController: eventStreamController,
      deleteDraft: _deleteDraft,
    );
  }

  static Future<bool> delete(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    return GenericCrud.markEntityAsDeleted<CrmEventDTO>(
      session,
      id: entityId,
      sessionId: sessionId,
      fetchWithoutRelations: _fetchWithoutRelations,
      updateRow: _updateRow,
      tableType: CrmEventUtils.tableType,
      streamController: eventStreamController,
    );
  }

  static Future<CrmEventDTO?> _fetchWithoutRelations(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return CrmEventDTO.db.findById(session, id, transaction: transaction);
  }

  static Future<CrmEventDTO> _updateRow(
    Session session,
    CrmEventDTO entity,
    Transaction transaction,
  ) async {
    return CrmEventDTO.db.updateRow(
      session,
      entity,
      transaction: transaction,
    );
  }

  static Future<CrmEventDTO?> _deleteDraft(
    Session session,
    CrmEventDTO entity,
    Transaction transaction,
  ) async {
    return CrmEventDTO.db.deleteRow(
      session,
      entity,
      transaction: transaction,
    );
  }
}
