import 'package:collection/collection.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';

class DrucklayoutPreSelectionUtils {
  const DrucklayoutPreSelectionUtils._();

  static const tableType = TableType.drucklayoutPreSelection;

  static DrucklayoutPreSelectionDTO initialPreSelection({
    required int userId,
    required String sessionId,
    required DrucklayoutPreSelectionDTO entity,
    required bool release,
    required DateTime now,
  }) {
    return DrucklayoutPreSelectionDTO(
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

  static Column<dynamic> Function(DrucklayoutPreSelectionDTOTable)
      preSelectionOrderBy(
    DrucklayoutPreSelectionField? sortByField,
  ) {
    if (sortByField == null) {
      return (DrucklayoutPreSelectionDTOTable t) => t.description;
    }
    return dbFieldFromEnum(sortByField);
  }

  static Expression<dynamic>? buildExpression(Filter? filter) {
    return buildFilterExpression<DrucklayoutPreSelectionDTOTable,
        DrucklayoutPreSelectionField>(
      table: DrucklayoutPreSelectionDTOTable(),
      filter: filter,
      enumFromString: (String fieldKey) => DrucklayoutPreSelectionField.values
          .firstWhereOrNull((e) => e.name == fieldKey),
      getDbField: (table, field) => dbFieldFromEnum(field)(table),
    );
  }

  static Column<dynamic> Function(DrucklayoutPreSelectionDTOTable)
      dbFieldFromEnum(
    DrucklayoutPreSelectionField sortFieldEnum,
  ) {
    switch (sortFieldEnum) {
      case DrucklayoutPreSelectionField.description:
        return (DrucklayoutPreSelectionDTOTable t) => t.description;
      case DrucklayoutPreSelectionField.customer:
        return (DrucklayoutPreSelectionDTOTable t) => t.customerId;
      case DrucklayoutPreSelectionField.id:
        return (DrucklayoutPreSelectionDTOTable t) => t.id;
      case DrucklayoutPreSelectionField.createdAt:
        return (DrucklayoutPreSelectionDTOTable t) => t.createdAt;
      case DrucklayoutPreSelectionField.createdBy:
        return (DrucklayoutPreSelectionDTOTable t) => t.createdById;
      case DrucklayoutPreSelectionField.lastModifiedAt:
        return (DrucklayoutPreSelectionDTOTable t) => t.lastModifiedAt;
      case DrucklayoutPreSelectionField.lastModifiedBy:
        return (DrucklayoutPreSelectionDTOTable t) => t.lastModifiedById;
      case DrucklayoutPreSelectionField.deletedAt:
        return (DrucklayoutPreSelectionDTOTable t) => t.deletedAt;
      case DrucklayoutPreSelectionField.isDraft:
        return (DrucklayoutPreSelectionDTOTable t) => t.isDraft;
    }
  }
}
