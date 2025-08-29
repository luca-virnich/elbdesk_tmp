import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:project_core/project_core.dart';
import 'package:project_core/src/admin_migration/mats_company/logic/migration_mats_company_controller.dart';
import 'package:project_core/src/admin_migration/mats_company/models/migration_mats_company.dart';
import 'package:project_core/src/admin_migration/mats_company/repositories/migration_mats_company_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'migration_mats_company_provider.g.dart';

@riverpod
MigrationMatsCompanyRepository migrationMatsCompanyRepository(Ref ref) {
  final endpoint = serverpodClient.migrationMatsCompany;
  return MigrationMatsCompanyRepository(
    endpoint: endpoint,
  );
}

@riverpod
MigrationMatsCompanyController migrationMatsCompanyController(Ref ref) {
  final repository = ref.watch(migrationMatsCompanyRepositoryProvider);
  return MigrationMatsCompanyController(
    repository: repository,
  );
}

@riverpod
Future<List<MigrationMatsCompany>> findMigrationMatsCompanies(
  Ref ref,
  String sessionId,
) async {
  final (sort, filter) = ref.watch(
    tableSortAndFilterProvider(
      sessionId,
      TableType.migrationMatsCompany.name,
    ),
  );

  return ref.watch(migrationMatsCompanyRepositoryProvider).find(
        sort: sort,
        filter: filter,
      );
}

@riverpod
Future<MigrationMatsCompany> fetchMigrationMatsCompanyById(
  Ref ref,
  int id,
) async {
  final repo = ref.watch(migrationMatsCompanyRepositoryProvider);
  return repo.fetchById(id);
}

@riverpod
Stream<MigrationMatsCompany> watchMigrationMatsCompanyUpdates(
  Ref ref, {
  required int id,
}) async* {
  final streamHelper =
      ServerpodStreamManager<MigrationMatsCompany, MigrationMatsCompanyDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.migrationMatsCompany.watchUpdates(
      entityId: id,
    ),
    convertDtoToModel: MigrationMatsCompany.fromDTO,
  );
}

@riverpod
class FetchAndWatchMigrationMatsCompany
    extends _$FetchAndWatchMigrationMatsCompany {
  @override
  Future<MigrationMatsCompany> build(int id) async {
    ref.listen(
      watchMigrationMatsCompanyUpdatesProvider(
        id: id,
      ),
      (previous, next) {
        if (next is AsyncData<MigrationMatsCompany>) {
          state = next;
        }
      },
    );
    final initial =
        await ref.watch(migrationMatsCompanyRepositoryProvider).fetchById(id);
    return state.value ?? initial;
  }
}
