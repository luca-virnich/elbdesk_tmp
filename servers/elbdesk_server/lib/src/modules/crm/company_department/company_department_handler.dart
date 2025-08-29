import 'package:collection/collection.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/generic_crud.dart';
import 'package:elbdesk_server/src/modules/crm/company_department/company_department_utils.dart';
import 'package:elbdesk_server/src/modules/crm/company_department/endpoints/company_department_endpoint.dart';
import 'package:serverpod/serverpod.dart';

/// Handler for CompanyDepartment
///
/// This class defines the business logic for the exposed endpoints in
/// CompanyDepartmentEndpoint.
///
/// It contains the logic for fetching, creating, updating, and deleting
/// CompanyDepartment entities
///
class CompanyDepartmentHandler {
  const CompanyDepartmentHandler._();

  /// * General CRUD *

  /// Creates a new CompanyDepartment entity
  static Future<CompanyDepartmentDTO> create(
    Session session, {
    required int companyId,
  }) async {
    final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);

    final entity = CompanyDepartmentUtils.initialCompanyDepartment(
      userId: userId,
      companyId: companyId,
      now: now,
    );

    final createdEntity = await session.db.transaction((transaction) async {
      final createdEntity = await GenericCrud.create(
        session,
        CompanyDepartmentDTO.db
            .insertRow(session, entity, transaction: transaction),
      );

      return createdEntity;
    });
    // companyDepartment are created as a draft so we dont add them to the
    // stream controller

