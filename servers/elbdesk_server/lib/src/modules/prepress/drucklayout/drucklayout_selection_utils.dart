import 'package:collection/collection.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';

class DrucklayoutSelectionUtils {
  const DrucklayoutSelectionUtils._();

  static const tableType = TableType.drucklayoutSelection;

  static DrucklayoutSelectionDTO initialDto({
    required int userId,
    required String sessionId,
    required DrucklayoutSelectionDTO entity,
    required bool release,
    required DateTime now,
  }) {
    return DrucklayoutSelectionDTO(
      description: entity.description,
      createdAt: now,
      drucklayoutPreSelectionId: entity.drucklayoutPreSelectionId,
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
    return buildFilterExpression<DrucklayoutSelectionDTOTable,
        DrucklayoutSelectionField>(
      table: DrucklayoutSelectionDTOTable(),
      filter: filter,
      enumFromString: (String fieldKey) =>
          DrucklayoutSelectionField.values.firstWhereOrNull(
        (e) => e.name == fieldKey,
      ),
      getDbField: (table, field) => dbFieldFromEnum(field)(table),
    );
  }

  static Column<dynamic> Function(DrucklayoutSelectionDTOTable) orderBy(
    DrucklayoutSelectionField? sortByField,
  ) {
    if (sortByField == null) {
      return (DrucklayoutSelectionDTOTable t) => t.description;
    }
    return dbFieldFromEnum(sortByField);
  }

  static Column<dynamic> Function(DrucklayoutSelectionDTOTable) dbFieldFromEnum(
    DrucklayoutSelectionField sortFieldEnum,
  ) {
    switch (sortFieldEnum) {
      case DrucklayoutSelectionField.description:
        return (DrucklayoutSelectionDTOTable t) => t.description;
      case DrucklayoutSelectionField.drucklayoutPreSelectionId:
        return (DrucklayoutSelectionDTOTable t) => t.drucklayoutPreSelectionId;
      case DrucklayoutSelectionField.id:
        return (DrucklayoutSelectionDTOTable t) => t.id;
      case DrucklayoutSelectionField.createdAt:
        return (DrucklayoutSelectionDTOTable t) => t.createdAt;
      case DrucklayoutSelectionField.createdBy:
        return (DrucklayoutSelectionDTOTable t) => t.createdById;
      case DrucklayoutSelectionField.lastModifiedAt:
        return (DrucklayoutSelectionDTOTable t) => t.lastModifiedAt;
      case DrucklayoutSelectionField.lastModifiedBy:
        return (DrucklayoutSelectionDTOTable t) => t.lastModifiedById;
      case DrucklayoutSelectionField.deletedAt:
        return (DrucklayoutSelectionDTOTable t) => t.deletedAt;
      case DrucklayoutSelectionField.isDraft:
        return (DrucklayoutSelectionDTOTable t) => t.isDraft;
    }
  }
}
