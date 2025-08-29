import 'package:elbdesk_backend_core_client/elbdesk_backend_core_client.dart';
import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:project_core/src/admin_migration/mats_company/models/migration_mats_company.dart';

/// Repository for managing migration mats company data
class MigrationMatsCompanyRepository {
  /// Migration Mats Company Repository constructor
  MigrationMatsCompanyRepository({
    required this.endpoint,
  });

  /// Migration Mats Company Endpoint
  final EndpointMigrationMatsCompany endpoint;

  /// Find all migration mats company records
  Future<List<MigrationMatsCompany>> find({
    Sort? sort,
    Filter? filter,
  }) async {
    final dtos = await endpoint.find(sort: sort, filter: filter);
    return dtos.map(MigrationMatsCompany.fromDTO).toList();
  }

  /// Fetches migration mats company by ID
  Future<MigrationMatsCompany> fetchById(int id) async {
    final dto = await endpoint.fetchById(id);
    return MigrationMatsCompany.fromDTO(dto!);
  }

  /// Creates a new migration mats company
  Future<MigrationMatsCompany> create(MigrationMatsCompany entity) async {
    final dto = await endpoint.create(entity: entity.toDTO());
    return MigrationMatsCompany.fromDTO(dto);
  }

  /// Updates the migration mats company
  Future<MigrationMatsCompany> update({
    required MigrationMatsCompany entity,
    required bool release,
    required String sessionId,
  }) async {
    final updatedDto = await endpoint.update(
      entity: entity.toDTO(),
      sessionId: sessionId,
      release: release,
    );
    return MigrationMatsCompany.fromDTO(updatedDto);
  }

  /// Deletes a migration mats company
  Future<void> delete(MigrationMatsCompany entity) async {
    await endpoint.delete(entity: entity.toDTO());
  }

  /// Stream to watch for migration mats company changes
  Stream<MigrationMatsCompany> watch({
    required String sessionId,
    required int entityId,
    required bool releaseOnClose,
  }) {
    return endpoint
        .watch(
          sessionId: sessionId,
          entityId: entityId,
          releaseOnClose: releaseOnClose,
        )
        .map(MigrationMatsCompany.fromDTO);
  }

  /// Stream to watch for updates to a specific migration mats company
  Stream<MigrationMatsCompany> watchUpdates({
    required int entityId,
  }) {
    return endpoint
        .watchUpdates(entityId: entityId)
        .map(MigrationMatsCompany.fromDTO);
  }

  /// Releases lock on migration mats company
  Future<void> release(int entityId, String sessionId) async {
    await endpoint.release(
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  /// Imports a batch of migration mats companies
  Future<void> import(List<MigrationMatsCompany> companies) async {
    const batchSize = 20;
    for (var i = 0; i < companies.length; i += batchSize) {
      final end =
          (i + batchSize < companies.length) ? i + batchSize : companies.length;
      final batch = companies.sublist(i, end);
      final dtos = batch.map((c) => c.toDTO()).toList();
      await endpoint.import(companies: dtos);
    }
  }

  /// Migrates all available MigrationMatsCompanies to Contacts
  Future<List<Contact>> migrateToContacts({
    required int offset,
    required int limit,
  }) async {
    final dtos = await endpoint.migrateToContacts(
      offset: offset,
      limit: limit,
    );
    return dtos.map(Contact.fromDTO).toList();
  }

  /// Migrates all available MigrationMatsCompanies to Customers
  Future<List<Customer>> migrateToCustomers({
    required int offset,
    required int limit,
  }) async {
    final dtos = await endpoint.migrateToCustomers(
      offset: offset,
      limit: limit,
    );
    return dtos.map(Customer.fromDTO).toList();
  }

  /// Gets the count of available migration mats companies
  Future<int> count({Filter? filter, bool? isMigrated}) async {
    return endpoint.count(
      filter: filter,
      isMigrated: isMigrated,
    );
  }

  /// Assigns employees to companies based on matching accountId
  Future<(int assignedCount, bool hasMoreContacts, int lastProcessedId)>
      assignEmployeesToCompanies({
    required int offset,
    required int limit,
  }) async {
    return endpoint.assignEmployeesToCompanies(
      offset: offset,
      limit: limit,
    );
  }

  /// Checks if there is at least a single contact linked with a mats company
  Future<bool> hasGeneratedContacts() async {
    return endpoint.hasGeneratedContacts();
  }

  /// Checks if there is at least a single contact linked with a mats company
  /// and a person
  Future<bool> hasGeneratedContactsAndPerson() async {
    return endpoint.hasGeneratedContactsAndPerson();
  }

  /// Creates departments from MigrationMatsPerson entries where isPerson = false
  Future<(int createdCount, bool hasMoreDepartments, int lastProcessedId)>
      createDepartments({
    required int offset,
    required int limit,
  }) async {
    return endpoint.createDepartments(
      offset: offset,
      limit: limit,
    );
  }
}
