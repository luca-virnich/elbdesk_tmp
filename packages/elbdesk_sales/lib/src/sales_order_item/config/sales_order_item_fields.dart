import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_sales/elbdesk_sales.dart';

/// UNIFIED SalesOrderItemField fields with ALL features (forms + tables) in
/// ONE place
/// This replaces SalesOrderItemFieldWrapper and SalesOrderItemFieldExt
class SalesOrderItemFields {
  SalesOrderItemFields._();

  // ==================== FIELD CACHE ====================

  static final _cache = FieldCache<SalesOrderItemField, ElbSalesLocalizations>(
    values: SalesOrderItemField.values,
    createField: _createField,
  );

  static ExtendedField<SalesOrderItemField, ElbSalesLocalizations> fromEnum(
    SalesOrderItemField field,
  ) =>
      _cache.fromEnum(field);

  static ExtendedField<SalesOrderItemField, ElbSalesLocalizations> fromFieldKey(
    String fieldKey,
  ) =>
      _cache.fromFieldKey(fieldKey);

  static final List<TableFieldConfig> defaultTableColumns = List.unmodifiable([
    _cache.fromEnum(SalesOrderItemField.customId).tableFieldConfig,
    _cache.fromEnum(SalesOrderItemField.status).tableFieldConfig,
    _cache.fromEnum(SalesOrderItemField.type).tableFieldConfig,
    _cache.fromEnum(SalesOrderItemField.salesOrderCustomId).tableFieldConfig,
    _cache.fromEnum(SalesOrderItemField.customerName).tableFieldConfig,
    _cache.fromEnum(SalesOrderItemField.assignedUser).tableFieldConfig,
  ]);

  // ==================== FIELD DEFINITIONS ====================

  static ExtendedField<SalesOrderItemField, ElbSalesLocalizations> _createField(
    SalesOrderItemField field,
  ) {
    return switch (field) {
      // ========== Entity Fields ==========
      SalesOrderItemField.customId => const ExtendedFieldImpl.id(
          SalesOrderItemField.customId,
          cellWidth: 80,
        ),
      SalesOrderItemField.salesOrderId => ExtendedFieldImpl.text(
          SalesOrderItemField.salesOrderId,
          readableFunc: (l10n, salesL10n) => salesL10n.sales_order_singular,
          validatorFunc: (l10n, salesL10n) => null,
          filterTypes: DefaultFilterTypes.noFilter,
        ),
      SalesOrderItemField.status => ExtendedFieldImpl.selection(
          SalesOrderItemField.status,
          readableFunc: (l10n, salesL10n) =>
              salesL10n.sales_order_status_singular,
          items: (l10n, salesL10n) => SalesOrderItemStatus.values.map((status) {
            return DropdownItem.selection(
              label: status.readable(l10n),
              value: status,
              color: status.color,
            );
          }).toList(),
          isMandatory: true,
          cellWidth: 140,
        ),

      // TODO(all): Think about making this selection
      SalesOrderItemField.type => ExtendedFieldImpl.textDropdown(
          SalesOrderItemField.type,
          readableFunc: (l10n, salesL10n) => salesL10n.sales_order_item_type,
          isMandatory: true,
          items: (l10n, salesL10n) => SalesOrderItemType.values
              .map(
                (type) => DropdownItem.text(
                  value: type,
                  label: type.readable(l10n, salesL10n),
                ),
              )
              .toList(),
          cellWidth: 180,
        ),
      SalesOrderItemField.soiTypePrimaryKey => ExtendedFieldImpl.integer(
          SalesOrderItemField.soiTypePrimaryKey,
          readableFunc: (l10n, salesL10n) => l10n.gen_id,
          validatorFunc: (l10n, salesL10n) => null,
        ),
      SalesOrderItemField.assignedUser => ExtendedFieldImpl.assignedUser(
          SalesOrderItemField.assignedUser,
          readableFunc: (l10n, salesL10n) => salesL10n.assigned_employee,
          isMandatory: false,
          cellWidth: 200,
        ),
      SalesOrderItemField.description => ExtendedFieldImpl.text(
          SalesOrderItemField.description,
          readableFunc: (l10n, _) => l10n.gen_description,
          validatorFunc: (l10n, salesL10n) => null,
        ),
      SalesOrderItemField.billableTime => ExtendedFieldImpl.integer(
          SalesOrderItemField.billableTime,
          readableFunc: (l10n, salesL10n) =>
              salesL10n.sales_order_item_planned_time,
          validatorFunc: (l10n, salesL10n) => null,
        ),
      SalesOrderItemField.salesOrderCustomId => ExtendedFieldImpl.integer(
          SalesOrderItemField.salesOrderCustomId,
          readableFunc: (l10n, salesL10n) =>
              salesL10n.sales_order_item_sales_order_id,
          validatorFunc: (l10n, salesL10n) => null,
          cellWidth: 160,
        ),
      SalesOrderItemField.customerName => ExtendedFieldImpl.text(
          SalesOrderItemField.customerName,
          readableFunc: (l10n, salesL10n) => salesL10n.customer_singular,
          validatorFunc: (l10n, salesL10n) => null,
          cellWidth: 200,
        ),
      SalesOrderItemField.deadline => ExtendedFieldImpl.date(
          SalesOrderItemField.deadline,
          readableFunc: (l10n, salesL10n) =>
              salesL10n.sales_order_item_deadline,
          dateValidatorFunc: (l10n, salesL10n) => null,
          cellWidth: 160,
        ),
    };
  }

