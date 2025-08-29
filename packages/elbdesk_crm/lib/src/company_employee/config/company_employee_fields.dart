import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations.dart';
import 'package:flutter/material.dart';

class CompanyEmployeeFields {
  CompanyEmployeeFields._();

  // ==================== FIELD CACHE ====================

  static final _cache = FieldCache<CompanyEmployeeField, ElbCrmLocalizations>(
    values: CompanyEmployeeField.values,
    createField: _createField,
  );

  static ExtendedField<CompanyEmployeeField, ElbCrmLocalizations> fromEnum(
    CompanyEmployeeField field,
  ) =>
      _cache.fromEnum(field);

  static ExtendedField<CompanyEmployeeField, ElbCrmLocalizations> fromFieldKey(
    String fieldKey,
  ) =>
      _cache.fromFieldKey(fieldKey);

  static final List<TableFieldConfig> defaultEmployeeTableColumns =
      List.unmodifiable([
    _cache
        .fromEnum(CompanyEmployeeField.employeeContactFullName)
        .tableFieldConfig,
    _cache.fromEnum(CompanyEmployeeField.position).tableFieldConfig,
    _cache.fromEnum(CompanyEmployeeField.department).tableFieldConfig,
    _cache
        .fromEnum(CompanyEmployeeField.employeeContactAddress)
        .tableFieldConfig,
    _cache
        .fromEnum(CompanyEmployeeField.employeeContactPostCode)
        .tableFieldConfig,
    _cache.fromEnum(CompanyEmployeeField.employeeContactCity).tableFieldConfig,
    _cache
        .fromEnum(CompanyEmployeeField.employeeContactCountryCode)
        .tableFieldConfig,
  ]);

  static final List<TableFieldConfig> defaultCompanyTableColumns =
      List.unmodifiable([
    _cache
        .fromEnum(CompanyEmployeeField.companyContactFullName)
        .tableFieldConfig,
    _cache.fromEnum(CompanyEmployeeField.position).tableFieldConfig,
    _cache.fromEnum(CompanyEmployeeField.department).tableFieldConfig,
    _cache
        .fromEnum(CompanyEmployeeField.companyContactAddress)
        .tableFieldConfig,
    _cache
        .fromEnum(CompanyEmployeeField.companyContactPostCode)
        .tableFieldConfig,
    _cache.fromEnum(CompanyEmployeeField.companyContactCity).tableFieldConfig,
    _cache
        .fromEnum(CompanyEmployeeField.companyContactCountryCode)
        .tableFieldConfig,
  ]);

  static final List<TableFieldConfig> defaultDepartmentTableColumns =
      List.unmodifiable([
    _cache
        .fromEnum(CompanyEmployeeField.employeeContactFullName)
        .tableFieldConfig,
    _cache.fromEnum(CompanyEmployeeField.position).tableFieldConfig,
    _cache.fromEnum(CompanyEmployeeField.department).tableFieldConfig,
    _cache
        .fromEnum(CompanyEmployeeField.employeeContactAddress)
        .tableFieldConfig,
    _cache
        .fromEnum(CompanyEmployeeField.employeeContactPostCode)
        .tableFieldConfig,
    _cache.fromEnum(CompanyEmployeeField.employeeContactCity).tableFieldConfig,
    _cache
        .fromEnum(CompanyEmployeeField.employeeContactCountryCode)
        .tableFieldConfig,
    _cache.fromEnum(CompanyEmployeeField.actions).tableFieldConfig,
  ]);

  // ==================== FIELD DEFINITIONS ====================

