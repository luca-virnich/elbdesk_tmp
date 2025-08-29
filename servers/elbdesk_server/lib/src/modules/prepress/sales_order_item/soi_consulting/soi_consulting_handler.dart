import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/custom_entity_keys/custom_entiy_keys_endpoint.dart';
import 'package:elbdesk_server/src/modules/core/generic_crud.dart';
import 'package:elbdesk_server/src/modules/prepress/sales_order_item/endpoints/sales_order_item_endpoint.dart';
import 'package:elbdesk_server/src/modules/prepress/sales_order_item/sales_order_item_handler.dart';
import 'package:elbdesk_server/src/modules/prepress/sales_order_item/soi_consulting/endpoints/soi_consulting_endpoint.dart';
import 'package:elbdesk_server/src/modules/prepress/sales_order_item/soi_consulting/soi_consulting_utils.dart';
import 'package:serverpod/serverpod.dart';

class SoiConsultingHandler {
  const SoiConsultingHandler._();

  static Future<SoiConsultingDTO?> _fetchWithoutRelations(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return SoiConsultingDTO.db.findById(session, id, transaction: transaction);
  }

  static Future<SoiConsultingDTO?> _fetchById(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return SoiConsultingDTO.db.findById(
      session,
      id,
      include: SoiConsultingUtils.includeAll,
      transaction: transaction,
    );
  }

  static Future<SoiConsultingDTO> _updateRow(
    Session session,
    SoiConsultingDTO entity,
    Transaction transaction,
  ) async {
    return SoiConsultingDTO.db
        .updateRow(session, entity, transaction: transaction);
  }

  /// The update happens inside of the unsafeQuery method
  static Future<SoiConsultingDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return GenericCrud.fetchAndLockEntity<SoiConsultingDTO>(
      session,
      id: id,
      tableType: SoiConsultingUtils.tableType,
      editingSessionId: editingSessionId,
      fetchById: _fetchById,
      tableName: SoiConsultingDTOTable().tableName,
      streamController: soiConsultingStreamController,
    );
  }

  static Future<SoiConsultingDTO> update(
    Session session, {
    required SoiConsultingDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    final updatedSoiConsulting =
        await session.db.transaction((transaction) async {
      final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);

      // * Check if we are allowed to update the sales order item
      final serverSoiConsulting = await _fetchWithoutRelations(
        session,
        entity.id!,
        transaction,
      );
      await GenericCrud.validateUpdate(
        session,
        sessionId: sessionId,
        serverEntity: serverSoiConsulting,
        now: now,
      );
      await SalesOrderItemHandler.update(
        session,
        item: entity.salesOrderItem!,
        transaction: transaction,
      );
      // Then update the SoiPrepareArtwork
      final withUpdatedMeta = GenericCrud.modifyEntityDataMeta(
        entity,
        serverSoiConsulting,
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

      return refetched!;
    });

    salesOrderItemStreamController.add(updatedSoiConsulting.salesOrderItem!);
    soiConsultingStreamController.add(updatedSoiConsulting);
    return updatedSoiConsulting;
  }

  static Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    await GenericCrud.releaseEntity<SoiConsultingDTO>(
      session,
      entityId: entityId,
      sessionId: sessionId,
      fetchById: _fetchById,
      updateEntity: _updateRow,
      tableType: SoiConsultingUtils.tableType,
      streamController: soiConsultingStreamController,
      deleteDraft: null,
    );
  }

  static Future<bool> delete(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    return session.db.transaction((transaction) async {
      // First fetch the SoiPrepareArtwork to get the salesOrderItemId
      final soiConsulting =
          await _fetchWithoutRelations(session, entityId, transaction);
      if (soiConsulting == null) {
        throw Exception('SoiConsulting not found');
      }

      // Delete the parent SalesOrderItem first
      await SalesOrderItemEndpoint().delete(
        session,
        entityId: soiConsulting.salesOrderItemId,
        sessionId: sessionId,
      );

      // Then delete the SoiPrepareArtwork
      return GenericCrud.markEntityAsDeleted<SoiConsultingDTO>(
        session,
        id: entityId,
        sessionId: sessionId,
        fetchWithoutRelations: _fetchWithoutRelations,
        updateRow: _updateRow,
        tableType: SoiConsultingUtils.tableType,
        streamController: soiConsultingStreamController,
      );
    });
  }

  static Future<int> createFromSalesOrder(
    Session session, {
    required int salesOrderId,
    required int customerId,
  }) async {
    final soi = await session.db.transaction((transaction) async {
      final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);

      // * Check if we already have a consulting soi sales order item for
      // this artwork
      final existingConsultingSoi = await SalesOrderItemDTO.db.findFirstRow(
        session,
        where: (t) =>
            t.salesOrderId.equals(salesOrderId) &
            t.type.equals(SalesOrderItemType.consulting.name),
        transaction: transaction,
      );
      if (existingConsultingSoi != null) {
        throw ElbException(
          message: 'Consulting Auftrag bereits erstellt',
          exceptionType: ElbExceptionType.conflict,
          // elbExceptionMessage: ElbExceptionMessage.artworkAlreadyInAnotherSalesOrder,
        );
      }

      final soiCustomId =
          await CustomEntityKeysHandler.getNextIntKeyTransaction(
        TableType.salesOrderItem,
      );
      // create parent sales order item
      final salesOrderItem = await SalesOrderItemHandler.createSalesOrderItem(
        session,
        type: SalesOrderItemType.consulting,
        status: SalesOrderItemStatus.preperation,
        salesOrderId: salesOrderId,
        customerId: customerId,
        description: '',
        billableTime: 0,
        assignedUser: null,
        transaction: transaction,
      );

      final initialSoiConsulting = SoiConsultingUtils.initialSoiConsulting(
        userId: userId,
        now: now,
        salesOrderId: salesOrderId,
        salesOrderItemId: salesOrderItem.id!,
      );
      final insertedSoiType = await GenericCrud.create<SoiConsultingDTO>(
        session,
        SoiConsultingDTO.db.insertRow(
          session,
          initialSoiConsulting,
          transaction: transaction,
        ),
      );

      final updatedSalesOrderItem =
          await SalesOrderItemHandler.updateSalesOrderItemAfterSoiCreation(
        session,
        item: salesOrderItem.copyWith(
          soiTypePrimaryKey: insertedSoiType.id,
        ),
        transaction: transaction,
      );

      // Add the new SoiPrepareArtwork to both stream controllers
      soiConsultingStreamController.add(insertedSoiType);

      return updatedSalesOrderItem;
    });
    salesOrderItemStreamController.add(soi);
    return soi.soiTypePrimaryKey!;
  }
}
