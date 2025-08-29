import 'dart:async';

import 'package:collection/collection.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/generic_crud.dart';
import 'package:elbdesk_server/src/modules/crm/app_client/app_client_handler.dart';
import 'package:elbdesk_server/src/modules/crm/app_client/app_client_utils.dart';
import 'package:serverpod/serverpod.dart';

final appClientStreamController = StreamController<AppClientDTO>.broadcast();

class AppClientEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  final _tableType = TableType.appClient;

  Stream<AppClientDTO> watch(
    Session session, {
    required String sessionId,
    required int entityId,
  }) async* {
    session.addWillCloseListener(
      (session) {
        AppClientHandler.release(
          session,
          entityId: entityId,
          sessionId: sessionId,
        );
      },
    );

    yield* appClientStreamController.stream
        .where((event) => event.id == entityId)
        .map((event) {
      return event;
    });
  }

  Stream<AppClientDTO> watchAll(Session session) {
    return appClientStreamController.stream;
  }

  Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    await AppClientHandler.release(
      session,
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  Future<AppClientDTO?> fetchById(
    Session session,
    int id,
  ) async {
    return AppClientDTO.db.findById(
      session,
      id,
      include: AppClientUtils.includeAll,
    );
  }

  Future<AppClientDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return AppClientHandler.fetchAndLock(
      session,
      id: id,
      editingSessionId: editingSessionId,
    );
  }

  Future<AppClientDTO> create(
    Session session, {
    required String sessionId,
  }) async {
    final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);

    final appClient = AppClientUtils.getInitialAppClient(
      userId: userId,
      now: now,
      sessionId: sessionId,
    );

    final inserted = await GenericCrud.create(
      session,
      AppClientDTO.db.insertRow(
        session,
        appClient,
      ),
    );

    appClientStreamController.add(inserted);

    return inserted;
  }

  Future<AppClientDTO> update(
    Session session, {
    required AppClientDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    return AppClientHandler.update(
      session,
      entity: entity,
      sessionId: sessionId,
      release: release,
    );
  }

  Future<List<AppClientDTO>> find(
    Session session, {
    Sort? sort,
    Filter? filter,
  }) {
    final sortByField = AppClientField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );
    final expression = AppClientUtils.buildExpression(filter);

    return AppClientDTO.db.find(
      session,
      include: AppClientUtils.includeAll,
      where: expression == null ? null : (t) => expression,
      orderBy: AppClientUtils.orderBy(sortByField),
      orderDescending: sort?.orderDescending ?? false,
    );
  }

  Future<List<AppClientDTO>> fetchAll(Session session, Sort? sort) {
    final sortByField = AppClientField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );
    return AppClientDTO.db.find(
      session,
      include: AppClientUtils.includeAll,
      orderBy: AppClientUtils.orderBy(sortByField),
      orderDescending: sort?.orderDescending ?? false,
    );
  }

  Future<List<EntityLockDTO>> findEntityLocks(Session session) async {
    final entities = await AppClientDTO.db.find(
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
