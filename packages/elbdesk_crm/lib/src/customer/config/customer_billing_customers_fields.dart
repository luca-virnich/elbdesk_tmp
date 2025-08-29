import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations.dart';

/// UNIFIED CustomerBillingCustomer fields with ALL features
/// (forms + tables) in ONE place
/// This replaces both CustomerBillingCustomerField extensions
/// and CustomerBillingCustomerFieldWrapper
class CustomerBillingCustomerFields {
  CustomerBillingCustomerFields._();

  // ==================== FIELD CACHE ====================

  static final _cache =
      FieldCache<CustomerBillingCustomerField, ElbCrmLocalizations>(
    values: CustomerBillingCustomerField.values,
    createField: _createField,
  );

  static ExtendedField<CustomerBillingCustomerField, ElbCrmLocalizations>
      fromEnum(
    CustomerBillingCustomerField field,
  ) =>
          _cache.fromEnum(field);

  static ExtendedField<CustomerBillingCustomerField, ElbCrmLocalizations>
      fromFieldKey(
    String fieldKey,
  ) =>
          _cache.fromFieldKey(fieldKey);

  static final List<TableFieldConfig> defaultTableColumns = List.unmodifiable([
    _cache
        .fromEnum(CustomerBillingCustomerField.billingCustomerFullName)
        .tableFieldConfig,
    _cache
        .fromEnum(CustomerBillingCustomerField.billingCustomerAddress)
        .tableFieldConfig,
    _cache
        .fromEnum(CustomerBillingCustomerField.billingCustomerPostCode)
        .tableFieldConfig,
    _cache
        .fromEnum(CustomerBillingCustomerField.billingCustomerCity)
        .tableFieldConfig,
    _cache
        .fromEnum(CustomerBillingCustomerField.billingCustomerCountryCode)
        .tableFieldConfig,
  ]);

  // ==================== FIELD DEFINITIONS ====================

