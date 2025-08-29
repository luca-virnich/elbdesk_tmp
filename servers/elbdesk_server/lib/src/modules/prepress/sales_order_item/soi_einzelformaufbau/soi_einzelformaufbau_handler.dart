import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/custom_entity_keys/custom_entiy_keys_endpoint.dart';
import 'package:elbdesk_server/src/modules/core/generic_crud.dart';
import 'package:elbdesk_server/src/modules/prepress/sales_order_item/endpoints/sales_order_item_endpoint.dart';
import 'package:elbdesk_server/src/modules/prepress/sales_order_item/sales_order_item_handler.dart';
import 'package:elbdesk_server/src/modules/prepress/sales_order_item/sales_order_item_utils.dart';
import 'package:elbdesk_server/src/modules/prepress/sales_order_item/soi_einzelformaufbau/endpoints/soi_einzelnutzenaufbau_endpoint.dart';
import 'package:elbdesk_server/src/modules/prepress/sales_order_item/soi_einzelformaufbau/soi_einzelformaufbau_utils.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';

class SoiEinzelformaufbauHandler {
  const SoiEinzelformaufbauHandler._();

  static Future<SoiEinzelformaufbauDTO?> _fetchWithoutRelations(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return SoiEinzelformaufbauDTO.db
        .findById(session, id, transaction: transaction);
  }

  static Future<SoiEinzelformaufbauDTO> _updateRow(
    Session session,
    SoiEinzelformaufbauDTO entity,
    Transaction transaction,
  ) async {
    return SoiEinzelformaufbauDTO.db
        .updateRow(session, entity, transaction: transaction);
  }

  static Future<SoiEinzelformaufbauDTO?> _fetchById(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return SoiEinzelformaufbauDTO.db.findById(
      session,
      id,
      transaction: transaction,
      include: SoiEinzelformaufbauUtils.includeAll,
    );
  }

  static Future<void> create(
    Session session, {
    required int salesOrderId,
    required int artworkId,
    required int artworkMasterId,
    required bool increaseEinzelformVersion,
    required int customerId,
  }) async {
    final (:salesOrderItem, :soiEinzelformaufbau) =
        await session.db.transaction(
      (transaction) async {
        final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);

        final (
          :salesOrderItem,
          :soiEinzelformaufbau,
        ) = await createSoiEinzelformaufbauAndSalesOrderItem(
          session,
          artworkId: artworkId,
          artworkMasterId: artworkMasterId,
          salesOrderId: salesOrderId,
          increaseEinzelformVersion: increaseEinzelformVersion,
          userId: userId,
          now: now,
          transaction: transaction,
          customerId: customerId,
        );

        return (
          soiEinzelformaufbau: soiEinzelformaufbau,
          salesOrderItem: salesOrderItem,
        );
      },
    );

    soiEinzelformaufbauStreamController.add(soiEinzelformaufbau);

