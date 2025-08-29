import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_core/src/service_user/_export_service_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'service_user_provider.g.dart';

/// Fetch Service User Provider
@riverpod
Future<ServiceUser?> fetchServiceUser(
  Ref ref,
  int serviceUserId,
  String sessionId,
) async {
  final repo = ref.watch(serviceUserRepositoryProvider);

  return repo.fetchAndLock(serviceUserId, sessionId);
}

/// Fetch Service Users Provider
///
/// Fetches a list of service users from the server
/// Sort and Filter are fetched from the table state through the sessionId
@riverpod
Future<List<ServiceUser>> findServiceUsers(
  Ref ref,
  String sessionId,
) async {
  final (sort, filter) = ref.watch(
    tableSortAndFilterProvider(
      sessionId,
      TableType.serviceUser.name,
    ),
  );
  final repo = ref.watch(serviceUserRepositoryProvider);

  return repo.findServiceUsers(sort, filter);
}

@riverpod
Future<List<ServiceUser>> fetchAllServiceUsers(
  Ref ref,
  String sessionId,
) async {
  final repo = ref.watch(serviceUserRepositoryProvider);
  return repo.fetchAll();
}
