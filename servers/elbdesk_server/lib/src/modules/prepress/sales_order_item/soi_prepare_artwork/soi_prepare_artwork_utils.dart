import 'package:collection/collection.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';

class SoiPrepareArtworkUtils {
  const SoiPrepareArtworkUtils._();

  static const tableType = TableType.soiPrepareArtwork;

  static SoiPrepareArtworkDTOInclude get tableInSalesOrderInclude =>
      SoiPrepareArtworkDTO.include(
        artwork: ArtworkDTO.include(),
        salesOrderItem: SalesOrderItemDTO.include(),
      );

  static SoiPrepareArtworkDTOInclude get includeAll =>
      SoiPrepareArtworkDTO.include(
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
    return buildFilterExpression<SoiPrepareArtworkDTOTable,
        SoiPrepareArtworkField>(
      table: SoiPrepareArtworkDTOTable(),
      filter: filter,
      enumFromString: (String fieldKey) => SoiPrepareArtworkField.values
          .firstWhereOrNull((e) => e.name == fieldKey),
      getDbField: (table, field) => _dbFieldFromEnum(field)(table),
    );
  }

  static Column<dynamic> Function(SoiPrepareArtworkDTOTable) orderBy(
    SoiPrepareArtworkField? sortField,
  ) {
    if (sortField == null) {
      return (SoiPrepareArtworkDTOTable t) => t.salesOrderItem.description;
    }
    return _dbFieldFromEnum(sortField);
  }

  static SoiPrepareArtworkDTO initialSoiPrepareArtwork({
    required int artworkId,
    required int userId,
    required DateTime now,
    required int salesOrderId,
    required int soiCustomId,
    required int salesOrderItemId,
    required int artworkMasterId,
  }) {
    return SoiPrepareArtworkDTO(
      artworkMasterId: artworkMasterId,
      createdAt: now,
      createdById: userId,
      artworkId: artworkId,
      isDraft: false,
      salesOrderItemId: salesOrderItemId,
      eyeCStatus: '',
      difficultyLevel: '',
    );
  }

  static Column<dynamic> Function(SoiPrepareArtworkDTOTable) _dbFieldFromEnum(
    SoiPrepareArtworkField sortFieldEnum,
  ) {
    switch (sortFieldEnum) {
      case SoiPrepareArtworkField.assignedUser:
        return (SoiPrepareArtworkDTOTable t) => t.id;
      case SoiPrepareArtworkField.createdAt:
        return (SoiPrepareArtworkDTOTable t) => t.createdAt;
      case SoiPrepareArtworkField.salesOrderItemId:
        return (SoiPrepareArtworkDTOTable t) => t.salesOrderItem.id;
      case SoiPrepareArtworkField.artworkId:
        return (SoiPrepareArtworkDTOTable t) => t.artwork.id;
      case SoiPrepareArtworkField.createdBy:
        return (SoiPrepareArtworkDTOTable t) => t.createdById;
      case SoiPrepareArtworkField.lastModifiedBy:
        return (SoiPrepareArtworkDTOTable t) => t.lastModifiedById;
      case SoiPrepareArtworkField.deletedAt:
        return (SoiPrepareArtworkDTOTable t) => t.deletedAt;
      case SoiPrepareArtworkField.isDraft:
        return (SoiPrepareArtworkDTOTable t) => t.isDraft;
      case SoiPrepareArtworkField.lastModifiedAt:
        return (SoiPrepareArtworkDTOTable t) => t.lastModifiedAt;
      case SoiPrepareArtworkField.salesOrderId:
        return (SoiPrepareArtworkDTOTable t) => t.salesOrderItem.salesOrder.id;
      case SoiPrepareArtworkField.description:
        return (SoiPrepareArtworkDTOTable t) => t.salesOrderItem.description;
      case SoiPrepareArtworkField.billableTime:
        return (SoiPrepareArtworkDTOTable t) => t.salesOrderItem.billableTime;
    }
  }
}