  static ExtendedField<CompanyEmployeeField, ElbCrmLocalizations> _createField(
    CompanyEmployeeField field,
  ) {
    return switch (field) {
      // ========== Meta Fields ==========
      CompanyEmployeeField.deletedAt => ExtendedFieldImpl.date(
          CompanyEmployeeField.deletedAt,
          readableFunc: (coreL10n, crmL10n) => coreL10n.gen_deleted_at,
          dateValidatorFunc: (coreL10n, crmL10n) => null,
          filterTypes: const [],
          cellAlignment: Alignment.centerLeft,
        ),
      CompanyEmployeeField.isDraft => ExtendedFieldImpl.boolean(
          CompanyEmployeeField.isDraft,
          readableFunc: (coreL10n, crmL10n) => coreL10n.gen_is_draft,
          filterTypes: const [],
          cellAlignment: Alignment.center,
          validatorFunc: (coreL10n, crmL10n) => null,
        ),
      CompanyEmployeeField.createdAt => ExtendedFieldImpl.date(
          CompanyEmployeeField.createdAt,
          readableFunc: (coreL10n, crmL10n) => coreL10n.gen_created_at,
          dateValidatorFunc: (coreL10n, crmL10n) => null,
          filterTypes: DefaultFilterTypes.dateTime,
          cellAlignment: Alignment.centerLeft,
        ),
      CompanyEmployeeField.createdBy => ExtendedFieldImpl.assignedUser(
          CompanyEmployeeField.createdBy,
          readableFunc: (coreL10n, crmL10n) => coreL10n.gen_created_by,
          isMandatory: false,
          cellAlignment: Alignment.centerLeft,
        ),
      CompanyEmployeeField.lastModifiedAt => ExtendedFieldImpl.date(
          CompanyEmployeeField.lastModifiedAt,
          readableFunc: (coreL10n, crmL10n) => coreL10n.gen_last_modified_at,
          dateValidatorFunc: (coreL10n, crmL10n) => null,
          cellAlignment: Alignment.centerLeft,
        ),
      CompanyEmployeeField.lastModifiedBy => ExtendedFieldImpl.assignedUser(
          CompanyEmployeeField.lastModifiedBy,
          readableFunc: (coreL10n, crmL10n) => coreL10n.gen_last_modified_by,
          isMandatory: false,
          cellAlignment: Alignment.centerLeft,
        ),

      // ========== Entity Fields ==========
      CompanyEmployeeField.id => const ExtendedFieldImpl.id(
          CompanyEmployeeField.id,
          cellAlignment: Alignment.centerLeft,
        ),
      CompanyEmployeeField.company => ExtendedFieldImpl.text(
          CompanyEmployeeField.company,
          readableFunc: (coreL10n, crmL10n) => crmL10n.company_employee_title,
          cellAlignment: Alignment.centerLeft,
          isMandatory: false,
          validatorFunc: (coreL10n, crmL10n) => null,
        ),
      CompanyEmployeeField.employee => ExtendedFieldImpl.text(
          CompanyEmployeeField.employee,
          readableFunc: (coreL10n, crmL10n) => crmL10n.employee,
          validatorFunc: (coreL10n, crmL10n) => null,
          filterTypes: DefaultFilterTypes.text,
          cellAlignment: Alignment.centerLeft,
        ),
      CompanyEmployeeField.position => ExtendedFieldImpl.text(
          CompanyEmployeeField.position,
          readableFunc: (coreL10n, crmL10n) =>
              crmL10n.company_employee_job_title,
          validatorFunc: (coreL10n, crmL10n) => null,
          filterTypes: DefaultFilterTypes.text,
          cellAlignment: Alignment.centerLeft,
        ),
      CompanyEmployeeField.department => ExtendedFieldImpl.text(
          CompanyEmployeeField.department,
          readableFunc: (coreL10n, crmL10n) =>
              crmL10n.company_employee_department,
          validatorFunc: (coreL10n, crmL10n) => null,
          filterTypes: DefaultFilterTypes.text,
          cellAlignment: Alignment.centerLeft,
        ),
      CompanyEmployeeField.active => ExtendedFieldImpl.boolean(
          CompanyEmployeeField.active,
          readableFunc: (coreL10n, crmL10n) => crmL10n.company_employee_active,
          validatorFunc: (coreL10n, crmL10n) => null,
          filterTypes: DefaultFilterTypes.boolean,
          cellAlignment: Alignment.center,
        ),
      CompanyEmployeeField.note => ExtendedFieldImpl.text(
          CompanyEmployeeField.note,
          readableFunc: (coreL10n, crmL10n) => crmL10n.company_employee_note,
          validatorFunc: (coreL10n, crmL10n) => null,
          filterTypes: DefaultFilterTypes.text,
          cellAlignment: Alignment.centerLeft,
        ),
      CompanyEmployeeField.employeeContactCustomId => ExtendedFieldImpl.text(
          CompanyEmployeeField.employeeContactCustomId,
          readableFunc: (coreL10n, crmL10n) =>
              '${crmL10n.contact_singular} ${coreL10n.gen_id}',
          validatorFunc: (coreL10n, crmL10n) => null,
          filterTypes: const [FilterType.equal],
          cellAlignment: Alignment.centerLeft,
        ),
      CompanyEmployeeField.employeeContactFullName => ExtendedFieldImpl.text(
          CompanyEmployeeField.employeeContactFullName,
          readableFunc: (coreL10n, crmL10n) => crmL10n.contact_name,
          validatorFunc: (coreL10n, crmL10n) => null,
          filterTypes: DefaultFilterTypes.text,
          cellAlignment: Alignment.centerLeft,
        ),
      CompanyEmployeeField.employeeContactAddress => ExtendedFieldImpl.text(
          CompanyEmployeeField.employeeContactAddress,
          readableFunc: (coreL10n, crmL10n) => crmL10n.contact_address_singular,
          validatorFunc: (coreL10n, crmL10n) => null,
          filterTypes: DefaultFilterTypes.text,
          cellAlignment: Alignment.centerLeft,
        ),
      CompanyEmployeeField.employeeContactAddress2 => ExtendedFieldImpl.text(
          CompanyEmployeeField.employeeContactAddress2,
          readableFunc: (coreL10n, crmL10n) => crmL10n.contact_address2,
          validatorFunc: (coreL10n, crmL10n) => null,
          filterTypes: DefaultFilterTypes.text,
          cellAlignment: Alignment.centerLeft,
        ),
      CompanyEmployeeField.employeeContactPostCode => ExtendedFieldImpl.text(
          CompanyEmployeeField.employeeContactPostCode,
          readableFunc: (coreL10n, crmL10n) => crmL10n.contact_zip,
          validatorFunc: (coreL10n, crmL10n) => null,
          filterTypes: DefaultFilterTypes.text,
          cellAlignment: Alignment.centerLeft,
        ),
      CompanyEmployeeField.employeeContactCity => ExtendedFieldImpl.text(
          CompanyEmployeeField.employeeContactCity,
          readableFunc: (coreL10n, crmL10n) => crmL10n.contact_city,
          validatorFunc: (coreL10n, crmL10n) => null,
          filterTypes: DefaultFilterTypes.text,
          cellAlignment: Alignment.centerLeft,
        ),
      CompanyEmployeeField.employeeContactState => ExtendedFieldImpl.text(
          CompanyEmployeeField.employeeContactState,
          readableFunc: (coreL10n, crmL10n) => crmL10n.contact_state,
          validatorFunc: (coreL10n, crmL10n) => null,
          filterTypes: DefaultFilterTypes.text,
          cellAlignment: Alignment.centerLeft,
        ),
      CompanyEmployeeField.employeeContactPhone => ExtendedFieldImpl.text(
          CompanyEmployeeField.employeeContactPhone,
          readableFunc: (coreL10n, crmL10n) => crmL10n.contact_phone,
          validatorFunc: (coreL10n, crmL10n) => null,
          filterTypes: DefaultFilterTypes.text,
          cellAlignment: Alignment.centerLeft,
        ),
      CompanyEmployeeField.employeeContactEmail => ExtendedFieldImpl.text(
          CompanyEmployeeField.employeeContactEmail,
          readableFunc: (coreL10n, crmL10n) => crmL10n.contact_email,
          validatorFunc: (coreL10n, crmL10n) => null,
          filterTypes: DefaultFilterTypes.text,
          cellAlignment: Alignment.centerLeft,
        ),
      CompanyEmployeeField.employeeContactMobile => ExtendedFieldImpl.text(
          CompanyEmployeeField.employeeContactMobile,
          readableFunc: (coreL10n, crmL10n) => crmL10n.contact_mobile,
          validatorFunc: (coreL10n, crmL10n) => null,
          filterTypes: DefaultFilterTypes.text,
          cellAlignment: Alignment.centerLeft,
        ),
      CompanyEmployeeField.employeeContactCountryCode => ExtendedFieldImpl.text(
          CompanyEmployeeField.employeeContactCountryCode,
          readableFunc: (coreL10n, crmL10n) => crmL10n.country_code_singular,
          validatorFunc: (coreL10n, crmL10n) => null,
          filterTypes: DefaultFilterTypes.text,
          cellAlignment: Alignment.centerLeft,
        ),
      CompanyEmployeeField.employeeContactLanguageCode =>
        ExtendedFieldImpl.text(
          CompanyEmployeeField.employeeContactLanguageCode,
          readableFunc: (coreL10n, crmL10n) => crmL10n.language_code_singular,
          validatorFunc: (coreL10n, crmL10n) => null,
          filterTypes: DefaultFilterTypes.text,
          cellAlignment: Alignment.centerLeft,
        ),
      CompanyEmployeeField.companyContactCustomId => ExtendedFieldImpl.text(
          CompanyEmployeeField.companyContactCustomId,
          readableFunc: (coreL10n, crmL10n) =>
              '${crmL10n.company_singluar} ${coreL10n.gen_id}',
          validatorFunc: (coreL10n, crmL10n) => null,
          filterTypes: const [FilterType.equal],
          cellAlignment: Alignment.centerLeft,
        ),
      CompanyEmployeeField.filterByCompanyContactIdOrFullName =>
        ExtendedFieldImpl.text(
          CompanyEmployeeField.filterByCompanyContactIdOrFullName,
          readableFunc: (coreL10n, crmL10n) => crmL10n.contact_id_and_fullname,
          validatorFunc: (coreL10n, crmL10n) => null,
          filterTypes: const [FilterType.iLike],
          cellAlignment: Alignment.centerLeft,
        ),
      CompanyEmployeeField.companyContactFullName => ExtendedFieldImpl.text(
          CompanyEmployeeField.companyContactFullName,
          readableFunc: (coreL10n, crmL10n) => crmL10n.contact_name,
          validatorFunc: (coreL10n, crmL10n) => null,
          filterTypes: DefaultFilterTypes.text,
          cellAlignment: Alignment.centerLeft,
        ),
      CompanyEmployeeField.companyContactAddress => ExtendedFieldImpl.text(
          CompanyEmployeeField.companyContactAddress,
          readableFunc: (coreL10n, crmL10n) => crmL10n.contact_address_singular,
          validatorFunc: (coreL10n, crmL10n) => null,
          filterTypes: DefaultFilterTypes.text,
          cellAlignment: Alignment.centerLeft,
        ),
      CompanyEmployeeField.companyContactAddress2 => ExtendedFieldImpl.text(
          CompanyEmployeeField.companyContactAddress2,
          readableFunc: (coreL10n, crmL10n) => crmL10n.contact_address2,
          validatorFunc: (coreL10n, crmL10n) => null,
          filterTypes: DefaultFilterTypes.text,
          cellAlignment: Alignment.centerLeft,
        ),
      CompanyEmployeeField.companyContactPostCode => ExtendedFieldImpl.text(
          CompanyEmployeeField.companyContactPostCode,
          readableFunc: (coreL10n, crmL10n) => crmL10n.contact_zip,
          validatorFunc: (coreL10n, crmL10n) => null,
          filterTypes: DefaultFilterTypes.text,
          cellAlignment: Alignment.centerLeft,
        ),
      CompanyEmployeeField.companyContactCity => ExtendedFieldImpl.text(
          CompanyEmployeeField.companyContactCity,
          readableFunc: (coreL10n, crmL10n) => crmL10n.contact_city,
          validatorFunc: (coreL10n, crmL10n) => null,
          filterTypes: DefaultFilterTypes.text,
          cellAlignment: Alignment.centerLeft,
        ),
      CompanyEmployeeField.companyContactState => ExtendedFieldImpl.text(
          CompanyEmployeeField.companyContactState,
          readableFunc: (coreL10n, crmL10n) => crmL10n.contact_state,
          validatorFunc: (coreL10n, crmL10n) => null,
          filterTypes: DefaultFilterTypes.text,
          cellAlignment: Alignment.centerLeft,
        ),
      CompanyEmployeeField.companyContactPhone => ExtendedFieldImpl.text(
          CompanyEmployeeField.companyContactPhone,
          readableFunc: (coreL10n, crmL10n) => crmL10n.contact_phone,
          validatorFunc: (coreL10n, crmL10n) => null,
          filterTypes: DefaultFilterTypes.text,
          cellAlignment: Alignment.centerLeft,
        ),
      CompanyEmployeeField.companyContactEmail => ExtendedFieldImpl.text(
          CompanyEmployeeField.companyContactEmail,
          readableFunc: (coreL10n, crmL10n) => crmL10n.contact_email,
          validatorFunc: (coreL10n, crmL10n) => null,
          filterTypes: DefaultFilterTypes.text,
          cellAlignment: Alignment.centerLeft,
        ),
      CompanyEmployeeField.companyContactMobile => ExtendedFieldImpl.text(
          CompanyEmployeeField.companyContactMobile,
          readableFunc: (coreL10n, crmL10n) => crmL10n.contact_mobile,
          validatorFunc: (coreL10n, crmL10n) => null,
          filterTypes: DefaultFilterTypes.text,
          cellAlignment: Alignment.centerLeft,
        ),
      CompanyEmployeeField.companyContactCountryCode => ExtendedFieldImpl.text(
          CompanyEmployeeField.companyContactCountryCode,
          readableFunc: (coreL10n, crmL10n) => crmL10n.country_code_singular,
          validatorFunc: (coreL10n, crmL10n) => null,
          filterTypes: DefaultFilterTypes.text,
          cellAlignment: Alignment.centerLeft,
        ),
      CompanyEmployeeField.companyContactLanguageCode => ExtendedFieldImpl.text(
          CompanyEmployeeField.companyContactLanguageCode,
          readableFunc: (coreL10n, crmL10n) => crmL10n.language_code_singular,
          validatorFunc: (coreL10n, crmL10n) => null,
          filterTypes: DefaultFilterTypes.text,
          cellAlignment: Alignment.centerLeft,
        ),
      CompanyEmployeeField.actions => ExtendedFieldImpl.text(
          CompanyEmployeeField.actions,
          readableFunc: (coreL10n, crmL10n) => coreL10n.gen_actions,
          validatorFunc: (coreL10n, crmL10n) => null,
          filterTypes: const [],
          cellAlignment: Alignment.centerLeft,
        ),
      CompanyEmployeeField.filterByEmployeeContactIdOrFullName =>
        ExtendedFieldImpl.text(
          CompanyEmployeeField.filterByEmployeeContactIdOrFullName,
          readableFunc: (coreL10n, crmL10n) => crmL10n.contact_id_and_fullname,
          validatorFunc: (coreL10n, crmL10n) => null,
          filterTypes: const [FilterType.iLike],
          cellAlignment: Alignment.centerLeft,
        ),
    };
  }
}