  static ExtendedField<CustomerBillingCustomerField, ElbCrmLocalizations>
      _createField(
    CustomerBillingCustomerField field,
  ) {
    return switch (field) {
      // ========== Identification Fields ==========
      CustomerBillingCustomerField.id => const ExtendedFieldImpl.id(
          CustomerBillingCustomerField.id,
        ),
      CustomerBillingCustomerField.customer => ExtendedFieldImpl.text(
          CustomerBillingCustomerField.customer,
          readableFunc: (l10n, crmL10n) => crmL10n.customer_singular,
          validatorFunc: (l10n, _) => null,
        ),
      CustomerBillingCustomerField.billingCustomer => ExtendedFieldImpl.text(
          CustomerBillingCustomerField.billingCustomer,
          readableFunc: (l10n, crmL10n) => crmL10n.customer_customer,
          validatorFunc: (l10n, _) => null,
        ),
      CustomerBillingCustomerField.isPrimary => ExtendedFieldImpl.boolean(
          CustomerBillingCustomerField.isPrimary,
          readableFunc: (l10n, crmL10n) => 'Standardlieferadresse'.hc,
          validatorFunc: (l10n, _) => null,
        ),
      CustomerBillingCustomerField.filterByBillingCustomerIdOrFullName =>
        ExtendedFieldImpl.text(
          CustomerBillingCustomerField.filterByBillingCustomerIdOrFullName,
          readableFunc: (l10n, crmL10n) => crmL10n.contact_id_and_fullname,
          validatorFunc: (l10n, _) => null,
        ),

      // ========== Billing Customer Fields ==========
      CustomerBillingCustomerField.billingCustomerCustomId =>
        ExtendedFieldImpl.text(
          CustomerBillingCustomerField.billingCustomerCustomId,
          readableFunc: (l10n, crmL10n) => crmL10n.customer_id,
          validatorFunc: (l10n, _) => null,
        ),
      CustomerBillingCustomerField.billingCustomerFullName =>
        ExtendedFieldImpl.text(
          CustomerBillingCustomerField.billingCustomerFullName,
          readableFunc: (l10n, crmL10n) => crmL10n.contact_name,
          validatorFunc: (l10n, _) => null,
        ),
      CustomerBillingCustomerField.billingCustomerAddress =>
        ExtendedFieldImpl.text(
          CustomerBillingCustomerField.billingCustomerAddress,
          readableFunc: (l10n, crmL10n) => crmL10n.contact_address_singular,
          validatorFunc: (l10n, _) => null,
          cellWidth: 160,
        ),
      CustomerBillingCustomerField.billingCustomerAddress2 =>
        ExtendedFieldImpl.text(
          CustomerBillingCustomerField.billingCustomerAddress2,
          readableFunc: (l10n, crmL10n) => crmL10n.contact_address2,
          validatorFunc: (l10n, _) => null,
        ),
      CustomerBillingCustomerField.billingCustomerPostCode =>
        ExtendedFieldImpl.text(
          CustomerBillingCustomerField.billingCustomerPostCode,
          readableFunc: (l10n, crmL10n) => crmL10n.contact_zip,
          validatorFunc: (l10n, _) => null,
        ),
      CustomerBillingCustomerField.billingCustomerCity =>
        ExtendedFieldImpl.text(
          CustomerBillingCustomerField.billingCustomerCity,
          readableFunc: (l10n, crmL10n) => crmL10n.contact_city,
          validatorFunc: (l10n, _) => null,
        ),
      CustomerBillingCustomerField.billingCustomerState =>
        ExtendedFieldImpl.text(
          CustomerBillingCustomerField.billingCustomerState,
          readableFunc: (l10n, crmL10n) => crmL10n.contact_state,
          validatorFunc: (l10n, _) => null,
        ),
      CustomerBillingCustomerField.billingCustomerPhone =>
        ExtendedFieldImpl.text(
          CustomerBillingCustomerField.billingCustomerPhone,
          readableFunc: (l10n, crmL10n) => crmL10n.contact_phone,
          validatorFunc: (l10n, _) => null,
        ),
      CustomerBillingCustomerField.billingCustomerEmail =>
        ExtendedFieldImpl.text(
          CustomerBillingCustomerField.billingCustomerEmail,
          readableFunc: (l10n, crmL10n) => crmL10n.contact_email,
          validatorFunc: (l10n, _) => null,
        ),
      CustomerBillingCustomerField.billingCustomerMobile =>
        ExtendedFieldImpl.text(
          CustomerBillingCustomerField.billingCustomerMobile,
          readableFunc: (l10n, crmL10n) => crmL10n.contact_mobile,
          validatorFunc: (l10n, _) => null,
        ),
      CustomerBillingCustomerField.billingCustomerCountryCode =>
        ExtendedFieldImpl.text(
          CustomerBillingCustomerField.billingCustomerCountryCode,
          readableFunc: (l10n, crmL10n) => crmL10n.country_code_singular,
          validatorFunc: (l10n, _) => null,
        ),
      CustomerBillingCustomerField.billingCustomerLanguageCode =>
        ExtendedFieldImpl.text(
          CustomerBillingCustomerField.billingCustomerLanguageCode,
          readableFunc: (l10n, crmL10n) => crmL10n.language_code_singular,
          validatorFunc: (l10n, _) => null,
        ),
    };
  }
}

// ==================== LIST EXTENSIONS ====================

