import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations.dart';

/// UNIFIED ShippingMethod fields with ALL features (forms + tables) in ONE place
/// This replaces the old individual static getters approach
class ShippingMethodFields {
  ShippingMethodFields._();

  // ==================== FIELD CACHE ====================

  static final _cache = FieldCache<ShippingMethodField, ElbCrmLocalizations>(
    values: ShippingMethodField.values,
    createField: _createField,
  );

  static ExtendedField<ShippingMethodField, ElbCrmLocalizations> fromEnum(
    ShippingMethodField field,
  ) =>
      _cache.fromEnum(field);

  static ExtendedField<ShippingMethodField, ElbCrmLocalizations> fromFieldKey(
    String fieldKey,
  ) =>
      _cache.fromFieldKey(fieldKey);

  static final List<TableFieldConfig> defaultTableColumns = List.unmodifiable([
    _cache.fromEnum(ShippingMethodField.code).tableFieldConfig,
    _cache.fromEnum(ShippingMethodField.description).tableFieldConfig,
    _cache.fromEnum(ShippingMethodField.isActive).tableFieldConfig,
    _cache.fromEnum(ShippingMethodField.createdAt).tableFieldConfig,
    _cache.fromEnum(ShippingMethodField.createdBy).tableFieldConfig,
    _cache.fromEnum(ShippingMethodField.lastModifiedAt).tableFieldConfig,
    _cache.fromEnum(ShippingMethodField.lastModifiedBy).tableFieldConfig,
  ]);

  // ==================== FIELD DEFINITIONS ====================

  static ExtendedField<ShippingMethodField, ElbCrmLocalizations> _createField(
    ShippingMethodField field,
  ) {
    return switch (field) {
      // ========== Meta Fields ==========
      ShippingMethodField.deletedAt => ExtendedFieldImpl.date(
          ShippingMethodField.deletedAt,
          readableFunc: (l10n, _) => l10n.gen_deleted_at,
          dateValidatorFunc: (l10n, _) => null,
          filterTypes: DefaultFilterTypes.noFilter,
        ),
      ShippingMethodField.isDraft => ExtendedFieldImpl.boolean(
          ShippingMethodField.isDraft,
          readableFunc: (l10n, _) => l10n.gen_is_draft,
          validatorFunc: (l10n, _) => null,
          filterTypes: DefaultFilterTypes.noFilter,
        ),
      ShippingMethodField.createdAt => ExtendedFieldImpl.date(
          ShippingMethodField.createdAt,
          readableFunc: (l10n, _) => l10n.gen_created_at,
          dateValidatorFunc: (l10n, _) => null,
        ),
      ShippingMethodField.createdBy => ExtendedFieldImpl.assignedUser(
          ShippingMethodField.createdBy,
          readableFunc: (l10n, _) => l10n.gen_created_by,
          isMandatory: false,
        ),
      ShippingMethodField.lastModifiedAt => ExtendedFieldImpl.date(
          ShippingMethodField.lastModifiedAt,
          readableFunc: (l10n, _) => l10n.gen_last_modified_at,
          dateValidatorFunc: (l10n, _) => null,
        ),
      ShippingMethodField.lastModifiedBy => ExtendedFieldImpl.assignedUser(
          ShippingMethodField.lastModifiedBy,
          readableFunc: (l10n, _) => l10n.gen_last_modified_by,
          isMandatory: false,
        ),

      // ========== Entity Fields ==========
      ShippingMethodField.id => const ExtendedFieldImpl.id(
          ShippingMethodField.id,
        ),
      ShippingMethodField.code => ExtendedFieldImpl.text(
          ShippingMethodField.code,
          readableFunc: (l10n, crmL10n) => crmL10n.shipping_method_code,
          validatorFunc: (l10n, _) => (String? value) {
            return TextFieldValidator.isTextNotEmptyOrNull(
              value,
              l10n.validation_required,
            );
          },
        ),
      ShippingMethodField.description => ExtendedFieldImpl.text(
          ShippingMethodField.description,
          readableFunc: (l10n, crmL10n) => crmL10n.shipping_method_description,
          validatorFunc: (l10n, _) => (String? value) {
            return TextFieldValidator.isTextNotEmptyOrNull(
              value,
              l10n.validation_required,
            );
          },
          cellWidth: 200,
        ),
      ShippingMethodField.isActive => ExtendedFieldImpl.boolean(
          ShippingMethodField.isActive,
          readableFunc: (l10n, crmL10n) => crmL10n.shipping_method_is_activated,
          validatorFunc: (l10n, _) => null,
        ),
    };
  }
}

// ==================== LIST EXTENSIONS ====================

/// Extension methods for table operations
extension ShippingMethodFieldsTableExt on List<ShippingMethodField> {
  /// Get filterable fields with labels
  Map<ShippingMethodField, TableFieldData> filterableWithLabels(
    ElbCoreLocalizations l10n,
    ElbCrmLocalizations crmL10n,
  ) {
    return ExtendedFieldListExt<ShippingMethodField, ElbCrmLocalizations>(this)
        .buildFilters(
      coreL10n: l10n,
      customL10n: crmL10n,
      fromEnum: ShippingMethodFields.fromEnum,
    );
  }

  /// Get table columns with labels
  Map<ShippingMethodField, TableColumnData> tableColumnsWithLabels(
    ElbCoreLocalizations l10n,
    ElbCrmLocalizations crmL10n,
  ) {
    const excludeFields = {
      ShippingMethodField.deletedAt,
      ShippingMethodField.isDraft,
      ShippingMethodField.id,
    };
    return ExtendedFieldListExt<ShippingMethodField, ElbCrmLocalizations>(this)
        .buildColumns(
      coreL10n: l10n,
      customL10n: crmL10n,
      fromEnum: ShippingMethodFields.fromEnum,
      excludeFields: excludeFields,
    );
  }
}
