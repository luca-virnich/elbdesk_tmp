import 'package:collection/collection.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/generic_crud.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork_quarantine/artwork_quarantine_utils.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork_quarantine/endpoints/artwork_quarantine_endpoint.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork_quarantine_group/artwork_quarantine_group_handler.dart';
import 'package:serverpod/serverpod.dart';

class ArtworkQuarantineHandler {
  const ArtworkQuarantineHandler._();

  /// Fetch artwork quarantine by ID with all relations
  static Future<ArtworkQuarantineDTO?> fetchById(
    Session session,
    int id, [
    Transaction? transaction,
  ]) async {
    return ArtworkQuarantineDTO.db.findById(
      session,
      id,
      include: ArtworkQuarantineUtils.includeAll,
      transaction: transaction,
    );
  }

  static Future<ArtworkQuarantineDTO> _updateRow(
    Session session,
    ArtworkQuarantineDTO entity,
    Transaction transaction,
  ) async {
    return ArtworkQuarantineDTO.db.updateRow(
      session,
      entity,
      transaction: transaction,
    );
  }

  /// Fetch and Lock Artwork Quarantine
  static Future<ArtworkQuarantineDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String sessionId,
  }) async {
    return GenericCrud.fetchAndLockEntity<ArtworkQuarantineDTO>(
      session,
      id: id,
      tableType: ArtworkQuarantineUtils.tableType,
      editingSessionId: sessionId,
      fetchById: fetchById,
      tableName: ArtworkQuarantineDTOTable().tableName,
      streamController: artworkQuarantineStreamController,
    );
  }

  /// Release entity from editing session
  static Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    await GenericCrud.releaseEntity<ArtworkQuarantineDTO>(
      session,
      entityId: entityId,
      sessionId: sessionId,
      fetchById: fetchById,
      updateEntity: _updateRow,
      tableType: ArtworkQuarantineUtils.tableType,
      streamController: artworkQuarantineStreamController,
      deleteDraft: null,
    );
  }

  /// Update Artwork Quarantine entity
  static Future<ArtworkQuarantineDTO> update(
    Session session, {
    required ArtworkQuarantineDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    return GenericCrud.update(
      session,
      fetchById: fetchById,
      sessionId: sessionId,
      newEntity: entity,
      updateEntity: _updateRow,
      tableType: ArtworkQuarantineUtils.tableType,
      streamController: artworkQuarantineStreamController,
      release: release,
    );
  }

  /// Create new Artwork Quarantine entity
  // static Future<ArtworkQuarantineDTO> create(
  //   Session session, {
  //   required String sessionId,
  //   required String description,
  //   required int customerId,
  //   required int groupId,
  // }) async {
  //   final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);

  //   final artworkQuarantine = ArtworkQuarantineUtils.initialArtworkQuarantine(
  //     userId: userId,
  //     description: description,
  //     customerId: customerId,
  //     groupId: groupId,
  //     now: now,
  //   );

  //   final result = await session.db.transaction((transaction) async {
  //     final newArtworkQuarantine = await GenericCrud.create(
  //       session,
  //       ArtworkQuarantineDTO.db.insertRow(
  //         session,
  //         artworkQuarantine,
  //         transaction: transaction,
  //       ),
  //     );

  //     final refetch = await ArtworkQuarantineDTO.db.findById(
  //       session,
  //       newArtworkQuarantine.id!,
  //       include: ArtworkQuarantineUtils.includeAll,
  //       transaction: transaction,
  //     );

  //     return refetch;
  //   });

  //   artworkQuarantineStreamController.add(result!);
  //   return result;
  // }

  // fetchByGroupId
  static Future<List<ArtworkQuarantineDTO>> fetchByGroupId(
    Session session,
    int groupId,
  ) async {
    return ArtworkQuarantineDTO.db.find(
      session,
      where: (q) => q.groupId.equals(groupId),
      include: ArtworkQuarantineUtils.includeAll,
    );
  }

  // fetchByGroupIdAndStatus
  static Future<List<ArtworkQuarantineDTO>> fetchByGroupIdAndStatus(
    Session session,
    int groupId,
    ArtworkQuarantineGroupStatus status,
  ) async {
    return ArtworkQuarantineDTO.db.find(
      session,
      where: (q) => q.groupId.equals(groupId) & q.status.equals(status.name),
      include: ArtworkQuarantineUtils.includeAll,
    );
  }

  /// Create Artwork Quarantine from Dateneingang
  static Future<ArtworkQuarantineDTO> createFromDateneingang(
    Session session, {
    required int customerId,
    required ArtworkQuarantineDTO artworkQuarantine,
  }) async {
    final userId = (await session.authenticated)?.userId;
    final updatedArtworkQuarantine = artworkQuarantine.copyWith(
      customerId: customerId,
      createdAt: DateTime.now(),
      createdById: userId,
    );

    final newArtworkQuarantine = await GenericCrud.create(
      session,
      ArtworkQuarantineDTO.db.insertRow(session, updatedArtworkQuarantine),
    );

    artworkQuarantineStreamController.add(newArtworkQuarantine);
    return newArtworkQuarantine;
  }

  /// Delete Artwork Quarantine from artwork creation
  static Future<void> deleteFromArtworkCreation(
    Session session,
    int artworkQuarantineId,
  ) async {
    final artworkQuarantine = await ArtworkQuarantineDTO.db.findById(
      session,
      artworkQuarantineId,
    );
    if (artworkQuarantine == null) {
      throw Exception('Artwork quarantine not found');
    }
    final updated = artworkQuarantine.copyWith(
      deletedAt: DateTime.now(),
      deletedById: (await session.authenticated)?.userId,
    );
    await ArtworkQuarantineDTO.db.updateRow(
      session,
      updated,
    );
    artworkQuarantineStreamController.add(updated);
    removeArtworkQuarantineDeletedController.add(artworkQuarantineId);
  }

  /// Set entity as deleted
  static Future<ArtworkQuarantineDTO> delete(
    Session session, {
    required int entityId,
    required Transaction transaction,
  }) async {
    final entity = await fetchById(session, entityId, transaction);
    if (entity == null) {
      throw Exception('Artwork quarantine not found');
    }
    final updated = entity.copyWith(
      deletedAt: DateTime.now(),
      deletedById: (await session.authenticated)?.userId,
    );
    final deleted = await ArtworkQuarantineDTO.db.updateRow(
      session,
      updated,
      transaction: transaction,
    );
    artworkQuarantineStreamController.add(updated);
    removeArtworkQuarantineDeletedController.add(entity.id!);

    return deleted;
  }

  /// Find artwork quarantines with optional sorting and filtering
  static Future<List<ArtworkQuarantineDTO>> find(
    Session session, {
    Sort? sort,
    Filter? filter,
  }) async {
    final sortByField = ArtworkQuarantineField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );
    final expression = ArtworkQuarantineUtils.buildExpression(filter);

    return ArtworkQuarantineDTO.db.find(
      session,
      where: expression == null ? null : (t) => expression,
      orderBy: ArtworkQuarantineUtils.orderBy(sortByField),
      orderDescending: sort?.orderDescending ?? false,
      include: ArtworkQuarantineUtils.includeAll,
    );
  }

  /// Fetch artwork quarantines by customer ID
  static Future<List<ArtworkQuarantineDTO>> fetchByCustomerId(
    Session session,
    int customerId,
  ) async {
    return ArtworkQuarantineDTO.db.find(
      session,
      where: (q) =>
          q.customerId.equals(customerId) &
          q.deletedAt.equals(null as DateTime?) &
          q.artworkId.equals(null as int?),
      include: ArtworkQuarantineUtils.includeAll,
      orderBy: ArtworkQuarantineUtils.orderBy(ArtworkQuarantineField.createdAt),
      orderDescending: true,
    );
  }

  /// Find all entity locks for artwork quarantines
  static Future<List<EntityLockDTO>> findEntityLocks(Session session) async {
    final entities = await ArtworkQuarantineDTO.db.find(
      session,
      where: (t) =>
          t.editingSession.notEquals(null as String?) &
          t.editingSession.notEquals(''),
    );

    return entities
        .map(
          (e) => EntityLockDTO(
            tableType: ArtworkQuarantineUtils.tableType.name,
            entityId: e.id!,
            editingSessionId: e.editingSession!,
            lockedAt: e.editingSince!,
            userId: e.editingById,
          ),
        )
        .toList();
  }

  /// Set Quarantine Status
  static Future<ArtworkQuarantineDTO> updateStatus(
    Session session,
    int artworkQuarantineId,
    ArtworkQuarantineGroupStatus status,
    Transaction transaction,
  ) async {
    final artworkQuarantine = await fetchById(session, artworkQuarantineId);
    if (artworkQuarantine == null) {
      throw Exception('Artwork quarantine not found');
    }
    final updated = artworkQuarantine.copyWith(
      status: status.name,
    );
    return ArtworkQuarantineDTO.db.updateRow(
      session,
      updated,
      transaction: transaction,
    );

    // Add to stream
    // TODO: Reimplement this!
    // artworkQuarantineStreamController.add(updated);
  }

  /// Update quarantine after assignment
  static Future<
      ({
        ArtworkQuarantineDTO quarantine,
        ArtworkQuarantineGroupDTO? updatedGroup,
      })> updateAfterAssignment(
    Session session,
    int artworkQuarantineId,
    Transaction transaction,
    DateTime now,
    int userId,
  ) async {
    // Quarantine is FINISHED -> Set group status to inUse
    final quarantine = await updateStatus(
      session,
      artworkQuarantineId,
      ArtworkQuarantineGroupStatus.inUse,
      transaction,
    );

    // Check wether all artwork quarantines from the group of this quarantine
    // are inUse
    // if yes:
    // Update the group State to inUse

    final quarantines = await ArtworkQuarantineGroupHandler
        .fetchQuarantinesByArtworkQuarantineId(
      session,
      artworkQuarantineId,
      transaction,
    );

    final groupStatus =
        ArtworkQuarantineGroupHandler.calculateGroupStatusByQuarantineChildren(
      quarantines,
    );

    ArtworkQuarantineGroupDTO? updatedGroup;

    if (groupStatus == ArtworkQuarantineGroupStatus.inUse) {
      updatedGroup = await ArtworkQuarantineGroupHandler.updateStatus(
        session,
        quarantines.first.groupId,
        ArtworkQuarantineGroupStatus.inUse,
        transaction,
      );
    }

    return (quarantine: quarantine, updatedGroup: updatedGroup);
  }
}
