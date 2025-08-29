import 'dart:async';

import 'package:collection/collection.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/generic_crud.dart';
import 'package:elbdesk_server/src/modules/prepress/sales_order_item/sales_order_item_handler.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';

final salesOrderItemStreamController =
    StreamController<SalesOrderItemDTO>.broadcast();

class SalesOrderItemEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Stream<SalesOrderItemDTO> watchForSalesOrder(
    Session session, {
    required int salesOrderId,
  }) async* {
    yield* salesOrderItemStreamController.stream
        .where((event) => event.salesOrderId == salesOrderId)
        .map((event) {
      return event;
    });
  }

  Stream<SalesOrderItemDTO> watchByCustomerList(
    Session session, {
    required int customerId,
  }) async* {
    yield* salesOrderItemStreamController.stream
        .where((event) => event.customerId == customerId)
        .map((event) {
      return event;
    });
  }

  Future<List<SalesOrderItemDTO>> findBySalesOrder(
    Session session, {
    required int salesOrderId,
  }) async {
    return SalesOrderItemDTO.db.find(
      session,
      where: (t) => t.salesOrderId.equals(salesOrderId),
    );
  }

  // fetch Sois for Artwork
  Future<List<SalesOrderItemDTO>> fetchByArtworkId(
    Session session, {
    required int artworkId,
  }) async {
    // we are fetching all salesOrderItemsIds for each soi type
    final salesOrderItemIds = <int>[];
    for (final type in SalesOrderItemType.values) {
      switch (type) {
        case SalesOrderItemType.prepareArtwork:
          final prepareArtworkSois = await SoiPrepareArtworkDTO.db.find(
            session,
            where: (t) =>
                t.artworkId.equals(artworkId) &
                t.deletedAt.equals(null as DateTime?),
          );
          salesOrderItemIds
              .addAll(prepareArtworkSois.map((e) => e.salesOrderItemId));
        case SalesOrderItemType.requestArtworkApproval:
          final requestArtworkApprovalSois =
              await SoiRequestArtworkApprovalDTO.db.find(
            session,
            where: (t) => t.artworkId.equals(artworkId),
          );
          salesOrderItemIds.addAll(
            requestArtworkApprovalSois.map((e) => e.salesOrderItemId),
          );
        case SalesOrderItemType.einzelformaufbau:
          final einzelformaufbauSois = await SoiEinzelformaufbauDTO.db.find(
            session,
            where: (t) => t.artworkId.equals(artworkId),
          );
          salesOrderItemIds.addAll(
            einzelformaufbauSois.map((e) => e.salesOrderItemId),
          );
        case SalesOrderItemType.consulting:
          break;
      }
    }

    // after fetching all salesOrderItemIds we can fetch the salesOrderItems

    return SalesOrderItemDTO.db.find(
      session,
      where: (t) => t.id.inSet(salesOrderItemIds.toSet()),
    );
  }

  Future<SalesOrderItemDTO?> fetchById(Session session, int id) async {
    return SalesOrderItemDTO.db.findById(
      session,
      id,
      include: SalesOrderItemDTO.include(
        assignedUser: LightUserDTO.include(),
        salesOrder: SalesOrderDTO.include(
          customer: CustomerDTO.include(
            contact: ContactDTO.include(),
          ),
        ),
      ),
    );
  }

  Future<List<SalesOrderItemDTO>> find(
    Session session, {
    Sort? sort,
    Filter? filter,
  }) async {
    final sortByField = SalesOrderItemField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );

    final transformedFilter = Filter(
      filterGroups: filter?.filterGroups.map((group) {
            return FilterGroup(
              filters: group.filters.map((field) {
                if (field.fieldKey ==
                    SalesOrderItemField.salesOrderCustomId.name) {
                  final value = field.value.replaceAll(RegExp('[^0-9]'), '');
                  final parsedValue = int.tryParse(value);
                  if (parsedValue != null) {
                    return FilterField(
                      fieldKey: SalesOrderItemField.salesOrderCustomId.name,
                      filterOperator: field.filterOperator,
                      type: FilterType.equal,
                      value: value,
                      uuid: const Uuid().v4(),
                      fieldType: FilterFieldType.number,
                    );
                  }
                }
                if (field.fieldKey == SalesOrderItemField.customId.name) {
                  final value = field.value.replaceAll(RegExp('[^0-9]'), '');
                  final parsedValue = int.tryParse(value);
                  if (parsedValue != null) {
                    return FilterField(
                      fieldKey: SalesOrderItemField.customId.name,
                      filterOperator: field.filterOperator,
                      type: FilterType.equal,
                      value: value,
                      uuid: const Uuid().v4(),
                      fieldType: FilterFieldType.number,
                    );
                  }
                }
                return field;
              }).toList(),
              nextOperator: group.nextOperator,
            );
          }).toList() ??
          [],
    );

    final expression =
        buildFilterExpression<SalesOrderItemDTOTable, SalesOrderItemField>(
      table: SalesOrderItemDTOTable(),
      filter: transformedFilter,
      enumFromString: (String fieldKey) => SalesOrderItemField.values
          .firstWhereOrNull((e) => e.name == fieldKey),
      getDbField: (table, field) => _dbFieldFromEnum(field)(table),
    );

    return SalesOrderItemDTO.db.find(
      session,
      where: expression == null ? null : (t) => expression,
      orderBy: sortByField != null
          ? _dbFieldFromEnum(sortByField)
          : _dbFieldFromEnum(SalesOrderItemField.salesOrderId),
      orderDescending: sort?.orderDescending ?? false,
      include: SalesOrderItemDTO.include(
        assignedUser: LightUserDTO.include(),
        salesOrder: SalesOrderDTO.include(
          customer: CustomerDTO.include(
            contact: ContactDTO.include(),
          ),
        ),
      ),
    );
  }

  Column<dynamic> Function(SalesOrderItemDTOTable) _dbFieldFromEnum(
    SalesOrderItemField sortFieldEnum,
  ) {
    switch (sortFieldEnum) {
      case SalesOrderItemField.customId:
        return (SalesOrderItemDTOTable t) => t.id;
      case SalesOrderItemField.soiTypePrimaryKey:
        return (SalesOrderItemDTOTable t) => t.soiTypePrimaryKey;
      case SalesOrderItemField.salesOrderId:
        return (SalesOrderItemDTOTable t) => t.salesOrderId;
      case SalesOrderItemField.status:
        return (SalesOrderItemDTOTable t) => t.status;
      case SalesOrderItemField.type:
        return (SalesOrderItemDTOTable t) => t.type;
      case SalesOrderItemField.assignedUser:
        return (SalesOrderItemDTOTable t) => t.assignedUser.userInfoId;
      case SalesOrderItemField.description:
        return (SalesOrderItemDTOTable t) => t.description;
      case SalesOrderItemField.billableTime:
        return (SalesOrderItemDTOTable t) => t.billableTime;
      case SalesOrderItemField.salesOrderCustomId:
        return (SalesOrderItemDTOTable t) => t.salesOrder.customId;
      case SalesOrderItemField.customerName:
        return (SalesOrderItemDTOTable t) =>
            t.salesOrder.customer.contact.fullName;
      case SalesOrderItemField.deadline:
        return (SalesOrderItemDTOTable t) => t.deadline;
    }
  }

  /// Deletes a SalesOrderItem by marking it as deleted
  Future<bool> delete(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    return GenericCrud.markEntityAsDeleted<SalesOrderItemDTO>(
      session,
      id: entityId,
      sessionId: sessionId,
      fetchWithoutRelations: SalesOrderItemHandler.fetchWithoutRelations,
      updateRow: SalesOrderItemHandler.updateRow,
      tableType: TableType.salesOrderItem,
      streamController: salesOrderItemStreamController,
    );
  }
}
