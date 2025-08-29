import 'package:collection/collection.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';

class ArtworkTemplateSelectionUtils {
  const ArtworkTemplateSelectionUtils._();

  static const tableType = TableType.artworkTemplateSelection;

  static ArtworkTemplateSelectionDTO initialDto({
    required int userId,
    required String sessionId,
    required ArtworkTemplateSelectionDTO entity,
    required bool release,
    required DateTime now,
  }) {
    return ArtworkTemplateSelectionDTO(
      description: entity.description,
      createdAt: now,
      artworkTemplatePreSelectionId: entity.artworkTemplatePreSelectionId,
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

  static Expression<dynamic>? buildExpression(Filter? filter) {
    return buildFilterExpression<ArtworkTemplateSelectionDTOTable,
        ArtworkTemplateSelectionField>(
      table: ArtworkTemplateSelectionDTOTable(),
      filter: filter,
      enumFromString: (String fieldKey) =>
          ArtworkTemplateSelectionField.values.firstWhereOrNull(
        (e) => e.name == fieldKey,
      ),
      getDbField: (table, field) => dbFieldFromEnum(field)(table),
    );
  }

  static Column<dynamic> Function(ArtworkTemplateSelectionDTOTable) orderBy(
    ArtworkTemplateSelectionField? sortByField,
  ) {
    if (sortByField == null) {
      return (ArtworkTemplateSelectionDTOTable t) => t.description;
    }
    return dbFieldFromEnum(sortByField);
  }

  static Column<dynamic> Function(ArtworkTemplateSelectionDTOTable)
      dbFieldFromEnum(
    ArtworkTemplateSelectionField sortFieldEnum,
  ) {
    switch (sortFieldEnum) {
      case ArtworkTemplateSelectionField.description:
        return (ArtworkTemplateSelectionDTOTable t) => t.description;
      case ArtworkTemplateSelectionField.artworkTemplatePreSelectionId:
        return (ArtworkTemplateSelectionDTOTable t) =>
            t.artworkTemplatePreSelectionId;
      case ArtworkTemplateSelectionField.id:
        return (ArtworkTemplateSelectionDTOTable t) => t.id;
      case ArtworkTemplateSelectionField.createdAt:
        return (ArtworkTemplateSelectionDTOTable t) => t.createdAt;
      case ArtworkTemplateSelectionField.createdBy:
        return (ArtworkTemplateSelectionDTOTable t) => t.createdById;
      case ArtworkTemplateSelectionField.lastModifiedAt:
        return (ArtworkTemplateSelectionDTOTable t) => t.lastModifiedAt;
      case ArtworkTemplateSelectionField.lastModifiedBy:
        return (ArtworkTemplateSelectionDTOTable t) => t.lastModifiedById;
      case ArtworkTemplateSelectionField.deletedAt:
        return (ArtworkTemplateSelectionDTOTable t) => t.deletedAt;
      case ArtworkTemplateSelectionField.isDraft:
        return (ArtworkTemplateSelectionDTOTable t) => t.isDraft;
    }
  }
}
