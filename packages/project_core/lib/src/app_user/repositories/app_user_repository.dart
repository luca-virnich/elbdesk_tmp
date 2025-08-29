import 'package:elbdesk_backend_core_client/elbdesk_backend_core_client.dart';
import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_core/src/app_user/models/app_user.dart';

/// Has App Users Provider - Insecure Public API
///
/// Checks if there are any app users in the system
/// This is an insecure public API - accessible as non admin and non logged in

/// App User Repository
class AppUserRepository implements EntityRepository<AppUser> {
  /// App User Repository constructor
  AppUserRepository({
    required this.ref,
    required this.client,
    required this.endpoint,
  });

  final Ref ref;

  /// Serverpod Client
  final Client client;

  final EndpointAppUser endpoint;

  @override
  Future<AppUser> createAndReturnEntity({
    required String sessionId,
    required AppUser entity,
    required bool release,
  }) async {
    final newUserDTO = await endpoint.create(sessionId: sessionId);
    return AppUser.fromDTO(newUserDTO);
  }

  @override
  Future<List<AppUser>> find({Sort? sort, Filter? filter}) async {
    final contacts = (await endpoint.find(sort: sort, filter: filter))
        .map(AppUser.fromDTO)
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
  Future<AppUser> fetchById(int id) async {
    final contact = await endpoint.fetchById(id);
    return AppUser.fromDTO(contact!);
  }

  @override
  Future<AppUser> update({
    required AppUser entity,
    required bool release,
    required String sessionId,
  }) async {
    final newAppUser = await endpoint.update(
      appUser: entity.toDTO(),
      sessionId: sessionId,
      release: release,
    );

    return AppUser.fromDTO(
      newAppUser,
    );
  }

  @override
  Future<AppUser?> fetchAndLock(
    int appUserId,
    String sessionId,
  ) async {
    final appUser = await endpoint.fetchAndLock(
      id: appUserId,
      editingSessionId: sessionId,
    );

    return appUser != null ? AppUser.fromDTO(appUser) : null;
  }

  @override
  Future<void> release(int entityId, String sessionId) async {
    await endpoint.release(
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  /// Has App Users
  ///
  /// Insecure Public API - also accessible as non admin and non logged in
  Future<bool> hasUsers() async {
    final hasAppUsers = await client.appUserPublicInsecure.hasUsers();

    return hasAppUsers;
  }

  /// Create a new App User based on the provided sessionId
  Future<AppUser> createInitialAdminAppUser({
    required String email,
    required String fullName,
  }) async {
    final newUserDTO =
        await client.appUserPublicInsecure.createInitialAdminAppUser(
      email: email,
      fullName: fullName,
    );
    return AppUser.fromDTO(newUserDTO);
  }

  /// Fetch App Users
  ///
  /// Public API - also accessible as non admin
  Future<List<AppUser>> findAppUsers(Sort? sort, Filter? filter) async {
    final userDTO = await endpoint.find(sort: sort, filter: filter);

    final appUsers = userDTO.map(AppUser.fromDTO).toList();

    return appUsers;
  }

  /// Fetch App User
  ///
  /// Public API - also accessible as non admin
  Future<AppUser?> fetchAppUser(int userId) async {
    final appUser = await endpoint.fetchById(userId);

    return appUser != null ? AppUser.fromDTO(appUser) : null;
  }

  /// Promote App User to Admin
  ///
  /// Grants the AppUser admin status
  Future<bool> promoteToAdmin() async {
    final hasBeenPromoted = await client.appUser.promoteToAdmin();

    return hasBeenPromoted;
  }

  @override
  Future<List<AppUser>> fetchAll() async {
    // final appUsers = await endpoint.fetchAll();
    // return appUsers.map(AppUser.fromDTO).toList();
    throw UnimplementedError();
  }
}
