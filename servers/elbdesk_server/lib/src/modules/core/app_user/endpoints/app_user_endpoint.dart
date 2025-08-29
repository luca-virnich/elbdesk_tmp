import 'dart:async';

import 'package:collection/collection.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/business/extensions/serverpod_extension.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/app_user/app_user_handler.dart';
import 'package:elbdesk_server/src/modules/core/app_user/app_user_utils.dart';
import 'package:elbdesk_server/src/modules/core/app_user/models/app_scope_server_extension.dart';
import 'package:elbdesk_server/src/modules/core/generic_crud.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

part 'app_user_public_insecure_endpoint.dart';
part 'app_user_shared_endpoint.dart';

final appUserStreamController = StreamController<AppUserDTO>.broadcast();

class AppUserSelfEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Stream<AppUserDTO> watchSelf(Session session) async* {
    final userId = (await session.authenticated)?.userId;

    if (userId == null) return;

    yield* appUserStreamController.stream
        .where((event) => event.userInfoId == userId)
        .map((event) => event);
  }

  Future<AppUserDTO> fetchSelf(Session session) async {
    return AppUserHandler.fetchSelf(
      session,
    );
  }
}

/// Endpoint for [AppUserDTO]
class AppUserEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  @override
  Set<Scope> get requiredScopes => AppScope.admin.rwd;

  final _tableType = TableType.appUser;

  Future<bool> promoteToAdmin(Session session) async {
    final userId = (await session.authenticated)?.userId;

    if (userId == null) return false;

    final promotedUser =
        await Users.updateUserScopes(session, userId, AppScope.admin.rwd);

    if (promotedUser == null) return false;

    return true;
  }

  Stream<AppUserDTO> watch(
    Session session, {
    required String sessionId,
    required int entityId,
  }) async* {
    session.addWillCloseListener(
      (session) {
        release(session, entityId: entityId, sessionId: sessionId);
      },
    );

    yield* appUserStreamController.stream
        .where((event) => event.id == entityId)
        .map((event) => event);
  }

  /// Fetch an AppUser by its id
  Future<AppUserDTO?> fetchById(
    Session session,
    int id,
  ) async {
    return AppUserDTO.db.findById(
      session,
      id,
      include: AppUserUtils.includeAll,
    );
  }

  /// Find all AppUsers
  Future<List<AppUserDTO>> find(
    Session session, {
    Sort? sort,
    Filter? filter,
  }) async {
    final sortByField = AppUserField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );

    final expression = AppUserUtils.buildExpression(filter);

    return AppUserDTO.db.find(
      session,
      where: (t) => expression,
      orderBy: AppUserUtils.orderBy(sortByField),
      orderDescending: sort?.orderDescending ?? false,
      include: AppUserUtils.includeAll,
    );
  }

  Future<AppUserDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return GenericCrud.fetchAndLockEntity<AppUserDTO>(
      session,
      id: id,
      tableType: _tableType,
      editingSessionId: editingSessionId,
      fetchById: AppUserHandler.fetchByIdInternal,
      tableName: AppUserDTOTable().tableName,
      streamController: appUserStreamController,
    );
  }

  Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    await GenericCrud.releaseEntity<AppUserDTO>(
      session,
      entityId: entityId,
      sessionId: sessionId,
      fetchById: AppUserHandler.fetchByIdInternal,
      updateEntity: AppUserHandler.updateRow,
      tableType: _tableType,
      streamController: appUserStreamController,
      deleteDraft: AppUserHandler.deleteDraft,
    );
  }

  /// Create a new User with the, optional, given sessionId so it can be
  /// edited by the user on the client
  Future<AppUserDTO> create(
    Session session, {
    required String sessionId,
  }) async {
    final appUser = await AppUserHandler.create(session, sessionId: sessionId);
    return appUser;
  }

  Future<AppUserDTO> update(
    Session session, {
    required AppUserDTO appUser,
    required String sessionId,
    required bool release,
  }) async {
    final updatedAppUser = await AppUserHandler.update(
      session,
      sessionId: sessionId,
      appUser: appUser,
    );

    return updatedAppUser;
  }

  Future<bool> delete(
    Session session, {
    required int userId,
    required String sessionId,
  }) async {
    throw UnimplementedError();
    // Find user
    // final user = await fetchById(session, userId);
    // final userInfoId = user?.userInfo?.id;

    // // Return false if user doesn't exist
    // if (user == null || userInfoId == null) return false;

    // // Checks if this is the current session
    // if (user.editingSession != sessionId) return false;

    // // UserInfo? user = await UserInfo.db.findById(session, userId);

    // // * Delete User

    // try {
    //   await AppUserDTO.db
    //       .deleteWhere(session, where: (t) => t.id.equals(user.id));
    // } catch (e) {
    //   return false;
    // }

    // // * Delete UserInfo and related tables
    // try {
    //   final email = user.userInfo?.email;

    //   if (email == null) return false;

    //   await session.db.transaction((transaction) async {
    //     await session.db.unsafeQuery(
    //       "DELETE FROM serverpod_user_info WHERE email='$email'",
    //       transaction: transaction,
    //     );

    //     await session.db.unsafeQuery(
    //       "DELETE FROM serverpod_email_auth WHERE email='$email'",
    //       transaction: transaction,
    //     );

    //     await session.db.unsafeQuery(
    //       "DELETE FROM serverpod_email_create_request WHERE email='$email'",
    //       transaction: transaction,
    //     );

    //     await session.db.unsafeQuery(
    //       "DELETE FROM serverpod_email_failed_sign_in WHERE email='$email'",
    //       transaction: transaction,
    //     );

    //     final columnInt =
    //         ColumnInt('userId', Table(tableName: 'serverpod_email_reset'));

    //     await session.db.unsafeQuery(
    //       "DELETE FROM serverpod_email_reset WHERE $columnInt = '$userId'",
    //       transaction: transaction,
    //     );

    //     final columnInt2 =
    //         ColumnInt('userId', Table(tableName: 'serverpod_auth_key'));

    //     await session.db.unsafeQuery(
    //       "DELETE FROM serverpod_auth_key WHERE $columnInt2 = '$userId'",
    //       transaction: transaction,
    //     );

    //     await session.db.unsafeExecute(
    //       "DELETE FROM serverpod_email_auth WHERE email = '$email'",
    //       transaction: transaction,
    //     );
    //   });
    //   return true;
    // } catch (e) {
    //   return false;
    // }
  }

  Future<List<EntityLockDTO>> findEntityLocks(Session session) async {
    final entities = await AppUserDTO.db.find(
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
