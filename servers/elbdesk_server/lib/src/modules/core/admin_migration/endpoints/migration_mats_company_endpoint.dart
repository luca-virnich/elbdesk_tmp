import 'dart:async';

import 'package:collection/collection.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart'
    as sc;
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/admin_migration/migration_mats_company_handler.dart';
import 'package:elbdesk_server/src/modules/core/admin_migration/migration_mats_company_utils.dart';
import 'package:serverpod/serverpod.dart';

/// Broadcasts migration mats company changes to all connected clients
final migrationMatsCompanyStreamController =
    StreamController<MigrationMatsCompanyDTO>.broadcast();

/// Endpoint for managing migration mats company data
class MigrationMatsCompanyEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  static const _tableType = TableType.migrationMatsCompany;

  /// Parses a phone number to match the validator pattern
  ///
  /// The pattern allows:
  /// - Optional + at start
  /// - Numbers, spaces, and hyphens
  /// - Must start with a number or +
  /// - Must contain at least 3 numbers
  String parsePhoneNumber(String? phone) {
    if (phone == null || phone.trim().isEmpty) return '';

    // Remove all non-allowed characters except + at start
    final cleaned = phone.replaceAll(RegExp(r'[^\d\s\-\+]'), '');

    // Ensure it starts with + or a number
    if (!RegExp(r'^[\+\d]').hasMatch(cleaned)) return '';

    // Count numbers to ensure minimum length
    final numberCount = cleaned.replaceAll(RegExp(r'[^\d]'), '').length;
    if (numberCount < 3) return '';

    return cleaned;
  }

  /// Creates a new migration mats company
  Future<MigrationMatsCompanyDTO> create(
    Session session, {
    required MigrationMatsCompanyDTO entity,
  }) async {
    final created = await MigrationMatsCompanyHandler.create(session, entity);
    migrationMatsCompanyStreamController.add(created);
    return created;
  }

  /// Fetches all migration mats companies with optional sorting and filtering
  Future<List<MigrationMatsCompanyDTO>> find(
    Session session, {
    sc.Sort? sort,
    sc.Filter? filter,
  }) async {
    final sortByField = MigrationMatsCompanyField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );

    final expression = MigrationMatsCompanyUtils.buildExpression(filter);

    return MigrationMatsCompanyDTO.db.find(
      session,
      where: expression == null ? null : (t) => expression,
      orderBy: MigrationMatsCompanyUtils.orderBy(sortByField),
      orderDescending: sort?.orderDescending ?? false,
    );
  }

  /// Fetches a migration mats company by ID
  Future<MigrationMatsCompanyDTO?> fetchById(
    Session session,
    int id,
  ) async {
    return MigrationMatsCompanyHandler.fetchById(session, id);
  }

  /// Updates a migration mats company
  Future<MigrationMatsCompanyDTO> update(
    Session session, {
    required MigrationMatsCompanyDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    final updated = await MigrationMatsCompanyHandler.update(session, entity);
    migrationMatsCompanyStreamController.add(updated);
    return updated;
  }

  /// Deletes a migration mats company
  Future<void> delete(
    Session session, {
    required MigrationMatsCompanyDTO entity,
  }) async {
    await MigrationMatsCompanyHandler.delete(session, entity);
  }

  /// Stream to watch for migration mats company changes
  Stream<MigrationMatsCompanyDTO> watch(
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

    yield* migrationMatsCompanyStreamController.stream
        .where((event) => event.id == entityId)
        .map((event) => event);
  }

  /// Stream to watch for updates to a specific migration mats company
  Stream<MigrationMatsCompanyDTO> watchUpdates(
    Session session, {
    required int entityId,
  }) async* {
    yield* migrationMatsCompanyStreamController.stream
        .where((event) => event.id == entityId)
        .map((event) => event);
  }

  /// Releases lock on migration mats company
  Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    final entity =
        await MigrationMatsCompanyHandler.fetchById(session, entityId);
    if (entity != null) {
      final updated = entity.copyWith(
        editingSession: null,
        editingSince: null,
        editingById: null,
      );
      await MigrationMatsCompanyHandler.update(session, updated);
      migrationMatsCompanyStreamController.add(updated);
    }
  }

  /// Find all entity locks for migration mats company
  Future<List<EntityLockDTO>> findEntityLocks(Session session) async {
    final entities = await MigrationMatsCompanyDTO.db.find(
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

  /// Imports a batch of migration mats companies
  Future<void> import(
    Session session, {
    required List<MigrationMatsCompanyDTO> companies,
  }) async {
    await MigrationMatsCompanyHandler.import(session, companies: companies);
  }

  /// Migrates a batch of MigrationMatsCompanies to Contacts
  Future<List<ContactDTO>> migrateToContacts(
    Session session, {
    required int offset,
    required int limit,
  }) async {
    return MigrationMatsCompanyHandler.migrateToContacts(
      session,
      offset: offset,
      limit: limit,
    );
  }

  /// Gets the count of available migration mats companies
  Future<int> count(
    Session session, {
    sc.Filter? filter,
    bool? isMigrated,
  }) async {
    final expression = MigrationMatsCompanyUtils.buildExpression(filter);
    return MigrationMatsCompanyDTO.db.count(
      session,
      where: expression == null
          ? null
          : (t) => expression & (t.isMigrated.equals(isMigrated)),
    );
  }

  /// Migrates companies to customers
  Future<List<CustomerDTO>> migrateToCustomers(
    Session session, {
    required int offset,
    required int limit,
  }) async {
    return MigrationMatsCompanyHandler.migrateToCustomers(
      session,
      offset: offset,
      limit: limit,
    );
  }

  /// Assigns employees to companies based on matching accountId
  Future<(int assignedCount, bool hasMoreContacts, int lastProcessedId)>
      assignEmployeesToCompanies(
    Session session, {
    required int offset,
    required int limit,
  }) async {
    return MigrationMatsCompanyHandler.assignEmployeesToCompanies(
      session,
      offset: offset,
      limit: limit,
    );
  }

  /// Creates departments from MigrationMatsPerson entries where isPerson = false
  Future<(int createdCount, bool hasMoreDepartments, int lastProcessedId)>
      createDepartments(
    Session session, {
    required int offset,
    required int limit,
  }) async {
    return MigrationMatsCompanyHandler.createDepartments(
      session,
      offset: offset,
      limit: limit,
    );
  }

  /// Bool check if there is at least a single contact linked with a mats
  /// company
  /// contact has a relation migrationMatsCompany with migrationMatsCompanyId
  /// that we can check for that
  Future<bool> hasGeneratedContacts(Session session) async {
    final contacts = await ContactDTO.db.findFirstRow(
      session,
      where: (t) => t.migrationMatsCompanyId.notEquals(null),
    );
    return contacts != null;
  }

  /// Bool check if there is at least a single contact linked with a mats
  /// company *and* a person
  /// contact has a relation migrationMatsCompany with migrationMatsCompanyId
  /// and a relation migrationMatsPerson with migrationMatsPersonId
  /// that we can check for that
  Future<bool> hasGeneratedContactsAndPerson(Session session) async {
    final companyContact = await ContactDTO.db.findFirstRow(
      session,
      where: (t) => t.migrationMatsCompanyId.notEquals(null),
    );
    final personContact = await ContactDTO.db.findFirstRow(
      session,
      where: (t) => t.migrationMatsPersonId.notEquals(null),
    );

    return companyContact != null && personContact != null;
  }
}
