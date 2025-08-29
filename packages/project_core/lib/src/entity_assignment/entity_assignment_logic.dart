import 'dart:async';
import 'dart:convert';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'entity_assignment_logic.g.dart';

@riverpod
class WatchEntityAssignments extends _$WatchEntityAssignments {
  @override
  Future<List<EntityAssignment>> build(int lightUserId) async {
    final initials = await ref
        .watch(entityAssignmentRepositoryProvider)
        .fetchEntityAssignments();

    ref.listen(watchNewEntityAssignmentsProvider(lightUserId: lightUserId),
        (previous, next) {
      if (next is AsyncData<EntityAssignment>) {
        handleAddedAssignment(next.value);
      }
    });

    ref.listen(watchRemovedEntityAssignmentsProvider(lightUserId: lightUserId),
        (previous, next) {
      if (next is AsyncData<EntityAssignment>) {
        handleRemovedAssignment(next.value);
      }
    });

    return initials;
  }

  Future<void> handleAddedAssignment(EntityAssignment assignment) async {
    await future;
    final currentAssignments = state.requireValue;
    // we have to check if we already have an assignment for this entity
    final existingAssignment = state.value?.firstWhereOrNull(
      (e) =>
          e.tableType == assignment.tableType &&
          e.entityId == assignment.entityId,
    );
    if (existingAssignment != null) {
      // check if the additional data has a status
      final encodedAdditionalData =
          jsonDecode(assignment.additionalData) as Map<String, dynamic>?;
      final status = encodedAdditionalData?['status'] as String?;
      if (status == 'completed' || status == 'canceled') {
        // remove, dont update
        final newState = currentAssignments
            .where(
              (e) =>
                  e.tableType != assignment.tableType ||
                  e.entityId != assignment.entityId,
            )
            .toList();

        state = AsyncData(newState);
      }

      final newState = currentAssignments
          .map(
            (e) => e.tableType == assignment.tableType &&
                    e.entityId == assignment.entityId
                ? assignment
                : e,
          )
          .toList()

        // sort by deadline
        ..sort((a, b) {
          if (a.deadline == null && b.deadline == null) {
            return 0;
          }
          if (a.deadline == null) {
            return 1; // null deadlines go at the end
          }
          if (b.deadline == null) {
            return -1; // non-null deadlines come before null
          }
          return a.deadline!
              .compareTo(b.deadline!); // sort by nearest deadline first
        });

      // update the assignment
      state = AsyncData(newState);
    } else {
      final newState = [assignment, ...currentAssignments]..sort((a, b) {
          if (a.deadline == null && b.deadline == null) {
            return 0;
          }
          if (a.deadline == null) {
            return 1; // null deadlines go at the end
          }
          if (b.deadline == null) {
            return -1; // non-null deadlines come before null
          }
          return a.deadline!
              .compareTo(b.deadline!); // sort by nearest deadline first
        });
      state = AsyncData(newState);
    }
  }

  void handleRemovedAssignment(EntityAssignment assignment) {
    state = state.whenData((value) {
      return value
          .where(
            (e) => !(e.tableType == assignment.tableType &&
                e.entityId == assignment.entityId),
          )
          .toList();
    });
  }
}

@riverpod
Stream<EntityAssignment> watchNewEntityAssignments(
  Ref ref, {
  required int lightUserId,
}) async* {
  final streamHelper =
      ServerpodStreamManager<EntityAssignment, EntityAssignmentDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.modules.core.entityAssignmentsCore
        .watchAddedAssignments(
      lightUserId: lightUserId,
    ),
    convertDtoToModel: EntityAssignment.fromDTO,
    onError: (error) {
      dlog('Error occurred in streamNewEntityAssignments: $error');
    },
  );
}

@riverpod
Stream<EntityAssignment> watchRemovedEntityAssignments(
  Ref ref, {
  required int lightUserId,
}) async* {
  final streamHelper =
      ServerpodStreamManager<EntityAssignment, EntityAssignmentDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.modules.core.entityAssignmentsCore
        .watchRemovedAssignments(
      lightUserId: lightUserId,
    ),
    convertDtoToModel: EntityAssignment.fromDTO,
    onError: (error) {
      dlog('Error occurred in streamNewEntityAssignments: $error');
    },
  );
}

@riverpod
EntityAssignmentRepository entityAssignmentRepository(
  Ref ref,
) {
  return EntityAssignmentRepository(
    endpoint: serverpodClient.entityAssignments,
  );
}

class EntityAssignmentRepository {
  const EntityAssignmentRepository({
    required this.endpoint,
  });

  final EndpointEntityAssignments endpoint;

  Future<List<EntityAssignment>> fetchEntityAssignments() async {
    final assignments = await endpoint.fetchEntityAssignments();
    return assignments.map(EntityAssignment.fromDTO).toList();
  }
}
