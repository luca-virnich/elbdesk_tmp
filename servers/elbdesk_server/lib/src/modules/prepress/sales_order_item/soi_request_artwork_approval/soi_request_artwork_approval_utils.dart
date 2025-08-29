import 'package:collection/collection.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';

class SoiRequestArtworkApprovalUtils {
  const SoiRequestArtworkApprovalUtils._();

  static const tableType = TableType.soiRequestArtworkApproval;

  static SoiRequestArtworkApprovalDTOInclude get tableInSalesOrderInclude =>
      SoiRequestArtworkApprovalDTO.include(
        artwork: ArtworkDTO.include(),
        salesOrderItem: SalesOrderItemDTO.include(),
      );

  static SoiRequestArtworkApprovalDTOInclude get includeAll =>
      SoiRequestArtworkApprovalDTO.include(
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
    return buildFilterExpression<SoiRequestArtworkApprovalDTOTable,
        SoiRequestArtworkApprovalField>(
      table: SoiRequestArtworkApprovalDTOTable(),
      filter: filter,
      enumFromString: (String fieldKey) => SoiRequestArtworkApprovalField.values
          .firstWhereOrNull((e) => e.name == fieldKey),
      getDbField: (table, field) => _dbFieldFromEnum(field)(table),
    );
  }

  static Column<dynamic> Function(SoiRequestArtworkApprovalDTOTable) orderBy(
    SoiRequestArtworkApprovalField? sortField,
  ) {
    if (sortField == null) {
      return (SoiRequestArtworkApprovalDTOTable t) =>
          t.salesOrderItem.description;
    }
    return _dbFieldFromEnum(sortField);
  }

  static SoiRequestArtworkApprovalDTO initialSoiRequestArtworkApproval({
    required int artworkId,
    required int userId,
    required DateTime now,
    required int salesOrderId,
    required int soiCustomId,
    required int salesOrderItemId,
    required int artworkMasterId,
  }) {
    return SoiRequestArtworkApprovalDTO(
      artworkMasterId: artworkMasterId,
      createdAt: now,
      createdById: userId,
      artworkId: artworkId,
      isDraft: false,
      salesOrderItemId: salesOrderItemId,
      approvalType: '',
    );
  }

  static Column<dynamic> Function(SoiRequestArtworkApprovalDTOTable)
      _dbFieldFromEnum(
    SoiRequestArtworkApprovalField sortFieldEnum,
  ) {
    switch (sortFieldEnum) {
      case SoiRequestArtworkApprovalField.assignedUser:
        return (SoiRequestArtworkApprovalDTOTable t) => t.id;
      case SoiRequestArtworkApprovalField.createdAt:
        return (SoiRequestArtworkApprovalDTOTable t) => t.createdAt;
      case SoiRequestArtworkApprovalField.salesOrderItemId:
        return (SoiRequestArtworkApprovalDTOTable t) => t.salesOrderItem.id;
      case SoiRequestArtworkApprovalField.artworkId:
        return (SoiRequestArtworkApprovalDTOTable t) => t.artwork.id;
      case SoiRequestArtworkApprovalField.createdBy:
        return (SoiRequestArtworkApprovalDTOTable t) => t.createdById;
      case SoiRequestArtworkApprovalField.lastModifiedBy:
        return (SoiRequestArtworkApprovalDTOTable t) => t.lastModifiedById;
      case SoiRequestArtworkApprovalField.deletedAt:
        return (SoiRequestArtworkApprovalDTOTable t) => t.deletedAt;
      case SoiRequestArtworkApprovalField.isDraft:
        return (SoiRequestArtworkApprovalDTOTable t) => t.isDraft;
      case SoiRequestArtworkApprovalField.lastModifiedAt:
        return (SoiRequestArtworkApprovalDTOTable t) => t.lastModifiedAt;
      case SoiRequestArtworkApprovalField.salesOrderId:
        return (SoiRequestArtworkApprovalDTOTable t) =>
            t.salesOrderItem.salesOrder.id;
      case SoiRequestArtworkApprovalField.description:
        return (SoiRequestArtworkApprovalDTOTable t) =>
            t.salesOrderItem.description;
      case SoiRequestArtworkApprovalField.billableTime:
        return (SoiRequestArtworkApprovalDTOTable t) =>
            t.salesOrderItem.billableTime;
      case SoiRequestArtworkApprovalField.approvalType:
        return (SoiRequestArtworkApprovalDTOTable t) => t.approvalType;
    }
  }
}
