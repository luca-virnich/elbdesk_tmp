import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/generic_crud.dart';
import 'package:elbdesk_server/src/modules/prepress/drucklayout/drucklayout_pre_selection_utils.dart';
import 'package:elbdesk_server/src/modules/prepress/drucklayout/endpoints/drucklayout_pre_selection_endpoint.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';

class DrucklayoutPreSelectionHandler {
  const DrucklayoutPreSelectionHandler._();

  static Future<DrucklayoutPreSelectionDTO> create(
    Session session, {
    required DrucklayoutPreSelectionDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    final (:inserted, :refetch) =
        await session.db.transaction((transaction) async {
      final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);
      final initialEntity = DrucklayoutPreSelectionUtils.initialPreSelection(
        userId: userId,
        sessionId: sessionId,
        entity: entity,
        release: release,
        now: now,
      );
      final inserted = await GenericCrud.create(
        session,
        DrucklayoutPreSelectionDTO.db
            .insertRow(session, initialEntity, transaction: transaction),
      );
      final refetch = await DrucklayoutPreSelectionDTO.db.findById(
        session,
        inserted.id!,
        include: DrucklayoutPreSelectionDTO.include(
          customer: CustomerDTO.include(),
        ),
        transaction: transaction,
      );
      return (inserted: inserted, refetch: refetch);
    });

    drucklayoutPreSelectionStreamController.add(refetch!);
    return refetch;
  }

  static Future<DrucklayoutPreSelectionDTO?> _fetchById(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return DrucklayoutPreSelectionDTO.db.findById(
      session,
      id,
      include: DrucklayoutPreSelectionDTO.include(
        customer: CustomerDTO.include(),
      ),
      transaction: transaction,
    );
  }

  static Future<DrucklayoutPreSelectionDTO> _updateRow(
    Session session,
    DrucklayoutPreSelectionDTO entity,
    Transaction transaction,
  ) async {
    return DrucklayoutPreSelectionDTO.db
        .updateRow(session, entity, transaction: transaction);
  }

  static Future<DrucklayoutPreSelectionDTO> update(
    Session session, {
    required DrucklayoutPreSelectionDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    final (:updated) = await session.db.transaction((transaction) async {
      final updated = await GenericCrud.update<DrucklayoutPreSelectionDTO>(
        session,
        fetchById: _fetchById,
        sessionId: sessionId,
        newEntity: entity,
        updateEntity: _updateRow,
        tableType: DrucklayoutPreSelectionUtils.tableType,
        streamController: drucklayoutPreSelectionStreamController,
        release: release,
        logFields: [],
        transaction: transaction,
      );
      return (updated: updated);
    });
    return updated;
  }

  static Future<DrucklayoutPreSelectionDTO> createDefaultPreSelection(
    Session session, {
    required int customerId,
    required Transaction transaction,
    required int userId,
    required DateTime now,
  }) async {
    final defaultPreSelection = DrucklayoutPreSelectionDTO(
      description: 'Standard',
      customerId: customerId,
      isDraft: false,
      createdAt: now,
      createdById: userId,
    );
    return DrucklayoutPreSelectionDTO.db
        .insertRow(session, defaultPreSelection, transaction: transaction);
  }

  static Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    await GenericCrud.releaseEntity<DrucklayoutPreSelectionDTO>(
      session,
      entityId: entityId,
      sessionId: sessionId,
      fetchById: _fetchById,
      updateEntity: _updateRow,
      tableType: DrucklayoutPreSelectionUtils.tableType,
      streamController: drucklayoutPreSelectionStreamController,
      deleteDraft: null,
    );
  }

  static Future<DrucklayoutPreSelectionDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return GenericCrud.fetchAndLockEntity<DrucklayoutPreSelectionDTO>(
      session,
      id: id,
      tableType: DrucklayoutPreSelectionUtils.tableType,
      editingSessionId: editingSessionId,
      fetchById: _fetchById,
      tableName: DrucklayoutPreSelectionDTOTable().tableName,
      streamController: drucklayoutPreSelectionStreamController,
    );
  }
}
