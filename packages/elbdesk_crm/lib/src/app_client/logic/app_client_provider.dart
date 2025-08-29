import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/src/app_client/models/app_client.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_client_provider.g.dart';

@riverpod
Future<List<AppClient>> findAppClients(
  Ref ref,
  String sessionId,
) async {
  final (sort, filter) = ref
      .watch(tableSortAndFilterProvider(sessionId, TableType.appClient.name));
  return ref
      .watch(appClientRepositoryProvider)
      .find(sort: sort, filter: filter);
}

@riverpod
AppClientRepository appClientRepository(
  Ref ref,
) {
  return AppClientRepository(
    endpoint: serverpodClient.appClient,
    ref: ref,
  );
}

@riverpod
Stream<AppClient> watchAllAppClients(
  Ref ref,
) async* {
  final streamHelper = ServerpodStreamManager<AppClient, AppClientDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: serverpodClient.appClient.watchAll,
    convertDtoToModel: AppClient.fromDTO,
  );
}

@riverpod
class FetchAndWatchAllAppClients extends _$FetchAndWatchAllAppClients {
  @override
  Future<List<AppClient>> build() async {
    ref.cacheFor(const Duration(minutes: 5));
    ref.listen(watchAllAppClientsProvider, (previous, next) {
      if (next is AsyncData<AppClient>) {
        handleEvent(next.value);
      }
    });
    final initial = await ref.watch(appClientRepositoryProvider).fetchAll();
    return initial;
  }

  Future<void> handleEvent(AppClient appClient) async {
    final current = await future;

    final index = current.indexWhere(
      (element) => element.meta.id == appClient.meta.id,
    );
    if (index != -1) {
      final updatedList = List<AppClient>.from(current);
      updatedList[index] = appClient;
      state = AsyncData(updatedList);
    } else {
      state = AsyncData([...current, appClient]);
    }
  }
}
