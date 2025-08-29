import 'package:elbdesk_backend_core_client/elbdesk_backend_core_client.dart';
import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:project_core/src/admin_migration/mats_person/models/migration_mats_person.dart';

/// Repository for managing migration mats person data
class MigrationMatsPersonRepository {
  /// Migration Mats Person Repository constructor
  MigrationMatsPersonRepository({
    required this.endpoint,
  });

  /// Migration Mats Person Endpoint
  final EndpointMigrationMatsPerson endpoint;

  /// Find all migration mats person records
  Future<List<MigrationMatsPerson>> find({
    Sort? sort,
    Filter? filter,
  }) async {
    final dtos = await endpoint.find(sort: sort, filter: filter);
    return dtos.map(MigrationMatsPerson.fromDTO).toList();
  }

  /// Fetches migration mats person by ID
  Future<MigrationMatsPerson> fetchById(int id) async {
    final dto = await endpoint.fetchById(id);
    return MigrationMatsPerson.fromDTO(dto!);
  }

  /// Creates a new migration mats person
  Future<MigrationMatsPerson> create(MigrationMatsPerson entity) async {
    final dto = await endpoint.create(entity: entity.toDTO());
    return MigrationMatsPerson.fromDTO(dto);
  }

  /// Updates the migration mats person
  Future<MigrationMatsPerson> update({
    required MigrationMatsPerson entity,
    required bool release,
    required String sessionId,
  }) async {
    final updatedDto = await endpoint.update(
      entity: entity.toDTO(),
      sessionId: sessionId,
      release: release,
    );
    return MigrationMatsPerson.fromDTO(updatedDto);
  }

  /// Deletes a migration mats person
  Future<void> delete(MigrationMatsPerson entity) async {
    await endpoint.delete(entity: entity.toDTO());
  }

  /// Stream to watch for migration mats person changes
  Stream<MigrationMatsPerson> watch({
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
        .map(MigrationMatsPerson.fromDTO);
  }

  /// Stream to watch for updates to a specific migration mats person
  Stream<MigrationMatsPerson> watchUpdates({
    required int entityId,
  }) {
    return endpoint
        .watchUpdates(entityId: entityId)
        .map(MigrationMatsPerson.fromDTO);
  }

  /// Releases lock on migration mats person
  Future<void> release(int entityId, String sessionId) async {
    await endpoint.release(
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  /// Imports a batch of migration mats persons
  Future<void> import(List<MigrationMatsPerson> persons) async {
    const batchSize = 20;
    for (var i = 0; i < persons.length; i += batchSize) {
      final end =
          (i + batchSize < persons.length) ? i + batchSize : persons.length;
      final batch = persons.sublist(i, end);
      final dtos = batch.map((p) => p.toDTO()).toList();
      await endpoint.import(persons: dtos);
    }
  }

  /// Migrates all available MigrationMatsPersons to Contacts
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

  /// Gets the count of available migration mats persons
  Future<int> count({Filter? filter, bool? isMigrated, bool? isPerson}) async {
    return endpoint.count(
      filter: filter,
      isMigrated: isMigrated,
      isPerson: isPerson,
    );
  }
}
