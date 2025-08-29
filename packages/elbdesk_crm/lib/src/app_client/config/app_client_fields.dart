import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations.dart';
import 'package:flutter/material.dart';

/// UNIFIED AppClient fields with ALL features (forms + tables) in ONE place
/// This replaces AppClientFieldWrapper and AppClientFieldsExt
class AppClientFields {
  AppClientFields._();

  // ==================== FIELD CACHE ====================

  static final _cache = FieldCache<AppClientField, ElbCrmLocalizations>(
    values: AppClientField.values,
    createField: _createField,
  );

  static ExtendedField<AppClientField, ElbCrmLocalizations> fromEnum(
    AppClientField field,
  ) =>
      _cache.fromEnum(field);

  static ExtendedField<AppClientField, ElbCrmLocalizations> fromFieldKey(
    String fieldKey,
  ) =>
      _cache.fromFieldKey(fieldKey);

  static final List<TableFieldConfig> defaultTableColumns = List.unmodifiable([
    _cache.fromEnum(AppClientField.description).tableFieldConfig,
    _cache.fromEnum(AppClientField.contact).tableFieldConfig,
  ]);

  // ==================== FIELD DEFINITIONS ====================

  static ExtendedField<AppClientField, ElbCrmLocalizations> _createField(
    AppClientField field,
  ) {
    return switch (field) {
      // ========== Meta Fields ==========
      AppClientField.deletedAt => ExtendedFieldImpl.date(
          AppClientField.deletedAt,
          readableFunc: (coreL10n, crmL10n) => coreL10n.gen_deleted_at,
          dateValidatorFunc: (coreL10n, crmL10n) => null,
          filterTypes: DefaultFilterTypes.noFilter,
        ),
      AppClientField.isDraft => ExtendedFieldImpl.boolean(
          AppClientField.isDraft,
          readableFunc: (coreL10n, crmL10n) => coreL10n.gen_is_draft,
          validatorFunc: (coreL10n, crmL10n) => null,
          filterTypes: DefaultFilterTypes.noFilter,
        ),
      AppClientField.createdAt => ExtendedFieldImpl.date(
          AppClientField.createdAt,
          readableFunc: (coreL10n, crmL10n) => coreL10n.gen_created_at,
          dateValidatorFunc: (coreL10n, crmL10n) => null,
        ),
      AppClientField.createdBy => ExtendedFieldImpl.assignedUser(
          AppClientField.createdBy,
          readableFunc: (coreL10n, crmL10n) => coreL10n.gen_created_by,
          isMandatory: false,
        ),
      AppClientField.lastModifiedAt => ExtendedFieldImpl.date(
          AppClientField.lastModifiedAt,
          readableFunc: (coreL10n, crmL10n) => coreL10n.gen_last_modified_at,
          dateValidatorFunc: (coreL10n, crmL10n) => null,
        ),
      AppClientField.lastModifiedBy => ExtendedFieldImpl.assignedUser(
          AppClientField.lastModifiedBy,
          readableFunc: (coreL10n, crmL10n) => coreL10n.gen_last_modified_by,
          isMandatory: false,
        ),

      // ========== Entity Fields ==========
      AppClientField.id => const ExtendedFieldImpl.id(
          AppClientField.id,
          cellWidth: 100,
          cellAlignment: Alignment.centerLeft,
        ),
      AppClientField.description => ExtendedFieldImpl.text(
          AppClientField.description,
          readableFunc: (coreL10n, crmL10n) => coreL10n.gen_description,
          validatorFunc: (coreL10n, crmL10n) => (value) {
            return TextFieldValidator.isTextNotEmptyOrNull(
              value,
              coreL10n.validation_required,
            );
          },
          cellWidth: 200,
        ),
      AppClientField.contact => ExtendedFieldImpl.text(
          AppClientField.contact,
          readableFunc: (coreL10n, crmL10n) => crmL10n.contact_singular,
          validatorFunc: (coreL10n, crmL10n) => null,
          cellWidth: 250,
        ),
      AppClientField.automationEngine => ExtendedFieldImpl.text(
          AppClientField.automationEngine,
          readableFunc: (coreL10n, crmL10n) => crmL10n.automation_engine,
          validatorFunc: (coreL10n, crmL10n) => null,
        ),
      AppClientField.employees => ExtendedFieldImpl.text(
          AppClientField.employees,
          readableFunc: (coreL10n, crmL10n) => crmL10n.employees,
          validatorFunc: (coreL10n, crmL10n) => null,
        ),
    };
  }
}

// ==================== LIST EXTENSIONS ====================

/// Extension methods for table operations
extension AppClientFieldsTableExt on List<AppClientField> {
  /// Get filterable fields with labels
  Map<AppClientField, TableFieldData> filterableWithLabels(
    ElbCoreLocalizations coreL10n,
    ElbCrmLocalizations crmL10n,
  ) {
    return ExtendedFieldListExt<AppClientField, ElbCrmLocalizations>(this)
        .buildFilters(
      coreL10n: coreL10n,
      customL10n: crmL10n,
      fromEnum: AppClientFields.fromEnum,
    );
  }

  /// Get table columns with labels
  Map<AppClientField, TableColumnData> tableColumnsWithLabels(
    ElbCoreLocalizations coreL10n,
    ElbCrmLocalizations crmL10n,
  ) {
    const excludeFields = {
      AppClientField.deletedAt,
      AppClientField.isDraft,
      AppClientField.id,
      AppClientField.employees,
      AppClientField.automationEngine,
    };
    return ExtendedFieldListExt<AppClientField, ElbCrmLocalizations>(this)
        .buildColumns(
      coreL10n: coreL10n,
      customL10n: crmL10n,
      fromEnum: AppClientFields.fromEnum,
      excludeFields: excludeFields,
    );
  }
}
