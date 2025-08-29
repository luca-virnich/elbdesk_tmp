import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:project_core/project_core.dart';
import 'package:project_core/src/admin_migration/mats_person/logic/migration_mats_person_controller.dart';
import 'package:project_core/src/admin_migration/mats_person/models/migration_mats_person.dart';
import 'package:project_core/src/admin_migration/mats_person/repositories/migration_mats_person_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'migration_mats_person_provider.g.dart';

@riverpod
MigrationMatsPersonRepository migrationMatsPersonRepository(Ref ref) {
  final endpoint = serverpodClient.migrationMatsPerson;
  return MigrationMatsPersonRepository(
    endpoint: endpoint,
  );
}

@riverpod
MigrationMatsPersonController migrationMatsPersonController(Ref ref) {
  final repository = ref.watch(migrationMatsPersonRepositoryProvider);
  return MigrationMatsPersonController(
    repository: repository,
  );
}

@riverpod
Future<List<MigrationMatsPerson>> findMigrationMatsPersons(
  Ref ref,
  String sessionId,
) async {
  final (sort, filter) = ref.watch(
    tableSortAndFilterProvider(
      sessionId,
      TableType.migrationMatsPerson.name,
    ),
  );

  return ref.watch(migrationMatsPersonRepositoryProvider).find(
        sort: sort,
        filter: filter,
      );
}

@riverpod
Future<MigrationMatsPerson> fetchMigrationMatsPersonById(
  Ref ref,
  int id,
) async {
  final repo = ref.watch(migrationMatsPersonRepositoryProvider);
  return repo.fetchById(id);
}

@riverpod
Stream<MigrationMatsPerson> watchMigrationMatsPersonUpdates(
  Ref ref, {
  required int id,
}) async* {
  final streamHelper =
      ServerpodStreamManager<MigrationMatsPerson, MigrationMatsPersonDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.migrationMatsPerson.watchUpdates(
      entityId: id,
    ),
    convertDtoToModel: MigrationMatsPerson.fromDTO,
  );
}

@riverpod
class FetchAndWatchMigrationMatsPerson
    extends _$FetchAndWatchMigrationMatsPerson {
  @override
  Future<MigrationMatsPerson> build(int id) async {
    ref.listen(
      watchMigrationMatsPersonUpdatesProvider(
        id: id,
      ),
      (previous, next) {
        if (next is AsyncData<MigrationMatsPerson>) {
          state = next;
        }
      },
    );
    final initial =
        await ref.watch(migrationMatsPersonRepositoryProvider).fetchById(id);
    return state.value ?? initial;
  }
}