// ==================== LIST EXTENSIONS ====================

extension CompanyEmployeeFieldsTableExt on List<CompanyEmployeeField> {
  Map<CompanyEmployeeField, TableFieldData> filterableWithLabels(
    ElbCoreLocalizations coreL10n,
    ElbCrmLocalizations crmL10n,
  ) {
    return ExtendedFieldListExt<CompanyEmployeeField, ElbCrmLocalizations>(this)
        .buildFilters(
      coreL10n: coreL10n,
      customL10n: crmL10n,
      fromEnum: CompanyEmployeeFields.fromEnum,
    );
  }

  Map<CompanyEmployeeField, TableColumnData> tableColumnsWithLabels(
    ElbCoreLocalizations coreL10n,
    ElbCrmLocalizations crmL10n,
  ) {
    return ExtendedFieldListExt<CompanyEmployeeField, ElbCrmLocalizations>(this)
        .buildColumns(
      coreL10n: coreL10n,
      customL10n: crmL10n,
      fromEnum: CompanyEmployeeFields.fromEnum,
    );
  }

  Map<CompanyEmployeeField, TableFieldData> quickSearchFilterEmployeesView(
    ElbCoreLocalizations coreL10n,
    ElbCrmLocalizations crmL10n,
  ) {
    final map = <CompanyEmployeeField, TableFieldData>{};

    final fields = [
      CompanyEmployeeField.filterByEmployeeContactIdOrFullName,
    ];

    for (final field in fields.orderedFieldsEmployeesView(coreL10n, crmL10n)) {
      final extField = CompanyEmployeeFields.fromEnum(field);
      // only add filterable fields with non empty array
      if (extField.filterTypes.isNotEmpty) {
        map[field] = TableFieldData(
          readable: extField.readable(coreL10n, crmL10n),
          filterTypes: extField.filterTypes,
          validator: extField.validator(coreL10n, crmL10n),
          fieldType: extField.fieldType,
        );
      }
    }

    return map;
  }

