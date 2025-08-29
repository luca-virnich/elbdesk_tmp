import 'package:collection/collection.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/entity_log/entity_log_endpoint.dart';
import 'package:serverpod/serverpod.dart';

class CompanyEmployeeUtils {
  const CompanyEmployeeUtils._();

  static const tableType = TableType.companyEmployee;

  // Cache for db field functions
  static final Map<CompanyEmployeeField,
      Column<dynamic> Function(CompanyEmployeeDTOTable)> _dbFieldCache = {};

  static CompanyEmployeeDTOInclude get includeAll => CompanyEmployeeDTO.include(
        company: ContactDTO.include(
          customer: CustomerDTO.include(),
          languageCode: LanguageCodeDTO.include(),
          countryCode: CountryCodeDTO.include(),
        ),
        employee: ContactDTO.include(
          languageCode: LanguageCodeDTO.include(),
          countryCode: CountryCodeDTO.include(),
        ),
        departments: CompanyEmployeeDepartmentJT.includeList(
          include: CompanyEmployeeDepartmentJT.include(
            companyDepartment: CompanyDepartmentDTO.include(),
          ),
        ),
      );

  static Expression<dynamic>? buildExpressionForEmployees(Filter? filter) {
    final transformedFilter = _transformedIdOrNameFilterForEmployees(filter);

    final expression =
        buildFilterExpression<CompanyEmployeeDTOTable, CompanyEmployeeField>(
      table: CompanyEmployeeDTOTable(),
      filter: transformedFilter,
      enumFromString: (String fieldKey) => CompanyEmployeeField.values
          .firstWhereOrNull((e) => e.name == fieldKey),
      getDbField: (table, field) => dbFieldFromEnum(field)(table),
    );

    return expression;
  }

  static Expression<dynamic>? buildExpressionForCompanies(Filter? filter) {
    final transformedFilter = _transformedIdOrNameFilterForCompanies(filter);

    final expression =
        buildFilterExpression<CompanyEmployeeDTOTable, CompanyEmployeeField>(
      table: CompanyEmployeeDTOTable(),
      filter: transformedFilter,
      enumFromString: (String fieldKey) => CompanyEmployeeField.values
          .firstWhereOrNull((e) => e.name == fieldKey),
      getDbField: (table, field) => dbFieldFromEnum(field)(table),
    );

    return expression;
  }

  static Column<dynamic> Function(CompanyEmployeeDTOTable) orderByEmployees(
    CompanyEmployeeField? sortField,
  ) {
    if (sortField == null) {
      return dbFieldFromEnum(
        CompanyEmployeeField.employeeContactFullName,
      );
    }
    return dbFieldFromEnum(sortField);
  }

  static Column<dynamic> Function(CompanyEmployeeDTOTable) orderByCompanies(
    CompanyEmployeeField? sortField,
  ) {
    if (sortField == null) {
      return dbFieldFromEnum(
        CompanyEmployeeField.companyContactFullName,
      );
    }
    return dbFieldFromEnum(sortField);
  }

  static Filter _transformedIdOrNameFilterForEmployees(Filter? filter) {
    return Filter(
      filterGroups: filter?.filterGroups.map((group) {
            return FilterGroup(
              filters: group.filters.map((field) {
                if (field.fieldKey ==
                    CompanyEmployeeField
                        .filterByEmployeeContactIdOrFullName.name) {
                  final value = field.value;
                  if (RegExp(r'^\d+$').hasMatch(value)) {
                    return FilterField(
                      fieldKey:
                          CompanyEmployeeField.employeeContactCustomId.name,
                      filterOperator: field.filterOperator,
                      type: FilterType.equal,
                      value: value,
                      uuid: const Uuid().v4(),
                      fieldType: FilterFieldType.number,
                    );
                  } else if (RegExp('^[Kk]-').hasMatch(value) &&
                      value.length > 2) {
                    final parts = value.split('-');
                    final customIdPart = parts.length > 1 ? parts[1] : '';
                    final customIdNumber = int.tryParse(customIdPart);

                    if (customIdNumber != null) {
                      return FilterField(
                        fieldKey:
                            CompanyEmployeeField.employeeContactCustomId.name,
                        filterOperator: field.filterOperator,
                        type: FilterType.equal,
                        value: customIdNumber.toString(),
                        uuid: const Uuid().v4(),
                        fieldType: FilterFieldType.number,
                      );
                    }
                  }
                  return FilterField(
                    fieldKey: CompanyEmployeeField.employeeContactFullName.name,
                    filterOperator: field.filterOperator,
                    type: FilterType.iLike,
                    value: value,
                    uuid: const Uuid().v4(),
                    fieldType: FilterFieldType.text,
                  );
                } else if (field.fieldKey ==
                    CompanyEmployeeField.employeeContactCustomId.name) {
                  final value = field.value;
                  if (RegExp('^[Kk]-').hasMatch(value) && value.length > 2) {
                    final parts = value.split('-');
                    final customIdPart = parts.length > 1 ? parts[1] : '';
                    final customIdNumber = int.tryParse(customIdPart);

                    if (customIdNumber != null) {
                      return FilterField(
                        fieldKey:
                            CompanyEmployeeField.employeeContactCustomId.name,
                        filterOperator: field.filterOperator,
                        type: FilterType.equal,
                        value: customIdNumber.toString(),
                        uuid: const Uuid().v4(),
                        fieldType: FilterFieldType.number,
                      );
                    }
                  }
                  return FilterField(
                    fieldKey: CompanyEmployeeField.employeeContactCustomId.name,
                    filterOperator: field.filterOperator,
                    type: FilterType.equal,
                    value: value,
                    uuid: const Uuid().v4(),
                    fieldType: FilterFieldType.number,
                  );
                }
                return field;
              }).toList(),
              nextOperator: group.nextOperator,
            );
          }).toList() ??
          [],
    );
  }

