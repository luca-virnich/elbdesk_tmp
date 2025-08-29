import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/l10n/elb_prepress_localizations.dart';

/// UNIFIED ProductLogField fields with ALL features (forms + tables) in ONE
/// place
/// This replaces ProductLogFieldWrapper and ProductLogFieldExt
class ProductLogFields {
  ProductLogFields._();

  // ==================== FIELD CACHE ====================

  static final _cache = FieldCache<ProductLogField, ElbPrepressLocalizations>(
    values: ProductLogField.values,
    createField: _createField,
  );

  static ExtendedField<ProductLogField, ElbPrepressLocalizations> fromEnum(
    ProductLogField field,
  ) =>
      _cache.fromEnum(field);

  static ExtendedField<ProductLogField, ElbPrepressLocalizations> fromFieldKey(
    String fieldKey,
  ) =>
      _cache.fromFieldKey(fieldKey);

  // ==================== FIELD DEFINITIONS ====================

  static ExtendedField<ProductLogField, ElbPrepressLocalizations> _createField(
    ProductLogField field,
  ) {
    return switch (field) {
      // ========== Log Fields ==========
      ProductLogField.id => const ExtendedFieldImpl.id(
          ProductLogField.id,
        ),
      ProductLogField.entityId => ExtendedFieldImpl.text(
          ProductLogField.entityId,
          readableFunc: (l10n, ppL10n) => l10n.id,
          validatorFunc: (l10n, ppL10n) => null,
        ),
      ProductLogField.salesOrderId => ExtendedFieldImpl.text(
          ProductLogField.salesOrderId,
          readableFunc: (l10n, ppL10n) => ppL10n.sales_sales_order_singular,
          validatorFunc: (l10n, ppL10n) => null,
        ),
      ProductLogField.salesOrderCustomId => ExtendedFieldImpl.text(
          ProductLogField.salesOrderCustomId,
          readableFunc: (l10n, ppL10n) => ppL10n.sales_sales_order_singular,
          validatorFunc: (l10n, ppL10n) => null,
        ),
      ProductLogField.oldValue => ExtendedFieldImpl.text(
          ProductLogField.oldValue,
          readableFunc: (l10n, _) => l10n.history_log_old_value,
          validatorFunc: (_, __) => null,
        ),
      ProductLogField.newValue => ExtendedFieldImpl.text(
          ProductLogField.newValue,
          readableFunc: (l10n, _) => l10n.history_log_new_value,
          validatorFunc: (_, __) => null,
        ),
      ProductLogField.field => ExtendedFieldImpl.text(
          ProductLogField.field,
          readableFunc: (l10n, _) => l10n.history_log_field,
          validatorFunc: (_, __) => null,
        ),
      ProductLogField.tableType => ExtendedFieldImpl.text(
          ProductLogField.tableType,
          readableFunc: (l10n, _) => l10n.gen_table_type,
          validatorFunc: (_, __) => null,
        ),
      ProductLogField.updatedAt => ExtendedFieldImpl.date(
          ProductLogField.updatedAt,
          readableFunc: (l10n, _) => l10n.gen_updated_at,
          dateValidatorFunc: (_, __) => null,
        ),
      ProductLogField.updatedBy => ExtendedFieldImpl.text(
          ProductLogField.updatedBy,
          readableFunc: (l10n, _) => l10n.gen_updated_by,
          validatorFunc: (_, __) => null,
        ),
    };
  }

  // ==================== DROPDOWN ITEMS ====================

  static Map<ProductLogField, List<DropdownItem<dynamic>>>
      buildFilterDropdownItems(
    ElbCoreLocalizations l10n,
    ElbPrepressLocalizations ppL10n,
  ) {
    return _cache.buildFilterDropdownItems(l10n, ppL10n);
  }
}

// ==================== LIST EXTENSIONS ====================

extension ProductLogFieldsTableExt on List<ProductLogField> {
  Map<ProductLogField, TableFieldData> filters(
    ElbCoreLocalizations l10n,
    ElbPrepressLocalizations ppL10n,
  ) {
    return ExtendedFieldListExt<ProductLogField, ElbPrepressLocalizations>(this)
        .buildFilters(
      coreL10n: l10n,
      customL10n: ppL10n,
      fromEnum: ProductLogFields.fromEnum,
    );
  }

  Map<ProductLogField, TableColumnData> columns(
    ElbCoreLocalizations l10n,
    ElbPrepressLocalizations ppL10n,
  ) {
    return ExtendedFieldListExt<ProductLogField, ElbPrepressLocalizations>(this)
        .buildColumns(
      coreL10n: l10n,
      customL10n: ppL10n,
      fromEnum: ProductLogFields.fromEnum,
    );
  }
}
