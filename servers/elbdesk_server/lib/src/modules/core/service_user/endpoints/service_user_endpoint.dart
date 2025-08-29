import 'dart:async';

import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/app_user/models/app_scope_server_extension.dart';
import 'package:elbdesk_server/src/modules/core/service_user/service_user_handler.dart';
import 'package:serverpod/serverpod.dart';

final serviceUserStreamController =
    StreamController<ServiceUserDTO>.broadcast();

/// Endpoint for [ServiceUserDTO]
class ServiceUserEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  @override
  Set<Scope> get requiredScopes => AppScope.serviceUser.rwd;

  Stream<ServiceUserDTO> watch(
    Session session, {
    required String sessionId,
    required int entityId,
  }) async* {
    yield* ServiceUserHandler.watch(
      session,
      sessionId: sessionId,
      entityId: entityId,
    );
  }

  /// Fetch an ServiceUser by its id
  Future<ServiceUserDTO?> fetchById(
    Session session,
    int id,
  ) async {
    return ServiceUserHandler.fetchById(session, id);
  }

  /// Find all ServiceUsers
  Future<List<ServiceUserDTO>> find(
    Session session, {
    Sort? sort,
    Filter? filter,
  }) async {
    return ServiceUserHandler.find(
      session,
      sort: sort,
      filter: filter,
    );
  }

  Future<ServiceUserDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return ServiceUserHandler.fetchAndLock(
      session,
      id: id,
      editingSessionId: editingSessionId,
    );
  }

  Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    await ServiceUserHandler.release(
      session,
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  /// Create a new User with the, optional, given sessionId so it can be
  /// edited by the user on the client
  Future<ServiceUserDTO> create(
    Session session, {
    required String sessionId,
  }) async {
    return ServiceUserHandler.create(session, sessionId: sessionId);
  }

  Future<ServiceUserDTO> update(
    Session session, {
    required ServiceUserDTO serviceUser,
    required String sessionId,
    required bool release,
  }) async {
    return ServiceUserHandler.update(
      session,
      sessionId: sessionId,
      serviceUser: serviceUser,
    );
  }

  Future<bool> delete(
    Session session, {
    required int userId,
    required String sessionId,
  }) async {
    throw UnimplementedError();
  }

  Future<List<EntityLockDTO>> findEntityLocks(Session session) async {
    return ServiceUserHandler.findEntityLocks(session);
  }
}
