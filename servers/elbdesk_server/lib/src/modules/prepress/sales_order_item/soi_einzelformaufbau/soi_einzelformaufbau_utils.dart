import 'package:collection/collection.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';

class SoiEinzelformaufbauUtils {
  const SoiEinzelformaufbauUtils._();

  static const tableType = TableType.soiEinzelformaufbau;

  static SoiEinzelformaufbauDTOInclude get tableInSalesOrderInclude =>
      SoiEinzelformaufbauDTO.include(
        artwork: ArtworkDTO.include(),
        salesOrderItem: SalesOrderItemDTO.include(),
      );

  static SoiEinzelformaufbauDTOInclude get includeAll =>
      SoiEinzelformaufbauDTO.include(
        artwork: ArtworkDTO.include(
          customer: CustomerDTO.include(
            contact: ContactDTO.include(),
          ),
          product: ProductDTO.include(),
        ),
        salesOrderItem: SalesOrderItemDTO.include(
          salesOrder: SalesOrderDTO.include(),
          assignedUser: LightUserDTO.include(),
        ),
      );

  static Expression<dynamic>? buildExpression(Filter? filter) {
    return buildFilterExpression<SoiEinzelformaufbauDTOTable,
        SoiEinzelformaufbauField>(
      table: SoiEinzelformaufbauDTOTable(),
      filter: filter,
      enumFromString: (String fieldKey) => SoiEinzelformaufbauField.values
          .firstWhereOrNull((e) => e.name == fieldKey),
      getDbField: (table, field) => _dbFieldFromEnum(field)(table),
    );
  }

  static Column<dynamic> Function(SoiEinzelformaufbauDTOTable) orderBy(
    SoiEinzelformaufbauField? sortField,
  ) {
    if (sortField == null) {
      return (SoiEinzelformaufbauDTOTable t) => t.salesOrderItem.description;
    }
    return _dbFieldFromEnum(sortField);
  }

  static SoiEinzelformaufbauDTO initialSoiEinzelformaufbau({
    required int artworkId,
    required int userId,
    required DateTime now,
    required int salesOrderId,
    required int soiCustomId,
    required int salesOrderItemId,
    required int artworkMasterId,
  }) {
    return SoiEinzelformaufbauDTO(
      artworkMasterId: artworkMasterId,
      createdAt: now,
      createdById: userId,
      artworkId: artworkId,
      isDraft: false,
      salesOrderItemId: salesOrderItemId,
      version: 1,
    );
  }

  static Column<dynamic> Function(SoiEinzelformaufbauDTOTable) _dbFieldFromEnum(
    SoiEinzelformaufbauField sortFieldEnum,
  ) {
    switch (sortFieldEnum) {
      case SoiEinzelformaufbauField.assignedUser:
        return (SoiEinzelformaufbauDTOTable t) =>
            t.salesOrderItem.assignedUser.id;
      case SoiEinzelformaufbauField.createdAt:
        return (SoiEinzelformaufbauDTOTable t) => t.createdAt;
      case SoiEinzelformaufbauField.salesOrderItemId:
        return (SoiEinzelformaufbauDTOTable t) => t.salesOrderItem.id;
      case SoiEinzelformaufbauField.artworkId:
        return (SoiEinzelformaufbauDTOTable t) => t.artwork.id;
      case SoiEinzelformaufbauField.createdBy:
        return (SoiEinzelformaufbauDTOTable t) => t.createdById;
      case SoiEinzelformaufbauField.lastModifiedBy:
        return (SoiEinzelformaufbauDTOTable t) => t.lastModifiedById;
      case SoiEinzelformaufbauField.deletedAt:
        return (SoiEinzelformaufbauDTOTable t) => t.deletedAt;
      case SoiEinzelformaufbauField.isDraft:
        return (SoiEinzelformaufbauDTOTable t) => t.isDraft;
      case SoiEinzelformaufbauField.lastModifiedAt:
        return (SoiEinzelformaufbauDTOTable t) => t.lastModifiedAt;
      case SoiEinzelformaufbauField.salesOrderId:
        return (SoiEinzelformaufbauDTOTable t) =>
            t.salesOrderItem.salesOrder.id;
      case SoiEinzelformaufbauField.description:
        return (SoiEinzelformaufbauDTOTable t) => t.salesOrderItem.description;
      case SoiEinzelformaufbauField.billableTime:
        return (SoiEinzelformaufbauDTOTable t) => t.salesOrderItem.billableTime;
      case SoiEinzelformaufbauField.version:
        return (SoiEinzelformaufbauDTOTable t) => t.version;
    }
  }
}