  static Filter _transformedIdOrNameFilterForCompanies(Filter? filter) {
    return Filter(
      filterGroups: filter?.filterGroups.map((group) {
            return FilterGroup(
              filters: group.filters.map((field) {
                if (field.fieldKey ==
                    CompanyEmployeeField
                        .filterByCompanyContactIdOrFullName.name) {
                  final value = field.value;
                  if (RegExp(r'^\d+$').hasMatch(value)) {
                    return FilterField(
                      fieldKey:
                          CompanyEmployeeField.companyContactCustomId.name,
                      filterOperator: field.filterOperator,
                      type: FilterType.equal,
                      value: value,
                      uuid: const Uuid().v4(),
                      fieldType: FilterFieldType.number,
                    );
                  } else if (RegExp('^[Kk]-').hasMatch(value) &&
                      value.length > 2) {
                    final parts = value.split('-');
                    final customIdPart = parts.length > 1 ? parts[1] : '';
                    final customIdNumber = int.tryParse(customIdPart);

                    if (customIdNumber != null) {
                      return FilterField(
                        fieldKey:
                            CompanyEmployeeField.companyContactCustomId.name,
                        filterOperator: field.filterOperator,
                        type: FilterType.equal,
                        value: customIdNumber.toString(),
                        uuid: const Uuid().v4(),
                        fieldType: FilterFieldType.number,
                      );
                    }
                  }
                  return FilterField(
                    fieldKey: CompanyEmployeeField.companyContactFullName.name,
                    filterOperator: field.filterOperator,
                    type: FilterType.iLike,
                    value: value,
                    uuid: const Uuid().v4(),
                    fieldType: FilterFieldType.text,
                  );
                } else if (field.fieldKey ==
                    CompanyEmployeeField.companyContactCustomId.name) {
                  final value = field.value;
                  if (RegExp('^[Kk]-').hasMatch(value) && value.length > 2) {
                    final parts = value.split('-');
                    final customIdPart = parts.length > 1 ? parts[1] : '';
                    final customIdNumber = int.tryParse(customIdPart);

                    if (customIdNumber != null) {
                      return FilterField(
                        fieldKey:
                            CompanyEmployeeField.companyContactCustomId.name,
                        filterOperator: field.filterOperator,
                        type: FilterType.equal,
                        value: customIdNumber.toString(),
                        uuid: const Uuid().v4(),
                        fieldType: FilterFieldType.number,
                      );
                    }
                  }
                  return FilterField(
                    fieldKey: CompanyEmployeeField.companyContactCustomId.name,
                    filterOperator: field.filterOperator,
                    type: FilterType.equal,
                    value: value,
                    uuid: const Uuid().v4(),
                    fieldType: FilterFieldType.number,
                  );
                }
                return field;
              }).toList(),
              nextOperator: group.nextOperator,
            );
          }).toList() ??
          [],
    );
  }

  static Column<dynamic> Function(CompanyEmployeeDTOTable) dbFieldFromEnum(
    CompanyEmployeeField field,
  ) {
    // Return cached function if available
    return _dbFieldCache[field] ??= _buildDbField(field);
  }