    return createdEntity;
  }

  /// Updates a CompanyDepartment entity
  static Future<CompanyDepartmentDTO> update(
    Session session, {
    required CompanyDepartmentDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    final (:updated) = await session.db.transaction((transaction) async {
      final updated = await GenericCrud.update(
        session,
        fetchById: fetchById,
        sessionId: sessionId,
        newEntity: entity,
        updateEntity: _updateRow,
        tableType: CompanyDepartmentUtils.tableType,
        streamController: companyDepartmentStreamController,
        release: release,
        transaction: transaction,
      );

      return (updated: updated);
    });
    return updated;
  }

  /// Deletes a CompanyDepartment entity
  ///
  /// This soft deletes an entity by setting the deletedAt field to now()
  static Future<bool> delete(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    return session.db.transaction((transaction) async {
      // First, delete all junction table entries for this department
      final junctionEntries = await CompanyEmployeeDepartmentJT.db.find(
        session,
        where: (t) => t.companyDepartmentId.equals(entityId),
        transaction: transaction,
      );

      // Store the entries to emit events after deletion
      final deletedEntries = <CompanyEmployeeDepartmentJT>[];

      for (final entry in junctionEntries) {
        await CompanyEmployeeDepartmentJT.db.deleteRow(
          session,
          entry,
          transaction: transaction,
        );
        deletedEntries.add(entry);
      }

      // Emit events for deleted junction table entries
      for (final entry in deletedEntries) {
        removeEmployeeFromDepartmentStreamController.add(entry);
      }

      // Then mark the company department as deleted
      return GenericCrud.markEntityAsDeleted<CompanyDepartmentDTO>(
        session,
        id: entityId,
        sessionId: sessionId,
        fetchWithoutRelations: _fetchWithoutRelations,
        updateRow: _updateRow,
        tableType: CompanyDepartmentUtils.tableType,
        streamController: companyDepartmentStreamController,
        transaction: transaction,
      );
    });
  }

  /// * Fetching *

  /// Fetches a single CompanyDepartment entity by id
  static Future<CompanyDepartmentDTO?> fetchById(
    Session session,
    int id,
    Transaction? transaction,
  ) async {
    return CompanyDepartmentDTO.db.findById(
      session,
      id,
      include: CompanyDepartmentUtils.includeAll,
      transaction: transaction,
    );
  }

  /// Fetches and locks a single CompanyDepartment entity by id
  ///
  /// The lock mechanism is implemented through the editSessionId of the entity
  static Future<CompanyDepartmentDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return GenericCrud.fetchAndLockEntity<CompanyDepartmentDTO>(
      session,
      id: id,
      tableType: CompanyDepartmentUtils.tableType,
      editingSessionId: editingSessionId,
      fetchById: fetchById,
      tableName: CompanyDepartmentDTOTable().tableName,
      streamController: companyDepartmentStreamController,
    );
  }

  /// Finds all CompanyDepartment entities
  static Future<List<CompanyDepartmentDTO>> find(
    Session session, {
    Sort? sort,
    Filter? filter,
  }) async {
    final sortByField = CompanyDepartmentField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );
    final expression = CompanyDepartmentUtils.buildExpression(filter);

    return CompanyDepartmentDTO.db.find(
      session,
      where: expression == null ? null : (t) => expression,
      orderBy: CompanyDepartmentUtils.orderBy(sortByField),
      orderDescending: sort?.orderDescending ?? false,
      include: CompanyDepartmentUtils.includeAll,
    );
  }

  /// Fetches a CompanyDepartment entity without relations
  static Future<CompanyDepartmentDTO?> _fetchWithoutRelations(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return CompanyDepartmentDTO.db
        .findById(session, id, transaction: transaction);
  }

  /// * Other *

  /// Releases a CompanyDepartment entity
  ///
  /// This clears the editingSessionId of the entity
  static Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    await GenericCrud.releaseEntity<CompanyDepartmentDTO>(
      session,
      entityId: entityId,
      sessionId: sessionId,
      fetchById: fetchById,
      updateEntity: _updateRow,
      tableType: CompanyDepartmentUtils.tableType,
      streamController: companyDepartmentStreamController,
      deleteDraft: _deleteDraft,
    );
  }

  /// Finds all locked entities for CompanyDepartment
  static Future<List<EntityLockDTO>> findEntityLocks(Session session) async {
    final entities = await CompanyDepartmentDTO.db.find(
      session,
      where: (t) =>
          t.editingSession.notEquals(null as String?) &
          t.editingSession.notEquals(''),
    );

    return entities
        .map(
          (e) => EntityLockDTO(
            tableType: CompanyDepartmentUtils.tableType.name,
            entityId: e.id!,
            editingSessionId: e.editingSession!,
            lockedAt: e.editingSince!,
            userId: e.editingById,
          ),
        )
        .toList();
  }

  /// Fetches departments by employee
  static Future<List<CompanyDepartmentDTO>> fetchDepartmentsByEmployee(
    Session session, {
    required int employeeId,
  }) async {
    // Get all junction table entries for this employee
    final junctionEntries = await CompanyEmployeeDepartmentJT.db.find(
      session,
      where: (t) => t.companyEmployeeId.equals(employeeId),
      include: CompanyEmployeeDepartmentJT.include(
        companyDepartment: CompanyDepartmentDTO.include(),
      ),
    );

    // Extract departments
    final departments = <CompanyDepartmentDTO>[];

    for (final junction in junctionEntries) {
      final department = junction.companyDepartment;
      if (department != null && department.id != null) {
        departments.add(department);
      }
    }

    return departments;
  }

  /// Watches departments by employee updates
  static Stream<CompanyDepartmentDTO> watchDepartmentsByEmployee(
    Session session, {
    required int employeeId,
  }) async* {
    // Watch for updates from the junction table streams
    yield* companyEmployeeDepartmentStreamController.stream
        .where((event) => event.companyEmployeeId == employeeId)
        .asyncMap((event) async {
          // Fetch the department for this junction entry
          final department =
              await fetchById(session, event.companyDepartmentId, null);
          return department;
        })
        .where((department) => department != null)
        .map((department) => department!);
  }

  /// Fetches departments by company
  static Future<List<CompanyDepartmentDTO>> fetchDepartmentsByCompany(
    Session session, {
    required int companyId,
    Sort? sort,
    Filter? filter,
  }) async {
    final sortByField = CompanyDepartmentField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );
    final expression = CompanyDepartmentUtils.buildExpression(filter);

    return CompanyDepartmentDTO.db.find(
      session,
      where: expression == null
          ? (t) => t.companyId.equals(companyId)
          : (t) => t.companyId.equals(companyId) & expression,
      orderBy: CompanyDepartmentUtils.orderBy(sortByField),
      orderDescending: sort?.orderDescending ?? false,
      include: CompanyDepartmentUtils.includeAll,
    );
  }

  /// * Streams *
  /// Watches departments by company updates
  static Stream<CompanyDepartmentDTO> watchDepartmentsByCompany(
    Session session, {
    required int companyId,
  }) async* {
    // Yield initial departments (only non-draft)
    // final initialDepartments = await fetchDepartmentsByCompany(
    //   session,
    //   companyId: companyId,
    // );
    // for (final department in initialDepartments) {
    //   if (!department.isDraft) {
    //     yield department;
    //   }
    // }

    // Watch for updates (only non-draft)
    yield* companyDepartmentStreamController.stream
        .where((event) => event.companyId == companyId && !event.isDraft);
  }

  /// Watches updates for a single CompanyDepartment entity
  /// Watch changes to a specific company_department
  static Stream<CompanyDepartmentDTO> watchEntity(
    Session session, {
    required String sessionId,
    required int entityId,
  }) async* {
    session.addWillCloseListener(
      (session) {
        release(session, entityId: entityId, sessionId: sessionId);
      },
    );

    // Yield initial entity if it exists
    final initialEntity = await fetchById(session, entityId, null);
    if (initialEntity != null) {
      yield initialEntity;
    }

    yield* companyDepartmentStreamController.stream
        .where((event) => event.id == entityId)
        .map((event) {
      return event;
    });
  }

  /// * Private *

  /// Updates a CompanyDepartment entity
  static Future<CompanyDepartmentDTO> _updateRow(
    Session session,
    CompanyDepartmentDTO entity,
    Transaction transaction,
  ) async {
    return CompanyDepartmentDTO.db.updateRow(
      session,
      entity,
      transaction: transaction,
    );
  }

  /// Deletes a draft CompanyDepartment entity
  static Future<CompanyDepartmentDTO?> _deleteDraft(
    Session session,
    CompanyDepartmentDTO entity,
    Transaction transaction,
  ) async {
    final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);

    // First, delete all junction table entries for this department
    final junctionEntries = await CompanyEmployeeDepartmentJT.db.find(
      session,
      where: (t) => t.companyDepartmentId.equals(entity.id),
      transaction: transaction,
    );

    // Delete junction table entries
    for (final entry in junctionEntries) {
      await CompanyEmployeeDepartmentJT.db.deleteRow(
        session,
        entry,
        transaction: transaction,
      );
    }

    // Then delete the department
    final result = await CompanyDepartmentDTO.db.deleteRow(
      session,
      entity,
      transaction: transaction,
    );

    // Emit deleted department with deletedAt to remove it from providers
    companyDepartmentStreamController.add(
      result.copyWith(
        deletedAt: now,
        deletedById: userId,
      ),
    );

    return result;
  }
}