  Map<CompanyEmployeeField, TableFieldData> quickSearchFilterCompaniesView(
    ElbCoreLocalizations coreL10n,
    ElbCrmLocalizations crmL10n,
  ) {
    final map = <CompanyEmployeeField, TableFieldData>{};

    final fields = [
      CompanyEmployeeField.filterByCompanyContactIdOrFullName,
    ];

    for (final field in fields.orderedFieldsCompaniesView(coreL10n, crmL10n)) {
      final extField = CompanyEmployeeFields.fromEnum(field);
      // only add filterable fields with non empty array
      if (extField.filterTypes.isNotEmpty) {
        map[field] = TableFieldData(
          readable: extField.readable(coreL10n, crmL10n),
          filterTypes: extField.filterTypes,
          validator: extField.validator(coreL10n, crmL10n),
          fieldType: extField.fieldType,
        );
      }
    }

    return map;
  }

  /// Returns a map of filterable fields with labels for employees view
  Map<CompanyEmployeeField, TableFieldData> filterableWithLabelsEmployeesView(
    ElbCoreLocalizations coreL10n,
    ElbCrmLocalizations crmL10n,
  ) {
    final excludeFields = {
      CompanyEmployeeField.id,
      CompanyEmployeeField.company,
      CompanyEmployeeField.employee,
      CompanyEmployeeField.deletedAt,
      CompanyEmployeeField.isDraft,
      CompanyEmployeeField.actions,
      CompanyEmployeeField.filterByCompanyContactIdOrFullName,
      CompanyEmployeeField.companyContactCustomId,
      CompanyEmployeeField.companyContactFullName,
      CompanyEmployeeField.companyContactAddress,
      CompanyEmployeeField.companyContactAddress2,
      CompanyEmployeeField.companyContactPostCode,
      CompanyEmployeeField.companyContactCity,
      CompanyEmployeeField.companyContactState,
      CompanyEmployeeField.companyContactPhone,
      CompanyEmployeeField.companyContactEmail,
      CompanyEmployeeField.companyContactMobile,
      CompanyEmployeeField.companyContactCountryCode,
      CompanyEmployeeField.companyContactLanguageCode,
    };

    return ExtendedFieldListExt<CompanyEmployeeField, ElbCrmLocalizations>(
      orderedFieldsEmployeesView(coreL10n, crmL10n),
    ).buildFilters(
      coreL10n: coreL10n,
      customL10n: crmL10n,
      fromEnum: CompanyEmployeeFields.fromEnum,
      excludeFields: excludeFields,
    );
  }

