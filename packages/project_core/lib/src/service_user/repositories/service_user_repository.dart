import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:project_core/project_core.dart';
import 'package:project_core/src/service_user/models/service_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'service_user_repository.g.dart';

/// Service User Repository Provider
@riverpod
ServiceUserRepository serviceUserRepository(Ref ref) {
  return ServiceUserRepository(
    ref: ref,
    client: serverpodClient,
    endpoint: serverpodClient.serviceUser,
  );
}

/// Has Service Users Provider - Insecure Public API
///
/// Checks if there are any service users in the system
/// This is an insecure public API - accessible as non admin and non logged in

/// Service User Repository
class ServiceUserRepository implements EntityRepository<ServiceUser> {
  /// Service User Repository constructor
  ServiceUserRepository({
    required this.ref,
    required this.client,
    required this.endpoint,
  });

  final Ref ref;

  /// Serverpod Client
  final Client client;

  final EndpointServiceUser endpoint;

  @override
  Future<ServiceUser> createAndReturnEntity({
    required String sessionId,
    required ServiceUser entity,
    required bool release,
  }) async {
    final newUserDTO = await endpoint.create(sessionId: sessionId);
    return ServiceUser.fromDTO(newUserDTO);
  }

  @override
  Future<List<ServiceUser>> find({Sort? sort, Filter? filter}) async {
    final contacts = (await endpoint.find(sort: sort, filter: filter))
        .map(ServiceUser.fromDTO)
        .toList();
    return contacts;
  }

  Future<int> create({
    required String sessionId,
  }) async {
    final newContact = await endpoint.create(
      sessionId: sessionId,
    );
    return newContact.id!;
  }

  @override
  Future<bool> delete(int entityId, String sessionId) async {
    return endpoint.delete(userId: entityId, sessionId: sessionId);
  }

  @override
  Future<ServiceUser> fetchById(int id) async {
    final contact = await endpoint.fetchById(id);
    return ServiceUser.fromDTO(contact!);
  }

  @override
  Future<ServiceUser> update({
    required ServiceUser entity,
    required bool release,
    required String sessionId,
  }) async {
    final newServiceUser = await endpoint.update(
      serviceUser: entity.toDTO(),
      sessionId: sessionId,
      release: release,
    );

    return ServiceUser.fromDTO(
      newServiceUser,
    );
  }

  @override
  Future<ServiceUser?> fetchAndLock(
    int serviceUserId,
    String sessionId,
  ) async {
    final serviceUser = await endpoint.fetchAndLock(
      id: serviceUserId,
      editingSessionId: sessionId,
    );

    return serviceUser != null ? ServiceUser.fromDTO(serviceUser) : null;
  }

  @override
  Future<void> release(int entityId, String sessionId) async {
    await endpoint.release(
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  /// Fetch Service Users
  ///
  /// Public API - also accessible as non admin
  Future<List<ServiceUser>> findServiceUsers(Sort? sort, Filter? filter) async {
    final userDTO = await endpoint.find(sort: sort, filter: filter);

    final serviceUsers = userDTO.map(ServiceUser.fromDTO).toList();

    return serviceUsers;
  }

  @override
  Future<List<ServiceUser>> fetchAll() async {
    // final serviceUsers = await endpoint.fetchAll();
    // return serviceUsers.map(ServiceUser.fromDTO).toList();
    throw UnimplementedError();
  }
}
