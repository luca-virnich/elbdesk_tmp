import 'dart:async';

import 'package:collection/collection.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/generic_crud.dart';
import 'package:elbdesk_server/src/modules/crm/company_department/endpoints/company_department_endpoint.dart';
import 'package:elbdesk_server/src/modules/crm/company_employee/company_employee_handler.dart';
import 'package:elbdesk_server/src/modules/crm/company_employee/company_employee_utils.dart';
import 'package:elbdesk_server/src/modules/crm/company_employee/endpoints/helper.dart';
import 'package:serverpod/serverpod.dart';

final companyEmployeeStreamController =
    StreamController<CompanyEmployeeDTO>.broadcast();

/// Company Employee Endpoint
///
/// This endpoint is used to manage company employees.
///
/// See [CompanyEmployeeDTO] for more information on how this is used
///
class CompanyEmployeeEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Watch an entity
  ///
  /// This is used to watch an entity for changes, which will be streamed to
  /// the client
  ///
  Stream<CompanyEmployeeDTO> watchEntity(
    Session session, {
    required String sessionId,
    required int entityId,
  }) async* {
    session.addWillCloseListener(
      (session) {
        CompanyEmployeeHandler.release(
          session,
          entityId: entityId,
          sessionId: sessionId,
        );
      },
    );

    yield* companyEmployeeStreamController.stream
        .where((event) => event.id == entityId)
        .map((event) {
      return event;
    });
  }

  /// Watch employees by company
  ///
  /// This is used to watch employees for a specific company
  ///
  Stream<CompanyEmployeeDTO> watchEmployessByCompany(
    Session session, {
    required int companyId,
  }) async* {
    yield* companyEmployeeStreamController.stream
        .where(
          (event) => event.companyId == companyId,
        )
        .map((event) => event);
  }

  /// Watch employee updates for a company with filter matching
  /// Streams a record: (removedId, employee)
  /// - If employee matches filter: (null, employee) - add/update in frontend
  /// - If employee doesn't match or deleted: (id, null) - remove from frontend
  Stream<(int?, CompanyEmployeeDTO?)> watchEmployeeByCompanyUpdates(
    Session session, {
    required int companyId,
    Filter? filter,
  }) {
    // Extremely simple: just pass session and find function
    return watchEmployessByCompany(
      session,
      companyId: companyId,
    ).withFilterUpdates(
      session: session,
      findByIdWithFilter: (session, id) =>
          CompanyEmployeeHandler.findByIdWithCompanyFilter(
        session,
        id,
        companyId,
        filter,
      ),
    );
  }

  /// Watch companies by employee
  ///
  /// This is used to watch companies for a specific employee
  ///
  Stream<CompanyEmployeeDTO> watchCompaniesByEmployee(
    Session session, {
    required int employeeId,
  }) async* {
    yield* companyEmployeeStreamController.stream
        .where(
          (event) => event.employeeId == employeeId,
        )
        .map((event) => event);
  }

  /// Watch employees by company and department
  ///
  /// This is used to watch employees for a specific company and department
  ///
  Stream<CompanyEmployeeDTO> watchEmployeesByCompanyAndDepartment(
    Session session, {
    required int companyId,
    required int departmentId,
  }) async* {
    yield* companyEmployeeDepartmentStreamController.stream
        .where((jt) => jt.companyDepartmentId == departmentId)
        .asyncMap((jt) async {
          // Fetch the company employee to get the companyId
          final companyEmployee = await CompanyEmployeeDTO.db.findById(
            session,
            jt.companyEmployeeId,
            include: CompanyEmployeeUtils.includeAll,
          );

          return companyEmployee;
        })
        .where(
          (employee) => employee != null && employee.companyId == companyId,
        )
        .map((employee) => employee!);
  }

  /// Watch employees by department deletion
  ///
  /// It returns the id of the employee that was removed from the department
  ///
  Stream<int> watchEmployeesByDepartmentDeletion(
    Session session, {
    required int departmentId,
  }) async* {
    yield* removeEmployeeFromDepartmentStreamController.stream
        .where((jt) => jt.companyDepartmentId == departmentId)
        .map((jt) => jt.companyEmployeeId);
  }

  /// Watch employee removals from any department
  ///
  /// It returns the id of the department that the employee was removed from
  ///
  Stream<int> watchEmployeeRemovalsFromAnyDepartment(
    Session session, {
    required int employeeId,
  }) async* {
    yield* removeEmployeeFromDepartmentStreamController.stream
        .where((jt) => jt.companyEmployeeId == employeeId)
        .map((jt) => jt.companyDepartmentId);
  }

  Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    await CompanyEmployeeHandler.release(
      session,
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  /// Tries to create a new Company Employee entity and checks if the employee
  /// is already assigned to the company
  ///
  Future<CompanyEmployeeDTO> create(
    Session session, {
    required int companyId,
    required int employeeId,
  }) async {
    return CompanyEmployeeHandler.create(
      session,
      companyId: companyId,
      employeeId: employeeId,
    );
  }

  /// Update a Company Employee
  ///
  /// See [GenericCrud] for more information on how this is done
  ///
  ///
  ///
  Future<CompanyEmployeeDTO> update(
    Session session, {
    required CompanyEmployeeDTO companyEmployee,
    required bool release,
    required String sessionId,
  }) async {
    return CompanyEmployeeHandler.update(
      session,
      companyEmployee: companyEmployee,
      sessionId: sessionId,
      release: release,
    );
  }

  Future<CompanyEmployeeDTO?> fetchById(
    Session session,
    int id,
  ) async {
    return CompanyEmployeeDTO.db.findById(
      session,
      id,
      include: CompanyEmployeeUtils.includeAll,
    );
  }

  /// Fetch and lock a Company Employee
  ///
  /// See [GenericCrud] for more information on how this is done
  ///
  Future<CompanyEmployeeDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return CompanyEmployeeHandler.fetchAndLock(
      session,
      id: id,
      sessionId: editingSessionId,
    );
  }

  /// Fetch list of employees for a specific company
  ///
  Future<List<CompanyEmployeeDTO>> fetchEmployeesByCompany(
    Session session, {
    required int companyId,
    Sort? sort,
    Filter? filter,
  }) {
    final sortByField = CompanyEmployeeField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );

    final filterExpression =
        CompanyEmployeeUtils.buildExpressionForEmployees(filter);

    var expression = CompanyEmployeeDTOTable().companyId.equals(companyId);

    if (filterExpression != null) {
      expression = expression & filterExpression;
    }

    return CompanyEmployeeDTO.db.find(
      session,
      include: CompanyEmployeeUtils.includeAll,
      where: (t) => expression,
      orderBy: CompanyEmployeeUtils.orderByEmployees(sortByField),
      orderDescending: sort?.orderDescending ?? false,
    );
  }

  /// Fetch list of companies for a specific employee
  ///
  Future<List<CompanyEmployeeDTO>> fetchCompaniesByEmployee(
    Session session, {
    required int employeeId,
    Sort? sort,
    Filter? filter,
  }) {
    final sortByField = CompanyEmployeeField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );

    final filterExpression =
        CompanyEmployeeUtils.buildExpressionForCompanies(filter);

    var expression = CompanyEmployeeDTOTable().employeeId.equals(employeeId);

    if (filterExpression != null) {
      expression = expression & filterExpression;
    }

    return CompanyEmployeeDTO.db.find(
      session,
      include: CompanyEmployeeDTO.include(
        company: ContactDTO.include(
          countryCode: CountryCodeDTO.include(),
          customer: CustomerDTO.include(
            paymentCode: PaymentCodeDTO.include(),
            contact: ContactDTO.include(),
          ),
        ),
        employee: ContactDTO.include(),
      ),
      where: (t) => expression,
      orderBy: CompanyEmployeeUtils.orderByCompanies(sortByField),
      orderDescending: sort?.orderDescending ?? false,
    );
  }

  /// Fetch list of employees for a specific company and department
  ///
  Future<List<CompanyEmployeeDTO>> fetchEmployeesByCompanyAndDepartment(
    Session session, {
    required int companyId,
    required int departmentId,
    Sort? sort,
    Filter? filter,
  }) {
    final sortByField = CompanyEmployeeField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );

    final filterExpression =
        CompanyEmployeeUtils.buildExpressionForEmployees(filter);

    var expression = CompanyEmployeeDTOTable().companyId.equals(companyId) &
        CompanyEmployeeDTOTable().departments.any(
              (t) => t.companyDepartmentId.equals(departmentId),
            );

    if (filterExpression != null) {
      expression = expression & filterExpression;
    }

    return CompanyEmployeeDTO.db.find(
      session,
      include: CompanyEmployeeDTO.include(
        company: ContactDTO.include(
          customer: CustomerDTO.include(),
        ),
        employee: ContactDTO.include(
          countryCode: CountryCodeDTO.include(),
        ),
        departments: CompanyEmployeeDepartmentJT.includeList(
          include: CompanyEmployeeDepartmentJT.include(
            companyDepartment: CompanyDepartmentDTO.include(),
          ),
        ),
      ),
      where: (t) => expression,
      orderBy: CompanyEmployeeUtils.orderByEmployees(sortByField),
      orderDescending: sort?.orderDescending ?? false,
    );
  }

  /// Add an employee to a department
  ///
  /// Creates a junction table entry linking the employee to the department
  ///
  Future<CompanyEmployeeDepartmentJT> addEmployeeToDepartment(
    Session session, {
    required int companyEmployeeId,
    required int departmentId,
  }) async {
    return CompanyEmployeeHandler.addEmployeeToDepartment(
      session,
      companyEmployeeId: companyEmployeeId,
      departmentId: departmentId,
    );
  }

  /// Remove an employee from a department
  ///
  /// Deletes the junction table entry linking the employee to the department
  ///
  Future<bool> removeEmployeeFromDepartment(
    Session session, {
    required int companyEmployeeId,
    required int departmentId,
  }) async {
    return CompanyEmployeeHandler.removeEmployeeFromDepartment(
      session,
      companyEmployeeId: companyEmployeeId,
      departmentId: departmentId,
    );
  }

  /// Delete a Company Employee
  ///
  /// See [GenericCrud] for more information on how this is done
  ///
  /// This only soft deletes the entity, it does not actually delete the entity
  /// from the database. A soft deleted entity will not be fetched by default
  ///
  Future<bool> delete(
    Session session, {
    required int companyEmployeeId,
    required String sessionId,
  }) async {
    return CompanyEmployeeHandler.delete(
      session,
      companyEmployeeId: companyEmployeeId,
      sessionId: sessionId,
    );
  }

  /// Find all entity locks for the Company Employee entity
  ///
  Future<List<EntityLockDTO>> findEntityLocks(Session session) async {
    final entities = await CompanyEmployeeDTO.db.find(
      session,
      where: (t) =>
          t.editingSession.notEquals(null as String?) &
          t.editingSession.notEquals(''),
    );

    return entities
        .map(
          (e) => EntityLockDTO(
            tableType: CompanyEmployeeUtils.tableType.name,
            entityId: e.id!,
            editingSessionId: e.editingSession!,
            lockedAt: e.editingSince!,
            userId: e.editingById,
          ),
        )
        .toList();
  }
}


 // * Leave this as reference
  // Stream<List<CompanyEmployeeDTO>> fetchAndWatchEmployeesByCompany(
  //   Session session, {
  //   required int companyId,
  //   sc.Sort? sort,
  //   sc.Filter? filter,
  // }) {
  //   final controller = StreamController<List<CompanyEmployeeDTO>>();

  //   // Start async operation
  //   () async {
  //     try {
  //       // Fetch initial data with full includes
  //       final initialData = await fetchEmployeesByCompany(
  //         session,
  //         companyId: companyId,
  //         sort: sort,
  //         filter: filter,
  //       );

  //       // Send initial data
  //       controller.add(initialData);

  //       // Keep track of current list
  //       final currentList = [...initialData];

  //       // Get the sort field for ordering
  //       final sortByField = CompanyEmployeeField.values.firstWhereOrNull(
  //         (e) => e.name == sort?.fieldKey,
  //       );

  //       final subscription = watchEmployessByCompany(
  //         session,
  //         companyId: companyId,
  //       ).listen(
  //         (update) async {
  //           // Update logic here
  //           final isDeleted = update.deletedAt != null;
  //           final existingIndex = currentList.indexWhere(
  //             (item) => item.id == update.id,
  //           );

  //           if (isDeleted) {
  //             if (existingIndex != -1) {
  //               currentList.removeAt(existingIndex);
  //             }
  //           } else {
  //             // Check if update matches filter by querying with filter
  //             var matchesFilter = true;
  //             if (filter != null) {
  //               final expression =
  //                   CompanyEmployeeUtils.buildExpressionForEmployees(filter);
  //               final baseWhere =
  //                   CompanyEmployeeDTOTable().id.equals(update.id) &
  //                       CompanyEmployeeDTOTable().companyId.equals(companyId);
  //               final whereClause =
  //                   expression != null ? baseWhere & expression : baseWhere;

  //               final matches = await CompanyEmployeeDTO.db.find(
  //                 session,
  //                 where: (_) => whereClause,
  //                 limit: 1,
  //               );
  //               matchesFilter = matches.isNotEmpty;
  //             }

  //             if (!matchesFilter) {
  //               // Remove from list if it doesn't match filter anymore
  //               if (existingIndex != -1) {
  //                 currentList.removeAt(existingIndex);
  //               }
  //             } else {
  //               // Fetch with full includes for the list
  //               final fullUpdate = await CompanyEmployeeDTO.db.findById(
  //                 session,
  //                 update.id!,
  //                 include: CompanyEmployeeUtils.includeAll,
  //               );

  //               if (fullUpdate == null) return;

  //               if (existingIndex != -1) {
  //                 // Update existing item
  //                 currentList[existingIndex] = fullUpdate;
  //               } else {
  //                 // Add new item
  //                 currentList.add(fullUpdate);

  //                 // Re-sort the list if sort is specified
  //                 if (sortByField != null) {
  //                   _sortListInMemory(
  //                     currentList,
  //                     sortByField,
  //                     sort?.orderDescending ?? false,
  //                   );
  //                 }
  //               }
  //             }
  //           }

  //           controller.add([...currentList]);
  //         },
  //         onError: controller.addError,
  //         onDone: controller.close,
  //       );

  //       // Clean up on session close
  //       session.addWillCloseListener((session) {
  //         subscription.cancel();
  //         controller.close();
  //       });
  //     } catch (e) {
  //       controller.addError(e);
  //     }
  //   }();

  //   return controller.stream;
  // }

