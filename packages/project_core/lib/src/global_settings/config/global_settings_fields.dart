import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';

/// UNIFIED GlobalSettings fields with ALL features (forms + tables) in ONE place
/// This replaces GlobalSettingsFieldWrapper and follows the modern FieldCache pattern
class GlobalSettingsFields {
  GlobalSettingsFields._();

  // ==================== FIELD CACHE ====================

  static final _cache = FieldCache<GlobalSettingsField, ElbCoreLocalizations>(
    values: GlobalSettingsField.values,
    createField: _createField,
  );

  static ExtendedField<GlobalSettingsField, ElbCoreLocalizations> fromEnum(
    GlobalSettingsField field,
  ) =>
      _cache.fromEnum(field);

  static ExtendedField<GlobalSettingsField, ElbCoreLocalizations> fromFieldKey(
    String fieldKey,
  ) =>
      _cache.fromFieldKey(fieldKey);

  // ==================== FIELD DEFINITIONS ====================

  static ExtendedField<GlobalSettingsField, ElbCoreLocalizations> _createField(
    GlobalSettingsField field,
  ) {
    return switch (field) {
      // ========== Identification Fields ==========
      GlobalSettingsField.id => const ExtendedFieldImpl.id(
          GlobalSettingsField.id,
        ),

      // ========== Configuration Fields ==========
      GlobalSettingsField.outputPath => ExtendedFieldImpl.text(
          GlobalSettingsField.outputPath,
          readableFunc: (l10n, _) => l10n.data_import_output_path,
          validatorFunc: (l10n, _) => (String? value) {
            if (value == null || value.isEmpty) return l10n.validation_required;
            return null;
          },
        ),
      GlobalSettingsField.aeEndpointPath => ExtendedFieldImpl.text(
          GlobalSettingsField.aeEndpointPath,
          readableFunc: (l10n, _) => l10n.data_import_ae_endpoint,
          validatorFunc: (l10n, _) => (String? value) {
            if (value == null || value.isEmpty) return l10n.validation_required;
            return null;
          },
        ),

      // ========== System Fields ==========
      GlobalSettingsField.createdAt => ExtendedFieldImpl.date(
          GlobalSettingsField.createdAt,
          readableFunc: (l10n, _) => l10n.gen_created_at,
          dateValidatorFunc: (l10n, _) => null,
        ),
      GlobalSettingsField.createdBy => ExtendedFieldImpl.assignedUser(
          GlobalSettingsField.createdBy,
          readableFunc: (l10n, _) => l10n.gen_created_by,
          isMandatory: false,
        ),
      GlobalSettingsField.lastModifiedAt => ExtendedFieldImpl.date(
          GlobalSettingsField.lastModifiedAt,
          readableFunc: (l10n, _) => l10n.gen_last_modified_at,
          dateValidatorFunc: (l10n, _) => null,
        ),
      GlobalSettingsField.lastModifiedBy => ExtendedFieldImpl.assignedUser(
          GlobalSettingsField.lastModifiedBy,
          readableFunc: (l10n, _) => l10n.gen_last_modified_by,
          isMandatory: false,
        ),
      GlobalSettingsField.deletedAt => ExtendedFieldImpl.date(
          GlobalSettingsField.deletedAt,
          readableFunc: (l10n, _) => l10n.gen_deleted_at,
          dateValidatorFunc: (l10n, _) => null,
          filterTypes: DefaultFilterTypes.noFilter,
        ),
      GlobalSettingsField.isDraft => ExtendedFieldImpl.boolean(
          GlobalSettingsField.isDraft,
          readableFunc: (l10n, _) => l10n.gen_is_draft,
          validatorFunc: (l10n, _) => null,
          filterTypes: DefaultFilterTypes.noFilter,
        ),
    };
  }
}

/// Extension methods for table operations
extension GlobalSettingsFieldsTableExt on List<GlobalSettingsField> {
  /// Returns a map of filterable fields with their labels
  Map<GlobalSettingsField, TableFieldData> filterableWithLabels(
    ElbCoreLocalizations l10n,
  ) {
    return ExtendedFieldListExt<GlobalSettingsField, ElbCoreLocalizations>(this)
        .buildFilters(
      coreL10n: l10n,
      customL10n: l10n,
      fromEnum: GlobalSettingsFields.fromEnum,
    );
  }

  /// Returns a map of table columns with their labels
  Map<GlobalSettingsField, TableColumnData> tableColumnsWithLabels(
    ElbCoreLocalizations l10n,
  ) {
    const excludeFields = {
      GlobalSettingsField.deletedAt,
      GlobalSettingsField.isDraft,
    };

    return ExtendedFieldListExt<GlobalSettingsField, ElbCoreLocalizations>(this)
        .buildColumns(
      coreL10n: l10n,
      customL10n: l10n,
      fromEnum: GlobalSettingsFields.fromEnum,
      excludeFields: excludeFields,
    );
  }
}