  Map<CompanyEmployeeField, TableFieldData> filterableWithLabelsCompaniesView(
    ElbCoreLocalizations coreL10n,
    ElbCrmLocalizations crmL10n,
  ) {
    final excludeFields = {
      CompanyEmployeeField.id,
      CompanyEmployeeField.company,
      CompanyEmployeeField.employee,
      CompanyEmployeeField.deletedAt,
      CompanyEmployeeField.isDraft,
      CompanyEmployeeField.actions,
      CompanyEmployeeField.filterByEmployeeContactIdOrFullName,
      CompanyEmployeeField.employeeContactCustomId,
      CompanyEmployeeField.employeeContactFullName,
      CompanyEmployeeField.employeeContactAddress,
      CompanyEmployeeField.employeeContactAddress2,
      CompanyEmployeeField.employeeContactPostCode,
      CompanyEmployeeField.employeeContactCity,
      CompanyEmployeeField.employeeContactState,
      CompanyEmployeeField.employeeContactPhone,
      CompanyEmployeeField.employeeContactEmail,
      CompanyEmployeeField.employeeContactMobile,
      CompanyEmployeeField.employeeContactCountryCode,
      CompanyEmployeeField.employeeContactLanguageCode,
    };

    return ExtendedFieldListExt<CompanyEmployeeField, ElbCrmLocalizations>(
      orderedFieldsCompaniesView(coreL10n, crmL10n),
    ).buildFilters(
      coreL10n: coreL10n,
      customL10n: crmL10n,
      fromEnum: CompanyEmployeeFields.fromEnum,
      excludeFields: excludeFields,
    );
  }

