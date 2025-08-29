import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations.dart';

/// UNIFIED PaymentCode fields with ALL features (forms + tables) in ONE place
/// This replaces the old individual static getters approach
class PaymentCodeFields {
  PaymentCodeFields._();

  // ==================== FIELD CACHE ====================

  static final _cache = FieldCache<PaymentCodeField, ElbCrmLocalizations>(
    values: PaymentCodeField.values,
    createField: _createField,
  );

  static ExtendedField<PaymentCodeField, ElbCrmLocalizations> fromEnum(
    PaymentCodeField field,
  ) =>
      _cache.fromEnum(field);

  static ExtendedField<PaymentCodeField, ElbCrmLocalizations> fromFieldKey(
    String fieldKey,
  ) =>
      _cache.fromFieldKey(fieldKey);

  static final List<TableFieldConfig> defaultTableColumns = List.unmodifiable([
    _cache.fromEnum(PaymentCodeField.code).tableFieldConfig,
    _cache.fromEnum(PaymentCodeField.dueDateCalculation).tableFieldConfig,
    _cache.fromEnum(PaymentCodeField.discountDateCalculation).tableFieldConfig,
    _cache.fromEnum(PaymentCodeField.discountPercentage).tableFieldConfig,
    _cache
        .fromEnum(PaymentCodeField.calculateDiscountOnCreditNote)
        .tableFieldConfig,
    _cache.fromEnum(PaymentCodeField.description).tableFieldConfig,
  ]);

  // ==================== FIELD DEFINITIONS ====================