    salesOrderItemStreamController.add(salesOrderItem);
  }

  static Future<SoiEinzelformaufbauDTO> update(
    Session session, {
    required SoiEinzelformaufbauDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    final (:soiEinzelformaufbau) =
        await session.db.transaction((transaction) async {
      final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);

      session.log('soi prepare gots updated: $entity');

      // * Check if we are allowed to update the sales order item
      final serverSoiPrepareArtwork = await _fetchWithoutRelations(
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
        transaction: transaction,
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

      // if (currentStatus != SalesOrderItemStatus.completed &&
      //     newStatus == SalesOrderItemStatus.completed) {
      //   await ArtworkHandler.lockArtwork(
      //     session,
      //     entity.artworkId,
      //     transaction: transaction,
      //   );
      // }
      // * When the current status is completed and the old one not, we have
      // * to check if the artwork is unlocked in another sales order
      // if (currentStatus == SalesOrderItemStatus.completed &&
      //     newStatus != SalesOrderItemStatus.completed) {
      //   final isUnlockedElsewhere = await ArtworkHandler.isUnlockedElsewhere(
      //     session,
      //     artworkId: entity.artworkId,
      //     artworkMasterId: entity.artworkMasterId,
      //     transaction: transaction,
      //   );
      //   if (isUnlockedElsewhere) {
      //     throw ElbException(
      //       message: 'Artwork is already in another sales order not finished',
      //       exceptionType: ElbExceptionType.conflict,
      //     );
      //   }
      //   // * Else, unlock the artwork
      //   await ArtworkHandler.unlockArtwork(
      //     session,
      //     entity.artworkId,
      //     transaction: transaction,
      //   );
      // }

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
        withUpdatedMeta!,
        transaction,
      );
      final refetched = await _fetchById(
        session,
        entity.id!,
        transaction,
      );

      return (soiEinzelformaufbau: refetched!,);
    });
    soiEinzelformaufbauStreamController.add(soiEinzelformaufbau);

    return soiEinzelformaufbau;
  }

  static Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    await GenericCrud.releaseEntity<SoiEinzelformaufbauDTO>(
      session,
      entityId: entityId,
      sessionId: sessionId,
      fetchById: _fetchById,
      updateEntity: _updateRow,
      tableType: SoiEinzelformaufbauUtils.tableType,
      streamController: soiEinzelformaufbauStreamController,
      deleteDraft: null,
    );
  }

  static Future<SoiEinzelformaufbauDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return GenericCrud.fetchAndLockEntity<SoiEinzelformaufbauDTO>(
      session,
      id: id,
      tableType: SoiEinzelformaufbauUtils.tableType,
      editingSessionId: editingSessionId,
      fetchById: _fetchById,
      tableName: SoiEinzelformaufbauDTOTable().tableName,
      streamController: soiEinzelformaufbauStreamController,
    );
  }

  static Future<
      ({
        SalesOrderItemDTO salesOrderItem,
        SoiEinzelformaufbauDTO soiEinzelformaufbau,
      })> createSoiEinzelformaufbauAndSalesOrderItem(
    Session session, {
    required int artworkId,
    required int artworkMasterId,
    required int salesOrderId,
    required bool increaseEinzelformVersion,
    required int userId,
    required DateTime now,
    required Transaction transaction,
    required int customerId,
  }) async {
    // * Check if we already have a einzelform in this sales order item for
    // this artwork
    final existingSoiEinzelformaufbau =
        await SoiEinzelformaufbauDTO.db.findFirstRow(
      session,
      where: (t) =>
          t.artworkId.equals(artworkId) & t.deletedAt.equals(null as DateTime?),
      transaction: transaction,
    );
    if (existingSoiEinzelformaufbau != null) {
      throw ElbException(
        message: 'Einzelform is already in sales order',
        exceptionType: ElbExceptionType.conflict,
        // elbExceptionMessage: ElbExceptionMessage.artworkAlreadyInAnotherSalesOrder,
      );
    }

    // * Create sales order item
    final salesOrderItem = await SalesOrderItemHandler.createSalesOrderItem(
      session,
      salesOrderId: salesOrderId,
      customerId: customerId,
      type: SalesOrderItemType.einzelformaufbau,
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
    final initialSoiEinzelformaufbau =
        SoiEinzelformaufbauUtils.initialSoiEinzelformaufbau(
      artworkId: artworkId,
      userId: userId,
      now: now,
      salesOrderId: salesOrderId,
      soiCustomId: soiCustomId,
      salesOrderItemId: salesOrderItem.id!,
      artworkMasterId: artworkMasterId,
    );
    final inserertedSoiEinzelformaufbau =
        await SoiEinzelformaufbauDTO.db.insertRow(
      session,
      initialSoiEinzelformaufbau,
      transaction: transaction,
    );

    final updatedSalesOrderItem =
        await SalesOrderItemHandler.updateSalesOrderItemAfterSoiCreation(
      session,
      item: salesOrderItem.copyWith(
        soiTypePrimaryKey: inserertedSoiEinzelformaufbau.id,
      ),
      transaction: transaction,
    );

    final refetchedSoiEinzelformaufbau = await _fetchById(
      session,
      inserertedSoiEinzelformaufbau.id!,
      transaction,
    );

    return (
      salesOrderItem: updatedSalesOrderItem,
      soiEinzelformaufbau: refetchedSoiEinzelformaufbau!,
    );
  }
}
