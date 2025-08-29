import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_sales/elbdesk_sales.dart';
import 'package:flutter/material.dart';

/// UNIFIED SalesOrder fields with ALL features (forms + tables) in ONE place
/// This replaces both SalesOrderField extensions and SalesOrderFieldWrapper
class SalesOrderFields {
  SalesOrderFields._();

  // ==================== FIELD CACHE ====================

  static final _cache = FieldCache<SalesOrderField, ElbSalesLocalizations>(
    values: SalesOrderField.values,
    createField: _createField,
  );

  static ExtendedField<SalesOrderField, ElbSalesLocalizations> fromEnum(
    SalesOrderField field,
  ) =>
      _cache.fromEnum(field);

  static ExtendedField<SalesOrderField, ElbSalesLocalizations> fromFieldKey(
    String fieldKey,
  ) =>
      _cache.fromFieldKey(fieldKey);

  static final List<TableFieldConfig> defaultColumns = List.unmodifiable([
    _cache.fromEnum(SalesOrderField.customId).tableFieldConfig,
    _cache.fromEnum(SalesOrderField.customerName).tableFieldConfig,
    _cache.fromEnum(SalesOrderField.orderNumber).tableFieldConfig,
    _cache.fromEnum(SalesOrderField.status).tableFieldConfig,
    _cache.fromEnum(SalesOrderField.keywords).tableFieldConfig,
    _cache.fromEnum(SalesOrderField.assignedUser).tableFieldConfig,
  ]);

  static final List<TableFieldConfig> defaultByCustomerColumns =
      List.unmodifiable([
    _cache.fromEnum(SalesOrderField.customId).tableFieldConfig,
    _cache.fromEnum(SalesOrderField.status).tableFieldConfig,
    _cache.fromEnum(SalesOrderField.keywords).tableFieldConfig,
    _cache.fromEnum(SalesOrderField.orderDate).tableFieldConfig,
    _cache.fromEnum(SalesOrderField.assignedUser).tableFieldConfig,
  ]);

  // ==================== FIELD DEFINITIONS ====================

