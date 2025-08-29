import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations.dart';

class LanguageCodeFields {
  LanguageCodeFields._();

  // ==================== FIELD CACHE ====================

  static final _cache = FieldCache<LanguageCodeField, ElbCrmLocalizations>(
    values: LanguageCodeField.values,
    createField: _createField,
  );

  static ExtendedField<LanguageCodeField, ElbCrmLocalizations> fromEnum(
    LanguageCodeField field,
  ) =>
      _cache.fromEnum(field);

  static ExtendedField<LanguageCodeField, ElbCrmLocalizations> fromFieldKey(
    String fieldKey,
  ) =>
      _cache.fromFieldKey(fieldKey);

  static final List<TableFieldConfig> defaultTableColumns = List.unmodifiable([
    _cache.fromEnum(LanguageCodeField.code).tableFieldConfig,
    _cache.fromEnum(LanguageCodeField.languageName).tableFieldConfig,
    _cache.fromEnum(LanguageCodeField.isPrimary).tableFieldConfig,
  ]);

  // ==================== FIELD DEFINITIONS ====================

  static ExtendedField<LanguageCodeField, ElbCrmLocalizations> _createField(
    LanguageCodeField field,
  ) {
    return switch (field) {
      // ========== Meta Fields ==========
      LanguageCodeField.deletedAt => ExtendedFieldImpl.date(
          LanguageCodeField.deletedAt,
          readableFunc: (l10n, _) => l10n.gen_deleted_at,
          dateValidatorFunc: (l10n, _) => null,
          filterTypes: DefaultFilterTypes.noFilter,
        ),
      LanguageCodeField.isDraft => ExtendedFieldImpl.boolean(
          LanguageCodeField.isDraft,
          readableFunc: (l10n, _) => l10n.gen_is_draft,
          validatorFunc: (l10n, _) => null,
          filterTypes: DefaultFilterTypes.noFilter,
        ),
      LanguageCodeField.createdAt => ExtendedFieldImpl.date(
          LanguageCodeField.createdAt,
          readableFunc: (l10n, _) => l10n.gen_created_at,
          dateValidatorFunc: (l10n, _) => null,
        ),
      LanguageCodeField.createdBy => ExtendedFieldImpl.assignedUser(
          LanguageCodeField.createdBy,
          readableFunc: (l10n, _) => l10n.gen_created_by,
          isMandatory: false,
        ),
      LanguageCodeField.lastModifiedAt => ExtendedFieldImpl.date(
          LanguageCodeField.lastModifiedAt,
          readableFunc: (l10n, _) => l10n.gen_last_modified_at,
          dateValidatorFunc: (l10n, _) => null,
        ),
      LanguageCodeField.lastModifiedBy => ExtendedFieldImpl.assignedUser(
          LanguageCodeField.lastModifiedBy,
          readableFunc: (l10n, _) => l10n.gen_last_modified_by,
          isMandatory: false,
        ),

      // ========== Entity Fields ==========
      LanguageCodeField.id => const ExtendedFieldImpl.id(
          LanguageCodeField.id,
        ),
      LanguageCodeField.code => ExtendedFieldImpl.text(
          LanguageCodeField.code,
          readableFunc: (l10n, crmL10n) => crmL10n.language_code_code,
          validatorFunc: (l10n, _) => (String? value) {
            return TextFieldValidator.isTextNotEmptyOrNull(
              value,
              l10n.validation_required,
            );
          },
        ),
      LanguageCodeField.languageName => ExtendedFieldImpl.text(
          LanguageCodeField.languageName,
          readableFunc: (l10n, crmL10n) => crmL10n.language_code_name,
          validatorFunc: (l10n, _) => (String? value) {
            return TextFieldValidator.isTextNotEmptyOrNull(
              value,
              l10n.validation_required,
            );
          },
          cellWidth: 200,
        ),
      LanguageCodeField.isPrimary => ExtendedFieldImpl.boolean(
          LanguageCodeField.isPrimary,
          readableFunc: (l10n, crmL10n) => crmL10n.language_code_primary,
          validatorFunc: (l10n, _) => null,
          cellWidth: 120,
        ),
    };
  }
}

// ==================== LIST EXTENSIONS ====================

extension LanguageCodeFieldsTableExt on List<LanguageCodeField> {
  Map<LanguageCodeField, TableFieldData> filterableWithLabels(
    ElbCoreLocalizations l10n,
    ElbCrmLocalizations crmL10n,
  ) {
    return ExtendedFieldListExt<LanguageCodeField, ElbCrmLocalizations>(this)
        .buildFilters(
      coreL10n: l10n,
      customL10n: crmL10n,
      fromEnum: LanguageCodeFields.fromEnum,
    );
  }

  Map<LanguageCodeField, TableColumnData> tableColumnsWithLabels(
    ElbCoreLocalizations l10n,
    ElbCrmLocalizations crmL10n,
  ) {
    const excludeFields = {
      LanguageCodeField.deletedAt,
      LanguageCodeField.isDraft,
      LanguageCodeField.id,
    };
    return ExtendedFieldListExt<LanguageCodeField, ElbCrmLocalizations>(this)
        .buildColumns(
      coreL10n: l10n,
      customL10n: crmL10n,
      fromEnum: LanguageCodeFields.fromEnum,
      excludeFields: excludeFields,
    );
  }
}
