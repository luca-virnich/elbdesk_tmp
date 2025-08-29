import 'package:collection/collection.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class ArtworkQuarantineUtils {
  const ArtworkQuarantineUtils._();

  static const tableType = TableType.artworkQuarantine;

  static Expression<dynamic>? buildExpression(Filter? filter) {
    return buildFilterExpression<ArtworkQuarantineDTOTable,
        ArtworkQuarantineField>(
      table: ArtworkQuarantineDTOTable(),
      filter: filter,
      enumFromString: (String fieldKey) => ArtworkQuarantineField.values
          .firstWhereOrNull((e) => e.name == fieldKey),
      getDbField: (table, field) => dbFieldFromEnum(field)(table),
    );
  }

  /// Create initial Artwork Quarantine entity
  // static ArtworkQuarantineDTO initialArtworkQuarantine({
  //   required int customerId,
  //   required int userId,
  //   required String description,
  //   required int groupId,
  //   required DateTime now,
  // }) {
  //   return ArtworkQuarantineDTO(
  //     artworkId: null,
  //     quarantineUuid: '',
  //     groupId: groupId,
  //     status: ArtworkQuarantineGroupStatus.open.name,
  //     customerId: customerId,
  //     description: description,
  //     createdAt: now,
  //     createdById: userId,
  //     colors: [],
  //     isDraft: false,
  //     width: null,
  //     height: null,
  //     cornerRadius: null,
  //   );
  // }

  static ArtworkQuarantineDTOInclude get includeAll =>
      ArtworkQuarantineDTO.include(
        customer: CustomerDTO.include(
          contact: ContactDTO.include(),
        ),
        group: ArtworkQuarantineGroupDTO.include(),
      );

  static Column<dynamic> Function(ArtworkQuarantineDTOTable) orderBy(
    ArtworkQuarantineField? sortByField,
  ) {
    if (sortByField == null) {
      return dbFieldFromEnum(ArtworkQuarantineField.createdAt);
    }
    return dbFieldFromEnum(sortByField);
  }

  static Column<dynamic> Function(ArtworkQuarantineDTOTable) dbFieldFromEnum(
    ArtworkQuarantineField sortFieldEnum,
  ) {
    switch (sortFieldEnum) {
      case ArtworkQuarantineField.id:
        return (ArtworkQuarantineDTOTable t) => t.id;

      case ArtworkQuarantineField.description:
        return (ArtworkQuarantineDTOTable t) => t.description;
      case ArtworkQuarantineField.customer:
        return (ArtworkQuarantineDTOTable t) => t.customer.contact.fullName;
      case ArtworkQuarantineField.customerId:
        return (ArtworkQuarantineDTOTable t) => t.customerId;
      case ArtworkQuarantineField.createdAt:
        return (ArtworkQuarantineDTOTable t) => t.createdAt;
      case ArtworkQuarantineField.createdBy:
        return (ArtworkQuarantineDTOTable t) => t.createdById;
      case ArtworkQuarantineField.lastModifiedAt:
        return (ArtworkQuarantineDTOTable t) => t.lastModifiedAt;
      case ArtworkQuarantineField.lastModifiedBy:
        return (ArtworkQuarantineDTOTable t) => t.lastModifiedById;
      case ArtworkQuarantineField.deletedAt:
        return (ArtworkQuarantineDTOTable t) => t.deletedAt;
      case ArtworkQuarantineField.isDraft:
        return (ArtworkQuarantineDTOTable t) => t.isDraft;
      case ArtworkQuarantineField.artwork:
        return (ArtworkQuarantineDTOTable t) => t.artworkId;
      case ArtworkQuarantineField.createProductPart:
        return (ArtworkQuarantineDTOTable t) => t.id;
      case ArtworkQuarantineField.createProduct:
        return (ArtworkQuarantineDTOTable t) => t.id;
      case ArtworkQuarantineField.deleteArtworkQuarantine:
        return (ArtworkQuarantineDTOTable t) => t.id;
      case ArtworkQuarantineField.width:
        return (ArtworkQuarantineDTOTable t) => t.width;
      case ArtworkQuarantineField.height:
        return (ArtworkQuarantineDTOTable t) => t.height;
      case ArtworkQuarantineField.status:
        return (ArtworkQuarantineDTOTable t) => t.status;
      case ArtworkQuarantineField.keywords:
        return (ArtworkQuarantineDTOTable t) => t.keywords;
      case ArtworkQuarantineField.colors:
        return (ArtworkQuarantineDTOTable t) => t.colors;
      case ArtworkQuarantineField.groupStatus:
        return (ArtworkQuarantineDTOTable t) => t.group.status;
      case ArtworkQuarantineField.cornerRadius:
        return (ArtworkQuarantineDTOTable t) => t.cornerRadius;
      case ArtworkQuarantineField.productSeriesId:
        return (ArtworkQuarantineDTOTable t) => t.id;
      case ArtworkQuarantineField.printProcessType:
        return (ArtworkQuarantineDTOTable t) => t.printProcessType;
      case ArtworkQuarantineField.productType:
        return (ArtworkQuarantineDTOTable t) => t.productType;
      case ArtworkQuarantineField.artworkType:
        return (ArtworkQuarantineDTOTable t) => t.type;
    }
  }
}
