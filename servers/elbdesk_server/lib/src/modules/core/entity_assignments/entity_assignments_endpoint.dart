import 'dart:async';

import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/modules/core/entity_assignments/entity_assignments_handler.dart';
import 'package:serverpod/serverpod.dart';

class EntityAssignmentsEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<List<EntityAssignmentDTO>> fetchEntityAssignments(
    Session session,
  ) async {
    final userId = await CoreUtils.getCurrentUserId(session);
    final lightUserId = await LightUserHandler.fetchByUserInfoId(
      session,
      userInfoId: userId,
    );

    if (lightUserId == null) {
      return [];
    }

    final result = <EntityAssignmentDTO>[];

    final assignments = await EntityAssignmentHandler.fetchAssignments(
      session,
      lightUserId.id!,
    );

    result.addAll(assignments);

    return result;
  }
}