  /// Returns a map of table columns with labels for employees view
  Map<CompanyEmployeeField, TableColumnData>
      tableColumnsWithLabelsEmployeesView(
    ElbCoreLocalizations coreL10n,
    ElbCrmLocalizations crmL10n,
  ) {
    final excludeFields = {
      CompanyEmployeeField.id,
      CompanyEmployeeField.employee,
      CompanyEmployeeField.company,
      CompanyEmployeeField.filterByEmployeeContactIdOrFullName,
      CompanyEmployeeField.deletedAt,
      CompanyEmployeeField.isDraft,
      CompanyEmployeeField.actions,
      CompanyEmployeeField.filterByCompanyContactIdOrFullName,
      CompanyEmployeeField.companyContactCustomId,
      CompanyEmployeeField.companyContactFullName,
      CompanyEmployeeField.companyContactAddress,
      CompanyEmployeeField.companyContactAddress2,
      CompanyEmployeeField.companyContactPostCode,
      CompanyEmployeeField.companyContactCity,
      CompanyEmployeeField.companyContactState,
      CompanyEmployeeField.companyContactPhone,
      CompanyEmployeeField.companyContactEmail,
      CompanyEmployeeField.companyContactMobile,
      CompanyEmployeeField.companyContactCountryCode,
      CompanyEmployeeField.companyContactLanguageCode,
    };

    return ExtendedFieldListExt<CompanyEmployeeField, ElbCrmLocalizations>(
      this,
    ).buildColumns(
      coreL10n: coreL10n,
      customL10n: crmL10n,
      fromEnum: CompanyEmployeeFields.fromEnum,
      excludeFields: excludeFields,
    );
  }

