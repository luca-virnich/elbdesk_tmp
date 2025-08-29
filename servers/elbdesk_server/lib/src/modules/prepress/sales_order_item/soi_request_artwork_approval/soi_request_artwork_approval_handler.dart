import 'dart:convert';

import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/custom_entity_keys/custom_entiy_keys_endpoint.dart';
import 'package:elbdesk_server/src/modules/core/generic_crud.dart';
import 'package:elbdesk_server/src/modules/core/utils/elb_exception_thrower.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork/artwork_utils.dart';
import 'package:elbdesk_server/src/modules/prepress/sales_order_item/endpoints/sales_order_item_endpoint.dart';
import 'package:elbdesk_server/src/modules/prepress/sales_order_item/sales_order_item_handler.dart';
import 'package:elbdesk_server/src/modules/prepress/sales_order_item/sales_order_item_utils.dart';
import 'package:elbdesk_server/src/modules/prepress/sales_order_item/soi_request_artwork_approval/endpoints/soi_request_artwork_approval_endpoint.dart';
import 'package:elbdesk_server/src/modules/prepress/sales_order_item/soi_request_artwork_approval/soi_request_artwork_approval_utils.dart';
import 'package:elbdesk_shared/elbdesk_shared.dart';
import 'package:serverpod/serverpod.dart';

class SoiRequestArtworkApprovalHandler {
  const SoiRequestArtworkApprovalHandler._();

  static Future<SoiRequestArtworkApprovalDTO?> _fetchForNotification(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return SoiRequestArtworkApprovalDTO.db.findById(
      session,
      id,
      include: SoiRequestArtworkApprovalDTO.include(
        artwork: ArtworkDTO.include(
          product: ProductDTO.include(),
        ),
      ),
      transaction: transaction,
    );
  }

  static Future<SoiRequestArtworkApprovalDTO> _updateRow(
    Session session,
    SoiRequestArtworkApprovalDTO entity,
    Transaction transaction,
  ) async {
    return SoiRequestArtworkApprovalDTO.db
        .updateRow(session, entity, transaction: transaction);
  }

  static Future<SoiRequestArtworkApprovalDTO?> _fetchById(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return SoiRequestArtworkApprovalDTO.db.findById(
      session,
      id,
      transaction: transaction,
      include: SoiRequestArtworkApprovalUtils.includeAll,
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
    final (:salesOrderItem, :soiRequestArtworkApproval) =
        await session.db.transaction(
      (transaction) async {
        final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);

        final (:salesOrderItem, :soiRequestArtworkApproval) =
            await createSoiRequestArtworkApprovalAndSalesOrderItem(
          session,
          customerId: customerId,
          artworkId: artworkId,
          artworkMasterId: artworkMasterId,
          salesOrderId: salesOrderId,
          userId: userId,
          now: now,
          transaction: transaction,
        );

        return (
          soiRequestArtworkApproval: soiRequestArtworkApproval,
          salesOrderItem: salesOrderItem
        );
      },
    );

    // Add the new SoiPrepareArtwork to both stream controllers
    soiRequestArtworkApprovalStreamController.add(soiRequestArtworkApproval);

    salesOrderItemStreamController.add(salesOrderItem);
  }

  static Future<SoiRequestArtworkApprovalDTO> update(
    Session session, {
    required SoiRequestArtworkApprovalDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    // Update both the SoiPrepareArtwork and its parent SalesOrderItem in a
    // transaction
    final (:soiRequestArtworkApproval, :salesOrderItem, :entityAssignmentData) =
        await session.db.transaction((transaction) async {
      final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);
      // First update the parent SalesOrderItem if it exists

      // * Check if we are allowed to update the sales order item
      final serverSoiRequestArtworkApproval = await _fetchForNotification(
        session,
        entity.id!,
        transaction,
      );
      await GenericCrud.validateUpdate(
        session,
        sessionId: sessionId,
        serverEntity: serverSoiRequestArtworkApproval,
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
        tableType: TableType.soiRequestArtworkApproval.name,
        deadline: entity.salesOrderItem?.deadline,
        entityId: entity.id!,
        oldLightUserId: serverSalesOrderItem?.assignedUser?.id,
        newLightUserId: entity.salesOrderItem?.assignedUser?.id,
        additionalData: jsonEncode({
          SoiRequestArtworkApprovalAdditionalDataField.artworkCustomId.name:
              ArtworkUtils.getArtworkCustomId(
            artwork: serverSoiRequestArtworkApproval!.artwork!,
            product: serverSoiRequestArtworkApproval.artwork!.product!,
          ),
          SoiRequestArtworkApprovalAdditionalDataField.customerId.name:
              entity.salesOrderItem!.customerId,
          SoiRequestArtworkApprovalAdditionalDataField.status.name:
              entity.salesOrderItem!.status,
        }),
      );
      await SalesOrderItemHandler.update(
        session,
        item: entity.salesOrderItem!,
        transaction: transaction,
      );

      final refetchedSalesOrderItem = await SalesOrderItemDTO.db.findById(
        session,
        entity.salesOrderItemId,
        include: SalesOrderItemUtils.includeAll,
        transaction: transaction,
      );

      final withUpdatedMeta = GenericCrud.modifyEntityDataMeta(
        entity,
        serverSoiRequestArtworkApproval,
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
        soiRequestArtworkApproval: refetched!,
        salesOrderItem: refetchedSalesOrderItem!,
        entityAssignmentData: entityAssignmentData,
      );
    });
    soiRequestArtworkApprovalStreamController.add(soiRequestArtworkApproval);
    salesOrderItemStreamController.add(salesOrderItem);
    EntityAssignmentsCoreHandler.handleAssignment(
      entityAssignmentData: entityAssignmentData,
    );
    return soiRequestArtworkApproval;
  }

