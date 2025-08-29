import 'package:collection/collection.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/generic_crud.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork_quarantine/artwork_quarantine_utils.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork_quarantine_group/artwork_quarantine_group_utils.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork_quarantine_group/endpoints/artwork_quarantine_group_endpoint.dart';
import 'package:serverpod/serverpod.dart';

class ArtworkQuarantineGroupHandler {
  const ArtworkQuarantineGroupHandler._();

  /// Fetch group by ID without relations
  static Future<ArtworkQuarantineGroupDTO?> _fetchWithoutRelations(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return ArtworkQuarantineGroupDTO.db.findById(
      session,
      id,
      transaction: transaction,
    );
  }

  /// Fetch group by ID with all relations
  static Future<ArtworkQuarantineGroupDTO?> _fetchById(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return ArtworkQuarantineGroupDTO.db.findById(
      session,
      id,
      transaction: transaction,
      include: ArtworkQuarantineGroupUtils.includeAll,
    );
  }

  /// Update group row
  static Future<ArtworkQuarantineGroupDTO> _updateRow(
    Session session,
    ArtworkQuarantineGroupDTO entity,
    Transaction transaction,
  ) async {
    return ArtworkQuarantineGroupDTO.db.updateRow(
      session,
      entity,
      transaction: transaction,
    );
  }

  /// Create a new quarantine group
  static Future<ArtworkQuarantineGroupDTO> create(
    Session session, {
    required String sessionId,
    required int? customerId,
  }) async {
    final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);

    // Fetch LightUser ID of current user
    // The assigned user uses LightUsers in a Dropdown
    final assignedUser = await LightUserHandler.fetchByUserInfoId(
      session,
      userInfoId: userId,
    );

    final newGroup = await ArtworkQuarantineGroupDTO.db.insertRow(
      session,
      ArtworkQuarantineGroupUtils.initialArtworkQuarantineGroup(
        customerId: customerId,
        userId: userId,
        now: now,
        assignedUserId: assignedUser!.id!,
      ),
    );

