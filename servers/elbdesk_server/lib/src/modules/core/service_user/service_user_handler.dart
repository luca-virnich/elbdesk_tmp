import 'package:collection/collection.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/generic_crud.dart';
import 'package:elbdesk_server/src/modules/core/service_user/endpoints/service_user_endpoint.dart';
import 'package:elbdesk_server/src/modules/core/service_user/service_user_utils.dart';
import 'package:elbdesk_server/src/modules/core/utils/elb_exception_thrower.dart';
import 'package:elbdesk_shared/elbdesk_shared.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class ServiceUserHandler {
  const ServiceUserHandler._();

  // * Create

  // We are creating a new ServiceUser instantly and will save it as Draft, draft
  // will be set to false with the first update/saving of the ServiceUser.

  static Future<ServiceUserDTO> create(
    Session session, {
    required String sessionId,
  }) async {
    final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);

    final initialServiceUser = ServiceUserDTO(
      serviceName: '',
      serviceDescription: '',
      isActive: true,
      createdAt: now,
      isDraft: true,
      createdById: userId,
      lastModifiedAt: null,
      lastModifiedById: null,
      editingSession: sessionId,
      editingSince: now,
      editingById: userId,
    );
    final insertedServiceUser =
        await ServiceUserDTO.db.insertRow(session, initialServiceUser);
    return insertedServiceUser;
  }

  // * Read

  static Future<ServiceUserDTO?> _fetchById(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return ServiceUserDTO.db.findById(
      session,
      id,
      include: ServiceUserUtils.includeAll,
      transaction: transaction,
    );
  }

  /// Fetch an ServiceUser by its id
  static Future<ServiceUserDTO?> fetchById(
    Session session,
    int id,
  ) async {
    return ServiceUserDTO.db.findById(
      session,
      id,
      include: ServiceUserUtils.includeAll,
    );
  }

  /// Find all ServiceUsers
  static Future<List<ServiceUserDTO>> find(
    Session session, {
    Sort? sort,
    Filter? filter,
  }) async {
    final sortByField = ServiceUserField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );

    final expression = ServiceUserUtils.buildExpression(filter);

    return ServiceUserDTO.db.find(
      session,
      where: (t) => expression,
      orderBy: ServiceUserUtils.orderBy(sortByField),
      orderDescending: sort?.orderDescending ?? false,
      include: ServiceUserUtils.includeAll,
    );
  }

  static Future<ServiceUserDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return GenericCrud.fetchAndLockEntity<ServiceUserDTO>(
      session,
      id: id,
      tableType: TableType.serviceUser,
      editingSessionId: editingSessionId,
      fetchById: _fetchById,
      tableName: ServiceUserDTOTable().tableName,
      streamController: serviceUserStreamController,
    );
  }

  static Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    await GenericCrud.releaseEntity<ServiceUserDTO>(
      session,
      entityId: entityId,
      sessionId: sessionId,
      fetchById: _fetchById,
      updateEntity: updateRow,
      tableType: TableType.serviceUser,
      streamController: serviceUserStreamController,
      deleteDraft: deleteDraft,
    );
  }

  static Stream<ServiceUserDTO> watch(
    Session session, {
    required String sessionId,
    required int entityId,
  }) async* {
    session.addWillCloseListener(
      (session) {
        release(session, entityId: entityId, sessionId: sessionId);
      },
    );

    yield* serviceUserStreamController.stream
        .where((event) => event.id == entityId)
        .map((event) => event);
  }

  static Future<List<EntityLockDTO>> findEntityLocks(Session session) async {
    final entities = await ServiceUserDTO.db.find(
      session,
      where: (t) =>
          t.editingSession.notEquals(null as String?) &
          t.editingSession.notEquals(''),
    );

    return entities
        .map(
          (e) => EntityLockDTO(
            tableType: TableType.serviceUser.name,
            entityId: e.id!,
            editingSessionId: e.editingSession!,
            lockedAt: e.editingSince!,
            userId: e.editingById,
          ),
        )
        .toList();
  }

  // * Update

  // We are updating an existing ServiceUser, we have to do several things:
  // - Check if its the first time the ServiceUser is being saved (its created as
  // draft initially), if so, we need to create the Serverpod User and
  // - Update the Serverpod User
  // - Update the ServiceUser
  // - Update the ServiceUserTokens
  // - Update the ServiceUserTokens

  static Future<ServiceUserDTO> update(
    Session session, {
    required String sessionId,
    required ServiceUserDTO serviceUser,
  }) async {
    final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);

    final serviceUserScopes = serviceUser.userInfo!.scopeNames;

    // * Clean up the ServiceUser
    final trimmedServiceName = serviceUser.serviceName.trim();
    final trimmedServiceDescription = serviceUser.serviceDescription.trim();

    if (trimmedServiceName.isEmpty) {
      throw await ElbExceptionThrower.validationError(
        session,
        exceptionType: ElbExceptionType.validationFieldError,
        message: ElbValidationError.serviceUserServiceNameCannotBeEmpty,
        field: 'name',
      );
    }

    if (trimmedServiceDescription.isEmpty) {
      throw await ElbExceptionThrower.validationError(
        session,
        exceptionType: ElbExceptionType.validationFieldError,
        message: ElbValidationError.serviceUserServiceDescriptionCannotBeEmpty,
        field: 'description',
      );
    }

    // * Starting Server Operations
    final (
      :updatedServiceUser,
      :updatedUserInfo,
    ) = await session.db.transaction((transaction) async {
      // Fetch the Server Entity

      UserInfo? updatedUserInfo;

      final serverServiceUser = await ServiceUserDTO.db.findById(
        session,
        serviceUser.id!,
        include: ServiceUserDTO.include(
          userInfo: UserInfo.include(),
        ),
        transaction: transaction,
      );

      // Validate the Update access
      await GenericCrud.validateUpdate(
        session,
        sessionId: sessionId,
        serverEntity: serverServiceUser,
        now: now,
      );

      // At this stage we can safely update the ServiceUser

      // Create or update the ServerpodUser

      final isNewServerpodUser = serverServiceUser!.userInfo == null;
      session.log('update service user called');

      // we have to create a new ServerpodUser if it doesn't exist
      if (isNewServerpodUser) {
        // Create a random password
        // registrationPassword = _createServerpodPassword();

        // Create a new serverpod service user

        final serverpodUserInfo = await Users.createUser(
          session,
          UserInfo(
            fullName: trimmedServiceName,
            userIdentifier: const Uuid().v4(),
            created: now,
            scopeNames: serviceUserScopes,
            blocked: false,
          ),
          // TODO(kz): Figure out what to with this auth method.
          'service',
        );

        if (serverpodUserInfo == null) {
          throw ElbException(
            exceptionType: ElbExceptionType.validationFieldError,
            message: 'Failed to create ServerpodUser',
          );
        }
        final updatedServerpodUserInfo = serverpodUserInfo.copyWith(
          fullName: trimmedServiceName,
          imageUrl: '',
          scopeNames: serviceUserScopes,
        );

        updatedUserInfo = await UserInfo.db.updateRow(
          session,
          updatedServerpodUserInfo,
          transaction: transaction,
        );
      } else {
        // Updating Serverpod User
        final updatedServerpodUserInfo = serverServiceUser.userInfo!.copyWith(
          fullName: trimmedServiceName,
          imageUrl: '',
          scopeNames: serviceUserScopes,
        );

        updatedUserInfo = await UserInfo.db.updateRow(
          session,
          updatedServerpodUserInfo,
          transaction: transaction,
        );
      }

      final serviceUserUpdate = serviceUser.copyWith(
        userInfoId: updatedUserInfo.id,
        isDraft: false,
        lastModifiedAt: now,
        lastModifiedById: userId,
        createdAt: serverServiceUser.createdAt,
        createdById: serverServiceUser.createdById,
        editingSession: sessionId,
        serviceName: trimmedServiceName,
        serviceDescription: trimmedServiceDescription,
      );

      // finally, update the User
      final updatedServiceUser = await ServiceUserDTO.db.updateRow(
        session,
        serviceUserUpdate,
        transaction: transaction,
      );
      final fetchedServiceUser = await ServiceUserDTO.db.findById(
        session,
        updatedServiceUser.id!,
        include: ServiceUserUtils.includeAll,
        transaction: transaction,
      );

      return (
        updatedServiceUser: fetchedServiceUser,
        updatedUserInfo: updatedUserInfo,
      );
      // * End Server Operations
    });
    await Users.updateUserScopes(
      session,
      updatedUserInfo.id!,
      updatedUserInfo.scopes,
    );

    await Users.changeFullName(
      session,
      updatedUserInfo.id!,
      updatedUserInfo.fullName!,
    );

    // * Broadcast Changes & Send Email

    if (updatedServiceUser == null) {
      throw ElbException(
        exceptionType: ElbExceptionType.validationFieldError,
        message: 'Failed to update ServiceUser',
      );
    }

    serviceUserStreamController.add(updatedServiceUser);
    return updatedServiceUser;
  }

  static Future<ServiceUserDTO> updateRow(
    Session session,
    ServiceUserDTO entity,
    Transaction transaction,
  ) async {
    return ServiceUserDTO.db.updateRow(
      session,
      entity,
      transaction: transaction,
    );
  }

  static Future<ServiceUserDTO?> fetchByIdWithoutRelations(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return ServiceUserDTO.db.findById(session, id, transaction: transaction);
  }

  static Future<ServiceUserDTO?> deleteDraft(
    Session session,
    ServiceUserDTO entity,
    Transaction transaction,
  ) async {
    return ServiceUserDTO.db
        .deleteRow(session, entity, transaction: transaction);
  }
}
