import 'dart:convert';
import 'dart:math';

import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/business/extensions/serverpod_extension.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/app_user/app_user_utils.dart';
import 'package:elbdesk_server/src/modules/core/app_user/endpoints/app_user_endpoint.dart';
import 'package:elbdesk_server/src/modules/core/generic_crud.dart';
import 'package:elbdesk_server/src/modules/core/utils/elb_exception_thrower.dart';
import 'package:elbdesk_shared/elbdesk_shared.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class AppUserHandler {
  const AppUserHandler._();

  // * Create

  // We are creating a new AppUser instantly and will save it as Draft, draft
  // will be set to false with the first update/saving of the AppUser.

  // Also, the Serverpod User and Light User will be created/updated with the
  // first update/saving of the AppUser.

  static Future<AppUserDTO> create(
    Session session, {
    required String sessionId,
  }) async {
    final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);

    final initialAppUser = AppUserDTO(
      firstName: null,
      lastName: null,
      initials: null,
      address: '',
      address2: '',
      postCode: '',
      city: '',
      state: '',
      phone: '',
      mobile: '',
      privateEmail: '',
      employeeNumber: '',
      position: '',
      costCenter: '',
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
    final insertedAppUser =
        await AppUserDTO.db.insertRow(session, initialAppUser);
    return insertedAppUser;
  }

  // * Read

  static Future<AppUserDTO> fetchSelf(Session session) async {
    final userId = (await session.authenticated)!.userId;

    final appUser = await AppUserDTO.db.findFirstRow(
      session,
      where: (t) => t.userInfoId.equals(userId),
      include: AppUserUtils.includeAll,
    );
    return appUser!;
  }

  static Future<AppUserDTO?> fetchByIdInternal(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return AppUserDTO.db.findById(
      session,
      id,
      include: AppUserUtils.includeAll,
      transaction: transaction,
    );
  }

  // * Update

  // We are updating an existing AppUser, we have to do several things:
  // - Check if its the first time the AppUser is being saved (its created as
  // draft initially), if so, we need to create the Serverpod User and
  // LightUser.
  // - Check if the initials are already taken by another LightUser
  // - Check if the work email is already taken by another AppUser
  // - Check if the first and last name combination is already taken by another
  //   AppUser

  static Future<AppUserDTO> update(
    Session session, {
    required String sessionId,
    required AppUserDTO appUser,
  }) async {
    session.log('update app user called 1');
    final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);
    final trimmedInitials = appUser.initials?.trim().toUpperCase() ?? '';
    if (trimmedInitials.isEmpty || trimmedInitials.length > 4) {
      throw await ElbExceptionThrower.validationError(
        session,
        exceptionType: ElbExceptionType.validationFieldError,
        message: ElbValidationError.appUserInitialsTooLong,
        field: AppUserField.initials.name,
      );
    }
    final trimmedEmail = appUser.userInfo!.email!.trim();
    if (trimmedEmail.isEmpty) {
      throw await ElbExceptionThrower.validationError(
        session,
        exceptionType: ElbExceptionType.validationFieldError,
        message: ElbValidationError.appUserEmailCannotBeEmpty,
        field: AppUserField.email.name,
      );
    }

    final appUserScopes = appUser.userInfo!.scopeNames;

    // * Clean up the AppUser
    final trimmedFirstName = appUser.firstName?.trim() ?? '';
    final trimmedLastName = appUser.lastName?.trim() ?? '';
    final trimmedFullName = '$trimmedFirstName $trimmedLastName';

    if (trimmedFirstName.isEmpty) {
      throw await ElbExceptionThrower.validationError(
        session,
        exceptionType: ElbExceptionType.validationFieldError,
        message: ElbValidationError.appUserFirstNameAndLastNameCannotBeEmpty,
        field: AppUserField.firstName.name,
      );
    }

    if (trimmedLastName.isEmpty) {
      throw await ElbExceptionThrower.validationError(
        session,
        exceptionType: ElbExceptionType.validationFieldError,
        message: ElbValidationError.appUserFirstNameAndLastNameCannotBeEmpty,
        field: AppUserField.lastName.name,
      );
    }

    // * Starting Server Operations
    final (
      :updatedLightUser,
      :updatedAppUser,
      :registrationMail,
      :registrationPassword,
      :updatedUserInfo,
    ) = await session.db.transaction((transaction) async {
      // Fetch the Server Entity

      LightUserDTO? updatedLightUser;
      String? sendRegistrationEmail;
      String? registrationPassword;

      UserInfo? updatedUserInfo;

      final serverAppUser = await AppUserDTO.db.findById(
        session,
        appUser.id!,
        include: AppUserDTO.include(
          userInfo: UserInfo.include(),
        ),
        transaction: transaction,
      );

      // Validate the Update access
      await GenericCrud.validateUpdate(
        session,
        sessionId: sessionId,
        serverEntity: serverAppUser,
        now: now,
      );

      // Check if the initials are already taken by another User
      // we are checking if we find another user with the same initials
      final initialsExistsForOtherUser = await AppUserDTO.db.findFirstRow(
        session,
        where: (t) =>
            t.initials.equals(trimmedInitials) & t.id.notEquals(appUser.id),
        transaction: transaction,
      );

      if (initialsExistsForOtherUser != null) {
        throw await ElbExceptionThrower.validationError(
          session,
          exceptionType: ElbExceptionType.validationFieldError,
          message: ElbValidationError.appUserInitialsAlreadyExists,
          artifacts: [trimmedInitials],
        );
      }

      // Check if the work email is already taken by another AppUser
      final workEmailExistsForOtherUser = await AppUserDTO.db.findFirstRow(
        session,
        where: (t) =>
            t.userInfo.email.equals(trimmedEmail) & t.id.notEquals(appUser.id),
        transaction: transaction,
      );

      if (workEmailExistsForOtherUser != null) {
        throw await ElbExceptionThrower.validationError(
          session,
          exceptionType: ElbExceptionType.validationFieldError,
          message: ElbValidationError.appUserEmailAlreadyExists,
          field: AppUserField.email.name,
          artifacts: [trimmedEmail],
        );
      }

      // Check if the first and last name combination is already taken by another
      // AppUser
      final nameExistsForOtherUser = await AppUserDTO.db.findFirstRow(
        session,
        where: (t) =>
            t.firstName.equals(trimmedFirstName) &
            t.lastName.equals(trimmedLastName) &
            t.id.notEquals(appUser.id),
        transaction: transaction,
      );

      if (nameExistsForOtherUser != null) {
        throw await ElbExceptionThrower.validationError(
          session,
          exceptionType: ElbExceptionType.validationFieldError,
          message: ElbValidationError.appUserNameAlreadyExists,
          field: AppUserField.fullName.name,
          artifacts: [trimmedFirstName, trimmedLastName, trimmedFullName],
        );
      }

      // At this stage we can safely update the AppUser and create or update the
      // LightUser and ServerpodUser

      // Create or update the ServerpodUser

      final isNewServerpodUser = serverAppUser!.userInfo == null;
      session.log('update app user called');

      // we have to create a new ServerpodUser if it doesn't exist
      if (isNewServerpodUser) {
        // Create a random password
        registrationPassword = _createServerpodPassword();

        // create serverpod email user
        final serverpodUserInfo = await Emails.createUser(
          session,
          '',
          trimmedEmail,
          registrationPassword,
        );
        if (serverpodUserInfo == null) {
          throw await ElbExceptionThrower.validationError(
            session,
            exceptionType: ElbExceptionType.unknown,
            message: ElbValidationError.appUserCouldntBeCreated,
          );
        }
        final updatedServerpodUserInfo = serverpodUserInfo.copyWith(
          fullName: trimmedFullName,
          imageUrl: '',
          scopeNames: appUserScopes,
        );

        updatedUserInfo = await UserInfo.db.updateRow(
          session,
          updatedServerpodUserInfo,
          transaction: transaction,
        );

        // Add Light User
        if (updatedUserInfo.id != 1) {
          final initialLightUser = LightUserDTO(
            userInfoId: updatedUserInfo.id,
            email: updatedUserInfo.email!,
            fullName: updatedUserInfo.fullName!,
            initials: trimmedInitials,
            imageUrl: '',
            isActive: true,
          );
          updatedLightUser = await LightUserHandler.create(
            session,
            lightUser: initialLightUser,
            transaction: transaction,
          );
        }

        // Send registration email
        sendRegistrationEmail = trimmedEmail;
      } else {
        // Updating Serverpod User
        session.log('update app user called 2 not new serverpod user');
        final updatedServerpodUserInfo = serverAppUser.userInfo!.copyWith(
          fullName: trimmedFullName,
          imageUrl: '',
          scopeNames: appUserScopes,
        );

        updatedUserInfo = await UserInfo.db.updateRow(
          session,
          updatedServerpodUserInfo,
          transaction: transaction,
        );

        // update Light User
        // find current Light User
        final currentLightUser = await LightUserHandler.fetchByUserInfoId(
          session,
          userInfoId: serverAppUser.userInfo!.id!,
          transaction: transaction,
        );

        updatedLightUser = await LightUserHandler.update(
          session,
          lightUser: currentLightUser!.copyWith(
            email: trimmedEmail,
            fullName: trimmedFullName,
            initials: trimmedInitials,
            imageUrl: '',
            isActive: appUser.isActive,
          ),
          transaction: transaction,
        );
      }

      final appUserUpdate = appUser.copyWith(
        userInfoId: updatedUserInfo.id,
        isDraft: false,
        lastModifiedAt: now,
        lastModifiedById: userId,
        createdAt: serverAppUser.createdAt,
        createdById: serverAppUser.createdById,
        editingSession: sessionId,
        firstName: trimmedFirstName,
        lastName: trimmedLastName,
        initials: trimmedInitials,
      );

      // finally, update the AppUser
      final updatedAppUser = await AppUserDTO.db.updateRow(
        session,
        appUserUpdate,
        transaction: transaction,
      );
      final fetchedAppUser = await AppUserDTO.db.findById(
        session,
        updatedAppUser.id!,
        include: AppUserUtils.includeAll,
        transaction: transaction,
      );

      return (
        updatedAppUser: fetchedAppUser,
        updatedLightUser: updatedLightUser,
        registrationMail: sendRegistrationEmail,
        registrationPassword: registrationPassword,
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
    if (updatedLightUser != null) {
      lightUserStreamController.add(updatedLightUser);
    }
    appUserStreamController.add(updatedAppUser!);
    if (registrationMail != null && registrationPassword != null) {
      await session.serverpod.mailer.sendRegistrationEmail(
        registrarEmail: 'admin@elbdesk.com',
        registrantEmail: registrationMail,
        password: registrationPassword,
      );
    }
    return updatedAppUser;
  }

  static String _createServerpodPassword() {
    final values =
        List<int>.generate(20, (int i) => Random.secure().nextInt(256));
    return base64Url.encode(values).substring(0, 20);
  }

  static Future<AppUserDTO> updateRow(
    Session session,
    AppUserDTO entity,
    Transaction transaction,
  ) async {
    return AppUserDTO.db.updateRow(
      session,
      entity,
      transaction: transaction,
    );
  }

  static Future<AppUserDTO?> fetchByIdWithoutRelations(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return AppUserDTO.db.findById(session, id, transaction: transaction);
  }

  static Future<AppUserDTO?> deleteDraft(
    Session session,
    AppUserDTO entity,
    Transaction transaction,
  ) async {
    return AppUserDTO.db.deleteRow(session, entity, transaction: transaction);
  }

  static Future<UserInfo> _updateUserInfo(
    Session session,
    UserInfo userInfo,
    Transaction transaction,
  ) async {
    session.log('private update user info called');
    session.log(userInfo.toString());

    await UserInfo.db.updateRow(session, userInfo, transaction: transaction);
    session.log('update row done');

    await Users.updateUserScopes(session, userInfo.id!, userInfo.scopes);
    session.log('private update changes scopes');

    if (userInfo.blocked) {
      await Users.blockUser(session, userInfo.id!);
    } else {
      await Users.unblockUser(session, userInfo.id!);
    }

    final updatedUserInfo = await Users.findUserByUserId(session, userInfo.id!);

    return updatedUserInfo!;
  }
}
