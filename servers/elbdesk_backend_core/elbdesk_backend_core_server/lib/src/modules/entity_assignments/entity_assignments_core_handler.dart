import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_backend_core_server/src/modules/entity_assignments/entity_assignments_core_endpoint.dart';

class EntityAssignmentsCoreHandler {
  const EntityAssignmentsCoreHandler();

  static void add({
    required String tableType,
    required int entityId,
    required int lightUserId,
    required String additionalData,
    required DateTime? deadline,
  }) {
    final assignment = EntityAssignmentDTO(
      tableType: tableType,
      entityId: entityId,
      deadline: deadline,
      lightUserId: lightUserId,
      additionalData: additionalData,
    );
    addedAssigmemtStreamController.add(assignment);
  }

  static void remove({
    required String tableType,
    required int entityId,
    required int lightUserId,
    required DateTime? deadline,
  }) {
    final assignment = EntityAssignmentDTO(
      tableType: tableType,
      entityId: entityId,
      lightUserId: lightUserId,
      deadline: deadline,
    );
    removedAssigmemtStreamController.add(assignment);
  }

  static void handleAssignment({
    required EntityAssignmentData entityAssignmentData,
  }) {
    final oldLightUserId = entityAssignmentData.oldLightUserId;
    final newLightUserId = entityAssignmentData.newLightUserId;
    final additionalData = entityAssignmentData.additionalData;
    final tableType = entityAssignmentData.tableType;
    final entityId = entityAssignmentData.entityId;
    if (oldLightUserId == null && newLightUserId == null) {
      // do nothing
      return;
    }
    if (newLightUserId != null) {
      // add assignent to new user because he needs the new status
      // from additinal data
      add(
        tableType: tableType,
        entityId: entityId,
        lightUserId: newLightUserId,
        additionalData: additionalData,
        deadline: entityAssignmentData.deadline,
      );
      if (oldLightUserId != null && oldLightUserId != newLightUserId) {
        // remove assignment from old user
        remove(
          tableType: tableType,
          entityId: entityId,
          lightUserId: oldLightUserId,
          deadline: entityAssignmentData.deadline,
        );
      }
      return;
    }
    if (oldLightUserId != null && newLightUserId == null) {
      // remove assignment from old user
      remove(
        tableType: tableType,
        entityId: entityId,
        lightUserId: oldLightUserId,
        deadline: entityAssignmentData.deadline,
      );
      return;
    }
    if (oldLightUserId != null && newLightUserId != null) {
      // remove assignment from old user and add to new user
      remove(
        tableType: tableType,
        entityId: entityId,
        lightUserId: oldLightUserId,
        deadline: entityAssignmentData.deadline,
      );
      add(
        tableType: tableType,
        entityId: entityId,
        lightUserId: newLightUserId,
        additionalData: additionalData,
        deadline: entityAssignmentData.deadline,
      );
      return;
    }
  }
}

class EntityAssignmentData {
  EntityAssignmentData({
    required this.tableType,
    required this.entityId,
    required this.additionalData,
    required this.oldLightUserId,
    required this.newLightUserId,
    required this.deadline,
  });
  final String tableType;
  final int entityId;
  final int? oldLightUserId;
  final int? newLightUserId;
  final String additionalData;
  final DateTime? deadline;
}
