import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations.dart';
import 'package:flutter/material.dart';

class CompanyDepartmentFields {
  CompanyDepartmentFields._();

  // ==================== FIELD CACHE ====================

  static final _cache = FieldCache<CompanyDepartmentField, ElbCrmLocalizations>(
    values: CompanyDepartmentField.values,
    createField: _createField,
  );

  static ExtendedField<CompanyDepartmentField, ElbCrmLocalizations> fromEnum(
    CompanyDepartmentField field,
  ) =>
      _cache.fromEnum(field);

  static ExtendedField<CompanyDepartmentField, ElbCrmLocalizations>
      fromFieldKey(
    String fieldKey,
  ) =>
          _cache.fromFieldKey(fieldKey);

  static final List<TableFieldConfig> defaultTableColumns = List.unmodifiable([
    _cache.fromEnum(CompanyDepartmentField.name).tableFieldConfig,
    _cache.fromEnum(CompanyDepartmentField.description).tableFieldConfig,
    _cache.fromEnum(CompanyDepartmentField.createdAt).tableFieldConfig,
    _cache.fromEnum(CompanyDepartmentField.createdBy).tableFieldConfig,
  ]);

  // ==================== FIELD DEFINITIONS ====================

  static ExtendedField<CompanyDepartmentField, ElbCrmLocalizations>
      _createField(
    CompanyDepartmentField field,
  ) {
    return switch (field) {
      // ========== Meta Fields ==========
      CompanyDepartmentField.deletedAt => ExtendedFieldImpl.date(
          CompanyDepartmentField.deletedAt,
          readableFunc: (coreL10n, crmL10n) => coreL10n.gen_deleted_at,
          dateValidatorFunc: (coreL10n, crmL10n) => null,
        ),
      CompanyDepartmentField.isDraft => ExtendedFieldImpl.boolean(
          CompanyDepartmentField.isDraft,
          readableFunc: (coreL10n, crmL10n) => coreL10n.gen_is_draft,
          validatorFunc: (coreL10n, crmL10n) => null,
          filterTypes: DefaultFilterTypes.noFilter,
        ),
      CompanyDepartmentField.createdAt => ExtendedFieldImpl.date(
          CompanyDepartmentField.createdAt,
          readableFunc: (coreL10n, crmL10n) => coreL10n.gen_created_at,
          dateValidatorFunc: (coreL10n, crmL10n) => null,
        ),
      CompanyDepartmentField.createdBy => ExtendedFieldImpl.assignedUser(
          CompanyDepartmentField.createdBy,
          readableFunc: (coreL10n, crmL10n) => coreL10n.gen_created_by,
          isMandatory: true,
        ),
      CompanyDepartmentField.lastModifiedAt => ExtendedFieldImpl.date(
          CompanyDepartmentField.lastModifiedAt,
          readableFunc: (coreL10n, crmL10n) => coreL10n.gen_last_modified_at,
          dateValidatorFunc: (coreL10n, crmL10n) => null,
        ),
      CompanyDepartmentField.lastModifiedBy => ExtendedFieldImpl.assignedUser(
          CompanyDepartmentField.lastModifiedBy,
          readableFunc: (coreL10n, crmL10n) => coreL10n.gen_last_modified_by,
          isMandatory: true,
        ),

      // ========== Entity Fields ==========
      CompanyDepartmentField.id => const ExtendedFieldImpl.id(
          CompanyDepartmentField.id,
        ),
      CompanyDepartmentField.name => ExtendedFieldImpl.text(
          CompanyDepartmentField.name,
          readableFunc: (coreL10n, crmL10n) => coreL10n.gen_name,
          validatorFunc: (coreL10n, crmL10n) => (value) {
            return TextFieldValidator.isTextNotEmptyOrNull(
              value,
              coreL10n.validation_required,
            );
          },
          filterTypes: DefaultFilterTypes.text,
          isMandatory: true,
        ),
      CompanyDepartmentField.description => ExtendedFieldImpl.text(
          CompanyDepartmentField.description,
          readableFunc: (coreL10n, crmL10n) => coreL10n.gen_description,
          validatorFunc: (coreL10n, crmL10n) => null,
          maxLines: 3,
          minLines: 3,
          keyboardType: TextInputType.multiline,
        ),
    };
  }
}

// ==================== LIST EXTENSIONS ====================

extension CompanyDepartmentFieldsTableExt on List<CompanyDepartmentField> {
  Map<CompanyDepartmentField, TableFieldData> filterableWithLabels(
    ElbCoreLocalizations coreL10n,
    ElbCrmLocalizations crmL10n,
  ) {
    return ExtendedFieldListExt<CompanyDepartmentField, ElbCrmLocalizations>(
      this,
    ).buildFilters(
      coreL10n: coreL10n,
      customL10n: crmL10n,
      fromEnum: CompanyDepartmentFields.fromEnum,
    );
  }

  Map<CompanyDepartmentField, TableColumnData> tableColumnsWithLabels(
    ElbCoreLocalizations coreL10n,
    ElbCrmLocalizations crmL10n,
  ) {
    const excludeFields = {
      CompanyDepartmentField.deletedAt,
      CompanyDepartmentField.isDraft,
      CompanyDepartmentField.id,
    };
    return ExtendedFieldListExt<CompanyDepartmentField, ElbCrmLocalizations>(
      this,
    ).buildColumns(
      coreL10n: coreL10n,
      customL10n: crmL10n,
      fromEnum: CompanyDepartmentFields.fromEnum,
      excludeFields: excludeFields,
    );
  }
}
