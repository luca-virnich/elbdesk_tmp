import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_core/src/admin_migration/mats_company/logic/migration_mats_company_provider.dart';
import 'package:project_core/src/admin_migration/mats_person/logic/migration_mats_person_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'migration_providers.freezed.dart';
part 'migration_providers.g.dart';

// First, create the data model
@freezed
class MigrationCounts with _$MigrationCounts {
  const factory MigrationCounts({
    required int notMigratedCompanyCount,
    required int migratedCompanyCount,
    required int notMigratedPersonCount,
    required int migratedPersonCount,
    required int departmentCount,
    required bool hasGeneratedContacts,
    required bool hasGeneratedContactsAndPerson,
  }) = _MigrationCounts;

  const MigrationCounts._();

  int get totalCompanyCount => notMigratedCompanyCount + migratedCompanyCount;
}

// Then create the provider
@riverpod
Future<MigrationCounts> migrationCounts(Ref ref) async {
  final companyRepository = ref.watch(migrationMatsCompanyRepositoryProvider);
  final personRepository = ref.watch(migrationMatsPersonRepositoryProvider);

  // Fetch all counts in parallel
  final (
    notMigratedCount,
    migratedCount,
    notMigratedPersonCount,
    migratedPersonCount,
    departmentCount,
    hasContacts,
    hasContactsAndPerson,
  ) = await (
    companyRepository.count(isMigrated: false),
    companyRepository.count(isMigrated: true),
    personRepository.count(isMigrated: false),
    personRepository.count(isMigrated: true),
    personRepository.count(
      isMigrated: false,
      isPerson: false,
    ),
    companyRepository.hasGeneratedContacts(),
    companyRepository.hasGeneratedContactsAndPerson(),
  ).wait;

  return MigrationCounts(
    notMigratedCompanyCount: notMigratedCount,
    migratedCompanyCount: migratedCount,
    notMigratedPersonCount: notMigratedPersonCount,
    migratedPersonCount: migratedPersonCount,
    departmentCount: departmentCount,
    hasGeneratedContacts: hasContacts,
    hasGeneratedContactsAndPerson: hasContactsAndPerson,
  );
}