// * Leave this as reference
  // void _sortListInMemory(
  //   List<CompanyEmployeeDTO> list,
  //   CompanyEmployeeField sortField,
  //   bool descending,
  // ) {
  //   list.sort((a, b) {
  //     dynamic aValue;
  //     dynamic bValue;

  //     switch (sortField) {
  //       case CompanyEmployeeField.employeeContactFullName:
  //         aValue = a.employee?.fullName ?? '';
  //         bValue = b.employee?.fullName ?? '';
  //       case CompanyEmployeeField.companyContactFullName:
  //         aValue = a.company?.fullName ?? '';
  //         bValue = b.company?.fullName ?? '';
  //       case CompanyEmployeeField.position:
  //         aValue = a.position;
  //         bValue = b.position;
  //       case CompanyEmployeeField.active:
  //         aValue = a.active ? 1 : 0;
  //         bValue = b.active ? 1 : 0;
  //       case CompanyEmployeeField.createdAt:
  //         aValue = a.createdAt;
  //         bValue = b.createdAt;
  //       case CompanyEmployeeField.id:
  //       case CompanyEmployeeField.company:
  //       case CompanyEmployeeField.employee:
  //       case CompanyEmployeeField.department:
  //       case CompanyEmployeeField.note:
  //       case CompanyEmployeeField.filterByEmployeeContactIdOrFullName:
  //       case CompanyEmployeeField.employeeContactCustomId:
  //       case CompanyEmployeeField.employeeContactAddress:
  //       case CompanyEmployeeField.employeeContactAddress2:
  //       case CompanyEmployeeField.employeeContactPostCode:
  //       case CompanyEmployeeField.employeeContactCity:
  //       case CompanyEmployeeField.employeeContactState:
  //       case CompanyEmployeeField.employeeContactPhone:
  //       case CompanyEmployeeField.employeeContactEmail:
  //       case CompanyEmployeeField.employeeContactMobile:
  //       case CompanyEmployeeField.employeeContactCountryCode:
  //       case CompanyEmployeeField.employeeContactLanguageCode:
  //       case CompanyEmployeeField.filterByCompanyContactIdOrFullName:
  //       case CompanyEmployeeField.companyContactCustomId:
  //       case CompanyEmployeeField.companyContactAddress:
  //       case CompanyEmployeeField.companyContactAddress2:
  //       case CompanyEmployeeField.companyContactPostCode:
  //       case CompanyEmployeeField.companyContactCity:
  //       case CompanyEmployeeField.companyContactState:
  //       case CompanyEmployeeField.companyContactPhone:
  //       case CompanyEmployeeField.companyContactEmail:
  //       case CompanyEmployeeField.companyContactMobile:
  //       case CompanyEmployeeField.companyContactCountryCode:
  //       case CompanyEmployeeField.companyContactLanguageCode:
  //       case CompanyEmployeeField.actions:
  //       case CompanyEmployeeField.createdBy:
  //       case CompanyEmployeeField.lastModifiedAt:
  //       case CompanyEmployeeField.lastModifiedBy:
  //       case CompanyEmployeeField.deletedAt:
  //       case CompanyEmployeeField.isDraft:
  //         aValue = a.id ?? 0;
  //         bValue = b.id ?? 0;
  //     }

  //     int comparison;
  //     if (aValue is String && bValue is String) {
  //       comparison = aValue.compareTo(bValue);
  //     } else if (aValue is num && bValue is num) {
  //       comparison = aValue.compareTo(bValue);
  //     } else if (aValue is DateTime && bValue is DateTime) {
  //       comparison = aValue.compareTo(bValue);
  //     } else {
  //       comparison = 0;
  //     }

  //     return descending ? -comparison : comparison;
  //   });
  // }
