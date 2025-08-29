import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations.dart';

/// UNIFIED CustomerCustomer fields with ALL features (forms + tables)
/// in ONE place
/// This replaces both CustomerCustomerField extensions
/// and CustomerCustomerFieldWrapper
class CustomerCustomerFields {
  CustomerCustomerFields._();

  // ==================== FIELD CACHE ====================

  static final _cache = FieldCache<CustomerCustomerField, ElbCrmLocalizations>(
    values: CustomerCustomerField.values,
    createField: _createField,
  );

  static ExtendedField<CustomerCustomerField, ElbCrmLocalizations> fromEnum(
    CustomerCustomerField field,
  ) =>
      _cache.fromEnum(field);

  static ExtendedField<CustomerCustomerField, ElbCrmLocalizations> fromFieldKey(
    String fieldKey,
  ) =>
      _cache.fromFieldKey(fieldKey);

  static final List<TableFieldConfig> defaultTableColumns = List.unmodifiable([
    _cache
        .fromEnum(CustomerCustomerField.customerCustomerContactFullName)
        .tableFieldConfig,
    _cache
        .fromEnum(CustomerCustomerField.customerCustomerContactAddress)
        .tableFieldConfig,
    _cache
        .fromEnum(CustomerCustomerField.customerCustomerContactPostCode)
        .tableFieldConfig,
    _cache
        .fromEnum(CustomerCustomerField.customerCustomerContactCity)
        .tableFieldConfig,
    _cache
        .fromEnum(CustomerCustomerField.customerCustomerContactCountryCode)
        .tableFieldConfig,
  ]);

  // ==================== FIELD DEFINITIONS ====================

