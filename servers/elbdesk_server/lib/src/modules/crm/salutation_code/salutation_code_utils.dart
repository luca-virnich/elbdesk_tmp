import 'package:collection/collection.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class SalutationCodeUtils {
  static const tableType = TableType.salutationCode;

  static Expression<dynamic>? buildExpression(
    Filter? filter,
  ) {
    return buildFilterExpression<SalutationCodeDTOTable, SalutationCodeField>(
      table: SalutationCodeDTOTable(),
      filter: filter,
      enumFromString: (String fieldKey) => SalutationCodeField.values
          .firstWhereOrNull((e) => e.name == fieldKey),
      getDbField: (table, field) => dbFieldFromEnum(field)(table),
    );
  }

  static Column<dynamic> Function(SalutationCodeDTOTable) orderBy(
    SalutationCodeField? sortField,
  ) {
    if (sortField == null) {
      return dbFieldFromEnum(SalutationCodeField.code);
    }
    return dbFieldFromEnum(sortField);
  }

  static Column<dynamic> Function(SalutationCodeDTOTable) dbFieldFromEnum(
    SalutationCodeField sortFieldEnum,
  ) {
    switch (sortFieldEnum) {
      case SalutationCodeField.isPrimaryPerson:
        return (SalutationCodeDTOTable t) => t.isPrimaryPerson;
      case SalutationCodeField.isPrimaryCompany:
        return (SalutationCodeDTOTable t) => t.isPrimaryCompany;
      case SalutationCodeField.code:
        return (SalutationCodeDTOTable t) => t.code;
      case SalutationCodeField.id:
        return (SalutationCodeDTOTable t) => t.id;
      case SalutationCodeField.deletedAt:
        return (SalutationCodeDTOTable t) => t.deletedAt;
      case SalutationCodeField.isDraft:
        return (SalutationCodeDTOTable t) => t.isDraft;
      case SalutationCodeField.description:
        return (SalutationCodeDTOTable t) => t.description;
      case SalutationCodeField.createdAt:
        return (SalutationCodeDTOTable t) => t.createdAt;
      case SalutationCodeField.createdBy:
        return (SalutationCodeDTOTable t) => t.createdById;
      case SalutationCodeField.lastModifiedAt:
        return (SalutationCodeDTOTable t) => t.lastModifiedAt;
      case SalutationCodeField.lastModifiedBy:
        return (SalutationCodeDTOTable t) => t.lastModifiedById;
    }
  }

  static SalutationCodeDTO initialSalutationCode({
    required int userId,
    required String sessionId,
    required SalutationCodeDTO entity,
    required bool release,
    required DateTime now,
  }) {
    return SalutationCodeDTO(
      code: entity.code,
      description: entity.description,
      isPrimaryPerson: entity.isPrimaryPerson,
      isPrimaryCompany: entity.isPrimaryCompany,
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