  static ExtendedField<SalesOrderField, ElbSalesLocalizations> _createField(
    SalesOrderField field,
  ) {
    return switch (field) {
      // ========== Meta Fields ==========
      SalesOrderField.deletedAt => ExtendedFieldImpl.date(
          SalesOrderField.deletedAt,
          readableFunc: (l10n, _) => l10n.gen_deleted_at,
          dateValidatorFunc: (l10n, _) => null,
          filterTypes: DefaultFilterTypes.noFilter,
          excludeFromTable: true,
        ),
      SalesOrderField.isDraft => ExtendedFieldImpl.boolean(
          SalesOrderField.isDraft,
          readableFunc: (l10n, _) => l10n.gen_is_draft,
          validatorFunc: (l10n, _) => null,
          filterTypes: DefaultFilterTypes.noFilter,
          excludeFromTable: true,
        ),
      SalesOrderField.createdAt => ExtendedFieldImpl.date(
          SalesOrderField.createdAt,
          readableFunc: (l10n, _) => l10n.gen_created_at,
          dateValidatorFunc: (l10n, _) => null,
        ),
      SalesOrderField.createdBy => ExtendedFieldImpl.assignedUser(
          SalesOrderField.createdBy,
          readableFunc: (l10n, _) => l10n.gen_created_by,
          isMandatory: false,
        ),
      SalesOrderField.lastModifiedAt => ExtendedFieldImpl.date(
          SalesOrderField.lastModifiedAt,
          readableFunc: (l10n, _) => l10n.gen_last_modified_at,
          dateValidatorFunc: (l10n, _) => null,
        ),
      SalesOrderField.lastModifiedBy => ExtendedFieldImpl.assignedUser(
          SalesOrderField.lastModifiedBy,
          readableFunc: (l10n, _) => l10n.gen_last_modified_by,
          isMandatory: false,
        ),

      // ========== Entity Fields ==========
      SalesOrderField.customId => ExtendedFieldImpl.integer(
          SalesOrderField.customId,
          readableFunc: (l10n, _) => l10n.id,
          validatorFunc: (l10n, _) => null,
          // customId is filterable through customIdString
          filterTypes: DefaultFilterTypes.noFilter,
        ),
      SalesOrderField.customIdString => ExtendedFieldImpl.text(
          SalesOrderField.customIdString,
          readableFunc: (l10n, _) => l10n.id,
          validatorFunc: (l10n, _) => null,
          excludeFromTable: true,
          cellWidth: 120,
        ),
      SalesOrderField.description => ExtendedFieldImpl.text(
          SalesOrderField.description,
          readableFunc: (l10n, salesL10n) => salesL10n.sales_order_description,
          validatorFunc: (l10n, _) => null,
          maxLines: 6,
          minLines: 3,
          keyboardType: TextInputType.multiline,
        ),
      SalesOrderField.orderDate => ExtendedFieldImpl.date(
          SalesOrderField.orderDate,
          readableFunc: (l10n, salesL10n) => salesL10n.sales_order_order_date,
          dateValidatorFunc: (l10n, _) => (value) {
            if (value == null) {
              return l10n.validation_invalid_date;
            }
            return null;
          },
        ),
      SalesOrderField.status => ExtendedFieldImpl.selection(
          SalesOrderField.status,
          readableFunc: (l10n, salesL10n) =>
              salesL10n.sales_order_status_singular,
          items: (l10n, salesL10n) =>
              SalesOrderStatus.values.orderedStatus.map((status) {
            return DropdownItem.selection(
              label: status.readable(l10n),
              value: status,
              color: status.color,
            );
          }).toList(),
          isMandatory: true,
        ),
      SalesOrderField.customerId => ExtendedFieldImpl.integer(
          SalesOrderField.customerId,
          readableFunc: (l10n, salesL10n) => salesL10n.sales_order_customer_id,
          validatorFunc: (l10n, _) => (value) {
            if (value == null) return null;
            if (int.tryParse(value) == null) {
              return l10n.validation_invalid_number;
            }
            return null;
          },
        ),
      SalesOrderField.customerName => ExtendedFieldImpl.text(
          SalesOrderField.customerName,
          readableFunc: (l10n, salesL10n) => salesL10n.sales_order_customer,
          validatorFunc: (l10n, _) => (value) {
            return TextFieldValidator.isTextNotEmptyOrNull(
              value,
              l10n.validation_name_required,
            );
          },
        ),
      SalesOrderField.keywords => ExtendedFieldImpl.text(
          SalesOrderField.keywords,
          readableFunc: (l10n, salesL10n) =>
              salesL10n.prepress_product_keywords,
          validatorFunc: (l10n, _) => null,
          cellWidth: 250,
        ),
      SalesOrderField.orderNumber => ExtendedFieldImpl.text(
          SalesOrderField.orderNumber,
          readableFunc: (l10n, salesL10n) => salesL10n.sales_order_order_number,
          validatorFunc: (l10n, _) => null,
          cellWidth: 170,
        ),
      SalesOrderField.assignedUser => ExtendedFieldImpl.assignedUser(
          SalesOrderField.assignedUser,
          readableFunc: (l10n, salesL10n) =>
              salesL10n.sales_order_assigned_user,
          isMandatory: true,
          cellWidth: 200,
        ),

      // ========== Customer Reference Fields ==========
      SalesOrderField.customerFirstReference => ExtendedFieldImpl.text(
          SalesOrderField.customerFirstReference,
          readableFunc: (l10n, salesL10n) =>
              salesL10n.customer_sales_order_first_ref,
          validatorFunc: (l10n, _) => null,
          filterTypes: DefaultFilterTypes.noFilter,
          excludeFromTable: true,
        ),
      SalesOrderField.customerSecondReference => ExtendedFieldImpl.text(
          SalesOrderField.customerSecondReference,
          readableFunc: (l10n, salesL10n) => salesL10n.sales_order_keywords,
          validatorFunc: (l10n, _) => null,
          filterTypes: DefaultFilterTypes.noFilter,
          excludeFromTable: true,
        ),
      SalesOrderField.customerCustomerReference => ExtendedFieldImpl.text(
          SalesOrderField.customerCustomerReference,
          readableFunc: (l10n, salesL10n) =>
              salesL10n.sales_order_customer_customer_ref,
          validatorFunc: (l10n, _) => null,
          filterTypes: DefaultFilterTypes.noFilter,
          excludeFromTable: true,
        ),
      SalesOrderField.customerContactPerson => ExtendedFieldImpl.text(
          SalesOrderField.customerContactPerson,
          readableFunc: (l10n, salesL10n) =>
              salesL10n.crm_customer_contact_person,
          validatorFunc: (l10n, _) => null,
          filterTypes: DefaultFilterTypes.noFilter,
          excludeFromTable: true,
        ),
      SalesOrderField.customerCustomerContactPerson => ExtendedFieldImpl.text(
          SalesOrderField.customerCustomerContactPerson,
          readableFunc: (l10n, salesL10n) =>
              salesL10n.crm_customer_customer_contact_person,
          validatorFunc: (l10n, _) => null,
          filterTypes: DefaultFilterTypes.noFilter,
          excludeFromTable: true,
        ),
      SalesOrderField.customerCustomer => ExtendedFieldImpl.text(
          SalesOrderField.customerCustomer,
          readableFunc: (l10n, salesL10n) => salesL10n.crm_customer_customer,
          validatorFunc: (l10n, _) => null,
          filterTypes: DefaultFilterTypes.noFilter,
        ),

      // ========== Address Fields ==========
      SalesOrderField.billingAddress => ExtendedFieldImpl.text(
          SalesOrderField.billingAddress,
          readableFunc: (l10n, salesL10n) =>
              salesL10n.sales_order_billing_address,
          validatorFunc: (l10n, _) => null,
          excludeFromTable: true,
        ),
      SalesOrderField.shippingAddress => ExtendedFieldImpl.text(
          SalesOrderField.shippingAddress,
          readableFunc: (l10n, salesL10n) =>
              salesL10n.crm_customer_shipping_address,
          validatorFunc: (l10n, _) => null,
          excludeFromTable: true,
        ),

      // ========== Filter Fields ==========
      SalesOrderField.filterByIdOrName => ExtendedFieldImpl.text(
          SalesOrderField.filterByIdOrName,
          readableFunc: (l10n, salesL10n) =>
              salesL10n.sales_order_id_and_description,
          validatorFunc: (l10n, _) => null,
          excludeFromTable: true,
        ),
    };
  }