  Map<CompanyEmployeeField, TableColumnData>
      tableColumnsWithLabelsCompaniesView(
    ElbCoreLocalizations coreL10n,
    ElbCrmLocalizations crmL10n,
  ) {
    final excludeFields = {
      CompanyEmployeeField.id,
      CompanyEmployeeField.employee,
      CompanyEmployeeField.company,
      CompanyEmployeeField.filterByCompanyContactIdOrFullName,
      CompanyEmployeeField.deletedAt,
      CompanyEmployeeField.isDraft,
      CompanyEmployeeField.actions,
      CompanyEmployeeField.filterByEmployeeContactIdOrFullName,
      CompanyEmployeeField.employeeContactCustomId,
      CompanyEmployeeField.employeeContactFullName,
      CompanyEmployeeField.employeeContactAddress,
      CompanyEmployeeField.employeeContactAddress2,
      CompanyEmployeeField.employeeContactPostCode,
      CompanyEmployeeField.employeeContactCity,
      CompanyEmployeeField.employeeContactState,
      CompanyEmployeeField.employeeContactPhone,
      CompanyEmployeeField.employeeContactEmail,
      CompanyEmployeeField.employeeContactMobile,
      CompanyEmployeeField.employeeContactCountryCode,
      CompanyEmployeeField.employeeContactLanguageCode,
    };

    return ExtendedFieldListExt<CompanyEmployeeField, ElbCrmLocalizations>(this)
        .buildColumns(
      coreL10n: coreL10n,
      customL10n: crmL10n,
      fromEnum: CompanyEmployeeFields.fromEnum,
      excludeFields: excludeFields,
    );
  }