/// Extension methods for table operations
extension CustomerBillingCustomerFieldsTableExt
    on List<CustomerBillingCustomerField> {
  /// Returns a map of quick search filter fields
  Map<CustomerBillingCustomerField, TableFieldData> quickSearchFilter(
    ElbCoreLocalizations l10n,
    ElbCrmLocalizations crmL10n,
  ) {
    final map = <CustomerBillingCustomerField, TableFieldData>{};

    const fields = [
      CustomerBillingCustomerField.filterByBillingCustomerIdOrFullName,
    ];

    for (final field in fields.orderedFields(l10n, crmL10n)) {
      final extField = CustomerBillingCustomerFields.fromEnum(field);
      // only add filterable fields with non empty array
      if (extField.filterTypes.isNotEmpty) {
        map[field] = TableFieldData(
          readable: extField.readable(l10n, crmL10n),
          filterTypes: extField.filterTypes,
          validator: extField.validator(l10n, crmL10n),
          fieldType: extField.fieldType,
        );
      }
    }

    return map;
  }

  /// Returns a map of filterable fields with labels
  Map<CustomerBillingCustomerField, TableFieldData> filterableWithLabels(
    ElbCoreLocalizations l10n,
    ElbCrmLocalizations crmL10n,
  ) {
    final map = <CustomerBillingCustomerField, TableFieldData>{};

    const excludeFields = {
      CustomerBillingCustomerField.id,
      CustomerBillingCustomerField.customer,
      CustomerBillingCustomerField.billingCustomer,
    };

    for (final field in orderedFields(l10n, crmL10n)) {
      if (excludeFields.contains(field)) continue;
      final extField = CustomerBillingCustomerFields.fromEnum(field);
      // only add filterable fields with non empty array
      if (extField.filterTypes.isNotEmpty) {
        map[field] = TableFieldData(
          readable: extField.readable(l10n, crmL10n),
          filterTypes: extField.filterTypes,
          validator: extField.validator(l10n, crmL10n),
          fieldType: extField.fieldType,
        );
      }
    }

    return map;
  }

  /// Returns a map of table columns with labels
  Map<CustomerBillingCustomerField, TableColumnData> tableColumnsWithLabels(
    ElbCoreLocalizations l10n,
    ElbCrmLocalizations crmL10n,
  ) {
    const excludeFields = {
      CustomerBillingCustomerField.id,
      CustomerBillingCustomerField.billingCustomer,
      CustomerBillingCustomerField.customer,
      CustomerBillingCustomerField.filterByBillingCustomerIdOrFullName,
      CustomerBillingCustomerField.billingCustomerLanguageCode,
    };
    return ExtendedFieldListExt<CustomerBillingCustomerField,
            ElbCrmLocalizations>(this)
        .buildColumns(
      coreL10n: l10n,
      customL10n: crmL10n,
      fromEnum: CustomerBillingCustomerFields.fromEnum,
      excludeFields: excludeFields,
    );
  }

  /// Returns a sorted list of CustomerBillingCustomerFields with specific
  /// fields prioritized at the top and remaining fields sorted
  /// alphabetically by their readable names
  ///
  /// Priority order:
  /// 1. filterByBillingCustomerIdOrFullName - For searching by ID or name
  /// 2. billingCustomerFullName - Main display name field
  /// 3. billingCustomerCustomId - Customer ID field
  /// 4. All other fields sorted alphabetically
  List<CustomerBillingCustomerField> orderedFields(
    ElbCoreLocalizations l10n,
    ElbCrmLocalizations crmL10n,
  ) {
    final fields = toList()
      ..sort((a, b) {
        // Place filterByBillingCustomerIdOrFullName at the very top
        if (a ==
            CustomerBillingCustomerField.filterByBillingCustomerIdOrFullName) {
          return -1;
        }
        if (b ==
            CustomerBillingCustomerField.filterByBillingCustomerIdOrFullName) {
          return 1;
        }

        // Place billingCustomerFullName field second
        if (a == CustomerBillingCustomerField.billingCustomerFullName) {
          return -1;
        }
        if (b == CustomerBillingCustomerField.billingCustomerFullName) {
          return 1;
        }

        // Place billingCustomerCustomId third
        if (a == CustomerBillingCustomerField.billingCustomerCustomId) {
          return -1;
        }
        if (b == CustomerBillingCustomerField.billingCustomerCustomId) {
          return 1;
        }

        // Sort remaining fields alphabetically by their readable (translated)
        // names
        final aField = CustomerBillingCustomerFields.fromEnum(a);
        final bField = CustomerBillingCustomerFields.fromEnum(b);

        final aReadable = aField.readable(l10n, crmL10n);
        final bReadable = bField.readable(l10n, crmL10n);
        return aReadable.compareTo(bReadable);
      });

    return fields;
  }
}
