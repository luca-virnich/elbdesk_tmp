import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:project_core/project_core.dart';
import 'package:project_core/src/app_user/models/app_user.dart';
import 'package:project_core/src/app_user/repositories/app_user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_user_provider.g.dart';

/// App User Repository Provider
@riverpod
AppUserRepository appUserRepository(Ref ref) {
  return AppUserRepository(
    ref: ref,
    client: serverpodClient,
    endpoint: serverpodClient.appUser,
  );
}

@riverpod
Future<bool> hasAppUsers(
  Ref ref,
) async {
  final repo = ref.watch(appUserRepositoryProvider);
  return repo.hasUsers();
}

/// Fetch App User Provider
@riverpod
Future<AppUser?> fetchAppUser(
  Ref ref,
  int appUserId,
  String sessionId,
) async {
  final repo = ref.watch(appUserRepositoryProvider);

  return repo.fetchAndLock(appUserId, sessionId);
}

/// Fetch App Users Provider
///
/// Fetches a list of app users from the server
/// Sort and Filter are fetched from the table state through the sessionId
@riverpod
Future<List<AppUser>> findAppUsers(
  Ref ref,
  String sessionId,
) async {
  final (sort, filter) = ref.watch(
    tableSortAndFilterProvider(
      sessionId,
      TableType.appUser.name,
    ),
  );
  final repo = ref.watch(appUserRepositoryProvider);

  return repo.findAppUsers(sort, filter);
}

@riverpod
Future<List<AppUser>> fetchAllAppUsers(
  Ref ref,
  String sessionId,
) async {
  final repo = ref.watch(appUserRepositoryProvider);
  return repo.fetchAll();
}