  static Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    await GenericCrud.releaseEntity<SoiRequestArtworkApprovalDTO>(
      session,
      entityId: entityId,
      sessionId: sessionId,
      fetchById: _fetchById,
      updateEntity: _updateRow,
      tableType: SoiRequestArtworkApprovalUtils.tableType,
      streamController: soiRequestArtworkApprovalStreamController,
      deleteDraft: null,
    );
  }

  static Future<SoiRequestArtworkApprovalDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return GenericCrud.fetchAndLockEntity<SoiRequestArtworkApprovalDTO>(
      session,
      id: id,
      tableType: SoiRequestArtworkApprovalUtils.tableType,
      editingSessionId: editingSessionId,
      fetchById: _fetchById,
      tableName: SoiRequestArtworkApprovalDTOTable().tableName,
      streamController: soiRequestArtworkApprovalStreamController,
    );
  }

  static Future<
      ({
        SalesOrderItemDTO salesOrderItem,
        SoiRequestArtworkApprovalDTO soiRequestArtworkApproval
      })> createSoiRequestArtworkApprovalAndSalesOrderItem(
    Session session, {
    required int artworkId,
    required int artworkMasterId,
    required int salesOrderId,
    required int userId,
    required DateTime now,
    required Transaction transaction,
    required int customerId,
  }) async {
    // * Check if we already have a prepare artwork sales order item for
    // this artwork
    final existingSoiRequestArtworkApproval =
        await SoiRequestArtworkApprovalDTO.db.findFirstRow(
      session,
      where: (t) =>
          t.artworkId.equals(artworkId) & t.deletedAt.equals(null as DateTime?),
      transaction: transaction,
    );
    if (existingSoiRequestArtworkApproval != null) {
      throw await ElbExceptionThrower.validationError(
        session,
        exceptionType: ElbExceptionType.conflict,
        message: ElbValidationError.artworkApprovalAlreadyAdded,
      );
    }

    // * Create sales order item
    final salesOrderItem = await SalesOrderItemHandler.createSalesOrderItem(
      session,
      salesOrderId: salesOrderId,
      customerId: customerId,
      type: SalesOrderItemType.requestArtworkApproval,
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
    final initialRequestArtworkApprovalSoi =
        SoiRequestArtworkApprovalUtils.initialSoiRequestArtworkApproval(
      artworkId: artworkId,
      userId: userId,
      now: now,
      salesOrderId: salesOrderId,
      soiCustomId: soiCustomId,
      salesOrderItemId: salesOrderItem.id!,
      artworkMasterId: artworkMasterId,
    );
    final inserertedRequestArtworkApprovalSoi =
        await SoiRequestArtworkApprovalDTO.db.insertRow(
      session,
      initialRequestArtworkApprovalSoi,
      transaction: transaction,
    );

    final updatedSalesOrderItem =
        await SalesOrderItemHandler.updateSalesOrderItemAfterSoiCreation(
      session,
      item: salesOrderItem.copyWith(
        soiTypePrimaryKey: inserertedRequestArtworkApprovalSoi.id,
      ),
      transaction: transaction,
    );

    final refetchedSoiRequestArtworkApproval = await _fetchById(
      session,
      inserertedRequestArtworkApprovalSoi.id!,
      transaction,
    );

    return (
      salesOrderItem: updatedSalesOrderItem,
      soiRequestArtworkApproval: refetchedSoiRequestArtworkApproval!,
    );
  }
}
