import 'package:collection/collection.dart';
import 'package:elbdesk_server/src/expressions/core/filter_expression.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/entity_log/entity_log_endpoint.dart';
import 'package:serverpod/serverpod.dart';

/// Utils for {{#pascalCase}}{{feature_name}}{{/pascalCase}}
/// 
/// This class defines util methods for the {{#pascalCase}}{{feature_name}}{{/pascalCase}} entity.
/// 
/// It contains the logic for building expressions, ordering, and initializing 
/// entities.
/// 
class {{#pascalCase}}{{feature_name}}{{/pascalCase}}Utils {
  const {{#pascalCase}}{{feature_name}}{{/pascalCase}}Utils._();

  /// Table type
  static const tableType = TableType.{{#camelCase}}{{feature_name}}{{/camelCase}};

  /// Include all fields
  static {{#pascalCase}}{{feature_name}}{{/pascalCase}}DTOInclude get includeAll =>
      {{#pascalCase}}{{feature_name}}{{/pascalCase}}DTO.include();

  static Expression<dynamic>? buildExpression(Filter? filter) {
    final expression = buildFilterExpression<{{#pascalCase}}{{feature_name}}{{/pascalCase}}DTOTable,
        {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field>(
      table: {{#pascalCase}}{{feature_name}}{{/pascalCase}}DTOTable(),
      filter: filter,
      enumFromString: (String fieldKey) =>
          {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.values.firstWhereOrNull((e) => e.name == fieldKey),
      getDbField: (table, field) => dbFieldFromEnum(field)(table),
    );

    return expression;
  }

  /// Order by field
  static Column<dynamic> Function({{#pascalCase}}{{feature_name}}{{/pascalCase}}DTOTable) orderBy(
    {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field? sortField,
  ) {
    if (sortField == null) {
      return dbFieldFromEnum({{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.name);
    }
    return dbFieldFromEnum(sortField);
  }

  /// Get the database field from the enum
  static Column<dynamic> Function({{#pascalCase}}{{feature_name}}{{/pascalCase}}DTOTable) dbFieldFromEnum(
    {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field sortFieldEnum,
  ) {
    switch (sortFieldEnum) {
      case {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.id:
        return ({{#pascalCase}}{{feature_name}}{{/pascalCase}}DTOTable t) => t.id;
      case {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.name:
        return ({{#pascalCase}}{{feature_name}}{{/pascalCase}}DTOTable t) => t.name;
      case {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.description:
        return ({{#pascalCase}}{{feature_name}}{{/pascalCase}}DTOTable t) => t.description;
      case {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.createdAt:
        return ({{#pascalCase}}{{feature_name}}{{/pascalCase}}DTOTable t) => t.createdAt;
      case {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.createdBy:
        return ({{#pascalCase}}{{feature_name}}{{/pascalCase}}DTOTable t) => t.createdById;
      case {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.lastModifiedAt:
        return ({{#pascalCase}}{{feature_name}}{{/pascalCase}}DTOTable t) => t.lastModifiedAt;
      case {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.lastModifiedBy:
        return ({{#pascalCase}}{{feature_name}}{{/pascalCase}}DTOTable t) => t.lastModifiedById;
      case {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.isDraft:
        return ({{#pascalCase}}{{feature_name}}{{/pascalCase}}DTOTable t) => t.isDraft;
      case {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.deletedAt:
        return ({{#pascalCase}}{{feature_name}}{{/pascalCase}}DTOTable t) => t.deletedAt;
    }
  }

  /// Initializes a new empty {{#pascalCase}}{{feature_name}}{{/pascalCase}} entity
  static {{#pascalCase}}{{feature_name}}{{/pascalCase}}DTO initial{{#pascalCase}}{{feature_name}}{{/pascalCase}}({
    required int userId,
    required String sessionId,
    required DateTime now,
  }) {
    return {{#pascalCase}}{{feature_name}}{{/pascalCase}}DTO(
      name: '',
      description: '',
      createdAt: now,
      createdById: userId,
      isDraft: true,
    );
  }

  /// Get the log fields for the {{#pascalCase}}{{feature_name}}{{/pascalCase}} entity
  static List<LogField<{{#pascalCase}}{{feature_name}}{{/pascalCase}}DTO>> getLogFields() {
    return {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.values
        .map((field) {
          switch (field) {
            case {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.id:
              return LogField<{{#pascalCase}}{{feature_name}}{{/pascalCase}}DTO>(
                fieldName: field.name,
                getValue: (entity) => entity.id?.toString() ?? '',
              );
            case {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.name:
              return LogField<{{#pascalCase}}{{feature_name}}{{/pascalCase}}DTO>(
                fieldName: field.name,
                getValue: (entity) => entity.name,
              );
            case {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.description:
              return LogField<{{#pascalCase}}{{feature_name}}{{/pascalCase}}DTO>(
                fieldName: field.name,
                getValue: (entity) => entity.description ?? '',
              );
            case {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.createdAt:
            case {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.createdBy:
            case {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.lastModifiedAt:
            case {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.lastModifiedBy:
            case {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.isDraft:
            case {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.deletedAt:
              return null;
          }
        })
        .whereType<LogField<{{#pascalCase}}{{feature_name}}{{/pascalCase}}DTO>>()
        .toList();
  }
} 
