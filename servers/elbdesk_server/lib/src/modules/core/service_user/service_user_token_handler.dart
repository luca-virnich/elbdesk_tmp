import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class ServiceUserTokenHandler {
  const ServiceUserTokenHandler._();

  /// Find all ServiceUserTokens for a specific service user
  static Future<List<ServiceUserTokenDTO>> find(
    Session session, {
    required int serviceUserId,
  }) async {
    final serviceUser = await ServiceUserDTO.db.findById(
      session,
      serviceUserId,
      include: ServiceUserDTO.include(
        tokens: ServiceUserTokenDTO.includeList(
          include: ServiceUserTokenDTO.include(
            authKey: AuthKey.include(),
          ),
        ),
      ),
    );

    return serviceUser?.tokens ?? [];
  }

  /// Create a new ServiceUserToken for a specific service user
  static Future<ServiceUserTokenDTO> create(
    Session session, {
    required int serviceUserId,
    required String tokenDescription,
  }) async {
    final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);

    // Verify the service user exists
    final serviceUser = await ServiceUserDTO.db.findById(
      session,
      serviceUserId,
      include: ServiceUserDTO.include(
        userInfo: UserInfo.include(),
      ),
    );

    if (serviceUser == null) {
      throw Exception('Service user not found');
    }

    if (serviceUser.userInfo == null) {
      throw Exception('Service user UserInfo not found');
    }

    final authKey = await UserAuthentication.signInUser(
      session,
      serviceUser.userInfo!.id!,
      'service',
    );

    if (authKey.key == null) {
      throw Exception('Failed to create auth key');
    }

    final serviceUserToken = ServiceUserTokenDTO(
      authKey: authKey,
      authKeyId: authKey.id,
      createdAt: now,
      tokenDescription: tokenDescription,
      isDraft: false,
      createdById: userId,
      lastModifiedAt: now,
      lastModifiedById: userId,
      deletedAt: null,
    );

    final insertedServiceUserToken =
        await ServiceUserTokenDTO.db.insertRow(session, serviceUserToken);

    await ServiceUserDTO.db.attach.tokens(
      session,
      serviceUser,
      [insertedServiceUserToken],
    );

    return insertedServiceUserToken;
  }

  /// Delete a ServiceUserToken
  static Future<bool> delete(
    Session session, {
    required int serviceUserTokenId,
  }) async {
    //TODO: add all the updated stuff, refactor etc
    final serviceUserToken = await ServiceUserTokenDTO.db.findById(
      session,
      serviceUserTokenId,
      include: ServiceUserTokenDTO.include(
        authKey: AuthKey.include(),
      ),
    );

    if (serviceUserToken == null) {
      throw Exception('Service user token not found');
    }

    if (serviceUserToken.authKey == null) {
      throw Exception('Service user token auth key not found');
    }

    try {
      await ServiceUserDTO.db.detach.tokens(
        session,
        [serviceUserToken],
      );

      await AuthKey.db.deleteRow(session, serviceUserToken.authKey!);

      await ServiceUserTokenDTO.db.deleteRow(session, serviceUserToken);
    } catch (e) {
      throw Exception('Failed to delete service user token');
    }

    return true;
  }
}
