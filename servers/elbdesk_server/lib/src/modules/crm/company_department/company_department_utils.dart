import 'package:collection/collection.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/entity_log/entity_log_endpoint.dart';
import 'package:serverpod/serverpod.dart';

/// Utils for CompanyDepartment
///
/// This class defines util methods for the CompanyDepartment entity.
///
/// It contains the logic for building expressions, ordering, and initializing
/// entities.
///
class CompanyDepartmentUtils {
  const CompanyDepartmentUtils._();

  /// Table type
  static const tableType = TableType.companyDepartment;

  /// Include all fields
  static CompanyDepartmentDTOInclude get includeAll =>
      CompanyDepartmentDTO.include(
        company: ContactDTO.include(),
        employees: CompanyEmployeeDepartmentJT.includeList(
          include: CompanyEmployeeDepartmentJT.include(
            companyEmployee: CompanyEmployeeDTO.include(
              company: ContactDTO.include(),
              employee: ContactDTO.include(),
            ),
          ),
        ),
      );

  static Expression<dynamic>? buildExpression(Filter? filter) {
    final expression = buildFilterExpression<CompanyDepartmentDTOTable,
        CompanyDepartmentField>(
      table: CompanyDepartmentDTOTable(),
      filter: filter,
      enumFromString: (String fieldKey) => CompanyDepartmentField.values
          .firstWhereOrNull((e) => e.name == fieldKey),
      getDbField: (table, field) => dbFieldFromEnum(field)(table),
    );

    return expression;
  }

  /// Order by field
  static Column<dynamic> Function(CompanyDepartmentDTOTable) orderBy(
    CompanyDepartmentField? sortField,
  ) {
    if (sortField == null) {
      return dbFieldFromEnum(CompanyDepartmentField.name);
    }
    return dbFieldFromEnum(sortField);
  }

  /// Get the database field from the enum
  static Column<dynamic> Function(CompanyDepartmentDTOTable) dbFieldFromEnum(
    CompanyDepartmentField sortFieldEnum,
  ) {
    switch (sortFieldEnum) {
      case CompanyDepartmentField.id:
        return (CompanyDepartmentDTOTable t) => t.id;
      case CompanyDepartmentField.name:
        return (CompanyDepartmentDTOTable t) => t.name;
      case CompanyDepartmentField.description:
        return (CompanyDepartmentDTOTable t) => t.description;
      case CompanyDepartmentField.createdAt:
        return (CompanyDepartmentDTOTable t) => t.createdAt;
      case CompanyDepartmentField.createdBy:
        return (CompanyDepartmentDTOTable t) => t.createdById;
      case CompanyDepartmentField.lastModifiedAt:
        return (CompanyDepartmentDTOTable t) => t.lastModifiedAt;
      case CompanyDepartmentField.lastModifiedBy:
        return (CompanyDepartmentDTOTable t) => t.lastModifiedById;
      case CompanyDepartmentField.isDraft:
        return (CompanyDepartmentDTOTable t) => t.isDraft;
      case CompanyDepartmentField.deletedAt:
        return (CompanyDepartmentDTOTable t) => t.deletedAt;
    }
  }

  /// Initializes a new empty CompanyDepartment entity
  static CompanyDepartmentDTO initialCompanyDepartment({
    required int userId,
    required DateTime now,
    required int companyId,
  }) {
    return CompanyDepartmentDTO(
      name: null,
      description: null,
      createdAt: now,
      createdById: userId,
      companyId: companyId,
      isDraft: true,
    );
  }

  /// Get the log fields for the CompanyDepartment entity
  static List<LogField<CompanyDepartmentDTO>> getLogFields() {
    return CompanyDepartmentField.values
        .map((field) {
          switch (field) {
            case CompanyDepartmentField.id:
              return LogField<CompanyDepartmentDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.id?.toString() ?? '',
              );
            case CompanyDepartmentField.name:
              return LogField<CompanyDepartmentDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.name,
              );
            case CompanyDepartmentField.description:
              return LogField<CompanyDepartmentDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.description ?? '',
              );
            case CompanyDepartmentField.createdAt:
            case CompanyDepartmentField.createdBy:
            case CompanyDepartmentField.lastModifiedAt:
            case CompanyDepartmentField.lastModifiedBy:
            case CompanyDepartmentField.isDraft:
            case CompanyDepartmentField.deletedAt:
              return null;
          }
        })
        .whereType<LogField<CompanyDepartmentDTO>>()
        .toList();
  }
}
