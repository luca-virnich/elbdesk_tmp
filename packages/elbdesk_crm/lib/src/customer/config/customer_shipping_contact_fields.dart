import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations.dart';

/// UNIFIED CustomerShippingContact fields with ALL features (forms + tables)
/// in ONE place
/// This replaces both CustomerShippingContactField extensions
/// and CustomerShippingContactFieldWrapper
class CustomerShippingContactFields {
  CustomerShippingContactFields._();

  // ==================== FIELD CACHE ====================

  static final _cache =
      FieldCache<CustomerShippingContactField, ElbCrmLocalizations>(
    values: CustomerShippingContactField.values,
    createField: _createField,
  );

  static ExtendedField<CustomerShippingContactField, ElbCrmLocalizations>
      fromEnum(
    CustomerShippingContactField field,
  ) =>
          _cache.fromEnum(field);

  static ExtendedField<CustomerShippingContactField, ElbCrmLocalizations>
      fromFieldKey(
    String fieldKey,
  ) =>
          _cache.fromFieldKey(fieldKey);

  static final List<TableFieldConfig> defaultTableColumns = List.unmodifiable([
    _cache
        .fromEnum(CustomerShippingContactField.shippingContactFullName)
        .tableFieldConfig,
    _cache
        .fromEnum(CustomerShippingContactField.shippingContactAddress)
        .tableFieldConfig,
    _cache
        .fromEnum(CustomerShippingContactField.shippingContactPostCode)
        .tableFieldConfig,
    _cache
        .fromEnum(CustomerShippingContactField.shippingContactCity)
        .tableFieldConfig,
    _cache
        .fromEnum(CustomerShippingContactField.shippingContactCountryCode)
        .tableFieldConfig,
  ]);

  // ==================== FIELD DEFINITIONS ====================

  static ExtendedField<CustomerShippingContactField, ElbCrmLocalizations>
      _createField(
    CustomerShippingContactField field,
  ) {
    return switch (field) {
      // ========== Identification Fields ==========
      CustomerShippingContactField.id => const ExtendedFieldImpl.id(
          CustomerShippingContactField.id,
        ),
      CustomerShippingContactField.customer => ExtendedFieldImpl.text(
          CustomerShippingContactField.customer,
          readableFunc: (l10n, crmL10n) => crmL10n.customer_singular,
          validatorFunc: (l10n, _) => null,
        ),
      CustomerShippingContactField.shippingContact => ExtendedFieldImpl.text(
          CustomerShippingContactField.shippingContact,
          readableFunc: (l10n, crmL10n) => crmL10n.shipping_address,
          validatorFunc: (l10n, _) => null,
        ),
      CustomerShippingContactField.filterByShippingContactIdOrFullName =>
        ExtendedFieldImpl.text(
          CustomerShippingContactField.filterByShippingContactIdOrFullName,
          readableFunc: (l10n, crmL10n) => crmL10n.contact_id_and_fullname,
          validatorFunc: (l10n, _) => null,
        ),

      // ========== Shipping Contact Fields ==========
      CustomerShippingContactField.shippingContactCustomId =>
        ExtendedFieldImpl.text(
          CustomerShippingContactField.shippingContactCustomId,
          readableFunc: (l10n, crmL10n) => l10n.id,
          validatorFunc: (l10n, _) => null,
        ),
      CustomerShippingContactField.shippingContactFullName =>
        ExtendedFieldImpl.text(
          CustomerShippingContactField.shippingContactFullName,
          readableFunc: (l10n, crmL10n) => crmL10n.contact_name,
          validatorFunc: (l10n, _) => null,
        ),
      CustomerShippingContactField.shippingContactAddress =>
        ExtendedFieldImpl.text(
          CustomerShippingContactField.shippingContactAddress,
          readableFunc: (l10n, crmL10n) => crmL10n.contact_address_singular,
          validatorFunc: (l10n, _) => null,
          cellWidth: 160,
        ),
      CustomerShippingContactField.shippingContactAddress2 =>
        ExtendedFieldImpl.text(
          CustomerShippingContactField.shippingContactAddress2,
          readableFunc: (l10n, crmL10n) => crmL10n.contact_address2,
          validatorFunc: (l10n, _) => null,
        ),
      CustomerShippingContactField.shippingContactPostCode =>
        ExtendedFieldImpl.text(
          CustomerShippingContactField.shippingContactPostCode,
          readableFunc: (l10n, crmL10n) => crmL10n.contact_zip,
          validatorFunc: (l10n, _) => null,
        ),
      CustomerShippingContactField.shippingContactCity =>
        ExtendedFieldImpl.text(
          CustomerShippingContactField.shippingContactCity,
          readableFunc: (l10n, crmL10n) => crmL10n.contact_city,
          validatorFunc: (l10n, _) => null,
        ),
      CustomerShippingContactField.shippingContactState =>
        ExtendedFieldImpl.text(
          CustomerShippingContactField.shippingContactState,
          readableFunc: (l10n, crmL10n) => crmL10n.contact_state,
          validatorFunc: (l10n, _) => null,
        ),
      CustomerShippingContactField.shippingContactPhone =>
        ExtendedFieldImpl.text(
          CustomerShippingContactField.shippingContactPhone,
          readableFunc: (l10n, crmL10n) => crmL10n.contact_phone,
          validatorFunc: (l10n, _) => null,
        ),
      CustomerShippingContactField.shippingContactEmail =>
        ExtendedFieldImpl.text(
          CustomerShippingContactField.shippingContactEmail,
          readableFunc: (l10n, crmL10n) => crmL10n.contact_email,
          validatorFunc: (l10n, _) => null,
        ),
      CustomerShippingContactField.shippingContactMobile =>
        ExtendedFieldImpl.text(
          CustomerShippingContactField.shippingContactMobile,
          readableFunc: (l10n, crmL10n) => crmL10n.contact_mobile,
          validatorFunc: (l10n, _) => null,
        ),
      CustomerShippingContactField.shippingContactCountryCode =>
        ExtendedFieldImpl.text(
          CustomerShippingContactField.shippingContactCountryCode,
          readableFunc: (l10n, crmL10n) => crmL10n.country_code_singular,
          validatorFunc: (l10n, _) => null,
        ),
      CustomerShippingContactField.shippingContactLanguageCode =>
        ExtendedFieldImpl.text(
          CustomerShippingContactField.shippingContactLanguageCode,
          readableFunc: (l10n, crmL10n) => crmL10n.language_code_singular,
          validatorFunc: (l10n, _) => null,
        ),
    };
  }
}