  static ExtendedField<PaymentCodeField, ElbCrmLocalizations> _createField(
    PaymentCodeField field,
  ) {
    return switch (field) {
      // ========== Meta Fields ==========
      PaymentCodeField.deletedAt => ExtendedFieldImpl.date(
          PaymentCodeField.deletedAt,
          readableFunc: (l10n, _) => l10n.gen_deleted_at,
          dateValidatorFunc: (l10n, _) => null,
          filterTypes: DefaultFilterTypes.noFilter,
        ),
      PaymentCodeField.isDraft => ExtendedFieldImpl.boolean(
          PaymentCodeField.isDraft,
          readableFunc: (l10n, _) => l10n.gen_is_draft,
          validatorFunc: (l10n, _) => null,
          filterTypes: DefaultFilterTypes.noFilter,
        ),
      PaymentCodeField.createdAt => ExtendedFieldImpl.date(
          PaymentCodeField.createdAt,
          readableFunc: (l10n, _) => l10n.gen_created_at,
          dateValidatorFunc: (l10n, _) => null,
        ),
      PaymentCodeField.createdBy => ExtendedFieldImpl.assignedUser(
          PaymentCodeField.createdBy,
          readableFunc: (l10n, _) => l10n.gen_created_by,
          isMandatory: false,
        ),
      PaymentCodeField.lastModifiedAt => ExtendedFieldImpl.date(
          PaymentCodeField.lastModifiedAt,
          readableFunc: (l10n, _) => l10n.gen_last_modified_at,
          dateValidatorFunc: (l10n, _) => null,
        ),
      PaymentCodeField.lastModifiedBy => ExtendedFieldImpl.assignedUser(
          PaymentCodeField.lastModifiedBy,
          readableFunc: (l10n, _) => l10n.gen_last_modified_by,
          isMandatory: false,
        ),

      // ========== Entity Fields ==========
      PaymentCodeField.id => const ExtendedFieldImpl.id(
          PaymentCodeField.id,
        ),
      PaymentCodeField.code => ExtendedFieldImpl.text(
          PaymentCodeField.code,
          readableFunc: (l10n, crmL10n) => crmL10n.payment_code_code,
          validatorFunc: (l10n, _) => (String? value) {
            return TextFieldValidator.isTextNotEmptyOrNull(
              value,
              l10n.validation_required,
            );
          },
        ),
      PaymentCodeField.description => ExtendedFieldImpl.text(
          PaymentCodeField.description,
          readableFunc: (l10n, crmL10n) => crmL10n.payment_code_description,
          validatorFunc: (l10n, _) => (String? value) {
            return TextFieldValidator.isTextNotEmptyOrNull(
              value,
              l10n.validation_required,
            );
          },
          cellWidth: 200,
        ),
      PaymentCodeField.dueDateCalculation => ExtendedFieldImpl.text(
          PaymentCodeField.dueDateCalculation,
          readableFunc: (l10n, crmL10n) =>
              crmL10n.payment_code_due_date_calculation,
          validatorFunc: (l10n, crmL10n) => (String? value) {
            if (value == null || value.trim().isEmpty) {
              return null;
            }
            final trimmed = value.trim();
            final regex = RegExp(r'^\d+(?:WD|[DWMQY])$');
            if (!regex.hasMatch(trimmed)) {
              return crmL10n.payment_code_due_date_calculation_error_hint;
            }
            return null;
          },
          cellWidth: 200,
        ),
      PaymentCodeField.discountDateCalculation => ExtendedFieldImpl.text(
          PaymentCodeField.discountDateCalculation,
          readableFunc: (l10n, crmL10n) =>
              crmL10n.payment_code_discount_date_calculation,
          validatorFunc: (l10n, crmL10n) => (String? value) {
            if (value == null || value.trim().isEmpty) {
              return null;
            }
            final trimmed = value.trim();
            final regex = RegExp(r'^\d+(?:WD|[DWMQY])$');
            if (!regex.hasMatch(trimmed)) {
              return crmL10n.payment_code_discount_date_calculation_error_hint;
            }
            return null;
          },
          cellWidth: 200,
        ),
      PaymentCodeField.discountPercentage => ExtendedFieldImpl.text(
          PaymentCodeField.discountPercentage,
          readableFunc: (l10n, crmL10n) =>
              crmL10n.payment_code_discount_percentage,
          validatorFunc: (l10n, crmL10n) => (String? value) {
            if (value == null || value.trim().isEmpty) {
              return null;
            }
            return AppValidator.isValidDouble(value)
                ? null
                : l10n.gen_invalid_number;
          },
          cellWidth: 200,
        ),
      PaymentCodeField.calculateDiscountOnCreditNote =>
        ExtendedFieldImpl.boolean(
          PaymentCodeField.calculateDiscountOnCreditNote,
          readableFunc: (l10n, crmL10n) =>
              crmL10n.payment_code_calculate_discount_on_credit_note,
          validatorFunc: (l10n, crmL10n) => null,
          cellWidth: 200,
        ),
    };
  }
}

// ==================== LIST EXTENSIONS ====================

/// Extension methods for table operations
extension PaymentCodeFieldsTableExt on List<PaymentCodeField> {
  /// Get filterable fields with labels
  Map<PaymentCodeField, TableFieldData> filterableWithLabels(
    ElbCoreLocalizations l10n,
    ElbCrmLocalizations crmL10n,
  ) {
    return ExtendedFieldListExt<PaymentCodeField, ElbCrmLocalizations>(this)
        .buildFilters(
      coreL10n: l10n,
      customL10n: crmL10n,
      fromEnum: PaymentCodeFields.fromEnum,
    );
  }

  /// Get table columns with labels
  Map<PaymentCodeField, TableColumnData> tableColumnsWithLabels(
    ElbCoreLocalizations l10n,
    ElbCrmLocalizations crmL10n,
  ) {
    const excludeFields = {
      PaymentCodeField.deletedAt,
      PaymentCodeField.isDraft,
      PaymentCodeField.id,
    };
    return ExtendedFieldListExt<PaymentCodeField, ElbCrmLocalizations>(this)
        .buildColumns(
      coreL10n: l10n,
      customL10n: crmL10n,
      fromEnum: PaymentCodeFields.fromEnum,
      excludeFields: excludeFields,
    );
  }
}
