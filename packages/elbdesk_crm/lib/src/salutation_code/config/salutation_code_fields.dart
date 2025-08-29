import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations.dart';

/// UNIFIED SalutationCode fields with ALL features (forms + tables) in ONE place
/// This replaces the old individual static getters approach
class SalutationCodeFields {
  SalutationCodeFields._();

  // ==================== FIELD CACHE ====================

  static final _cache = FieldCache<SalutationCodeField, ElbCrmLocalizations>(
    values: SalutationCodeField.values,
    createField: _createField,
  );

  static ExtendedField<SalutationCodeField, ElbCrmLocalizations> fromEnum(
    SalutationCodeField field,
  ) =>
      _cache.fromEnum(field);

  static ExtendedField<SalutationCodeField, ElbCrmLocalizations> fromFieldKey(
    String fieldKey,
  ) =>
      _cache.fromFieldKey(fieldKey);

  static final List<TableFieldConfig> defaultTableColumns = List.unmodifiable([
    _cache.fromEnum(SalutationCodeField.code).tableFieldConfig,
    _cache.fromEnum(SalutationCodeField.description).tableFieldConfig,
    _cache.fromEnum(SalutationCodeField.isPrimaryPerson).tableFieldConfig,
    _cache.fromEnum(SalutationCodeField.isPrimaryCompany).tableFieldConfig,
  ]);

  // ==================== FIELD DEFINITIONS ====================

  static ExtendedField<SalutationCodeField, ElbCrmLocalizations> _createField(
    SalutationCodeField field,
  ) {
    return switch (field) {
      // ========== Meta Fields ==========
      SalutationCodeField.deletedAt => ExtendedFieldImpl.date(
          SalutationCodeField.deletedAt,
          readableFunc: (l10n, _) => l10n.gen_deleted_at,
          dateValidatorFunc: (l10n, _) => null,
        ),
      SalutationCodeField.isDraft => ExtendedFieldImpl.boolean(
          SalutationCodeField.isDraft,
          readableFunc: (l10n, _) => l10n.gen_is_draft,
          validatorFunc: (l10n, _) => null,
        ),
      SalutationCodeField.createdAt => ExtendedFieldImpl.date(
          SalutationCodeField.createdAt,
          readableFunc: (l10n, _) => l10n.gen_created_at,
          dateValidatorFunc: (l10n, _) => null,
        ),
      SalutationCodeField.createdBy => ExtendedFieldImpl.assignedUser(
          SalutationCodeField.createdBy,
          readableFunc: (l10n, _) => l10n.gen_created_by,
          isMandatory: false,
        ),
      SalutationCodeField.lastModifiedAt => ExtendedFieldImpl.date(
          SalutationCodeField.lastModifiedAt,
          readableFunc: (l10n, _) => l10n.gen_last_modified_at,
          dateValidatorFunc: (l10n, _) => null,
        ),
      SalutationCodeField.lastModifiedBy => ExtendedFieldImpl.assignedUser(
          SalutationCodeField.lastModifiedBy,
          readableFunc: (l10n, _) => l10n.gen_last_modified_by,
          isMandatory: false,
        ),

      // ========== Entity Fields ==========
      SalutationCodeField.id => const ExtendedFieldImpl.id(
          SalutationCodeField.id,
        ),
      SalutationCodeField.code => ExtendedFieldImpl.text(
          SalutationCodeField.code,
          readableFunc: (l10n, crmL10n) => crmL10n.salutation_code_code,
          validatorFunc: (l10n, _) => (String? value) {
            return TextFieldValidator.isTextNotEmptyOrNull(
              value,
              l10n.validation_required,
            );
          },
        ),
      SalutationCodeField.description => ExtendedFieldImpl.text(
          SalutationCodeField.description,
          readableFunc: (l10n, crmL10n) => crmL10n.salutation_code_description,
          validatorFunc: (l10n, _) => (String? value) {
            return TextFieldValidator.isTextNotEmptyOrNull(
              value,
              l10n.validation_required,
            );
          },
          cellWidth: 200,
        ),
      SalutationCodeField.isPrimaryPerson => ExtendedFieldImpl.boolean(
          SalutationCodeField.isPrimaryPerson,
          readableFunc: (l10n, crmL10n) =>
              crmL10n.salutation_code_primary_person,
          validatorFunc: (l10n, _) => null,
          cellWidth: 200,
        ),
      SalutationCodeField.isPrimaryCompany => ExtendedFieldImpl.boolean(
          SalutationCodeField.isPrimaryCompany,
          readableFunc: (l10n, crmL10n) =>
              crmL10n.salutation_code_primary_company,
          validatorFunc: (l10n, _) => null,
          cellWidth: 230,
        ),
    };
  }
}

// ==================== LIST EXTENSIONS ====================

/// Extension methods for table operations
extension SalutationCodeFieldsTableExt on List<SalutationCodeField> {
  /// Get filterable fields with labels
  Map<SalutationCodeField, TableFieldData> filterableWithLabels(
    ElbCoreLocalizations l10n,
    ElbCrmLocalizations crmL10n,
  ) {
    return ExtendedFieldListExt<SalutationCodeField, ElbCrmLocalizations>(this)
        .buildFilters(
      coreL10n: l10n,
      customL10n: crmL10n,
      fromEnum: SalutationCodeFields.fromEnum,
    );
  }

  /// Get table columns with labels
  Map<SalutationCodeField, TableColumnData> tableColumnsWithLabels(
    ElbCoreLocalizations l10n,
    ElbCrmLocalizations crmL10n,
  ) {
    const excludeFields = {
      SalutationCodeField.deletedAt,
      SalutationCodeField.isDraft,
      SalutationCodeField.id,
    };
    return ExtendedFieldListExt<SalutationCodeField, ElbCrmLocalizations>(this)
        .buildColumns(
      coreL10n: l10n,
      customL10n: crmL10n,
      fromEnum: SalutationCodeFields.fromEnum,
      excludeFields: excludeFields,
    );
  }
}
