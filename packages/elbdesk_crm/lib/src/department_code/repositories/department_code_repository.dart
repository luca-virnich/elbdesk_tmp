import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/src/department_code/config/department_code_setup.dart';
import 'package:elbdesk_crm/src/department_code/models/department_code.dart';

/// @nodoc
class DepartmentCodeRepository implements EntityRepository<DepartmentCode> {
  /// @nodoc
  DepartmentCodeRepository({required this.endpoint});

  final EndpointDepartmentCode endpoint;

  @override
  Future<List<DepartmentCode>> find({Sort? sort, Filter? filter}) async {
    final response = await endpoint.find(sort: sort, filter: filter);
    return response.map(DepartmentCode.fromDTO).toList();
  }

  @override
  Future<DepartmentCode> fetchById(int id) async {
    final response = await endpoint.fetchById(id);
    return DepartmentCode.fromDTO(response!);
  }

  @override
  Future<List<DepartmentCode>> fetchAll() async {
    final response = await endpoint.fetchAll();
    return response.map(DepartmentCode.fromDTO).toList();
  }

  @override
  Future<DepartmentCode?> fetchAndLock(int id, String sessionId) async {
    final response =
        await endpoint.fetchAndLock(id: id, editingSessionId: sessionId);
    return response != null ? DepartmentCode.fromDTO(response) : null;
  }

  @override
  Future<void> release(int id, String sessionId) async {
    await endpoint.release(entityId: id, sessionId: sessionId);
  }

  @override
  Future<DepartmentCode> update({
    required DepartmentCode entity,
    required bool release,
    required String sessionId,
  }) async {
    final response = await endpoint.update(
      sessionId: sessionId,
      entity: entity.toDTO(),
      release: release,
    );
    return DepartmentCode.fromDTO(response);
  }

  @override
  Future<DepartmentCode> createAndReturnEntity({
    required DepartmentCode entity,
    required bool release,
    required String sessionId,
  }) async {
    final response = await endpoint.create(
      sessionId: sessionId,
      entity: entity.toDTO(),
      release: release,
    );
    return DepartmentCode.fromDTO(response);
  }

  @override
  Future<bool> delete(int entityId, String sessionId) async {
    // TODO: Implement delete
    // final response = await endpoint.delete(entityId, sessionId);
    // return response;
    throw UnimplementedError('delete is not implemented');
  }

  Future<void> initialSetup() async {
    for (final departmentCode in allDepartmentCodesForSetup) {
      await createAndReturnEntity(
        entity: departmentCode,
        release: true,
        sessionId: '',
      );
    }
  }
}
