import 'dart:async';

import 'package:collection/collection.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart'
    as sc;
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/admin_migration/migration_mats_person_handler.dart';
import 'package:elbdesk_server/src/modules/core/admin_migration/migration_mats_person_utils.dart';
import 'package:serverpod/serverpod.dart';

/// Broadcasts migration mats person changes to all connected clients
final migrationMatsPersonStreamController =
    StreamController<MigrationMatsPersonDTO>.broadcast();

/// Endpoint for managing migration mats person data
class MigrationMatsPersonEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  // @override
  // Set<Scope> get requiredScopes => AppScope.superAdmin.rwd;

  static const _tableType = TableType.migrationMatsPerson;

  /// Creates a new migration mats person
  Future<MigrationMatsPersonDTO> create(
    Session session, {
    required MigrationMatsPersonDTO entity,
  }) async {
    final created = await MigrationMatsPersonHandler.create(session, entity);
    migrationMatsPersonStreamController.add(created);
    return created;
  }

  /// Fetches all migration mats persons with optional sorting and filtering
  Future<List<MigrationMatsPersonDTO>> find(
    Session session, {
    sc.Sort? sort,
    sc.Filter? filter,
  }) async {
    final sortByField = MigrationMatsPersonField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );

    final expression = MigrationMatsPersonUtils.buildExpression(filter);

    return MigrationMatsPersonDTO.db.find(
      session,
      where: expression == null ? null : (t) => expression,
      orderBy: MigrationMatsPersonUtils.orderBy(sortByField),
      orderDescending: sort?.orderDescending ?? false,
    );
  }

  /// Fetches a migration mats person by ID
  Future<MigrationMatsPersonDTO?> fetchById(
    Session session,
    int id,
  ) async {
    return MigrationMatsPersonHandler.fetchById(session, id);
  }

  /// Updates a migration mats person
  Future<MigrationMatsPersonDTO> update(
    Session session, {
    required MigrationMatsPersonDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    final updated = await MigrationMatsPersonHandler.update(session, entity);
    migrationMatsPersonStreamController.add(updated);
    return updated;
  }

  /// Deletes a migration mats person
  Future<void> delete(
    Session session, {
    required MigrationMatsPersonDTO entity,
  }) async {
    await MigrationMatsPersonHandler.delete(session, entity);
  }

  /// Stream to watch for migration mats person changes
  Stream<MigrationMatsPersonDTO> watch(
    Session session, {
    required String sessionId,
    required int entityId,
    required bool releaseOnClose,
  }) async* {
    if (releaseOnClose) {
      session.addWillCloseListener(
        (session) {
          release(session, entityId: entityId, sessionId: sessionId);
        },
      );
    }

    yield* migrationMatsPersonStreamController.stream
        .where((event) => event.id == entityId)
        .map((event) => event);
  }

  /// Stream to watch for updates to a specific migration mats person
  Stream<MigrationMatsPersonDTO> watchUpdates(
    Session session, {
    required int entityId,
  }) async* {
    yield* migrationMatsPersonStreamController.stream
        .where((event) => event.id == entityId)
        .map((event) => event);
  }

  /// Releases lock on migration mats person
  Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    final entity =
        await MigrationMatsPersonHandler.fetchById(session, entityId);
    if (entity != null) {
      final updated = entity.copyWith(
        editingSession: null,
        editingSince: null,
        editingById: null,
      );
      await MigrationMatsPersonHandler.update(session, updated);
      migrationMatsPersonStreamController.add(updated);
    }
  }

  /// Find all entity locks for migration mats person
  Future<List<EntityLockDTO>> findEntityLocks(Session session) async {
    final entities = await MigrationMatsPersonDTO.db.find(
      session,
      where: (t) =>
          t.editingSession.notEquals(null as String?) &
          t.editingSession.notEquals(''),
    );

    return entities
        .map(
          (e) => EntityLockDTO(
            tableType: _tableType.name,
            entityId: e.id!,
            editingSessionId: e.editingSession!,
            lockedAt: e.editingSince!,
            userId: e.editingById,
          ),
        )
        .toList();
  }

  /// Imports a batch of migration mats persons
  Future<void> import(
    Session session, {
    required List<MigrationMatsPersonDTO> persons,
  }) async {
    await MigrationMatsPersonHandler.import(session, persons: persons);
  }

  /// Migrates a batch of MigrationMatsPersons to Contacts
  Future<List<ContactDTO>> migrateToContacts(
    Session session, {
    required int offset,
    required int limit,
  }) async {
    return MigrationMatsPersonHandler.migrateToContacts(
      session,
      offset: offset,
      limit: limit,
    );
  }

  /// Gets the count of available migration mats persons
  Future<int> count(
    Session session, {
    sc.Filter? filter,
    bool? isMigrated,
    bool? isPerson,
  }) async {
    final expression = MigrationMatsPersonUtils.buildExpression(filter);

    // This allows isMigrated or isPerson to be null and the query still works
    return MigrationMatsPersonDTO.db.count(
      session,
      where: expression == null
          ? null
          : (t) {
              var whereClause = expression;
              if (isMigrated != null) {
                whereClause = whereClause & t.isMigrated.equals(isMigrated);
              }
              if (isPerson != null) {
                whereClause = whereClause & t.isPerson.equals(isPerson);
              }
              return whereClause;
            },
    );
  }
}
