import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/generic_crud.dart';
import 'package:elbdesk_server/src/modules/core/utils/elb_exception_thrower.dart';
import 'package:elbdesk_server/src/modules/crm/company_department/endpoints/company_department_endpoint.dart';
import 'package:elbdesk_server/src/modules/crm/company_employee/company_employee_utils.dart';
import 'package:elbdesk_server/src/modules/crm/company_employee/endpoints/company_employee_endpoint.dart';
import 'package:elbdesk_shared/elbdesk_shared.dart';
import 'package:serverpod/serverpod.dart';

class CompanyEmployeeHandler {
  const CompanyEmployeeHandler._();

  static Future<CompanyEmployeeDTO> create(
    Session session, {
    required int companyId,
    required int employeeId,
  }) async {
    try {
      final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);

      final companyEmployee = await session.db.transaction((transaction) async {
        final employeeContact = await ContactDTO.db.findById(
          session,
          employeeId,
          transaction: transaction,
        );
        if (employeeContact == null) {
          throw await ElbExceptionThrower.validationError(
            session,
            exceptionType: ElbExceptionType.notFound,
            message: ElbValidationError.companyEmployeeNotFound,
          );
        }
        if (employeeContact.isDraft) {
          throw await ElbExceptionThrower.validationError(
            session,
            exceptionType: ElbExceptionType.conflict,
            message: ElbValidationError.companyEmployeeContactNotSaved,
          );
        }
        final companyContact = await ContactDTO.db.findById(
          session,
          companyId,
          transaction: transaction,
        );
        if (companyContact == null) {
          throw await ElbExceptionThrower.validationError(
            session,
            exceptionType: ElbExceptionType.notFound,
            message: ElbValidationError.companyEmployeeCompanyNotFound,
          );
        }
        if (companyContact.isDraft) {
          throw await ElbExceptionThrower.validationError(
            session,
            exceptionType: ElbExceptionType.conflict,
            message: ElbValidationError.companyEmployeeCompanyNotSaved,
          );
        }
        final isAlreadyAssigned = await isEmployeeAlreadyAssignedToCompany(
          session,
          companyId: companyId,
          employeeId: employeeId,
          transaction: transaction,
        );
        if (isAlreadyAssigned) {
          throw await ElbExceptionThrower.validationError(
            session,
            exceptionType: ElbExceptionType.conflict,
            message: ElbValidationError.companyEmployeeAlreadyAssigned,
          );
        }

        final companyEmployee = CompanyEmployeeDTO(
          companyId: companyId,
          employeeId: employeeId,
          position: '',
          departments: [],
          active: true,
          note: '',
          isDraft: false,
          createdAt: now,
          createdById: userId,
        );
        final inserted = await CompanyEmployeeDTO.db
            .insertRow(session, companyEmployee, transaction: transaction);
        final refetch = await CompanyEmployeeDTO.db.findById(
          session,
          inserted.id!,
          include: CompanyEmployeeUtils.includeAll,
          transaction: transaction,
        );
        return refetch!;
      });
      return companyEmployee;
    } on ElbException {
      rethrow;
    } on DatabaseQueryException catch (e) {
      throw e.toElbException();
    } catch (e) {
      throw ElbException(
        exceptionType: ElbExceptionType.unknown,
        message: e.toString(),
      );
    }
  }

  static Future<CompanyEmployeeDTO> update(
    Session session, {
    required CompanyEmployeeDTO companyEmployee,
    required String sessionId,
    required bool release,
  }) async {
    return GenericCrud.update<CompanyEmployeeDTO>(
      session,
      newEntity: companyEmployee,
      sessionId: sessionId,
      fetchById: fetchById,
      tableType: CompanyEmployeeUtils.tableType,
      streamController: companyEmployeeStreamController,
      updateEntity: CompanyEmployeeHandler.updateRow,
      logFields: CompanyEmployeeUtils.getLogFields(),
      release: release,
    );
  }

  static Future<CompanyEmployeeDTO?> fetchById(
    Session session,
    int id,
    Transaction? transaction,
  ) async {
    return CompanyEmployeeDTO.db.findById(
      session,
      id,
      include: CompanyEmployeeUtils.includeAll,
      transaction: transaction,
    );
  }

  /// Find first row matching a where clause with includes
  static Future<CompanyEmployeeDTO?> findFirstRowWithFilter(
    Session session,
    Expression<dynamic> where,
    CompanyEmployeeDTOInclude? include,
  ) async {
    return CompanyEmployeeDTO.db.findFirstRow(
      session,
      where: (_) => where,
      include: include,
    );
  }

  /// Find by ID with filter for a specific company
  /// Returns null if entity doesn't match the filter
  static Future<CompanyEmployeeDTO?> findByIdWithCompanyFilter(
    Session session,
    int id,
    int companyId,
    Filter? filter,
  ) async {
    final filterExpression =
        CompanyEmployeeUtils.buildExpressionForEmployees(filter);

    var whereClause = CompanyEmployeeDTOTable().id.equals(id) &
        CompanyEmployeeDTOTable().companyId.equals(companyId);

    if (filterExpression != null) {
      whereClause = whereClause & filterExpression;
    }

    return findFirstRowWithFilter(
      session,
      whereClause,
      CompanyEmployeeUtils.includeAll,
    );
  }

  static Future<CompanyEmployeeDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String sessionId,
  }) async {
    return GenericCrud.fetchAndLockEntity<CompanyEmployeeDTO>(
      session,
      id: id,
      editingSessionId: sessionId,
      fetchById: fetchById,
      tableType: CompanyEmployeeUtils.tableType,
      tableName: CompanyEmployeeDTOTable().tableName,
      streamController: companyEmployeeStreamController,
    );
  }

  static Future<CompanyEmployeeDTO> updateRow(
    Session session,
    CompanyEmployeeDTO companyEmployee,
    Transaction transaction,
  ) async {
    return CompanyEmployeeDTO.db.updateRow(
      session,
      companyEmployee,
      transaction: transaction,
    );
  }

  static Future<CompanyEmployeeDTO?> fetchWithoutRelations(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    final entity = await CompanyEmployeeDTO.db.findById(
      session,
      id,
      transaction: transaction,
    );
    return entity;
  }

  static Future<CompanyEmployeeDTO> deleteDraft(
    Session session,
    CompanyEmployeeDTO companyEmployee,
    Transaction transaction,
  ) async {
    return CompanyEmployeeDTO.db.deleteRow(
      session,
      companyEmployee,
      transaction: transaction,
    );
  }

  static Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    await GenericCrud.releaseEntity<CompanyEmployeeDTO>(
      session,
      entityId: entityId,
      sessionId: sessionId,
      // in this case we need to fetch the entity with relations
      // because its getted updated directly in the card
      fetchById: fetchById,
      tableType: CompanyEmployeeUtils.tableType,
      streamController: companyEmployeeStreamController,
      updateEntity: updateRow,
      deleteDraft: deleteDraft,
    );
  }

  static Future<bool> delete(
    Session session, {
    required int companyEmployeeId,
    required String sessionId,
  }) async {
    // Store the entries to emit events after successful transaction
    final deletedEntries = <CompanyEmployeeDepartmentJT>[];

    final result = await session.db.transaction((transaction) async {
      // First, delete all junction table entries for this employee
      final junctionEntries = await CompanyEmployeeDepartmentJT.db.find(
        session,
        where: (t) => t.companyEmployeeId.equals(companyEmployeeId),
        transaction: transaction,
      );

      for (final entry in junctionEntries) {
        await CompanyEmployeeDepartmentJT.db.deleteRow(
          session,
          entry,
          transaction: transaction,
        );
        deletedEntries.add(entry);
      }

      // Then mark the company employee as deleted
      return GenericCrud.markEntityAsDeleted<CompanyEmployeeDTO>(
        session,
        id: companyEmployeeId,
        sessionId: sessionId,
        fetchWithoutRelations: fetchById,
        tableType: CompanyEmployeeUtils.tableType,
        streamController: companyEmployeeStreamController,
        updateRow: updateRow,
        transaction: transaction,
      );
    });

    // Emit events for deleted junction table entries after successful transaction
    for (final entry in deletedEntries) {
      removeEmployeeFromDepartmentStreamController.add(entry);
    }

    return result;
  }

  // Check if an employee is already assigned to a company
  static Future<bool> isEmployeeAlreadyAssignedToCompany(
    Session session, {
    required int employeeId,
    required int companyId,
    required Transaction transaction,
  }) async {
    final companyEmployees = await CompanyEmployeeDTO.db.find(
      session,
      include: CompanyEmployeeDTO.include(),
      where: (t) =>
          t.employeeId.equals(employeeId) &
          t.companyId.equals(companyId) &
          t.deletedAt.equals(null as DateTime?),
      transaction: transaction,
    );
    return companyEmployees.isNotEmpty;
  }

  /// Add an employee to a department
  ///
  /// Creates a junction table entry linking the employee to the department
  ///
  static Future<CompanyEmployeeDepartmentJT> addEmployeeToDepartment(
    Session session, {
    required int companyEmployeeId,
    required int departmentId,
  }) async {
    return session.db.transaction((transaction) async {
      // Verify the company employee exists
      final companyEmployee = await CompanyEmployeeDTO.db.findById(
        session,
        companyEmployeeId,
        transaction: transaction,
      );
      if (companyEmployee == null) {
        throw await ElbExceptionThrower.validationError(
          session,
          exceptionType: ElbExceptionType.notFound,
          message: ElbValidationError.companyEmployeeNotFound,
        );
      }

      // Verify the department exists
      final department = await CompanyDepartmentDTO.db.findById(
        session,
        departmentId,
        transaction: transaction,
      );
      if (department == null) {
        throw await ElbExceptionThrower.validationError(
          session,
          exceptionType: ElbExceptionType.notFound,
          message: ElbValidationError.companyEmployeeDepartmentNotFound,
        );
      }

      // Check if the employee is already assigned to this department
      final existingAssignment = await CompanyEmployeeDepartmentJT.db.find(
        session,
        where: (t) =>
            t.companyEmployeeId.equals(companyEmployeeId) &
            t.companyDepartmentId.equals(departmentId),
        transaction: transaction,
      );

      if (existingAssignment.isNotEmpty) {
        throw await ElbExceptionThrower.validationError(
          session,
          exceptionType: ElbExceptionType.conflict,
          message:
              ElbValidationError.companyEmployeeAlreadyAssignedToDepartment,
        );
      }

      // Create the junction table entry
      final junctionEntry = CompanyEmployeeDepartmentJT(
        companyEmployeeId: companyEmployeeId,
        companyDepartmentId: departmentId,
      );

      final inserted = await CompanyEmployeeDepartmentJT.db.insertRow(
        session,
        junctionEntry,
        transaction: transaction,
      );

      companyEmployeeDepartmentStreamController.add(inserted);

      return inserted;
    });
  }

  /// Remove an employee from a department
  ///
  /// Deletes the junction table entry linking the employee to the department
  ///
  static Future<bool> removeEmployeeFromDepartment(
    Session session, {
    required int companyEmployeeId,
    required int departmentId,
  }) async {
    return session.db.transaction((transaction) async {
      // Find the junction table entry
      final junctionEntries = await CompanyEmployeeDepartmentJT.db.find(
        session,
        where: (t) =>
            t.companyEmployeeId.equals(companyEmployeeId) &
            t.companyDepartmentId.equals(departmentId),
        transaction: transaction,
      );

      if (junctionEntries.isEmpty) {
        throw await ElbExceptionThrower.validationError(
          session,
          exceptionType: ElbExceptionType.notFound,
          message: ElbValidationError.companyEmployeeNotAssignedToDepartment,
        );
      }

      // Delete the junction table entry
      await CompanyEmployeeDepartmentJT.db.deleteRow(
        session,
        junctionEntries.first,
        transaction: transaction,
      );

      removeEmployeeFromDepartmentStreamController.add(junctionEntries.first);

      return true;
    });
  }
}
