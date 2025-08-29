import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/generic_crud.dart';
import 'package:elbdesk_server/src/modules/crm/department_code/department_code_utils.dart';
import 'package:elbdesk_server/src/modules/crm/department_code/endpoints/department_code_endpoint.dart';
import 'package:serverpod/serverpod.dart';

class DepartmentCodeHandler {
  const DepartmentCodeHandler._();

  static Future<DepartmentCodeDTO> create(
    Session session, {
    required DepartmentCodeDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);

    final initialEntity = DepartmentCodeUtils.initialDepartmentCode(
      userId: userId,
      sessionId: sessionId,
      entity: entity,
      release: release,
      now: now,
    );
    return GenericCrud.create(
      session,
      DepartmentCodeDTO.db.insertRow(session, initialEntity),
    );
  }

  static Future<DepartmentCodeDTO?> _fetchById(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return DepartmentCodeDTO.db.findById(session, id, transaction: transaction);
  }

  static Future<DepartmentCodeDTO> _updateRow(
    Session session,
    DepartmentCodeDTO entity,
    Transaction transaction,
  ) async {
    return DepartmentCodeDTO.db.updateRow(
      session,
      entity,
      transaction: transaction,
    );
  }

  static Future<DepartmentCodeDTO?> _deleteDraft(
    Session session,
    DepartmentCodeDTO entity,
    Transaction transaction,
  ) async {
    return DepartmentCodeDTO.db.deleteRow(
      session,
      entity,
      transaction: transaction,
    );
  }

  static Future<DepartmentCodeDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return GenericCrud.fetchAndLockEntity<DepartmentCodeDTO>(
      session,
      id: id,
      tableType: DepartmentCodeUtils.tableType,
      editingSessionId: editingSessionId,
      fetchById: _fetchById,
      tableName: DepartmentCodeDTOTable().tableName,
      streamController: departmentCodeStreamController,
    );
  }

  static Future<DepartmentCodeDTO> update(
    Session session, {
    required DepartmentCodeDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    return GenericCrud.update<DepartmentCodeDTO>(
      session,
      fetchById: _fetchById,
      sessionId: sessionId,
      newEntity: entity,
      updateEntity: _updateRow,
      tableType: DepartmentCodeUtils.tableType,
      streamController: departmentCodeStreamController,
      release: release,
      logFields: [
        // DepartmentCodeField.code,
        // DepartmentCodeField.description,
      ],
    );
  }

  static Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    await GenericCrud.releaseEntity<DepartmentCodeDTO>(
      session,
      entityId: entityId,
      sessionId: sessionId,
      fetchById: _fetchById,
      updateEntity: _updateRow,
      tableType: DepartmentCodeUtils.tableType,
      streamController: departmentCodeStreamController,
      deleteDraft: _deleteDraft,
    );
  }
}
