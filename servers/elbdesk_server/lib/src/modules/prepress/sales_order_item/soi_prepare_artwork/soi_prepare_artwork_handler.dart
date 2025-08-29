import 'dart:convert';

import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/custom_entity_keys/custom_entiy_keys_endpoint.dart';
import 'package:elbdesk_server/src/modules/core/generic_crud.dart';
import 'package:elbdesk_server/src/modules/core/utils/elb_exception_thrower.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork/artwork_handler.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork/artwork_utils.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork/endpoints/artwork_endpoint.dart';
import 'package:elbdesk_server/src/modules/prepress/sales_order_item/endpoints/sales_order_item_endpoint.dart';
import 'package:elbdesk_server/src/modules/prepress/sales_order_item/sales_order_item_handler.dart';
import 'package:elbdesk_server/src/modules/prepress/sales_order_item/sales_order_item_utils.dart';
import 'package:elbdesk_server/src/modules/prepress/sales_order_item/soi_prepare_artwork/endpoints/soi_prepare_artwork_endpoint.dart';
import 'package:elbdesk_server/src/modules/prepress/sales_order_item/soi_prepare_artwork/soi_prepare_artwork_utils.dart';
import 'package:elbdesk_shared/elbdesk_shared.dart';
import 'package:serverpod/serverpod.dart';

class SoiPrepareArtworkHandler {
  const SoiPrepareArtworkHandler._();

  static Future<SoiPrepareArtworkDTO> _updateRow(
    Session session,
    SoiPrepareArtworkDTO entity,
    Transaction transaction,
  ) async {
    return SoiPrepareArtworkDTO.db
        .updateRow(session, entity, transaction: transaction);
  }

  static Future<SoiPrepareArtworkDTO?> _fetchForNotification(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return SoiPrepareArtworkDTO.db.findById(
      session,
      id,
      include: SoiPrepareArtworkDTO.include(
        artwork: ArtworkDTO.include(
          product: ProductDTO.include(),
        ),
      ),
      transaction: transaction,
    );
  }

  static Future<SoiPrepareArtworkDTO?> _fetchById(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return SoiPrepareArtworkDTO.db.findById(
      session,
      id,
      transaction: transaction,
      include: SoiPrepareArtworkUtils.includeAll,
    );
  }

  static Future<void> create(
    Session session, {
    required int salesOrderId,
    required int artworkId,
    required int artworkMasterId,
    required bool increaseArtworkVersion,
    required int customerId,
  }) async {
    final (:salesOrderItem, :prepareArtworkSoi, :artwork) =
        await session.db.transaction(
      (transaction) async {
        final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);

        final (:salesOrderItem, :soiPrepareArtwork, :artwork) =
            await createSoiPrepareArtworkAndSalesOrderItem(
          session,
          artworkId: artworkId,
          artworkMasterId: artworkMasterId,
          salesOrderId: salesOrderId,
          increaseArtworkVersion: increaseArtworkVersion,
          userId: userId,
          now: now,
          transaction: transaction,
          customerId: customerId,
        );

        return (
          prepareArtworkSoi: soiPrepareArtwork,
          salesOrderItem: salesOrderItem,
          artwork: artwork,
        );
      },
    );

    // Add the new SoiPrepareArtwork to both stream controllers
    soiPrepareArtworkStreamController.add(prepareArtworkSoi);

