import 'dart:async';

import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/crm/company_department/company_department_handler.dart';
import 'package:serverpod/serverpod.dart';

/// Stream controller for CompanyDepartment
///
/// This is used to broadcast updates to the client
/// Exposed through watch endpoints
final companyDepartmentStreamController =
    StreamController<CompanyDepartmentDTO>.broadcast();

final companyEmployeeDepartmentStreamController =
    StreamController<CompanyEmployeeDepartmentJT>.broadcast();

final removeEmployeeFromDepartmentStreamController =
    StreamController<CompanyEmployeeDepartmentJT>.broadcast();

/// Endpoint for [CompanyDepartmentDTO]
///
/// This exposes the endpoints for CompanyDepartment
///
/// Used by the corresponding repository in the clients frontend
///
class CompanyDepartmentEndpoint extends Endpoint {
  /// Whether the endpoint requires a login
  @override
  bool get requireLogin => true;

  /// * General CRUD *

  /// Creates a new CompanyDepartment
  Future<CompanyDepartmentDTO> create(
    Session session, {
    required int companyId,
  }) async {
    return CompanyDepartmentHandler.create(
      session,
      companyId: companyId,
    );
  }

  /// Updates a CompanyDepartment
  Future<CompanyDepartmentDTO> update(
    Session session, {
    required CompanyDepartmentDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    return CompanyDepartmentHandler.update(
      session,
      entity: entity,
      sessionId: sessionId,
      release: release,
    );
  }

  /// Deletes a CompanyDepartment
  Future<bool> delete(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    return CompanyDepartmentHandler.delete(
      session,
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  /// * Fetching *

  /// Fetches a single CompanyDepartment by id
  Future<CompanyDepartmentDTO?> fetchById(
    Session session,
    int id,
  ) async {
    return CompanyDepartmentHandler.fetchById(
      session,
      id,
      null,
    );
  }

  /// Finds all CompanyDepartment entities
  ///
  /// Filtered and sorted by the given parameters
  /// These are usually defined through table settings in the client
  Future<List<CompanyDepartmentDTO>> find(
    Session session, {
    Sort? sort,
    Filter? filter,
  }) async {
    return CompanyDepartmentHandler.find(
      session,
      sort: sort,
      filter: filter,
    );
  }

  /// Fetches and locks a single CompanyDepartment by id
  Future<CompanyDepartmentDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return CompanyDepartmentHandler.fetchAndLock(
      session,
      id: id,
      editingSessionId: editingSessionId,
    );
  }

  /// * Streams *

  /// Watches updates for a single CompanyDepartment
  /// Watch changes to a specific company_department
  Stream<CompanyDepartmentDTO> watchEntity(
    Session session, {
    required String sessionId,
    required int entityId,
  }) async* {
    yield* CompanyDepartmentHandler.watchEntity(
      session,
      sessionId: sessionId,
      entityId: entityId,
    );
  }

  /// * Other *

  /// Releases a CompanyDepartment
  Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    await CompanyDepartmentHandler.release(
      session,
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  /// Finds all locked entities for CompanyDepartment
  Future<List<EntityLockDTO>> findEntityLocks(Session session) async {
    return CompanyDepartmentHandler.findEntityLocks(session);
  }

  /// Fetches departments by company
  Future<List<CompanyDepartmentDTO>> fetchDepartmentsByCompany(
    Session session, {
    required int companyId,
    Sort? sort,
    Filter? filter,
  }) async {
    return CompanyDepartmentHandler.fetchDepartmentsByCompany(
      session,
      companyId: companyId,
      sort: sort,
      filter: filter,
    );
  }

  /// Watches departments by company updates
  Stream<CompanyDepartmentDTO> watchDepartmentsByCompany(
    Session session, {
    required int companyId,
  }) async* {
    yield* CompanyDepartmentHandler.watchDepartmentsByCompany(
      session,
      companyId: companyId,
    );
  }

  /// Fetches departments by employee
  Future<List<CompanyDepartmentDTO>> fetchDepartmentsByEmployee(
    Session session, {
    required int employeeId,
  }) async {
    return CompanyDepartmentHandler.fetchDepartmentsByEmployee(
      session,
      employeeId: employeeId,
    );
  }

  /// Watches departments by employee updates
  Stream<CompanyDepartmentDTO> watchDepartmentsByEmployee(
    Session session, {
    required int employeeId,
  }) async* {
    yield* CompanyDepartmentHandler.watchDepartmentsByEmployee(
      session,
      employeeId: employeeId,
    );
  }
}