  List<CompanyEmployeeField> orderedFieldsEmployeesView(
    ElbCoreLocalizations coreL10n,
    ElbCrmLocalizations crmL10n,
  ) {
    final fields = toList()
      ..sort((a, b) {
        // Place filterByIdOrFullName at the very top
        if (a == CompanyEmployeeField.filterByEmployeeContactIdOrFullName) {
          return -1;
        }
        if (b == CompanyEmployeeField.filterByEmployeeContactIdOrFullName) {
          return 1;
        }

        // Place fullName field second
        if (a == CompanyEmployeeField.employeeContactFullName) {
          return -1;
        }
        if (b == CompanyEmployeeField.employeeContactFullName) return 1;

        // Place customId third
        if (a == CompanyEmployeeField.employeeContactCustomId) {
          return -1;
        }
        if (b == CompanyEmployeeField.employeeContactCustomId) {
          return 1;
        }

        // Sort remaining fields alphabetically by their readable (translated)
        // names
        final aReadable =
            CompanyEmployeeFields.fromEnum(a).readable(coreL10n, crmL10n);
        final bReadable =
            CompanyEmployeeFields.fromEnum(b).readable(coreL10n, crmL10n);
        return aReadable.compareTo(bReadable);
      });

    return fields;
  }

  List<CompanyEmployeeField> orderedFieldsCompaniesView(
    ElbCoreLocalizations coreL10n,
    ElbCrmLocalizations crmL10n,
  ) {
    final fields = toList()
      ..sort((a, b) {
        // Place filterByIdOrFullName at the very top
        if (a == CompanyEmployeeField.filterByCompanyContactIdOrFullName) {
          return -1;
        }
        if (b == CompanyEmployeeField.filterByCompanyContactIdOrFullName) {
          return 1;
        }

        // Place fullName field second
        if (a == CompanyEmployeeField.companyContactFullName) {
          return -1;
        }
        if (b == CompanyEmployeeField.companyContactFullName) return 1;

        // Place customId third
        if (a == CompanyEmployeeField.companyContactCustomId) {
          return -1;
        }
        if (b == CompanyEmployeeField.companyContactCustomId) {
          return 1;
        }

        // Sort remaining fields alphabetically by their readable (translated)
        // names
        final aReadable =
            CompanyEmployeeFields.fromEnum(a).readable(coreL10n, crmL10n);
        final bReadable =
            CompanyEmployeeFields.fromEnum(b).readable(coreL10n, crmL10n);
        return aReadable.compareTo(bReadable);
      });

    return fields;
  }
}
