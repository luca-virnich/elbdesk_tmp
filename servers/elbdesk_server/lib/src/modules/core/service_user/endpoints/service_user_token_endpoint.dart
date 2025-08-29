import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/app_user/models/app_scope_server_extension.dart';
import 'package:elbdesk_server/src/modules/core/service_user/service_user_token_handler.dart';
import 'package:serverpod/serverpod.dart';

class ServiceUserTokenEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  @override
  Set<Scope> get requiredScopes => AppScope.serviceUser.rwd;

  /// Find all ServiceUserTokens for a specific service user
  Future<List<ServiceUserTokenDTO>> find(
    Session session, {
    required int serviceUserId,
  }) async {
    return ServiceUserTokenHandler.find(
      session,
      serviceUserId: serviceUserId,
    );
  }

  /// Create a new ServiceUserToken for a specific service user
  Future<ServiceUserTokenDTO> create(
    Session session, {
    required int serviceUserId,
    required String tokenDescription,
  }) async {
    return ServiceUserTokenHandler.create(
      session,
      serviceUserId: serviceUserId,
      tokenDescription: tokenDescription,
    );
  }

  /// Delete a ServiceUserToken
  Future<bool> delete(
    Session session, {
    required int serviceUserTokenId,
  }) async {
    return ServiceUserTokenHandler.delete(
      session,
      serviceUserTokenId: serviceUserTokenId,
    );
  }
}
