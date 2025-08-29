import 'package:collection/collection.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';

class ArtworkQuarantineGroupUtils {
  const ArtworkQuarantineGroupUtils._();

  static const tableType = TableType.artworkQuarantineGroup;

  static ArtworkQuarantineGroupDTOInclude get includeAll =>
      ArtworkQuarantineGroupDTO.include(
        artworkQuarantines: ArtworkQuarantineDTO.includeList(
          include: ArtworkQuarantineDTO.include(),
          where: (table) => table.deletedAt.equals(null),
          orderBy: (table) => table.id,
        ),
        customer: CustomerDTO.include(
          contact: ContactDTO.include(),
        ),
        assignedUser: LightUserDTO.include(),
      );

  /// Create initial Artwork Quarantine entity
  static ArtworkQuarantineGroupDTO initialArtworkQuarantineGroup({
    required int? customerId,
    required int userId,
    required DateTime now,
    required int assignedUserId,
  }) {
    return ArtworkQuarantineGroupDTO(
      customerId: customerId,
      status: ArtworkQuarantineGroupStatus.open.name,
      width: null,
      height: null,
      description: '',
      createdAt: now,
      createdById: userId,
      isDraft: true,
      assignedUserId: assignedUserId,
    );
  }

  /// Build filter expression for queries
  static Expression<dynamic>? buildExpression(Filter? filter) {
    return buildFilterExpression<ArtworkQuarantineGroupDTOTable,
        ArtworkQuarantineGroupField>(
      table: ArtworkQuarantineGroupDTOTable(),
      filter: filter,
      enumFromString: (String fieldKey) => ArtworkQuarantineGroupField.values
          .firstWhereOrNull((e) => e.name == fieldKey),
      getDbField: (table, field) => dbFieldFromEnum(field)(table),
    );
  }

  /// Get order by column function
  static Column<dynamic> Function(ArtworkQuarantineGroupDTOTable) orderBy(
    ArtworkQuarantineGroupField? sortByField,
  ) {
    if (sortByField == null) {
      return dbFieldFromEnum(ArtworkQuarantineGroupField.createdAt);
    }
    return dbFieldFromEnum(sortByField);
  }

  /// Map enum fields to database columns
  static Column<dynamic> Function(ArtworkQuarantineGroupDTOTable)
      dbFieldFromEnum(
    ArtworkQuarantineGroupField sortFieldEnum,
  ) {
    switch (sortFieldEnum) {
      case ArtworkQuarantineGroupField.id:
        return (ArtworkQuarantineGroupDTOTable t) => t.id;
      case ArtworkQuarantineGroupField.customer:
        return (ArtworkQuarantineGroupDTOTable t) => t.customerId;
      case ArtworkQuarantineGroupField.artworkType:
        return (ArtworkQuarantineGroupDTOTable t) => t.artworkType;
      case ArtworkQuarantineGroupField.productType:
        return (ArtworkQuarantineGroupDTOTable t) => t.productType;
      case ArtworkQuarantineGroupField.printProcessType:
        return (ArtworkQuarantineGroupDTOTable t) => t.printProcessType;
      case ArtworkQuarantineGroupField.width:
        return (ArtworkQuarantineGroupDTOTable t) => t.width;
      case ArtworkQuarantineGroupField.height:
        return (ArtworkQuarantineGroupDTOTable t) => t.height;
      case ArtworkQuarantineGroupField.cornerRadius:
        return (ArtworkQuarantineGroupDTOTable t) => t.cornerRadius;
      case ArtworkQuarantineGroupField.description:
        return (ArtworkQuarantineGroupDTOTable t) => t.description;
      case ArtworkQuarantineGroupField.assignedUser:
        return (ArtworkQuarantineGroupDTOTable t) => t.assignedUserId;
      case ArtworkQuarantineGroupField.sendToAeAt:
        return (ArtworkQuarantineGroupDTOTable t) => t.sendToAeAt;
      case ArtworkQuarantineGroupField.sendToAeBy:
        return (ArtworkQuarantineGroupDTOTable t) => t.sendToAeBy;
      case ArtworkQuarantineGroupField.artworkQuarantines:
        return (ArtworkQuarantineGroupDTOTable t) => t.id;

      case ArtworkQuarantineGroupField.type:
        return (ArtworkQuarantineGroupDTOTable t) => t.type;
      case ArtworkQuarantineGroupField.selectedProductSeriesId:
        return (ArtworkQuarantineGroupDTOTable t) => t.selectedProductSeriesId;
      case ArtworkQuarantineGroupField.outputPath:
        return (ArtworkQuarantineGroupDTOTable t) => t.outputPath;
      case ArtworkQuarantineGroupField.attachments:
        return (ArtworkQuarantineGroupDTOTable t) => t.attachments;
      case ArtworkQuarantineGroupField.status:
        return (ArtworkQuarantineGroupDTOTable t) => t.status;
      case ArtworkQuarantineGroupField.createdAt:
        return (ArtworkQuarantineGroupDTOTable t) => t.createdAt;
      case ArtworkQuarantineGroupField.createdBy:
        return (ArtworkQuarantineGroupDTOTable t) => t.createdById;
      case ArtworkQuarantineGroupField.lastModifiedAt:
        return (ArtworkQuarantineGroupDTOTable t) => t.lastModifiedAt;
      case ArtworkQuarantineGroupField.lastModifiedBy:
        return (ArtworkQuarantineGroupDTOTable t) => t.lastModifiedById;
      case ArtworkQuarantineGroupField.deletedAt:
        return (ArtworkQuarantineGroupDTOTable t) => t.deletedAt;
    }
  }
}
