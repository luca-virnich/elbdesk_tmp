import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:project_core/project_core.dart';
import 'package:project_core/src/service_user/models/service_user_token.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'service_user_token_repository.g.dart';

/// Service User Repository Provider
@riverpod
ServiceUserTokenRepository serviceUserTokenRepository(Ref ref) {
  return ServiceUserTokenRepository(
    ref: ref,
    client: serverpodClient,
    endpoint: serverpodClient.serviceUserToken,
  );
}

/// Has Service Users Provider - Insecure Public API
///
/// Checks if there are any service users in the system
/// This is an insecure public API - accessible as non admin and non logged in

/// Service User Repository
class ServiceUserTokenRepository {
  /// Service User Repository constructor
  ServiceUserTokenRepository({
    required this.ref,
    required this.client,
    required this.endpoint,
  });

  final Ref ref;

  /// Serverpod Client
  final Client client;

  final EndpointServiceUserToken endpoint;

  // @override
  Future<ServiceUserToken> createAndReturnEntity({
    required String sessionId,
    // required ServiceUserToken entity,
    required String tokenDescription,
    // required bool release,
    required int serviceUserId,
  }) async {
    dlog('createAndReturnEntity called');
    final newUserDTO = await endpoint.create(
      serviceUserId: serviceUserId,
      tokenDescription: tokenDescription,
    );
    return ServiceUserToken.fromDTO(newUserDTO);
  }

  // @override
  Future<List<ServiceUserToken>> find({required int serviceUserId}) async {
    dlog('find called');
    final serviceUserTokens =
        (await endpoint.find(serviceUserId: serviceUserId))
            .map(ServiceUserToken.fromDTO)
            .toList();
    return serviceUserTokens;
  }

  // Future<int> create({
  //   required String sessionId,
  // }) async {
  //   print('create called');
  //   final newContact = await endpoint.create(
  //     sessionId: sessionId,
  //   );
  //   return newContact.id!;
  // }

  // @override
  Future<bool> delete({required int serviceUserTokenId}) async {
    dlog('delete called');
    return endpoint.delete(
      serviceUserTokenId: serviceUserTokenId,
    );
  }

  // @override
  // Future<ServiceUser> fetchById(int id) async {
  //   print('fetchById called');
  //   final contact = await endpoint.fetchById(id);
  //   return ServiceUser.fromDTO(contact!);
  // }

  // @override
  // Future<ServiceUser> update({
  //   required ServiceUser entity,
  //   required bool release,
  //   required String sessionId,
  // }) async {
  //   print('update called');
  //   final newServiceUser = await endpoint.update(
  //     serviceUser: entity.toDTO(),
  //     sessionId: sessionId,
  //     release: release,
  //   );

  //   return ServiceUser.fromDTO(
  //     newServiceUser,
  //   );
  // }

  // @override
  // Future<ServiceUser?> fetchAndLock(
  //   int serviceUserId,
  //   String sessionId,
  // ) async {
  //   print('fetchAndLock called');
  //   final serviceUser = await endpoint.fetchAndLock(
  //     id: serviceUserId,
  //     editingSessionId: sessionId,
  //   );

  //   return serviceUser != null ? ServiceUser.fromDTO(serviceUser) : null;
  // }

  // @override
  // Future<void> release(int entityId, String sessionId) async {
  //   print('release called');
  //   await endpoint.release(
  //     entityId: entityId,
  //     sessionId: sessionId,
  //   );
  // }

  // /// Fetch Service Users
  // ///
  // /// Public API - also accessible as non admin
  // Future<List<ServiceUser>> findServiceUsers(Sort? sort, Filter? filter) async {
  //   print('findServiceUsers called');
  //   final userDTO = await endpoint.find(sort: sort, filter: filter);

  //   final serviceUsers = userDTO.map(ServiceUser.fromDTO).toList();

  //   return serviceUsers;
  // }

  // @override
  // Future<List<ServiceUser>> fetchAll() async {
  //   print('fetchAll called');
  //   // final serviceUsers = await endpoint.fetchAll();
  //   // return serviceUsers.map(ServiceUser.fromDTO).toList();
  //   throw UnimplementedError();
  // }
}
