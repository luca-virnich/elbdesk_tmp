import 'dart:async';

import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork_quarantine_group/artwork_quarantine_group_handler.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork_quarantine_group/artwork_quarantine_group_utils.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';

// Stream controller for real-time updates
final artworkQuarantineGroupStreamController =
    StreamController<ArtworkQuarantineGroupDTO>.broadcast();

class ArtworkQuarantineGroupEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Watch changes to a specific quarantine group
  Stream<ArtworkQuarantineGroupDTO> watchEntity(
    Session session, {
    required String sessionId,
    required int entityId,
  }) async* {
    session.addWillCloseListener(
      (session) {
        release(session, entityId: entityId, sessionId: sessionId);
      },
    );

    yield* artworkQuarantineGroupStreamController.stream
        .where((event) => event.id == entityId)
        .map((event) {
      return event;
    });
  }

  /// Watch all quarantine groups
  Stream<ArtworkQuarantineGroupDTO> watchAllGroups(Session session) async* {
    yield* artworkQuarantineGroupStreamController.stream;
  }

  /// Watch quarantine groups for a specific customer
  Stream<ArtworkQuarantineGroupDTO> watchCustomerGroups(
    Session session, {
    required int customerId,
  }) async* {
    yield* artworkQuarantineGroupStreamController.stream.where(
      (event) {
        return event.isDraft == false && event.customerId == customerId;
      },
    );
  }

  /// Watch quarantine groups by status
  Stream<ArtworkQuarantineGroupDTO> watchGroupsByStatus(
    Session session, {
    required ArtworkQuarantineGroupStatus status,
  }) async* {
    yield* artworkQuarantineGroupStreamController.stream.where(
      (event) {
        return event.isDraft == false && event.status == status.name;
      },
    );
  }

  /// Create a new quarantine group
  Future<ArtworkQuarantineGroupDTO> create(
    Session session, {
    required String sessionId,
    required int? customerId,
  }) async {
    final group = await ArtworkQuarantineGroupHandler.create(
      session,
      sessionId: sessionId,
      customerId: customerId,
    );
    return group;
  }

  /// Fetch a group by ID
  Future<ArtworkQuarantineGroupDTO?> fetchById(Session session, int id) async {
    return ArtworkQuarantineGroupDTO.db.findById(
      session,
      id,
      include: ArtworkQuarantineGroupUtils.includeAll,
    );
  }

  /// Fetch and lock a single quarantine group by ID
  ///
  /// [id] The ID of the quarantine group to fetch and lock
  /// [editingSessionId] The ID of the editing session of the window
  Future<ArtworkQuarantineGroupDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return ArtworkQuarantineGroupHandler.fetchAndLock(
      session,
      id: id,
      editingSessionId: editingSessionId,
    );
  }

  /// Update an existing quarantine group
  ///
  /// [group] The group with the updated values
  /// [sessionId] The session ID of the current user window
  /// [release] Whether to release the group after updating
  Future<ArtworkQuarantineGroupDTO> update(
    Session session, {
    required ArtworkQuarantineGroupDTO group,
    required String sessionId,
    required bool release,
  }) async {
    return ArtworkQuarantineGroupHandler.update(
      session,
      group: group,
      sessionId: sessionId,
      release: release,
    );
  }

  /// Release editing lock on a group
  ///
  /// [entityId] The ID of the group to release
  /// [sessionId] The session ID of the current user window
  Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    await ArtworkQuarantineGroupHandler.release(
      session,
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  /// Delete a quarantine group
  ///
  /// [entityId] The ID of the group to delete
  /// [sessionId] The session ID of the current user window
  Future<bool> delete(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    return ArtworkQuarantineGroupHandler.delete(
      session,
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  /// Fetch groups by customer ID
  Future<List<ArtworkQuarantineGroupDTO>> fetchByCustomerId(
    Session session,
    int customerId,
  ) async {
    return ArtworkQuarantineGroupHandler.fetchByCustomerId(session, customerId);
  }

  /// Fetch groups by status
  Future<List<ArtworkQuarantineGroupDTO>> fetchByStatus(
    Session session,
    ArtworkQuarantineGroupStatus status,
  ) async {
    return ArtworkQuarantineGroupHandler.fetchByStatus(session, status);
  }

  /// Fetch groups by customer ID and status
  Future<List<ArtworkQuarantineGroupDTO>> fetchGroupsByCustomerIdAndStatus(
    Session session, {
    required int customerId,
    required ArtworkQuarantineGroupStatus status,
  }) async {
    return ArtworkQuarantineGroupHandler.fetchGroupsByCustomerIdAndStatus(
      session,
      customerId: customerId,
      status: status,
    );
  }

  /// Fetch artwork quarantines by customer ID and group status
  Future<List<ArtworkQuarantineDTO>> fetchQuarantinesByCustomerIdAndStatus(
    Session session, {
    required int customerId,
    required ArtworkQuarantineGroupStatus status,
  }) async {
    return ArtworkQuarantineGroupHandler.fetchQuarantinesByCustomerIdAndStatus(
      session,
      customerId: customerId,
      status: status,
    );
  }

  /// Find groups with optional sorting and filtering
  Future<List<ArtworkQuarantineGroupDTO>> find(
    Session session, {
    Sort? sort,
    Filter? filter,
  }) async {
    return ArtworkQuarantineGroupHandler.find(
      session,
      sort: sort,
      filter: filter,
    );
  }

  /// Mark a group as deleted
  Future<void> setDeleted(
    Session session,
    ArtworkQuarantineGroupDTO entity,
  ) async {
    await ArtworkQuarantineGroupHandler.setDeleted(session, entity);
  }

  /// Find all entity locks for quarantine groups
  /// Means all groups that are currently being edited by another user or
  /// were left in that state through app errors or crashes
  ///
  /// [session] The session to find the entity locks for
  Future<List<EntityLockDTO>> findEntityLocks(Session session) async {
    return ArtworkQuarantineGroupHandler.findEntityLocks(session);
  }
}
