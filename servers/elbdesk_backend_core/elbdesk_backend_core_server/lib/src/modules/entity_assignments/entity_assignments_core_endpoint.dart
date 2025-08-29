import 'dart:async';

import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';

final addedAssigmemtStreamController =
    StreamController<EntityAssignmentDTO>.broadcast();

final removedAssigmemtStreamController =
    StreamController<EntityAssignmentDTO>.broadcast();

class EntityAssignmentsCoreEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Stream<EntityAssignmentDTO> watchAddedAssignments(
    Session session, {
    required int lightUserId,
  }) async* {
    yield* addedAssigmemtStreamController.stream
        .where((event) => event.lightUserId == lightUserId);
  }

  Stream<EntityAssignmentDTO> watchRemovedAssignments(
    Session session, {
    required int lightUserId,
  }) async* {
    yield* removedAssigmemtStreamController.stream
        .where((event) => event.lightUserId == lightUserId);
  }
}
