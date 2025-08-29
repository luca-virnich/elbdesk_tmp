import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations.dart';
import 'package:elbdesk_crm/src/customer/extensions/invoice_method_ext.dart';
import 'package:flutter/widgets.dart';

/// UNIFIED Customer fields with ALL features (forms + tables) in ONE place
/// This replaces both CustomerField extensions and CustomerFieldWrapper
class CustomerFields {
  CustomerFields._();

  // ==================== FIELD CACHE ====================

  static final _cache = FieldCache<CustomerField, ElbCrmLocalizations>(
    values: CustomerField.values,
    createField: _createField,
  );

  static ExtendedField<CustomerField, ElbCrmLocalizations> fromEnum(
    CustomerField field,
  ) =>
      _cache.fromEnum(field);

  static ExtendedField<CustomerField, ElbCrmLocalizations> fromFieldKey(
    String fieldKey,
  ) =>
      _cache.fromFieldKey(fieldKey);

  static final List<TableFieldConfig> defaultTableColumns = List.unmodifiable([
    _cache.fromEnum(CustomerField.customIdString).tableFieldConfig,
    _cache.fromEnum(CustomerField.customerName).tableFieldConfig,
    _cache.fromEnum(CustomerField.city).tableFieldConfig,
    _cache.fromEnum(CustomerField.address).tableFieldConfig,
    _cache.fromEnum(CustomerField.phone).tableFieldConfig,
    _cache.fromEnum(CustomerField.website).tableFieldConfig,
    _cache.fromEnum(CustomerField.assignedUser).tableFieldConfig,
  ]);

  // ==================== FIELD DEFINITIONS ====================

