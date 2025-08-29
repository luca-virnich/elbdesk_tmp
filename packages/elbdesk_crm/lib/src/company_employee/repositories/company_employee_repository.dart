import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/src/company_employee/models/company_employee.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CompanyEmployeeRepository implements EntityRepository<CompanyEmployee> {
  CompanyEmployeeRepository({
    required this.ref,
    required this.endpoint,
  });

  final Ref ref;

  final EndpointCompanyEmployee endpoint;

  @override
  Future<CompanyEmployee> createAndReturnEntity({
    required String sessionId,
    required CompanyEmployee entity,
    required bool release,
  }) async {
    throw UnimplementedError();
  }

  Future<int> createCompanyEmployee({
    required int companyId,
    required int employeeId,
  }) async {
    final newCompanyEmployee = await endpoint.create(
      companyId: companyId,
      employeeId: employeeId,
    );

    return newCompanyEmployee.id!;
  }

  @override
  Future<bool> delete(int companyEmployeeId, String sessionId) async {
    return endpoint.delete(
      companyEmployeeId: companyEmployeeId,
      sessionId: sessionId,
    );
  }

  @override
  Future<CompanyEmployee?> fetchAndLock(
    int companyEmployeeId,
    String sessionId,
  ) async {
    final companyEmployee = await endpoint.fetchAndLock(
      id: companyEmployeeId,
      editingSessionId: sessionId,
    );

    return companyEmployee != null
        ? CompanyEmployee.fromDTO(companyEmployee)
        : null;
  }

  @override
  Future<void> release(int entityId, String sessionId) async {
    await endpoint.release(
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  @override
  Future<CompanyEmployee?> fetchById(int entityId) async {
    final companyEmployee = await endpoint.fetchById(
      entityId,
    );
    return companyEmployee != null
        ? CompanyEmployee.fromDTO(companyEmployee)
        : null;
  }

  @override
  Future<List<CompanyEmployee>> fetchAll() async {
    throw UnimplementedError();
  }

  @override
  Future<List<CompanyEmployee>> find({Sort? sort, Filter? filter}) async {
    throw UnimplementedError();
  }

  @override
  Future<CompanyEmployee> update({
    required CompanyEmployee entity,
    required bool release,
    required String sessionId,
  }) async {
    final newCompanyEmployee = await endpoint.update(
      companyEmployee: entity.toDTO(),
      sessionId: sessionId,
      release: release,
    );
    return CompanyEmployee.fromDTO(newCompanyEmployee);
  }

  Future<List<CompanyEmployee>> fetchEmployeesByCompany(
    int companyId,
    Sort? sort,
    Filter? filter,
  ) async {
    final companyEmployees = await endpoint.fetchEmployeesByCompany(
      companyId: companyId,
      sort: sort,
      filter: filter,
    );
    return companyEmployees.map(CompanyEmployee.fromDTO).toList();
  }

  Future<List<CompanyEmployee>> fetchCompaniesByEmployee(
    int employeeId,
    Sort? sort,
    Filter? filter,
  ) async {
    final companyEmployees = await endpoint.fetchCompaniesByEmployee(
      employeeId: employeeId,
      sort: sort,
      filter: filter,
    );
    return companyEmployees.map(CompanyEmployee.fromDTO).toList();
  }

  Future<List<CompanyEmployee>> fetchEmployeesByCompanyAndDepartment(
    int companyId,
    int departmentId,
    Sort? sort,
    Filter? filter,
  ) async {
    final companyEmployees =
        await endpoint.fetchEmployeesByCompanyAndDepartment(
      companyId: companyId,
      departmentId: departmentId,
      sort: sort,
      filter: filter,
    );
    return companyEmployees.map(CompanyEmployee.fromDTO).toList();
  }

  /// Add an employee to a department
  ///
  /// Creates a junction table entry linking the employee to the department
  ///
  Future<CompanyEmployeeDepartmentJT> addEmployeeToDepartment({
    required int companyEmployeeId,
    required int departmentId,
  }) async {
    return endpoint.addEmployeeToDepartment(
      companyEmployeeId: companyEmployeeId,
      departmentId: departmentId,
    );
  }

  /// Remove an employee from a department
  ///
  /// Deletes the junction table entry linking the employee to the department
  ///
  Future<bool> removeEmployeeFromDepartment({
    required int companyEmployeeId,
    required int departmentId,
  }) async {
    return endpoint.removeEmployeeFromDepartment(
      companyEmployeeId: companyEmployeeId,
      departmentId: departmentId,
    );
  }
}
