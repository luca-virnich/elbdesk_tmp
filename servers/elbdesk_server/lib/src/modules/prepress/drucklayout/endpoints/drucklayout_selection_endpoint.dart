import 'dart:async';

import 'package:collection/collection.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/prepress/drucklayout/drucklayout_selection_handler.dart';
import 'package:elbdesk_server/src/modules/prepress/drucklayout/drucklayout_selection_utils.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';

final drucklayoutSelectionStreamController =
    StreamController<DrucklayoutSelectionDTO>.broadcast();

/// Drucklayout Selection Endpoint
///
/// Used to manage the drucklayout selection category
///
/// See [DrucklayoutSelectionDTO] for more information
///
class DrucklayoutSelectionEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  static const _tableType = TableType.drucklayoutSelection;

  Stream<DrucklayoutSelectionDTO> watch(
    Session session, {
    required String sessionId,
    required int entityId,
  }) async* {
    session.addWillCloseListener(
      (session) {
        release(session, entityId: entityId, sessionId: sessionId);
      },
    );

    yield* drucklayoutSelectionStreamController.stream
        .where((event) => event.id == entityId)
        .map((event) {
      return event;
    });
  }

  Stream<DrucklayoutSelectionDTO> watchSelection(
    Session session, {
    required int preSelectionId,
  }) async* {
    yield* drucklayoutSelectionStreamController.stream
        .where((event) => event.drucklayoutPreSelectionId == preSelectionId)
        .map((event) {
      return event;
    });
  }

  Future<DrucklayoutSelectionDTO> create(
    Session session, {
    required DrucklayoutSelectionDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    return DrucklayoutSelectionHandler.create(
      session,
      entity: entity,
      sessionId: sessionId,
      release: release,
    );
  }

  Future<DrucklayoutSelectionDTO?> fetchById(
    Session session,
    int id,
  ) async {
    return DrucklayoutSelectionDTO.db.findById(
      session,
      id,
    );
  }

  Future<List<DrucklayoutSelectionDTO>> fetchAll(Session session) async {
    return DrucklayoutSelectionDTO.db.find(
      session,
      orderBy: DrucklayoutSelectionUtils.orderBy(
        DrucklayoutSelectionField.description,
      ),
      orderDescending: false,
    );
  }

  Future<List<DrucklayoutSelectionDTO>> find(
    Session session, {
    Sort? sort,
    Filter? filter,
  }) async {
    final sortByField = DrucklayoutSelectionField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );

    final expression = DrucklayoutSelectionUtils.buildExpression(filter);

    return DrucklayoutSelectionDTO.db.find(
      session,
      where: expression == null ? null : (t) => expression,
      orderBy: DrucklayoutSelectionUtils.orderBy(sortByField),
      orderDescending: sort?.orderDescending ?? false,
    );
  }

  Future<DrucklayoutSelectionDTO> update(
    Session session, {
    required DrucklayoutSelectionDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    return DrucklayoutSelectionHandler.update(
      session,
      entity: entity,
      sessionId: sessionId,
      release: release,
    );
  }

  Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    return DrucklayoutSelectionHandler.release(
      session,
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  Future<DrucklayoutSelectionDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return DrucklayoutSelectionHandler.fetchAndLock(
      session,
      id: id,
      editingSessionId: editingSessionId,
    );
  }

  Future<List<DrucklayoutSelectionDTO>> fetchFromPreSelection(
    Session session,
    int preSelectionId,
  ) async {
    return DrucklayoutSelectionDTO.db.find(
      session,
      where: (t) => t.drucklayoutPreSelectionId.equals(preSelectionId),
    );
  }

  Future<List<EntityLockDTO>> findEntityLocks(Session session) async {
    final entities = await DrucklayoutSelectionDTO.db.find(
      session,
      where: (t) =>
          t.editingSession.notEquals(null as String?) &
          t.editingSession.notEquals(''),
    );

    return entities
        .map(
          (e) => EntityLockDTO(
            tableType: _tableType.name,
            entityId: e.id!,
            editingSessionId: e.editingSession!,
            lockedAt: e.editingSince!,
            userId: e.editingById,
          ),
        )
        .toList();
  }
}