  static ExtendedField<CustomerField, ElbCrmLocalizations> _createField(
    CustomerField field,
  ) {
    return switch (field) {
      // ========== Identification Fields ==========
      // Primary Key of the Customer
      CustomerField.id => const ExtendedFieldImpl.primaryKey(
          CustomerField.id,
        ),
      CustomerField.customId => const ExtendedFieldImpl.ignore(
          CustomerField.customId,
        ),
      CustomerField.customIdString => ExtendedFieldImpl.text(
          CustomerField.customIdString,
          readableFunc: (l10n, _) => l10n.gen_id,
          validatorFunc: (l10n, _) => null,
          excludeFromTable: true,
          cellWidth: 80,
        ),
      CustomerField.filterByIdOrName => ExtendedFieldImpl.text(
          CustomerField.filterByIdOrName,
          readableFunc: (l10n, crmL10n) => crmL10n.contact_id_and_fullname,
          validatorFunc: (l10n, _) => null,
        ),

      // ========== Basic Information Fields ==========
      CustomerField.customerName => ExtendedFieldImpl.text(
          CustomerField.customerName,
          readableFunc: (l10n, crmL10n) => crmL10n.customer_name,
          validatorFunc: (l10n, _) => (String? value) {
            if (value == null) return null;
            if (value.isEmpty) return l10n.validation_name_required;
            return null;
          },
        ),
      CustomerField.type => ExtendedFieldImpl.text(
          CustomerField.type,
          readableFunc: (l10n, crmL10n) => crmL10n.type,
          validatorFunc: (l10n, _) => (String? value) {
            if (value == null) return null;
            if (value.isEmpty) return l10n.validation_type_required;
            return null;
          },
        ),
      CustomerField.vatId => ExtendedFieldImpl.text(
          CustomerField.vatId,
          readableFunc: (l10n, crmL10n) => crmL10n.customer_vat_id,
          validatorFunc: (l10n, _) => null,
        ),

      // ========== Contact Information Fields ==========
      // ========== Address Fields ==========
      //*  ==  handled by contact ==
      CustomerField.website => ExtendedFieldImpl.text(
          CustomerField.website,
          readableFunc: (l10n, crmL10n) => crmL10n.contact_website,
          validatorFunc: (l10n, _) => null,
        ),
      CustomerField.address => ExtendedFieldImpl.text(
          CustomerField.address,
          readableFunc: (l10n, crmL10n) => crmL10n.contact_address_singular,
          validatorFunc: (l10n, _) => null,
        ),
      CustomerField.address2 => ExtendedFieldImpl.text(
          CustomerField.address2,
          readableFunc: (l10n, crmL10n) => crmL10n.contact_address2,
          validatorFunc: (l10n, _) => null,
          cellWidth: 160,
        ),
      CustomerField.address3 => ExtendedFieldImpl.text(
          CustomerField.address3,
          readableFunc: (l10n, crmL10n) => crmL10n.contact_address3,
          validatorFunc: (l10n, _) => null,
          maxLines: 2,
          filterTypes: DefaultFilterTypes.noFilter,
          cellWidth: 160,
        ),
      CustomerField.postCode => ExtendedFieldImpl.text(
          CustomerField.postCode,
          readableFunc: (l10n, crmL10n) => crmL10n.contact_zip,
          validatorFunc: (l10n, _) => null,
        ),
      CustomerField.city => ExtendedFieldImpl.text(
          CustomerField.city,
          readableFunc: (l10n, crmL10n) => crmL10n.contact_city,
          validatorFunc: (l10n, _) => null,
        ),
      CustomerField.state => ExtendedFieldImpl.text(
          CustomerField.state,
          readableFunc: (l10n, crmL10n) => crmL10n.contact_state,
          validatorFunc: (l10n, _) => null,
        ),
      CustomerField.country => ExtendedFieldImpl.text(
          CustomerField.country,
          readableFunc: (l10n, crmL10n) => crmL10n.country_code_singular,
          validatorFunc: (l10n, _) => null,
        ),
      CustomerField.phone => ExtendedFieldImpl.text(
          CustomerField.phone,
          readableFunc: (l10n, crmL10n) => crmL10n.contact_phone,
          validatorFunc: (l10n, _) => null,
        ),
      CustomerField.email => ExtendedFieldImpl.text(
          CustomerField.email,
          readableFunc: (l10n, crmL10n) => crmL10n.contact_email,
          validatorFunc: (l10n, _) => null,
        ),
      CustomerField.mobile => ExtendedFieldImpl.text(
          CustomerField.mobile,
          readableFunc: (l10n, crmL10n) => crmL10n.contact_mobile,
          validatorFunc: (l10n, _) => null,
        ),

      // ========== Business Fields ==========
      CustomerField.contractSovereignty => ExtendedFieldImpl.lazyTextDropdown(
          CustomerField.contractSovereignty,
          isMandatory: false,
          readableFunc: (l10n, crmL10n) => crmL10n.customer_contract,
          validatorFunc: (l10n, _) => null,
        ),
      CustomerField.paymentCode => ExtendedFieldImpl.lazyTextDropdown(
          CustomerField.paymentCode,
          readableFunc: (l10n, crmL10n) => crmL10n.customer_payment_terms,
          validatorFunc: (l10n, _) => null,
          isMandatory: false,
        ),
      CustomerField.invoiceEmail => ExtendedFieldImpl.text(
          CustomerField.invoiceEmail,
          readableFunc: (l10n, crmL10n) => crmL10n.customer_invoice_email,
          validatorFunc: (l10n, _) => null,
          keyboardType: TextInputType.emailAddress,
        ),
      CustomerField.invoiceDeliveryMethod => ExtendedFieldImpl.textDropdown(
          CustomerField.invoiceDeliveryMethod,
          readableFunc: (l10n, crmL10n) => crmL10n.customer_invoice_delivery,
          isMandatory: false,
          items: (l10n, crmL10n) => InvoiceDeliveryMethod.values
              .map(
                (e) => DropdownItem.text(
                  value: e,
                  label: e.readable(crmL10n),
                ),
              )
              .toList(),
        ),
      CustomerField.shippingMethod => ExtendedFieldImpl.lazyTextDropdown(
          CustomerField.shippingMethod,
          readableFunc: (l10n, crmL10n) => crmL10n.shipping_method_singular,
          validatorFunc: (l10n, _) => null,
          isMandatory: false,
        ),
      CustomerField.assignedUser => ExtendedFieldImpl.assignedUser(
          CustomerField.assignedUser,
          readableFunc: (l10n, crmL10n) => crmL10n.customer_supervisor,
          isMandatory: true,
          cellWidth: 180,
        ),

      // ========== System Fields ==========
      CustomerField.createdAt => ExtendedFieldImpl.date(
          CustomerField.createdAt,
          readableFunc: (l10n, _) => l10n.gen_created_at,
          dateValidatorFunc: (l10n, _) => null,
        ),
      CustomerField.createdBy => ExtendedFieldImpl.assignedUser(
          CustomerField.createdBy,
          readableFunc: (l10n, _) => l10n.gen_created_by,
          isMandatory: false,
        ),
      CustomerField.lastModifiedAt => ExtendedFieldImpl.date(
          CustomerField.lastModifiedAt,
          readableFunc: (l10n, _) => l10n.gen_last_modified_at,
          dateValidatorFunc: (l10n, _) => null,
        ),
      CustomerField.lastModifiedBy => ExtendedFieldImpl.assignedUser(
          CustomerField.lastModifiedBy,
          readableFunc: (l10n, _) => l10n.gen_last_modified_by,
          isMandatory: false,
        ),
      CustomerField.deletedAt => ExtendedFieldImpl.date(
          CustomerField.deletedAt,
          readableFunc: (l10n, _) => l10n.gen_deleted_at,
          dateValidatorFunc: (l10n, _) => null,
          filterTypes: DefaultFilterTypes.noFilter,
          excludeFromTable: true,
        ),
      CustomerField.isDraft => ExtendedFieldImpl.boolean(
          CustomerField.isDraft,
          readableFunc: (l10n, _) => l10n.gen_is_draft,
          validatorFunc: (l10n, _) => null,
          filterTypes: DefaultFilterTypes.noFilter,
          excludeFromTable: true,
        ),

      // ========== UI/Action Fields ==========
      CustomerField.selectCustomer => ExtendedFieldImpl.text(
          CustomerField.selectCustomer,
          readableFunc: (l10n, _) => l10n.gen_table_select_entity,
          validatorFunc: (l10n, _) => null,
          filterTypes: DefaultFilterTypes.noFilter,
        ),
    };
  }

