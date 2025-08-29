import 'package:collection/collection.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/entity_log/entity_log_endpoint.dart';
import 'package:serverpod/serverpod.dart';

class LanguageCodeUtils {
  static const tableType = TableType.languageCode;

  static Expression<dynamic>? buildExpression(
    Filter? filter,
  ) {
    return buildFilterExpression<LanguageCodeDTOTable, LanguageCodeField>(
      table: LanguageCodeDTOTable(),
      filter: filter,
      enumFromString: (String fieldKey) =>
          LanguageCodeField.values.firstWhereOrNull((e) => e.name == fieldKey),
      getDbField: (table, field) => dbFieldFromEnum(field)(table),
    );
  }

  static Column<dynamic> Function(LanguageCodeDTOTable) orderBy(
    LanguageCodeField? sortField,
  ) {
    if (sortField == null) {
      return dbFieldFromEnum(LanguageCodeField.code);
    }
    return dbFieldFromEnum(sortField);
  }

  static Column<dynamic> Function(LanguageCodeDTOTable) dbFieldFromEnum(
    LanguageCodeField sortFieldEnum,
  ) {
    switch (sortFieldEnum) {
      case LanguageCodeField.isPrimary:
        return (LanguageCodeDTOTable t) => t.isPrimary;
      case LanguageCodeField.code:
        return (LanguageCodeDTOTable t) => t.code;
      case LanguageCodeField.id:
        return (LanguageCodeDTOTable t) => t.id;
      case LanguageCodeField.languageName:
        return (LanguageCodeDTOTable t) => t.languageName;
      case LanguageCodeField.createdAt:
        return (LanguageCodeDTOTable t) => t.createdAt;
      case LanguageCodeField.createdBy:
        return (LanguageCodeDTOTable t) => t.createdById;
      case LanguageCodeField.lastModifiedAt:
        return (LanguageCodeDTOTable t) => t.lastModifiedAt;
      case LanguageCodeField.lastModifiedBy:
        return (LanguageCodeDTOTable t) => t.lastModifiedById;
      case LanguageCodeField.deletedAt:
        return (LanguageCodeDTOTable t) => t.deletedAt;
      case LanguageCodeField.isDraft:
        return (LanguageCodeDTOTable t) => t.isDraft;
    }
  }

  static List<LogField<LanguageCodeDTO>> getLogFields() {
    return LanguageCodeField.values
        .map((field) {
          switch (field) {
            case LanguageCodeField.languageName:
              return LogField<LanguageCodeDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.languageName,
              );
            case LanguageCodeField.isPrimary:
              return LogField<LanguageCodeDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.isPrimary,
              );
            case LanguageCodeField.code:
              return LogField<LanguageCodeDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.code,
              );
            case LanguageCodeField.createdAt:
              return LogField<LanguageCodeDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.createdAt,
              );
            case LanguageCodeField.createdBy:
              return LogField<LanguageCodeDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.createdById,
              );
            case LanguageCodeField.lastModifiedAt:
              return LogField<LanguageCodeDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.lastModifiedAt,
              );
            case LanguageCodeField.lastModifiedBy:
              return LogField<LanguageCodeDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.lastModifiedById,
              );

            case LanguageCodeField.id:
            case LanguageCodeField.deletedAt:
            case LanguageCodeField.isDraft:
              return null;
          }
        })
        .whereType<LogField<LanguageCodeDTO>>()
        .toList();
  }

  static LanguageCodeDTO initialLanguageCode({
    required int userId,
    required String sessionId,
    required LanguageCodeDTO entity,
    required bool release,
    required DateTime now,
  }) {
    return LanguageCodeDTO(
      isPrimary: entity.isPrimary,
      code: entity.code,
      languageName: entity.languageName,
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