    artworkQuarantineGroupStreamController.add(newGroup);
    return newGroup;
  }

  /// Fetch and lock a quarantine group for editing
  static Future<ArtworkQuarantineGroupDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return GenericCrud.fetchAndLockEntity<ArtworkQuarantineGroupDTO>(
      session,
      id: id,
      tableType: ArtworkQuarantineGroupUtils.tableType,
      editingSessionId: editingSessionId,
      fetchById: _fetchById,
      tableName: ArtworkQuarantineGroupDTOTable().tableName,
      streamController: artworkQuarantineGroupStreamController,
    );
  }

  /// Update quarantine group
  static Future<ArtworkQuarantineGroupDTO> update(
    Session session, {
    required ArtworkQuarantineGroupDTO group,
    required String sessionId,
    required bool release,
  }) async {
    final refetchedGroup = await session.db.transaction((transaction) async {
      // Check if the group needs a new status (only if not canceled)
      ArtworkQuarantineGroupStatus? newStatus;
      if (group.status != ArtworkQuarantineGroupStatus.canceled.name) {
        newStatus = calculateGroupStatusByQuarantineChildren(
          group.artworkQuarantines ?? [],
        );
      }

      // Update group
      final updatedGroup = await GenericCrud.update<ArtworkQuarantineGroupDTO>(
        session,
        sessionId: sessionId,
        newEntity: group.copyWith(
          status: newStatus?.name ?? group.status,
        ),
        fetchById: _fetchById,
        updateEntity: _updateRow,
        tableType: ArtworkQuarantineGroupUtils.tableType,
        streamController: artworkQuarantineGroupStreamController,
        release: release,
        transaction: transaction,
      );

      // Handle ArtworkQuarantines if they exist in the group
      if (group.artworkQuarantines != null &&
          group.artworkQuarantines!.isNotEmpty) {
        await _processArtworkQuarantines(
          session,
          transaction: transaction,
          sessionId: sessionId,
          group: updatedGroup,
          artworkQuarantines: group.artworkQuarantines!,
        );
      }

      // refetch updated group with quarantines
      // If this is not done -> The streams won't update the quarantines and
      // this could cause issues with the state of the group
      final refetchedGroup = await _fetchById(
        session,
        updatedGroup.id!,
        transaction,
      );

      if (refetchedGroup == null) {
        throw ElbException(
          exceptionType: ElbExceptionType.notFound,
          message: 'Artwork Quarantine Group not found after update',
        );
      }

      return refetchedGroup;
    });

    artworkQuarantineGroupStreamController.add(refetchedGroup);

    return refetchedGroup;
  }

  /// Process ArtworkQuarantines for a group
  static Future<void> _processArtworkQuarantines(
    Session session, {
    required Transaction transaction,
    required String sessionId,
    required ArtworkQuarantineGroupDTO group,
    required List<ArtworkQuarantineDTO> artworkQuarantines,
  }) async {
    final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);

    for (final artworkQuarantine in artworkQuarantines) {
      // If group is canceled, all quarantines should also be canceled
      final quarantineStatus =
          group.status == ArtworkQuarantineGroupStatus.canceled.name
              ? ArtworkQuarantineGroupStatus.canceled.name
              : artworkQuarantine.status;

      // Check if this quarantine already exists (has an ID)
      if (artworkQuarantine.id != null) {
        // Check if quarantine was marked as deleted but deletedById is not set
        final wasSetDeleted = artworkQuarantine.deletedAt != null &&
            artworkQuarantine.deletedById == null;

        // Update existing quarantine
        await ArtworkQuarantineDTO.db.updateRow(
          session,
          artworkQuarantine.copyWith(
            groupId: group.id,
            status: quarantineStatus,
            lastModifiedAt: now,
            lastModifiedById: userId,
            // Set deletedAt and deletedById if quarantine was marked as deleted
            deletedAt: wasSetDeleted ? now : artworkQuarantine.deletedAt,
            deletedById: wasSetDeleted ? userId : artworkQuarantine.deletedById,
          ),
          transaction: transaction,
        );
      } else {
        // Create new quarantine
        await ArtworkQuarantineDTO.db.insertRow(
          session,
          artworkQuarantine.copyWith(
            groupId: group.id,
            status: quarantineStatus,
            createdAt: now,
            createdById: userId,
            isDraft: false,
          ),
          transaction: transaction,
        );
      }
    }
  }

  /// Release editing lock on group
  static Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    await GenericCrud.releaseEntity<ArtworkQuarantineGroupDTO>(
      session,
      entityId: entityId,
      sessionId: sessionId,
      fetchById: _fetchById,
      updateEntity: _updateRow,
      tableType: ArtworkQuarantineGroupUtils.tableType,
      streamController: artworkQuarantineGroupStreamController,
      deleteDraft: null,
    );
  }

  /// Delete a quarantine group (mark as deleted)
  static Future<bool> delete(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    return GenericCrud.markEntityAsDeleted<ArtworkQuarantineGroupDTO>(
      session,
      id: entityId,
      sessionId: sessionId,
      fetchWithoutRelations: _fetchWithoutRelations,
      updateRow: _updateRow,
      tableType: ArtworkQuarantineGroupUtils.tableType,
      streamController: artworkQuarantineGroupStreamController,
    );
  }

  /// Fetch artwork quarantines by customer ID and group status
  static Future<List<ArtworkQuarantineDTO>>
      fetchQuarantinesByCustomerIdAndStatus(
    Session session, {
    required int customerId,
    required ArtworkQuarantineGroupStatus status,
  }) async {
    // First find all groups that match the criteria
    final groups = await ArtworkQuarantineGroupDTO.db.find(
      session,
      where: (t) =>
          t.customerId.equals(customerId) &
          t.status.equals(status.name) &
          t.deletedAt.equals(null as DateTime?),
      orderBy: (t) => t.createdAt,
      orderDescending: true,
    );

    // Then fetch all quarantines from these groups
    final allQuarantines = <ArtworkQuarantineDTO>[];
    for (final group in groups) {
      final quarantines = await ArtworkQuarantineDTO.db.find(
        session,
        where: (q) =>
            q.groupId.equals(group.id) & q.deletedAt.equals(null as DateTime?),
        orderBy: (q) => q.createdAt,
        orderDescending: true,
        include: ArtworkQuarantineUtils.includeAll,
      );
      allQuarantines.addAll(quarantines);
    }

    return allQuarantines;
  }

  /// Fetch groups by customer ID
  static Future<List<ArtworkQuarantineGroupDTO>> fetchByCustomerId(
    Session session,
    int customerId,
  ) async {
    return ArtworkQuarantineGroupDTO.db.find(
      session,
      where: (t) => t.customerId.equals(customerId),
      include: ArtworkQuarantineGroupUtils.includeAll,
    );
  }

  /// Fetch groups by status
  static Future<List<ArtworkQuarantineGroupDTO>> fetchByStatus(
    Session session,
    ArtworkQuarantineGroupStatus status,
  ) async {
    return ArtworkQuarantineGroupDTO.db.find(
      session,
      where: (t) =>
          t.status.equals(status.name) & t.deletedAt.equals(null as DateTime?),
      orderBy: (t) => t.createdAt,
      orderDescending: true,
    );
  }

  /// Fetch groups by customer ID and status
  static Future<List<ArtworkQuarantineGroupDTO>>
      fetchGroupsByCustomerIdAndStatus(
    Session session, {
    required int customerId,
    required ArtworkQuarantineGroupStatus status,
  }) async {
    return ArtworkQuarantineGroupDTO.db.find(
      session,
      where: (t) =>
          t.customerId.equals(customerId) &
          t.status.equals(status.name) &
          t.deletedAt.equals(null as DateTime?),
      orderBy: (t) => t.createdAt,
      orderDescending: true,
      include: ArtworkQuarantineGroupUtils.includeAll,
    );
  }

  /// Find groups with optional sorting and filtering
  static Future<List<ArtworkQuarantineGroupDTO>> find(
    Session session, {
    Sort? sort,
    Filter? filter,
  }) async {
    final sortByField = ArtworkQuarantineGroupField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );
    final expression = ArtworkQuarantineGroupUtils.buildExpression(filter);

    return ArtworkQuarantineGroupDTO.db.find(
      session,
      where: expression == null
          ? (t) => t.deletedAt.equals(null as DateTime?)
          : (t) => expression & t.deletedAt.equals(null as DateTime?),
      orderBy: ArtworkQuarantineGroupUtils.orderBy(sortByField),
      orderDescending: sort?.orderDescending ?? false,
    );
  }

  /// Mark a group as deleted
  static Future<void> setDeleted(
    Session session,
    ArtworkQuarantineGroupDTO entity,
  ) async {
    final userId = (await session.authenticated)?.userId;
    final updated = entity.copyWith(
      deletedAt: DateTime.now(),
      deletedById: userId,
    );
    await ArtworkQuarantineGroupDTO.db.updateRow(session, updated);
    artworkQuarantineGroupStreamController.add(updated);
  }

  /// Find all entity locks for quarantine groups
  static Future<List<EntityLockDTO>> findEntityLocks(Session session) async {
    final entities = await ArtworkQuarantineGroupDTO.db.find(
      session,
      where: (t) =>
          t.editingSession.notEquals(null as String?) &
          t.editingSession.notEquals(''),
    );

    return entities
        .map(
          (e) => EntityLockDTO(
            tableType: ArtworkQuarantineGroupUtils.tableType.name,
            entityId: e.id!,
            editingSessionId: e.editingSession!,
            lockedAt: e.editingSince!,
            userId: e.editingById,
          ),
        )
        .toList();
  }

  /// Calculate the desired group status based on quarantine children
  /// Returns null if no status change is needed
  static ArtworkQuarantineGroupStatus? calculateGroupStatusByQuarantineChildren(
    List<ArtworkQuarantineDTO> quarantines,
  ) {
    if (quarantines.isEmpty) {
      return null;
    }

    // Check if any quarantine is canceled -> ignore
    final hasCanceledQuarantine = quarantines
        .any((q) => q.status == ArtworkQuarantineGroupStatus.canceled.name);
    if (hasCanceledQuarantine) {
      return null;
    }

    // Find the lowest (least advanced) state among non-canceled quarantines
    // State order: open (0) < todo (1) < done (2) < inUse (3)
    ArtworkQuarantineGroupStatus? lowestStatus;

    for (final quarantine in quarantines) {
      final status = ArtworkQuarantineGroupStatus.values.firstWhereOrNull(
        (s) => s.name == quarantine.status,
      );

      if (status != null && status != ArtworkQuarantineGroupStatus.canceled) {
        if (lowestStatus == null ||
            _getStatusPriority(status) < _getStatusPriority(lowestStatus)) {
          lowestStatus = status;
        }
      }
    }

    return lowestStatus;
  }

  /// Get priority value for status comparison
  /// Higher value = more advanced state
  static int _getStatusPriority(ArtworkQuarantineGroupStatus status) {
    switch (status) {
      case ArtworkQuarantineGroupStatus.open:
        return 0;
      case ArtworkQuarantineGroupStatus.todo:
        return 1;
      case ArtworkQuarantineGroupStatus.done:
        return 2;
      case ArtworkQuarantineGroupStatus.inUse:
        return 3;
      case ArtworkQuarantineGroupStatus.canceled:
        return 4;
    }
  }

  /// Fetch quarantines by groupId
  static Future<List<ArtworkQuarantineDTO>> fetchQuarantinesByGroupId(
    Session session,
    int groupId,
    Transaction transaction,
  ) async {
    return ArtworkQuarantineDTO.db.find(
      session,
      where: (q) => q.groupId.equals(groupId),
      transaction: transaction,
    );
  }

  /// Fetch quarantines by artworkQuarantineId
  static Future<List<ArtworkQuarantineDTO>>
      fetchQuarantinesByArtworkQuarantineId(
    Session session,
    int artworkQuarantineId,
    Transaction transaction,
  ) async {
    final artworkQuarantine = await ArtworkQuarantineDTO.db.findById(
      session,
      artworkQuarantineId,
      transaction: transaction,
    );

    final quarantines = await fetchQuarantinesByGroupId(
      session,
      artworkQuarantine!.groupId,
      transaction,
    );

    return quarantines;
  }

  /// Set group status
  static Future<ArtworkQuarantineGroupDTO> updateStatus(
    Session session,
    int id,
    ArtworkQuarantineGroupStatus status,
    Transaction transaction,
  ) async {
    final entity = await _fetchById(session, id, transaction);

    if (entity == null) {
      throw ElbException(
        exceptionType: ElbExceptionType.notFound,
        message: 'Artwork Quarantine Group not found',
      );
    }

    final updated = entity.copyWith(
      status: status.name,
    );

    final insertedUpdatedGroup = await ArtworkQuarantineGroupDTO.db.updateRow(
      columns: (t) => [
        t.status,
      ],
      session,
      updated,
      transaction: transaction,
    );
    return insertedUpdatedGroup;
  }

  /// Update quarantine after xml analysis
  /// Group will only be returned if status is done
  static Future<ArtworkQuarantineGroupDTO?> updateAfterXmlAnalysis(
    Session session,
    int artworkQuarantineId,
    Transaction transaction,
  ) async {
    final quarantines = await fetchQuarantinesByArtworkQuarantineId(
      session,
      artworkQuarantineId,
      transaction,
    );

    final groupStatus = calculateGroupStatusByQuarantineChildren(
      quarantines,
    );

    ArtworkQuarantineGroupDTO? updatedGroup;

    if (groupStatus == ArtworkQuarantineGroupStatus.done) {
      updatedGroup = await updateStatus(
        session,
        quarantines.first.groupId,
        ArtworkQuarantineGroupStatus.done,
        transaction,
      );
    }

    return updatedGroup;
  }

  /// Notify user after group status is set to done
  static Future<void> notifyUserAfterGroupStatusIsSetToDone(
    Session session,
    int groupId,
  ) async {
    final group = await ArtworkQuarantineGroupDTO.db.findById(
      session,
      groupId,
      include: ArtworkQuarantineGroupDTO.include(
        assignedUser: LightUserDTO.include(),
      ),
    );

    final lightUser = group?.assignedUser;
    final lightUserId = group?.assignedUserId;
    final userId = lightUser?.userInfoId;

    if (lightUserId != null && userId != null) {
      // Notify user about the status change
      final note = EntityNoteDTO(
        tableType: ArtworkQuarantineGroupUtils.tableType.name,
        entityId: groupId,
        message: '[user:$userId] - Alle Artworks '
            'wurden analysiert',
        mentions: [MentionDTO(userId: userId)],
      );

      await EntityNoteCoreHandler.createSystemNote(
        session,
        note: note,
        hardcodedSender: 'Automation Engine',
      );
    }
  }
}