// ==================== LIST EXTENSIONS ====================

/// Extension methods for table operations
extension CustomerShippingContactFieldsTableExt
    on List<CustomerShippingContactField> {
  /// Returns a map of quick search filter fields
  Map<CustomerShippingContactField, TableFieldData> quickSearchFilter(
    ElbCoreLocalizations l10n,
    ElbCrmLocalizations crmL10n,
  ) {
    final map = <CustomerShippingContactField, TableFieldData>{};

    const fields = [
      CustomerShippingContactField.filterByShippingContactIdOrFullName,
    ];

    for (final field in fields.orderedFields(l10n, crmL10n)) {
      final extField = CustomerShippingContactFields.fromEnum(field);
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
  Map<CustomerShippingContactField, TableFieldData> filterableWithLabels(
    ElbCoreLocalizations l10n,
    ElbCrmLocalizations crmL10n,
  ) {
    final map = <CustomerShippingContactField, TableFieldData>{};

    const excludeFields = {
      CustomerShippingContactField.id,
      CustomerShippingContactField.customer,
      CustomerShippingContactField.shippingContact,
    };

    for (final field in orderedFields(l10n, crmL10n)) {
      if (excludeFields.contains(field)) continue;
      final extField = CustomerShippingContactFields.fromEnum(field);
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
  Map<CustomerShippingContactField, TableColumnData> tableColumnsWithLabels(
    ElbCoreLocalizations l10n,
    ElbCrmLocalizations crmL10n,
  ) {
    const excludeFields = {
      CustomerShippingContactField.id,
      CustomerShippingContactField.shippingContact,
      CustomerShippingContactField.customer,
      CustomerShippingContactField.filterByShippingContactIdOrFullName,
      CustomerShippingContactField.shippingContactLanguageCode,
    };
    return ExtendedFieldListExt<CustomerShippingContactField,
            ElbCrmLocalizations>(this)
        .buildColumns(
      coreL10n: l10n,
      customL10n: crmL10n,
      fromEnum: CustomerShippingContactFields.fromEnum,
      excludeFields: excludeFields,
    );
  }

  /// Returns a sorted list of CustomerShippingContactFields with specific
  /// fields prioritized at the top and remaining fields sorted alphabetically
  /// by their readable names
  ///
  /// Priority order:
  /// 1. filterByShippingContactIdOrFullName - For searching by ID or name
  /// 2. shippingContactFullName - Main display name field
  /// 3. shippingContactCustomId - Shipping contact ID field
  /// 4. All other fields sorted alphabetically
  List<CustomerShippingContactField> orderedFields(
    ElbCoreLocalizations l10n,
    ElbCrmLocalizations crmL10n,
  ) {
    final fields = toList()
      ..sort((a, b) {
        // Place filterByShippingContactIdOrFullName at the very top
        if (a ==
            CustomerShippingContactField.filterByShippingContactIdOrFullName) {
          return -1;
        }
        if (b ==
            CustomerShippingContactField.filterByShippingContactIdOrFullName) {
          return 1;
        }

        // Place shippingContactFullName field second
        if (a == CustomerShippingContactField.shippingContactFullName) {
          return -1;
        }
        if (b == CustomerShippingContactField.shippingContactFullName) {
          return 1;
        }

        // Place shippingContactCustomId third
        if (a == CustomerShippingContactField.shippingContactCustomId) {
          return -1;
        }
        if (b == CustomerShippingContactField.shippingContactCustomId) {
          return 1;
        }

        // Sort remaining fields alphabetically by their readable
        // (translated) names
        final aField = CustomerShippingContactFields.fromEnum(a);
        final bField = CustomerShippingContactFields.fromEnum(b);

        final aReadable = aField.readable(l10n, crmL10n);
        final bReadable = bField.readable(l10n, crmL10n);
        return aReadable.compareTo(bReadable);
      });

    return fields;
  }
}