  static ExtendedField<CustomerCustomerField, ElbCrmLocalizations> _createField(
    CustomerCustomerField field,
  ) {
    return switch (field) {
      // ========== Identification Fields ==========
      CustomerCustomerField.id => const ExtendedFieldImpl.id(
          CustomerCustomerField.id,
        ),
      CustomerCustomerField.customer => ExtendedFieldImpl.text(
          CustomerCustomerField.customer,
          readableFunc: (l10n, crmL10n) => crmL10n.customer_singular,
          validatorFunc: (l10n, _) => null,
        ),
      CustomerCustomerField.customerCustomerContact => ExtendedFieldImpl.text(
          CustomerCustomerField.customerCustomerContact,
          readableFunc: (l10n, crmL10n) => crmL10n.customer_customer,
          validatorFunc: (l10n, _) => null,
        ),
      CustomerCustomerField.filterByCustomerCustomerContactIdOrFullName =>
        ExtendedFieldImpl.text(
          CustomerCustomerField.filterByCustomerCustomerContactIdOrFullName,
          readableFunc: (l10n, crmL10n) => crmL10n.contact_id_and_fullname,
          validatorFunc: (l10n, _) => null,
        ),

      // ========== Customer Contact Fields ==========
      CustomerCustomerField.customerCustomerContactCustomId =>
        ExtendedFieldImpl.text(
          CustomerCustomerField.customerCustomerContactCustomId,
          readableFunc: (l10n, crmL10n) => l10n.id,
          validatorFunc: (l10n, _) => null,
        ),
      CustomerCustomerField.customerCustomerContactFullName =>
        ExtendedFieldImpl.text(
          CustomerCustomerField.customerCustomerContactFullName,
          readableFunc: (l10n, crmL10n) => crmL10n.contact_name,
          validatorFunc: (l10n, _) => null,
        ),
      CustomerCustomerField.customerCustomerContactAddress =>
        ExtendedFieldImpl.text(
          CustomerCustomerField.customerCustomerContactAddress,
          readableFunc: (l10n, crmL10n) => crmL10n.contact_address_singular,
          validatorFunc: (l10n, _) => null,
        ),
      CustomerCustomerField.customerCustomerContactAddress2 =>
        ExtendedFieldImpl.text(
          CustomerCustomerField.customerCustomerContactAddress2,
          readableFunc: (l10n, crmL10n) => crmL10n.contact_address2,
          validatorFunc: (l10n, _) => null,
        ),
      CustomerCustomerField.customerCustomerContactPostCode =>
        ExtendedFieldImpl.text(
          CustomerCustomerField.customerCustomerContactPostCode,
          readableFunc: (l10n, crmL10n) => crmL10n.contact_zip,
          validatorFunc: (l10n, _) => null,
        ),
      CustomerCustomerField.customerCustomerContactCity =>
        ExtendedFieldImpl.text(
          CustomerCustomerField.customerCustomerContactCity,
          readableFunc: (l10n, crmL10n) => crmL10n.contact_city,
          validatorFunc: (l10n, _) => null,
        ),
      CustomerCustomerField.customerCustomerContactState =>
        ExtendedFieldImpl.text(
          CustomerCustomerField.customerCustomerContactState,
          readableFunc: (l10n, crmL10n) => crmL10n.contact_state,
          validatorFunc: (l10n, _) => null,
        ),
      CustomerCustomerField.customerCustomerContactPhone =>
        ExtendedFieldImpl.text(
          CustomerCustomerField.customerCustomerContactPhone,
          readableFunc: (l10n, crmL10n) => crmL10n.contact_phone,
          validatorFunc: (l10n, _) => null,
        ),
      CustomerCustomerField.customerCustomerContactEmail =>
        ExtendedFieldImpl.text(
          CustomerCustomerField.customerCustomerContactEmail,
          readableFunc: (l10n, crmL10n) => crmL10n.contact_email,
          validatorFunc: (l10n, _) => null,
        ),
      CustomerCustomerField.customerCustomerContactMobile =>
        ExtendedFieldImpl.text(
          CustomerCustomerField.customerCustomerContactMobile,
          readableFunc: (l10n, crmL10n) => crmL10n.contact_mobile,
          validatorFunc: (l10n, _) => null,
        ),
      CustomerCustomerField.customerCustomerContactCountryCode =>
        ExtendedFieldImpl.text(
          CustomerCustomerField.customerCustomerContactCountryCode,
          readableFunc: (l10n, crmL10n) => crmL10n.country_code_singular,
          validatorFunc: (l10n, _) => null,
        ),
      CustomerCustomerField.customerCustomerContactLanguageCode =>
        ExtendedFieldImpl.text(
          CustomerCustomerField.customerCustomerContactLanguageCode,
          readableFunc: (l10n, crmL10n) => crmL10n.language_code_singular,
          validatorFunc: (l10n, _) => null,
        ),

      // ========== System Fields ==========
      CustomerCustomerField.createdAt => ExtendedFieldImpl.date(
          CustomerCustomerField.createdAt,
          readableFunc: (l10n, crmL10n) => l10n.gen_created_at,
          dateValidatorFunc: (l10n, _) => (DateTime? value) {
            return null; // No validation for system field
          },
        ),
      CustomerCustomerField.createdBy => ExtendedFieldImpl.assignedUser(
          CustomerCustomerField.createdBy,
          readableFunc: (l10n, crmL10n) => l10n.gen_created_by,
          isMandatory: false,
        ),
      CustomerCustomerField.lastModifiedAt => ExtendedFieldImpl.date(
          CustomerCustomerField.lastModifiedAt,
          readableFunc: (l10n, crmL10n) => l10n.gen_last_modified_at,
          dateValidatorFunc: (l10n, _) => (DateTime? value) {
            return null; // No validation for system field
          },
        ),
      CustomerCustomerField.lastModifiedBy => ExtendedFieldImpl.assignedUser(
          CustomerCustomerField.lastModifiedBy,
          readableFunc: (l10n, crmL10n) => l10n.gen_last_modified_by,
          isMandatory: false,
        ),
      CustomerCustomerField.deletedAt => ExtendedFieldImpl.date(
          CustomerCustomerField.deletedAt,
          readableFunc: (l10n, crmL10n) => l10n.gen_deleted_at,
          dateValidatorFunc: (l10n, _) => (DateTime? value) {
            return null; // No validation for system field
          },
        ),
      CustomerCustomerField.isDraft => ExtendedFieldImpl.boolean(
          CustomerCustomerField.isDraft,
          readableFunc: (l10n, crmL10n) => l10n.gen_is_draft,
          filterTypes: DefaultFilterTypes.noFilter,
          validatorFunc: (l10n, _) => null,
        ),
    };
  }
}

