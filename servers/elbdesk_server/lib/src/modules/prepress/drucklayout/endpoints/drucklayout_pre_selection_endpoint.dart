import 'dart:async';

import 'package:collection/collection.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/prepress/drucklayout/drucklayout_pre_selection_handler.dart';
import 'package:elbdesk_server/src/modules/prepress/drucklayout/drucklayout_pre_selection_utils.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';

final drucklayoutPreSelectionStreamController =
    StreamController<DrucklayoutPreSelectionDTO>.broadcast();

/// Drucklayout Pre Selection Endpoint
///
/// Used to manage the drucklayout pre selection category
///
/// See [DrucklayoutPreSelectionDTO] for more information
///
class DrucklayoutPreSelectionEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Stream<DrucklayoutPreSelectionDTO> watch(
    Session session, {
    required String sessionId,
    required int entityId,
  }) async* {
    session.addWillCloseListener(
      (session) {
        release(session, entityId: entityId, sessionId: sessionId);
      },
    );

    yield* drucklayoutPreSelectionStreamController.stream
        .where((event) => event.id == entityId)
        .map((event) {
      return event;
    });
  }

  Stream<DrucklayoutPreSelectionDTO> watchPreSelection(
    Session session, {
    required int? customerId,
  }) async* {
    yield* drucklayoutPreSelectionStreamController.stream
        .where((event) => event.customerId == customerId)
        .map((event) {
      return event;
    });
  }

  Future<DrucklayoutPreSelectionDTO> create(
    Session session, {
    required DrucklayoutPreSelectionDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    return DrucklayoutPreSelectionHandler.create(
      session,
      entity: entity,
      sessionId: sessionId,
      release: release,
    );
  }

  Future<DrucklayoutPreSelectionDTO?> fetchById(
    Session session,
    int id,
  ) async {
    return DrucklayoutPreSelectionDTO.db.findById(
      session,
      id,
    );
  }

  Future<List<DrucklayoutPreSelectionDTO>> fetchAll(Session session) async {
    return DrucklayoutPreSelectionDTO.db.find(
      session,
      orderBy: (t) => t.description,
      orderDescending: false,
    );
  }

  Future<List<DrucklayoutPreSelectionDTO>> find(
    Session session, {
    Sort? sort,
    Filter? filter,
  }) async {
    final sortByField = DrucklayoutPreSelectionField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );

    final expression = DrucklayoutPreSelectionUtils.buildExpression(filter);

    return DrucklayoutPreSelectionDTO.db.find(
      session,
      where: expression == null ? null : (t) => expression,
      orderBy: DrucklayoutPreSelectionUtils.preSelectionOrderBy(sortByField),
      orderDescending: sort?.orderDescending ?? false,
    );
  }

  Future<DrucklayoutPreSelectionDTO> update(
    Session session, {
    required DrucklayoutPreSelectionDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    return DrucklayoutPreSelectionHandler.update(
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
    return DrucklayoutPreSelectionHandler.release(
      session,
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  Future<DrucklayoutPreSelectionDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return DrucklayoutPreSelectionHandler.fetchAndLock(
      session,
      id: id,
      editingSessionId: editingSessionId,
    );
  }

  Future<List<DrucklayoutPreSelectionDTO>> fetchByCustomerId(
    Session session,
    int customerId,
  ) async {
    return DrucklayoutPreSelectionDTO.db.find(
      session,
      where: (t) => t.customerId.equals(
        customerId,
      ),
      orderBy: (t) => t.description,
      orderDescending: false,
    );
  }

  Future<List<DrucklayoutPreSelectionDTO>> fetchGlobal(
    Session session,
  ) async {
    return DrucklayoutPreSelectionDTO.db.find(
      session,
      where: (t) => t.customerId.equals(
        null,
      ),
      orderBy: (t) => t.description,
      orderDescending: false,
    );
  }

  Future<List<EntityLockDTO>> findEntityLocks(Session session) async {
    final entities = await DrucklayoutPreSelectionDTO.db.find(
      session,
      where: (t) =>
          t.editingSession.notEquals(null as String?) &
          t.editingSession.notEquals(''),
    );

    return entities
        .map(
          (e) => EntityLockDTO(
            tableType: DrucklayoutPreSelectionUtils.tableType.name,
            entityId: e.id!,
            editingSessionId: e.editingSession!,
            lockedAt: e.editingSince!,
            userId: e.editingById,
          ),
        )
        .toList();
  }
}