  // ==================== DROPDOWN HELPERS ====================

  /// Build filter dropdown items for all fields with items
  /// Delegates to cache which converts selection items to text-only
  static Map<SalesOrderField, List<DropdownItem<dynamic>>>
      buildFilterDropdownItems(
    ElbCoreLocalizations l10n,
    ElbSalesLocalizations salesL10n,
  ) {
    return _cache.buildFilterDropdownItems(l10n, salesL10n);
  }
}

// ==================== LIST EXTENSIONS ====================

extension SalesOrderFieldsTableExt on List<SalesOrderField> {
  /// Returns a map of filterable fields with labels (standard)
  Map<SalesOrderField, TableFieldData> filters(
    ElbCoreLocalizations l10n,
    ElbSalesLocalizations salesL10n,
  ) {
    final priorityFields = [
      SalesOrderField.filterByIdOrName,
    ];
    return ExtendedFieldListExt<SalesOrderField, ElbSalesLocalizations>(
      this,
    ).buildFilters(
      coreL10n: l10n,
      customL10n: salesL10n,
      fromEnum: SalesOrderFields.fromEnum,
      priorityFields: priorityFields,
    );
  }

  /// Returns a map of filterable fields with labels (by customer)
  Map<SalesOrderField, TableFieldData> filtersByCustomer(
    ElbCoreLocalizations l10n,
    ElbSalesLocalizations salesL10n,
  ) {
    final priorityFields = [
      SalesOrderField.filterByIdOrName,
    ];
    final excludeFields = {
      SalesOrderField.customerId,
      SalesOrderField.customerName,
    };

    return ExtendedFieldListExt<SalesOrderField, ElbSalesLocalizations>(
      this,
    ).buildFilters(
      coreL10n: l10n,
      customL10n: salesL10n,
      fromEnum: SalesOrderFields.fromEnum,
      excludeFields: excludeFields,
      priorityFields: priorityFields,
    );
  }

  /// Quick search filter (standard)
  Map<SalesOrderField, TableFieldData> quickSearchFilters(
    ElbCoreLocalizations l10n,
    ElbSalesLocalizations salesL10n,
  ) {
    return [
      SalesOrderField.customIdString,
      SalesOrderField.customerName,
      SalesOrderField.orderNumber,
    ].buildQuickSearch(
      coreL10n: l10n,
      customL10n: salesL10n,
      fromEnum: SalesOrderFields.fromEnum,
    );
  }

  /// Quick search filter (by customer)
  Map<SalesOrderField, TableFieldData> quickSearchFiltersByCustomer(
    ElbCoreLocalizations l10n,
    ElbSalesLocalizations salesL10n,
  ) {
    return [
      SalesOrderField.customIdString,
      SalesOrderField.orderNumber,
    ].buildQuickSearch(
      coreL10n: l10n,
      customL10n: salesL10n,
      fromEnum: SalesOrderFields.fromEnum,
    );
  }

  /// Returns a map of table columns with labels (standard)
  Map<SalesOrderField, TableColumnData> columns(
    ElbCoreLocalizations l10n,
    ElbSalesLocalizations salesL10n,
  ) {
    return ExtendedFieldListExt<SalesOrderField, ElbSalesLocalizations>(
      this,
    ).buildColumns(
      coreL10n: l10n,
      customL10n: salesL10n,
      fromEnum: SalesOrderFields.fromEnum,
    );
  }

  /// Returns a map of table columns with labels (by customer)
  Map<SalesOrderField, TableColumnData> columnsByCustomer(
    ElbCoreLocalizations l10n,
    ElbSalesLocalizations salesL10n,
  ) {
    const excludeFields = {
      // customer
      SalesOrderField.customerId,
      SalesOrderField.customerName,
      SalesOrderField.customerFirstReference,
      SalesOrderField.customerSecondReference,
      SalesOrderField.customerContactPerson,

      // customer customer
      SalesOrderField.customerCustomer,
      SalesOrderField.customerCustomerContactPerson,
      SalesOrderField.customerCustomerReference,
    };
    return ExtendedFieldListExt<SalesOrderField, ElbSalesLocalizations>(
      this,
    ).buildColumns(
      coreL10n: l10n,
      customL10n: salesL10n,
      fromEnum: SalesOrderFields.fromEnum,
      excludeFields: excludeFields,
    );
  }
}