  // ==================== DROPDOWN ITEMS ====================

  static Map<CustomerField, List<DropdownItem<dynamic>>>
      buildFilterDropdownItems(
    ElbCoreLocalizations l10n,
    ElbCrmLocalizations crmL10n,
  ) {
    return _cache.buildFilterDropdownItems(l10n, crmL10n);
  }
}

// ==================== LIST EXTENSIONS ====================

/// Extension methods for table operations (replacing CustomerFieldsExt)
extension CustomerFieldsTableExt on List<CustomerField> {
  /// Returns a map of filterable fields with labels
  Map<CustomerField, TableFieldData> filters(
    ElbCoreLocalizations l10n,
    ElbCrmLocalizations crmL10n,
  ) {
    const excludeFields = {
      CustomerField.type,
    };

    return ExtendedFieldListExt<CustomerField, ElbCrmLocalizations>(
      this,
    ).buildFilters(
      coreL10n: l10n,
      customL10n: crmL10n,
      fromEnum: CustomerFields.fromEnum,
      excludeFields: excludeFields,
    );
  }

  Map<CustomerField, TableFieldData> quickSearchFilters(
    ElbCoreLocalizations l10n,
    ElbCrmLocalizations crmL10n,
  ) {
    return [
      CustomerField.filterByIdOrName,
    ].buildQuickSearch(
      coreL10n: l10n,
      customL10n: crmL10n,
      fromEnum: CustomerFields.fromEnum,
    );
  }

  /// Returns a map of table columns with labels
  Map<CustomerField, TableColumnData> columns(
    ElbCoreLocalizations l10n,
    ElbCrmLocalizations crmL10n,
  ) {
    const excludeFields = {
      CustomerField.filterByIdOrName,
      CustomerField.selectCustomer,
      CustomerField.address3,
      CustomerField.type,
    };
    return ExtendedFieldListExt<CustomerField, ElbCrmLocalizations>(
      this,
    ).buildColumns(
      coreL10n: l10n,
      customL10n: crmL10n,
      fromEnum: CustomerFields.fromEnum,
      excludeFields: excludeFields,
    );
  }
}
