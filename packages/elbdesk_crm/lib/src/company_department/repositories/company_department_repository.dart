import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/src/company_department/models/company_department.dart';

/// Repository for managing CompanyDepartment entities
class CompanyDepartmentRepository
    implements EntityRepository<CompanyDepartment> {
  CompanyDepartmentRepository({
    required this.endpoint,
  });

  /// Serverpod Endpoint
  final EndpointCompanyDepartment endpoint;

  /// * General CRUD *

  /// Create a new empty company_department entity
  Future<int> create({
    required int companyId,
  }) async {
    final newEntity = await endpoint.create(
      companyId: companyId,
    );
    return newEntity.id!;
  }

  /// Create a new company_department entity
  @override
  Future<CompanyDepartment> createAndReturnEntity({
    required String sessionId,
    required CompanyDepartment entity,
    required bool release,
  }) async {
    final newEntity = await endpoint.create(
      companyId: entity.companyId,
    );
    return CompanyDepartment.fromDTO(newEntity);
  }

  /// Update a company_department entity
  @override
  Future<CompanyDepartment> update({
    required CompanyDepartment entity,
    required bool release,
    required String sessionId,
  }) async {
    final updatedItem = await endpoint.update(
      entity: entity.toDTO(),
      sessionId: sessionId,
      release: release,
    );
    return CompanyDepartment.fromDTO(updatedItem);
  }

  /// Delete a company_department entity
  @override
  Future<bool> delete(int entityId, String sessionId) async {
    return endpoint.delete(
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  /// * Fetching *

  /// Fetch all company_department entities
  @override
  Future<List<CompanyDepartment>> fetchAll() async {
    final items = await endpoint.find();
    return items.map(CompanyDepartment.fromDTO).toList();
  }

  /// Fetch a company_department entity by id
  @override
  Future<CompanyDepartment> fetchById(int id) async {
    final item = await endpoint.fetchById(id);
    return CompanyDepartment.fromDTO(item!);
  }

  /// Fetch a company_department entity by id
  @override
  Future<List<CompanyDepartment>> find({Sort? sort, Filter? filter}) async {
    final items = await endpoint.find(
      sort: sort,
      filter: filter,
    );
    return items.map(CompanyDepartment.fromDTO).toList();
  }

  /// Fetch a company_department entity by id
  /// and lock it for editing
  @override
  Future<CompanyDepartment?> fetchAndLock(
    int entityId,
    String sessionId,
  ) async {
    final item = await endpoint.fetchAndLock(
      id: entityId,
      editingSessionId: sessionId,
    );
    return item != null ? CompanyDepartment.fromDTO(item) : null;
  }

  /// * Other *

  /// Release a company_department entity
  @override
  Future<void> release(int entityId, String sessionId) async {
    await endpoint.release(
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  /// Fetch departments by company
  Future<List<CompanyDepartment>> fetchDepartmentsByCompany(
    int companyId, {
    Sort? sort,
    Filter? filter,
  }) async {
    final items = await endpoint.fetchDepartmentsByCompany(
      companyId: companyId,
      sort: sort,
      filter: filter,
    );
    return items.map(CompanyDepartment.fromDTO).toList();
  }

  /// Watch departments by company updates
  Stream<CompanyDepartment> watchDepartmentsByCompany(int companyId) {
    return endpoint
        .watchDepartmentsByCompany(companyId: companyId)
        .map(CompanyDepartment.fromDTO);
  }

  /// Fetch departments by employee
  Future<List<CompanyDepartment>> fetchDepartmentsByEmployee(
    int employeeId,
  ) async {
    final items = await endpoint.fetchDepartmentsByEmployee(
      employeeId: employeeId,
    );
    return items.map(CompanyDepartment.fromDTO).toList();
  }

  /// Watch departments by employee updates
  Stream<CompanyDepartment> watchDepartmentsByEmployee(int employeeId) {
    return endpoint
        .watchDepartmentsByEmployee(employeeId: employeeId)
        .map(CompanyDepartment.fromDTO);
  }
}