// ==================== LIST EXTENSIONS ====================

/// Extension methods for table operations
extension CustomerCustomerFieldsTableExt on List<CustomerCustomerField> {
  /// Returns a map of quick search filter fields
  Map<CustomerCustomerField, TableFieldData> quickSearchFilter(
    ElbCoreLocalizations l10n,
    ElbCrmLocalizations crmL10n,
  ) {
    final map = <CustomerCustomerField, TableFieldData>{};

    const fields = [
      CustomerCustomerField.filterByCustomerCustomerContactIdOrFullName,
    ];

    for (final field in fields.orderedFields(l10n, crmL10n)) {
      final extField = CustomerCustomerFields.fromEnum(field);
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
  Map<CustomerCustomerField, TableFieldData> filterableWithLabels(
    ElbCoreLocalizations l10n,
    ElbCrmLocalizations crmL10n,
  ) {
    final map = <CustomerCustomerField, TableFieldData>{};

    const excludeFields = {
      CustomerCustomerField.id,
      CustomerCustomerField.customer,
      CustomerCustomerField.customerCustomerContact,
    };

    for (final field in orderedFields(l10n, crmL10n)) {
      if (excludeFields.contains(field)) continue;
      final extField = CustomerCustomerFields.fromEnum(field);
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
  Map<CustomerCustomerField, TableColumnData> tableColumnsWithLabels(
    ElbCoreLocalizations l10n,
    ElbCrmLocalizations crmL10n,
  ) {
    const excludeFields = {
      CustomerCustomerField.id,
      CustomerCustomerField.customerCustomerContact,
      CustomerCustomerField.customer,
      CustomerCustomerField.filterByCustomerCustomerContactIdOrFullName,
      CustomerCustomerField.customerCustomerContactLanguageCode,
      CustomerCustomerField.createdAt,
      CustomerCustomerField.createdBy,
      CustomerCustomerField.lastModifiedAt,
      CustomerCustomerField.lastModifiedBy,
      CustomerCustomerField.deletedAt,
      CustomerCustomerField.isDraft,
    };
    return ExtendedFieldListExt<CustomerCustomerField, ElbCrmLocalizations>(
      this,
    ).buildColumns(
      coreL10n: l10n,
      customL10n: crmL10n,
      fromEnum: CustomerCustomerFields.fromEnum,
      excludeFields: excludeFields,
    );
  }

  /// Returns a sorted list of CustomerCustomerFields with specific fields
  /// prioritized at the top and remaining fields sorted alphabetically by
  /// their readable names
  ///
  /// Priority order:
  /// 1. filterByCustomerCustomerContactIdOrFullName - For searching
  /// 2. customerCustomerContactFullName - Main display name field
  /// 3. customerCustomerContactCustomId - Customer ID field
  /// 4. All other fields sorted alphabetically
  List<CustomerCustomerField> orderedFields(
    ElbCoreLocalizations l10n,
    ElbCrmLocalizations crmL10n,
  ) {
    final fields = toList()
      ..sort((a, b) {
        // Place filterByCustomerCustomerContactIdOrFullName at the very top
        if (a ==
            CustomerCustomerField.filterByCustomerCustomerContactIdOrFullName) {
          return -1;
        }
        if (b ==
            CustomerCustomerField.filterByCustomerCustomerContactIdOrFullName) {
          return 1;
        }

        // Place customerCustomerContactFullName field second
        if (a == CustomerCustomerField.customerCustomerContactFullName) {
          return -1;
        }
        if (b == CustomerCustomerField.customerCustomerContactFullName) {
          return 1;
        }

        // Place customerCustomerContactCustomId third
        if (a == CustomerCustomerField.customerCustomerContactCustomId) {
          return -1;
        }
        if (b == CustomerCustomerField.customerCustomerContactCustomId) {
          return 1;
        }

        // Sort remaining fields alphabetically by their readable
        // (translated) names
        final aField = CustomerCustomerFields.fromEnum(a);
        final bField = CustomerCustomerFields.fromEnum(b);

        final aReadable = aField.readable(l10n, crmL10n);
        final bReadable = bField.readable(l10n, crmL10n);
        return aReadable.compareTo(bReadable);
      });

    return fields;
  }
}
