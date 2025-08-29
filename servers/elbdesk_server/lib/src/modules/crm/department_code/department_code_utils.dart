import 'package:collection/collection.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class DepartmentCodeUtils {
  const DepartmentCodeUtils._();

  static const tableType = TableType.departmentCode;

  static Expression<dynamic>? buildExpression(
    Filter? filter,
  ) {
    final expression =
        buildFilterExpression<DepartmentCodeDTOTable, DepartmentCodeField>(
      table: DepartmentCodeDTOTable(),
      filter: filter,
      enumFromString: (String fieldKey) => DepartmentCodeField.values
          .firstWhereOrNull((e) => e.name == fieldKey),
      getDbField: (table, field) => dbFieldFromEnum(field)(table),
    );

    return expression;
  }

  // order By
  static Column<dynamic> Function(DepartmentCodeDTOTable) orderBy(
    DepartmentCodeField? sortField,
  ) {
    if (sortField == null) {
      return dbFieldFromEnum(DepartmentCodeField.code);
    }
    return dbFieldFromEnum(sortField);
  }

  static Column<dynamic> Function(DepartmentCodeDTOTable) dbFieldFromEnum(
    DepartmentCodeField sortFieldEnum,
  ) {
    switch (sortFieldEnum) {
      case DepartmentCodeField.code:
        return (DepartmentCodeDTOTable t) => t.code;
      case DepartmentCodeField.id:
        return (DepartmentCodeDTOTable t) => t.id;

      case DepartmentCodeField.description:
        return (DepartmentCodeDTOTable t) => t.description;
      case DepartmentCodeField.createdAt:
        return (DepartmentCodeDTOTable t) => t.createdAt;
      case DepartmentCodeField.createdBy:
        return (DepartmentCodeDTOTable t) => t.createdById;
      case DepartmentCodeField.lastModifiedAt:
        return (DepartmentCodeDTOTable t) => t.lastModifiedAt;
      case DepartmentCodeField.lastModifiedBy:
        return (DepartmentCodeDTOTable t) => t.lastModifiedById;
      case DepartmentCodeField.deletedAt:
        return (DepartmentCodeDTOTable t) => t.deletedAt;
      case DepartmentCodeField.isDraft:
        return (DepartmentCodeDTOTable t) => t.isDraft;
    }
  }

  static DepartmentCodeDTO initialDepartmentCode({
    required int userId,
    required String sessionId,
    required DepartmentCodeDTO entity,
    required bool release,
    required DateTime now,
  }) {
    return DepartmentCodeDTO(
      code: entity.code,
      description: entity.description,
      createdAt: now,
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
}