  // ==================== DROPDOWN ITEMS ====================

  static Map<SalesOrderItemField, List<DropdownItem<dynamic>>>
      buildFilterDropdownItems(
    ElbCoreLocalizations l10n,
    ElbSalesLocalizations salesL10n,
  ) {
    return _cache.buildFilterDropdownItems(l10n, salesL10n);
  }
}

// ==================== LIST EXTENSIONS ====================

extension SalesOrderItemFieldsTableExt on List<SalesOrderItemField> {
  /// Returns a map of filterable fields with labels
  Map<SalesOrderItemField, TableFieldData> filters(
    ElbCoreLocalizations l10n,
    ElbSalesLocalizations salesL10n,
  ) {
    const excludeFields = {
      SalesOrderItemField.salesOrderId,
      SalesOrderItemField.soiTypePrimaryKey,
    };
    return ExtendedFieldListExt<SalesOrderItemField, ElbSalesLocalizations>(
      this,
    ).buildFilters(
      coreL10n: l10n,
      customL10n: salesL10n,
      fromEnum: SalesOrderItemFields.fromEnum,
      excludeFields: excludeFields,
    );
  }

  /// Quick search filter for sales order items
  Map<SalesOrderItemField, TableFieldData> quickSearchFilter(
    ElbCoreLocalizations l10n,
    ElbSalesLocalizations salesL10n,
  ) {
    return [
      SalesOrderItemField.customId,
      SalesOrderItemField.salesOrderCustomId,
      SalesOrderItemField.customerName,
    ].buildQuickSearch(
      coreL10n: l10n,
      customL10n: salesL10n,
      fromEnum: SalesOrderItemFields.fromEnum,
    );
  }

  /// Returns a map of table columns with labels
  Map<SalesOrderItemField, TableColumnData> adjustableColumns(
    ElbCoreLocalizations l10n,
    ElbSalesLocalizations salesL10n,
  ) {
    const excludeFields = {
      SalesOrderItemField.salesOrderId,
      SalesOrderItemField.soiTypePrimaryKey,
    };
    return ExtendedFieldListExt<SalesOrderItemField, ElbSalesLocalizations>(
      this,
    ).buildColumns(
      coreL10n: l10n,
      customL10n: salesL10n,
      fromEnum: SalesOrderItemFields.fromEnum,
      excludeFields: excludeFields,
    );
  }
}
