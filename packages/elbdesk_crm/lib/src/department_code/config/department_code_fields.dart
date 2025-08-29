import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations.dart';

/// UNIFIED DepartmentCode fields with ALL features (forms + tables) in ONE place
/// This replaces the old individual static getters approach
class DepartmentCodeFields {
  DepartmentCodeFields._();

  // ==================== FIELD CACHE ====================

  static final _cache = FieldCache<DepartmentCodeField, ElbCrmLocalizations>(
    values: DepartmentCodeField.values,
    createField: _createField,
  );

  static ExtendedField<DepartmentCodeField, ElbCrmLocalizations> fromEnum(
    DepartmentCodeField field,
  ) =>
      _cache.fromEnum(field);

  static ExtendedField<DepartmentCodeField, ElbCrmLocalizations> fromFieldKey(
    String fieldKey,
  ) =>
      _cache.fromFieldKey(fieldKey);

  static final List<TableFieldConfig> defaultTableColumns = List.unmodifiable([
    _cache.fromEnum(DepartmentCodeField.code).tableFieldConfig,
    _cache.fromEnum(DepartmentCodeField.description).tableFieldConfig,
  ]);

  // ==================== FIELD DEFINITIONS ====================

  static ExtendedField<DepartmentCodeField, ElbCrmLocalizations> _createField(
    DepartmentCodeField field,
  ) {
    return switch (field) {
      // ========== Meta Fields ==========
      DepartmentCodeField.deletedAt => ExtendedFieldImpl.date(
          DepartmentCodeField.deletedAt,
          readableFunc: (l10n, _) => l10n.gen_deleted_at,
          dateValidatorFunc: (l10n, _) => null,
        ),
      DepartmentCodeField.isDraft => ExtendedFieldImpl.boolean(
          DepartmentCodeField.isDraft,
          readableFunc: (l10n, _) => l10n.gen_is_draft,
          validatorFunc: (l10n, _) => null,
        ),
      DepartmentCodeField.createdAt => ExtendedFieldImpl.date(
          DepartmentCodeField.createdAt,
          readableFunc: (l10n, _) => l10n.gen_created_at,
          dateValidatorFunc: (l10n, _) => null,
        ),
      DepartmentCodeField.createdBy => ExtendedFieldImpl.assignedUser(
          DepartmentCodeField.createdBy,
          readableFunc: (l10n, _) => l10n.gen_created_by,
          isMandatory: false,
        ),
      DepartmentCodeField.lastModifiedAt => ExtendedFieldImpl.date(
          DepartmentCodeField.lastModifiedAt,
          readableFunc: (l10n, _) => l10n.gen_last_modified_at,
          dateValidatorFunc: (l10n, _) => null,
        ),
      DepartmentCodeField.lastModifiedBy => ExtendedFieldImpl.assignedUser(
          DepartmentCodeField.lastModifiedBy,
          readableFunc: (l10n, _) => l10n.gen_last_modified_by,
          isMandatory: false,
        ),

      // ========== Entity Fields ==========
      DepartmentCodeField.id => const ExtendedFieldImpl.id(
          DepartmentCodeField.id,
        ),
      DepartmentCodeField.code => ExtendedFieldImpl.text(
          DepartmentCodeField.code,
          readableFunc: (l10n, crmL10n) => crmL10n.department_code_code,
          validatorFunc: (l10n, _) => (String? value) {
            return TextFieldValidator.isTextNotEmptyOrNull(
              value,
              l10n.validation_required,
            );
          },
        ),
      DepartmentCodeField.description => ExtendedFieldImpl.text(
          DepartmentCodeField.description,
          readableFunc: (l10n, crmL10n) => crmL10n.department_code_description,
          validatorFunc: (l10n, _) => (String? value) {
            return TextFieldValidator.isTextNotEmptyOrNull(
              value,
              l10n.validation_required,
            );
          },
          cellWidth: 200,
        ),
    };
  }
}

// ==================== LIST EXTENSIONS ====================

/// Extension methods for table operations
extension DepartmentCodeFieldsTableExt on List<DepartmentCodeField> {
  /// Get filterable fields with labels
  Map<DepartmentCodeField, TableFieldData> filterableWithLabels(
    ElbCoreLocalizations l10n,
    ElbCrmLocalizations crmL10n,
  ) {
    return ExtendedFieldListExt<DepartmentCodeField, ElbCrmLocalizations>(this)
        .buildFilters(
      coreL10n: l10n,
      customL10n: crmL10n,
      fromEnum: DepartmentCodeFields.fromEnum,
    );
  }

  /// Get table columns with labels
  Map<DepartmentCodeField, TableColumnData> tableColumnsWithLabels(
    ElbCoreLocalizations l10n,
    ElbCrmLocalizations crmL10n,
  ) {
    const excludeFields = {
      DepartmentCodeField.deletedAt,
      DepartmentCodeField.isDraft,
      DepartmentCodeField.id,
    };
    return ExtendedFieldListExt<DepartmentCodeField, ElbCrmLocalizations>(this)
        .buildColumns(
      coreL10n: l10n,
      customL10n: crmL10n,
      fromEnum: DepartmentCodeFields.fromEnum,
      excludeFields: excludeFields,
    );
  }
}
