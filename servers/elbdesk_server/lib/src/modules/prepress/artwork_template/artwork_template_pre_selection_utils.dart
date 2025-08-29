import 'package:collection/collection.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';

class ArtworkTemplatePreSelectionUtils {
  const ArtworkTemplatePreSelectionUtils._();

  static const tableType = TableType.artworkTemplatePreSelection;

  static ArtworkTemplatePreSelectionDTO initialPreSelection({
    required int userId,
    required String sessionId,
    required ArtworkTemplatePreSelectionDTO entity,
    required bool release,
    required DateTime now,
  }) {
    return ArtworkTemplatePreSelectionDTO(
      description: entity.description,
      createdAt: now,
      customerId: entity.customerId,
      isDraft: false,
      createdById: userId,
      editingSince: null,
      editingById: null,
      deletedAt: null,
      deletedById: null,
      lastModifiedAt: null,
      lastModifiedById: null,
      editingSession: release ? null : sessionId,
    );
  }

  static Column<dynamic> Function(ArtworkTemplatePreSelectionDTOTable)
      preSelectionOrderBy(
    ArtworkTemplatePreSelectionField? sortByField,
  ) {
    if (sortByField == null) {
      return (ArtworkTemplatePreSelectionDTOTable t) => t.description;
    }
    return dbFieldFromEnum(sortByField);
  }

  static Expression<dynamic>? buildExpression(Filter? filter) {
    return buildFilterExpression<ArtworkTemplatePreSelectionDTOTable,
        ArtworkTemplatePreSelectionField>(
      table: ArtworkTemplatePreSelectionDTOTable(),
      filter: filter,
      enumFromString: (String fieldKey) => ArtworkTemplatePreSelectionField
          .values
          .firstWhereOrNull((e) => e.name == fieldKey),
      getDbField: (table, field) => dbFieldFromEnum(field)(table),
    );
  }

  static Column<dynamic> Function(ArtworkTemplatePreSelectionDTOTable)
      dbFieldFromEnum(
    ArtworkTemplatePreSelectionField sortFieldEnum,
  ) {
    switch (sortFieldEnum) {
      case ArtworkTemplatePreSelectionField.description:
        return (ArtworkTemplatePreSelectionDTOTable t) => t.description;
      case ArtworkTemplatePreSelectionField.customer:
        return (ArtworkTemplatePreSelectionDTOTable t) => t.customerId;
      case ArtworkTemplatePreSelectionField.id:
        return (ArtworkTemplatePreSelectionDTOTable t) => t.id;
      case ArtworkTemplatePreSelectionField.createdAt:
        return (ArtworkTemplatePreSelectionDTOTable t) => t.createdAt;
      case ArtworkTemplatePreSelectionField.createdBy:
        return (ArtworkTemplatePreSelectionDTOTable t) => t.createdById;
      case ArtworkTemplatePreSelectionField.lastModifiedAt:
        return (ArtworkTemplatePreSelectionDTOTable t) => t.lastModifiedAt;
      case ArtworkTemplatePreSelectionField.lastModifiedBy:
        return (ArtworkTemplatePreSelectionDTOTable t) => t.lastModifiedById;
      case ArtworkTemplatePreSelectionField.deletedAt:
        return (ArtworkTemplatePreSelectionDTOTable t) => t.deletedAt;
      case ArtworkTemplatePreSelectionField.isDraft:
        return (ArtworkTemplatePreSelectionDTOTable t) => t.isDraft;
    }
  }
}
