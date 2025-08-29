import 'dart:async';

import 'package:collection/collection.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/crm/department_code/department_code_handler.dart';
import 'package:elbdesk_server/src/modules/crm/department_code/department_code_utils.dart';
import 'package:serverpod/serverpod.dart';

final departmentCodeStreamController =
    StreamController<DepartmentCodeDTO>.broadcast();

class DepartmentCodeEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  final _tableType = TableType.departmentCode;

  Stream<DepartmentCodeDTO> watch(
    Session session, {
    required String sessionId,
    required int entityId,
  }) async* {
    session.addWillCloseListener(
      (session) {
        DepartmentCodeHandler.release(
          session,
          entityId: entityId,
          sessionId: sessionId,
        );
      },
    );

    yield* departmentCodeStreamController.stream
        .where((event) => event.id == entityId)
        .map((event) {
      return event;
    });
  }

  Future<DepartmentCodeDTO> create(
    Session session, {
    required DepartmentCodeDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    return DepartmentCodeHandler.create(
      session,
      entity: entity,
      sessionId: sessionId,
      release: release,
    );
  }

  Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    await DepartmentCodeHandler.release(
      session,
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  Future<DepartmentCodeDTO?> fetchById(
    Session session,
    int id,
  ) async {
    return DepartmentCodeDTO.db.findById(
      session,
      id,
    );
  }

  Future<List<DepartmentCodeDTO>> fetchAll(Session session) async {
    return DepartmentCodeDTO.db.find(
      session,
      orderBy: DepartmentCodeUtils.dbFieldFromEnum(
        DepartmentCodeField.description,
      ),
      orderDescending: false,
    );
  }

  Future<List<DepartmentCodeDTO>> find(
    Session session, {
    Sort? sort,
    Filter? filter,
  }) async {
    final sortByField = DepartmentCodeField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );

    final expression = DepartmentCodeUtils.buildExpression(filter);

    return DepartmentCodeDTO.db.find(
      session,
      where: expression == null ? null : (t) => expression,
      orderBy: DepartmentCodeUtils.orderBy(sortByField),
      orderDescending: sort?.orderDescending ?? false,
    );
  }

  Future<DepartmentCodeDTO> update(
    Session session, {
    required DepartmentCodeDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    return DepartmentCodeHandler.update(
      session,
      entity: entity,
      sessionId: sessionId,
      release: release,
    );
  }

  Future<DepartmentCodeDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return DepartmentCodeHandler.fetchAndLock(
      session,
      id: id,
      editingSessionId: editingSessionId,
    );
  }

  Future<List<EntityLockDTO>> findEntityLocks(Session session) async {
    final entities = await DepartmentCodeDTO.db.find(
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
}