    salesOrderItemStreamController.add(salesOrderItem);
    artworkStreamController.add(artwork);
  }

  static Future<SoiPrepareArtworkDTO> update(
    Session session, {
    required SoiPrepareArtworkDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    final (:soiPrepareArtwork, :artwork, :entityAssignmentData) =
        await session.db.transaction((transaction) async {
      final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);

      session.log('soi prepare gots updated: $entity');

      // * Check if we are allowed to update the sales order item
      final serverSoiPrepareArtwork = await _fetchForNotification(
        session,
        entity.id!,
        transaction,
      );
      await GenericCrud.validateUpdate(
        session,
        sessionId: sessionId,
        serverEntity: serverSoiPrepareArtwork,
        now: now,
      );

      // * Fetch & Update the sales order item

      // * We have to fetch the sales order item to get the current status
      final serverSalesOrderItem = await SalesOrderItemDTO.db.findById(
        session,
        entity.salesOrderItemId,
        include: SalesOrderItemDTO.include(
          assignedUser: LightUserDTO.include(),
        ),
        transaction: transaction,
      );

      final entityAssignmentData = EntityAssignmentData(
        tableType: TableType.soiPrepareArtwork.name,
        deadline: entity.salesOrderItem?.deadline,
        entityId: entity.id!,
        oldLightUserId: serverSalesOrderItem?.assignedUser?.id,
        newLightUserId: entity.salesOrderItem?.assignedUser?.id,
        additionalData: jsonEncode({
          SoiPrepareArtworkAdditionalDataField.artworkCustomId.name:
              ArtworkUtils.getArtworkCustomId(
            artwork: serverSoiPrepareArtwork!.artwork!,
            product: serverSoiPrepareArtwork.artwork!.product!,
          ),
          SoiPrepareArtworkAdditionalDataField.customerId.name:
              entity.salesOrderItem!.customerId,
          SoiPrepareArtworkAdditionalDataField.status.name:
              entity.salesOrderItem!.status,
          SoiPrepareArtworkAdditionalDataField.artworkWidth.name:
              serverSoiPrepareArtwork.artwork!.width,
          SoiPrepareArtworkAdditionalDataField.artworkHeight.name:
              serverSoiPrepareArtwork.artwork!.height,
        }),
      );

      final currentStatus = SalesOrderItemUtils.getSalesOrderItemStatus(
        serverSalesOrderItem!.status,
      );
      final newStatus = SalesOrderItemUtils.getSalesOrderItemStatus(
        entity.salesOrderItem!.status,
      );
      // *
      // * When the new status is completed and the old one not, we have
      // * to lock the artwork

      if (currentStatus != SalesOrderItemStatus.completed &&
          newStatus == SalesOrderItemStatus.completed) {
        await ArtworkHandler.lockArtwork(
          session,
          entity.artworkId,
          transaction: transaction,
        );
      }
      // * When the current status is completed and the old one not, we have
      // * to check if the artwork is unlocked in another sales order
      if (currentStatus == SalesOrderItemStatus.completed &&
          newStatus != SalesOrderItemStatus.completed) {
        final isUnlockedElsewhere = await ArtworkHandler.isUnlockedElsewhere(
          session,
          artworkId: entity.artworkId,
          artworkMasterId: entity.artworkMasterId,
          transaction: transaction,
        );
        if (isUnlockedElsewhere) {
          throw ElbException(
            message: 'Artwork is already in another sales order not finished',
            exceptionType: ElbExceptionType.conflict,
          );
        }
        // * Else, unlock the artwork
        await ArtworkHandler.unlockArtwork(
          session,
          entity.artworkId,
          transaction: transaction,
        );
      }

      ArtworkDTO? artwork;

      // * if the lock status changed, we have to fetch the artwork again
      // * and broadcast if
      if ((currentStatus != SalesOrderItemStatus.completed &&
              newStatus == SalesOrderItemStatus.completed) ||
          (currentStatus == SalesOrderItemStatus.completed &&
              newStatus != SalesOrderItemStatus.completed)) {
        artwork = await ArtworkHandler.fetchById(
          session,
          entity.artworkId,
          transaction,
        );
      }

      await SalesOrderItemHandler.update(
        session,
        item: entity.salesOrderItem!,
        transaction: transaction,
      );

      final withUpdatedMeta = GenericCrud.modifyEntityDataMeta(
        entity,
        serverSoiPrepareArtwork,
        userId,
        release,
        now,
      );
      await _updateRow(
        session,
        withUpdatedMeta,
        transaction,
      );
      final refetched = await _fetchById(
        session,
        entity.id!,
        transaction,
      );

      return (
        soiPrepareArtwork: refetched!,
        artwork: artwork,
        entityAssignmentData: entityAssignmentData,
      );
    });
    soiPrepareArtworkStreamController.add(soiPrepareArtwork);
    if (artwork != null) {
      artworkStreamController.add(artwork);
    }

    EntityAssignmentsCoreHandler.handleAssignment(
      entityAssignmentData: entityAssignmentData,
    );

    return soiPrepareArtwork;
  }

  static Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    await GenericCrud.releaseEntity<SoiPrepareArtworkDTO>(
      session,
      entityId: entityId,
      sessionId: sessionId,
      fetchById: _fetchById,
      updateEntity: _updateRow,
      tableType: SoiPrepareArtworkUtils.tableType,
      streamController: soiPrepareArtworkStreamController,
      deleteDraft: null,
    );
  }

  static Future<SoiPrepareArtworkDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return GenericCrud.fetchAndLockEntity<SoiPrepareArtworkDTO>(
      session,
      id: id,
      tableType: SoiPrepareArtworkUtils.tableType,
      editingSessionId: editingSessionId,
      fetchById: _fetchById,
      tableName: SoiPrepareArtworkDTOTable().tableName,
      streamController: soiPrepareArtworkStreamController,
    );
  }

  static Future<
      ({
        SalesOrderItemDTO salesOrderItem,
        SoiPrepareArtworkDTO soiPrepareArtwork,
        ArtworkDTO artwork,
      })> createSoiPrepareArtworkAndSalesOrderItem(
    Session session, {
    required int artworkId,
    required int artworkMasterId,
    required int salesOrderId,
    required bool increaseArtworkVersion,
    required int userId,
    required DateTime now,
    required Transaction transaction,
    required int customerId,
  }) async {
    // * Check if we already have a prepare artwork sales order item for
    // this artwork
    final prepareArtworkSoi = await SoiPrepareArtworkDTO.db.findFirstRow(
      session,
      where: (t) =>
          t.artworkId.equals(artworkId) & t.deletedAt.equals(null as DateTime?),
      transaction: transaction,
    );
    if (prepareArtworkSoi != null) {
      throw await ElbExceptionThrower.validationError(
        session,
        exceptionType: ElbExceptionType.conflict,
        message: ElbValidationError.prepareArtworkAlreadyAdded,
      );
    }
// * Check if we have unlocked artworks in other sales orders
    final hasArtworkUnfinishedInOtherSalesOrder =
        await ArtworkHandler.isUnlockedElsewhere(
      session,
      artworkId: artworkId,
      artworkMasterId: artworkMasterId,
      transaction: transaction,
    );

    if (hasArtworkUnfinishedInOtherSalesOrder) {
      throw await ElbExceptionThrower.validationError(
        session,
        exceptionType: ElbExceptionType.conflict,
        message: ElbValidationError.artworkAlreadyInAnotherSalesOrder,
      );
    }
    // * Create sales order item
    final salesOrderItem = await SalesOrderItemHandler.createSalesOrderItem(
      session,
      salesOrderId: salesOrderId,
      customerId: customerId,
      type: SalesOrderItemType.prepareArtwork,
      status: SalesOrderItemStatus.preperation,
      description: '',
      billableTime: 0,
      assignedUser: null,
      transaction: transaction,
    );
    final soiCustomId = await CustomEntityKeysHandler.getNextIntKeyTransaction(
      TableType.salesOrderItem,
    );
    // * Create soi prepare artwork
    final initialPrepareArtworkSoi =
        SoiPrepareArtworkUtils.initialSoiPrepareArtwork(
      artworkId: artworkId,
      userId: userId,
      now: now,
      salesOrderId: salesOrderId,
      soiCustomId: soiCustomId,
      salesOrderItemId: salesOrderItem.id!,
      artworkMasterId: artworkMasterId,
    );
    final inserertedPrepareArtworkSoi = await SoiPrepareArtworkDTO.db.insertRow(
      session,
      initialPrepareArtworkSoi,
      transaction: transaction,
    );

    final updatedSalesOrderItem =
        await SalesOrderItemHandler.updateSalesOrderItemAfterSoiCreation(
      session,
      item: salesOrderItem.copyWith(
        soiTypePrimaryKey: inserertedPrepareArtworkSoi.id,
      ),
      transaction: transaction,
    );
    await ArtworkHandler.unlockArtwork(
      session,
      artworkId,
      transaction: transaction,
    );

    final unlockedArtwork = await ArtworkHandler.fetchById(
      session,
      artworkId,
      transaction,
    );

    if (increaseArtworkVersion) {
      await ArtworkHandler.increaseVersion(
        session,
        artworkId: artworkId,
        artworkMasterId: artworkMasterId,
        transaction: transaction,
      );
    }
    final refetchedSoiPrepareArtwork = await _fetchById(
      session,
      inserertedPrepareArtworkSoi.id!,
      transaction,
    );

    return (
      salesOrderItem: updatedSalesOrderItem,
      soiPrepareArtwork: refetchedSoiPrepareArtwork!,
      artwork: unlockedArtwork!,
    );
  }
}
