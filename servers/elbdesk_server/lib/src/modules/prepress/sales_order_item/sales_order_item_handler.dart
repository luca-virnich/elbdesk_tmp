import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork/artwork_handler.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork/endpoints/artwork_endpoint.dart';
import 'package:serverpod/serverpod.dart';

class SalesOrderItemHandler {
  const SalesOrderItemHandler._();

  static Future<SalesOrderItemDTO> createSalesOrderItem(
    Session session, {
    required int salesOrderId,
    required SalesOrderItemType type,
    required SalesOrderItemStatus status,
    required String description,
    required int billableTime,
    required LightUserDTO? assignedUser,
    required Transaction transaction,
    required int customerId,
  }) async {
    final soi = await SalesOrderItemDTO.db.insertRow(
      session,
      SalesOrderItemDTO(
        salesOrderId: salesOrderId,
        customerId: customerId,
        type: type.name,
        soiTypePrimaryKey: null,
        status: status.name,
        description: description,
        billableTime: billableTime,
        assignedUser: assignedUser,
      ),
      transaction: transaction,
    );
    return soi;
  }

  static Future<SalesOrderItemDTO> update(
    Session session, {
    required SalesOrderItemDTO item,
    required Transaction transaction,
  }) async {
    // final currentItem = await SalesOrderItemDTO.db.findById(
    //   session,
    //   item.id!,
    //   include: SalesOrderItemDTO.include(
    //     assignedUser: LightUserDTO.include(),
    //   ),
    //   transaction: transaction,
    // );
    // final currentLightUserId = currentItem?.assignedUser?.id;
    // final newLightUserId = item.assignedUser?.id;

    // if (currentLightUserId != newLightUserId) {
    //   if (currentLightUserId != null) {
    //     EntityAssignmentHandler.remove(
    //       entity: TableType.salesOrderItem,
    //       entityId: item.id!,
    //       lightUserId: currentLightUserId,
    //     );
    //   }
    //   if (newLightUserId != null) {
    //     EntityAssignmentHandler.add(
    //       entity: TableType.salesOrderItem,
    //       entityId: item.id!,
    //       lightUserId: newLightUserId,
    //     );
    //   }
    // }

    final updated = await SalesOrderItemDTO.db.updateRow(
      session,
      item,
      transaction: transaction,
    );
    session.log('Updated sales order item: $updated');
    return updated;
  }

  static Future<SalesOrderItemDTO> updateSalesOrderItemAfterSoiCreation(
    Session session, {
    required SalesOrderItemDTO item,
    required Transaction transaction,
  }) async {
    final soi = await SalesOrderItemDTO.db.updateRow(
      session,
      item,
      transaction: transaction,
    );
    return soi;
  }

  static Future<SalesOrderItemDTO> updateSalesOrderItem(
    Session session, {
    required SalesOrderItemDTO item,
  }) async {
    final (:salesOrderItem, :artwork) =
        await session.db.transaction((transaction) async {
      ArtworkDTO? artwork;
      final type = _getSalesOrderItemType(item.type);
      final status = getSalesOrderItemStatus(item.status);
      final serverSalesOrderItem = await SalesOrderItemDTO.db.findById(
        session,
        item.id!,
        transaction: transaction,
      );
      final currentStatus =
          getSalesOrderItemStatus(serverSalesOrderItem!.status);
      switch (type) {
        case SalesOrderItemType.prepareArtwork:
          artwork = await _lockOrUnlockArtwork(
            session,
            prepareArtworkSoiId: item.soiTypePrimaryKey!,
            status: status,
            currentStatus: currentStatus,
            transaction: transaction,
          );
        case SalesOrderItemType.requestArtworkApproval:
        case SalesOrderItemType.consulting:
        case SalesOrderItemType.einzelformaufbau:
      }
      final salesOrderItem = await SalesOrderItemDTO.db.updateRow(
        session,
        item,
        transaction: transaction,
      );
      return (salesOrderItem: salesOrderItem, artwork: artwork);
    });
    if (artwork != null) {
      artworkStreamController.add(artwork);
    }
    return salesOrderItem;
  }

  static Future<ArtworkDTO?> _lockOrUnlockArtwork(
    Session session, {
    required int prepareArtworkSoiId,
    required SalesOrderItemStatus status,
    required SalesOrderItemStatus currentStatus,
    required Transaction transaction,
  }) async {
    if (currentStatus == status) {
      return null;
    }

    if (currentStatus == SalesOrderItemStatus.completed &&
        status != SalesOrderItemStatus.completed) {
      final prepareArtworkSoi = await SoiPrepareArtworkDTO.db.findById(
        session,
        prepareArtworkSoiId,
        transaction: transaction,
      );
      await ArtworkHandler.unlockArtwork(
        session,
        prepareArtworkSoi!.artworkId,
        transaction: transaction,
      );
      final artwork = await ArtworkDTO.db.findById(
        session,
        prepareArtworkSoi.artworkId,
        include: ArtworkDTO.include(
          customer: CustomerDTO.include(
            contact: ContactDTO.include(),
          ),
          salesOrder: SalesOrderDTO.include(),
          artworkMaster: ArtworkMasterDTO.include(),
          product: ProductDTO.include(),
        ),
        transaction: transaction,
      );
      return artwork;

      // unlock artwork
    }
    if (status == SalesOrderItemStatus.completed) {
      // lock artwork
      final prepareArtworkSoi = await SoiPrepareArtworkDTO.db.findById(
        session,
        prepareArtworkSoiId,
        transaction: transaction,
      );

      await ArtworkHandler.lockArtwork(
        session,
        prepareArtworkSoi!.artworkId,
        transaction: transaction,
      );
      final artwork = await ArtworkDTO.db.findById(
        session,
        prepareArtworkSoi.artworkId,
        include: ArtworkDTO.include(
          customer: CustomerDTO.include(
            contact: ContactDTO.include(),
          ),
          salesOrder: SalesOrderDTO.include(),
          artworkMaster: ArtworkMasterDTO.include(),
          product: ProductDTO.include(),
        ),
        transaction: transaction,
      );
      return artwork!;
    }

    return null;
  }

  static SalesOrderItemType _getSalesOrderItemType(String typeString) {
    return SalesOrderItemType.values.firstWhere(
      (type) => type.name == typeString,
      orElse: () => SalesOrderItemType.prepareArtwork,
    );
  }

  static SalesOrderItemStatus getSalesOrderItemStatus(String statusString) {
    return SalesOrderItemStatus.values.firstWhere(
      (status) => status.name == statusString,
      orElse: () => SalesOrderItemStatus.preperation,
    );
  }

  static Future<SalesOrderItemDTO?> fetchWithoutRelations(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return SalesOrderItemDTO.db.findById(session, id, transaction: transaction);
  }

  static Future<SalesOrderItemDTO> updateRow(
    Session session,
    SalesOrderItemDTO entity,
    Transaction transaction,
  ) async {
    return SalesOrderItemDTO.db
        .updateRow(session, entity, transaction: transaction);
  }
}
