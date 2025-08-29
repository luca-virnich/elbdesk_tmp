import 'dart:convert';

import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/custom_entity_keys/custom_entiy_keys_endpoint.dart';
import 'package:elbdesk_server/src/modules/core/generic_crud.dart';
import 'package:elbdesk_server/src/modules/crm/customer_billing_customers/customer_bllling_customers_handler.dart';
import 'package:elbdesk_server/src/modules/crm/customer_shipping_contact/customer_shipping_handler.dart';
import 'package:elbdesk_server/src/modules/sales/sales_order/endpoints/sales_order_endpoint.dart';
import 'package:elbdesk_server/src/modules/sales/sales_order/sales_order_utils.dart';
import 'package:serverpod/serverpod.dart';

class SalesOrderHandler {
  const SalesOrderHandler._();

  static Future<SalesOrderDTO?> _fetchWithoutRelations(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return SalesOrderDTO.db.findById(session, id, transaction: transaction);
  }

  static Future<SalesOrderDTO?> _fetchForNotification(
    Session session,
    int id,
  ) async {
    return SalesOrderDTO.db.findById(
      session,
      id,
      include: SalesOrderDTO.include(
        assignedUser: LightUserDTO.include(),
        customer: CustomerDTO.include(
          contact: ContactDTO.include(),
        ),
      ),
    );
  }

  static Future<SalesOrderDTO> _updateRow(
    Session session,
    SalesOrderDTO entity,
    Transaction transaction,
  ) async {
    return SalesOrderDTO.db
        .updateRow(session, entity, transaction: transaction);
  }

  static Future<SalesOrderDTO?> _fetchById(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return SalesOrderDTO.db.findById(
      session,
      id,
      include: SalesOrderUtils.includeAll,
      transaction: transaction,
    );
  }

  static Future<SalesOrderDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return GenericCrud.fetchAndLockEntity<SalesOrderDTO>(
      session,
      id: id,
      tableType: SalesOrderUtils.tableType,
      editingSessionId: editingSessionId,
      fetchById: _fetchById,
      tableName: SalesOrderDTOTable().tableName,
      streamController: salesOrderStreamController,
    );
  }

  static Future<SalesOrderDTO> update(
    Session session, {
    required SalesOrderDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    final currentSalesOrder = await _fetchForNotification(
      session,
      entity.id!,
    );
    final updatedSalesOrder = await GenericCrud.update(
      //hasManyToManyRelations: true,
      session,
      fetchById: _fetchById,
      sessionId: sessionId,
      newEntity: entity,
      updateEntity: _updateRow,

      tableType: SalesOrderUtils.tableType,
      streamController: salesOrderStreamController,
      release: release,

      logFields: SalesOrderUtils.getLogFields(),
    );
    // if we reach this, the generic crud transacton has been successful
    final entityAssignmentData = EntityAssignmentData(
      tableType: TableType.salesOrder.name,
      entityId: entity.id!,
      deadline: null,
      oldLightUserId: currentSalesOrder?.assignedUser?.id,
      newLightUserId: entity.assignedUser?.id,
      additionalData: jsonEncode({
        SalesOrderAdditionalDataField.customerName.name:
            currentSalesOrder?.customer?.contact?.fullName,
        SalesOrderAdditionalDataField.customId.name: 'VA-${entity.customId}',
        SalesOrderAdditionalDataField.status.name: entity.status,
        SalesOrderAdditionalDataField.keywords.name: entity.keywords,
      }),
    );
    EntityAssignmentsCoreHandler.handleAssignment(
      entityAssignmentData: entityAssignmentData,
    );
    return updatedSalesOrder;
  }

  static Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    await GenericCrud.releaseEntity<SalesOrderDTO>(
      session,
      entityId: entityId,
      updateEntity: _updateRow,
      sessionId: sessionId,
      fetchById: _fetchById,
      tableType: SalesOrderUtils.tableType,
      streamController: salesOrderStreamController,
      deleteDraft: null,
    );
  }

  static Future<bool> delete(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    return GenericCrud.markEntityAsDeleted<SalesOrderDTO>(
      session,
      id: entityId,
      sessionId: sessionId,
      fetchWithoutRelations: _fetchWithoutRelations,
      updateRow: _updateRow,
      tableType: SalesOrderUtils.tableType,
      streamController: salesOrderStreamController,
    );
  }

  static Future<SalesOrderDTO> create(
    Session session, {
    required String? sessionId,
    required int? customerId,
  }) async {
    final (:soi, :lightUser, :entityAssignmentData) =
        await session.db.transaction((transaction) async {
      final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);
      final customer = await CustomerDTO.db.findById(
        session,
        customerId!,
        include: CustomerDTO.include(
          contact: ContactDTO.include(),
        ),
      );

      final assignedUser = await LightUserHandler.fetchByUserInfoId(
        session,
        userInfoId: userId,
      );

      final shippingAddressContactId =
          await CustomerShippingHandler.fetchPrimaryShippingAddress(
        session,
        customerId,
        transaction,
      );
      final billingAddressCustomerId =
          await CustomerBillingCustomersHandler.fetchPrimaryBillingCustomer(
        session,
        customerId,
        transaction,
      );
      final customId = await CustomEntityKeysHandler.getNextIntKey(
        session,
        SalesOrderUtils.tableType,
        transaction,
      );
      // Create a temporary initial sales order
      final initialSalesOrder = SalesOrderUtils.initialSalesOrder(
        userId: userId,
        assignedLightUserId: assignedUser!.id!,
        sessionId: sessionId,
        customer: customer!,
        shippingAddressId: shippingAddressContactId ?? customer.contact!.id!,
        billingAddressCustomerId: billingAddressCustomerId ?? customer.id!,
        now: now,
        customId: customId,
      );
      final newSalesOrder = await GenericCrud.create(
        session,
        SalesOrderDTO.db.insertRow(
          session,
          initialSalesOrder,
          transaction: transaction,
        ),
      );

      // Fetch a new Sales Order ID

      // Update the Sales Order with the new ID

      final entityAssignmentData = EntityAssignmentData(
        tableType: TableType.salesOrder.name,
        entityId: newSalesOrder.id!,
        deadline: null,
        oldLightUserId: null,
        newLightUserId: assignedUser.id,
        additionalData: jsonEncode({
          SalesOrderAdditionalDataField.customerName.name:
              customer.contact?.fullName,
          SalesOrderAdditionalDataField.customId.name:
              'VA-${newSalesOrder.customId}',
          SalesOrderAdditionalDataField.status.name: newSalesOrder.status,
        }),
      );

      return (
        soi: newSalesOrder,
        lightUser: assignedUser,
        entityAssignmentData: entityAssignmentData,
      );
    });

    EntityAssignmentsCoreHandler.handleAssignment(
      entityAssignmentData: entityAssignmentData,
    );
    return soi;
  }
}