  static Column<dynamic> Function(CompanyEmployeeDTOTable) _buildDbField(
    CompanyEmployeeField field,
  ) {
    return switch (field) {
      // Direct fields on CompanyEmployeeDTO
      CompanyEmployeeField.id => (t) => t.id,
      CompanyEmployeeField.company => (t) => t.companyId,
      CompanyEmployeeField.employee => (t) => t.employeeId,
      CompanyEmployeeField.position => (t) => t.position,
      CompanyEmployeeField.department => (t) => t.departments.count(),
      CompanyEmployeeField.active => (t) => t.active,
      CompanyEmployeeField.note => (t) => t.note,

      // Employee contact fields
      CompanyEmployeeField.employeeContactCustomId => (t) =>
          t.employee.customId,
      CompanyEmployeeField.employeeContactFullName => (t) =>
          t.employee.fullName,
      CompanyEmployeeField.employeeContactAddress => (t) => t.employee.address,
      CompanyEmployeeField.employeeContactAddress2 => (t) =>
          t.employee.address2,
      CompanyEmployeeField.employeeContactPostCode => (t) =>
          t.employee.postCode,
      CompanyEmployeeField.employeeContactCity => (t) => t.employee.city,
      CompanyEmployeeField.employeeContactState => (t) => t.employee.state,
      CompanyEmployeeField.employeeContactPhone => (t) => t.employee.phone,
      CompanyEmployeeField.employeeContactEmail => (t) => t.employee.email,
      CompanyEmployeeField.employeeContactMobile => (t) => t.employee.mobile,
      CompanyEmployeeField.employeeContactCountryCode => (t) =>
          t.employee.countryCode.countryRegionName,
      CompanyEmployeeField.employeeContactLanguageCode => (t) =>
          t.employee.languageCode.languageName,

      // Company contact fields
      CompanyEmployeeField.companyContactCustomId => (t) => t.company.customId,
      CompanyEmployeeField.companyContactFullName => (t) => t.company.fullName,
      CompanyEmployeeField.companyContactAddress => (t) => t.company.address,
      CompanyEmployeeField.companyContactAddress2 => (t) => t.company.address2,
      CompanyEmployeeField.companyContactPostCode => (t) => t.company.postCode,
      CompanyEmployeeField.companyContactCity => (t) => t.company.city,
      CompanyEmployeeField.companyContactState => (t) => t.company.state,
      CompanyEmployeeField.companyContactPhone => (t) => t.company.phone,
      CompanyEmployeeField.companyContactEmail => (t) => t.company.email,
      CompanyEmployeeField.companyContactMobile => (t) => t.company.mobile,
      CompanyEmployeeField.companyContactCountryCode => (t) =>
          t.company.countryCode.countryRegionName,
      CompanyEmployeeField.companyContactLanguageCode => (t) =>
          t.company.languageCode.languageName,

      // Meta fields
      CompanyEmployeeField.createdAt => (t) => t.createdAt,
      CompanyEmployeeField.createdBy => (t) => t.createdById,
      CompanyEmployeeField.lastModifiedAt => (t) => t.lastModifiedAt,
      CompanyEmployeeField.lastModifiedBy => (t) => t.lastModifiedById,
      CompanyEmployeeField.deletedAt => (t) => t.deletedAt,
      CompanyEmployeeField.isDraft => (t) => t.isDraft,

      // Special cases that map to id
      CompanyEmployeeField.filterByEmployeeContactIdOrFullName ||
      CompanyEmployeeField.filterByCompanyContactIdOrFullName ||
      CompanyEmployeeField.actions =>
        (t) => t.id,
    };
  }

  // Cache for log fields
  static List<LogField<CompanyEmployeeDTO>>? _logFieldsCache;

  static List<LogField<CompanyEmployeeDTO>> getLogFields() {
    // Return cached log fields if available
    if (_logFieldsCache != null) return _logFieldsCache!;

    // Define which fields should be logged with their getters
    final logFieldDefinitions =
        <CompanyEmployeeField, dynamic Function(CompanyEmployeeDTO)>{
      CompanyEmployeeField.active: (entity) => entity.active,
      CompanyEmployeeField.department: (entity) =>
          entity.departments?.length ?? 0,
      CompanyEmployeeField.position: (entity) => entity.position,
    };

    // Build and cache the log fields
    _logFieldsCache = logFieldDefinitions.entries
        .map(
          (entry) => LogField<CompanyEmployeeDTO>(
            fieldName: entry.key.name,
            getValue: entry.value,
          ),
        )
        .toList();

    return _logFieldsCache!;
  }
}
