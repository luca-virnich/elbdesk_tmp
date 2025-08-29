import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations.dart';

// TODO(mh): Refactor to new FieldCache pattern, move to CRM

/// UNIFIED MigrationMatsCompany fields with ALL features (forms + tables) in ONE place
/// This replaces MigrationMatsCompanyFieldWrapper and MigrationMatsCompanyFieldsExt
class MigrationMatsCompanyFields {
  MigrationMatsCompanyFields._();

  // Pre-built cache mapping field names to MigrationMatsCompanyField enums for O(1)
  // lookup
  static final Map<String, MigrationMatsCompanyField> _fieldNameToEnum = {
    for (final field in MigrationMatsCompanyField.values) field.name: field,
  };

  // Cache for fromFieldKey results to avoid repeated fromEnum calls
  static final Map<String,
          ExtendedField<MigrationMatsCompanyField, ElbCrmLocalizations>>
      _fieldKeyCache = {};

  // ========== Core Fields ==========

  static ExtendedField<MigrationMatsCompanyField, ElbCrmLocalizations>
      get idAccount => ExtendedFieldImpl.text(
            MigrationMatsCompanyField.idAccount,
            readableFunc: (l10n, _) => 'Account ID'.hc,
            validatorFunc: (l10n, _) => null,
          );

  static ExtendedField<MigrationMatsCompanyField, ElbCrmLocalizations>
      get account => ExtendedFieldImpl.text(
            MigrationMatsCompanyField.account,
            readableFunc: (l10n, _) => 'Firma',
            validatorFunc: (l10n, _) => null,
          );

  static ExtendedField<MigrationMatsCompanyField, ElbCrmLocalizations>
      get account2 => ExtendedFieldImpl.text(
            MigrationMatsCompanyField.account2,
            readableFunc: (l10n, _) => 'Zusatzname',
            validatorFunc: (l10n, _) => null,
          );

  static ExtendedField<MigrationMatsCompanyField, ElbCrmLocalizations>
      get shippingStreet1 => ExtendedFieldImpl.text(
            MigrationMatsCompanyField.shippingStreet1,
            readableFunc: (l10n, crmL10n) => crmL10n.contact_address,
            validatorFunc: (l10n, _) => null,
          );

  static ExtendedField<MigrationMatsCompanyField, ElbCrmLocalizations>
      get shippingStreet2 => ExtendedFieldImpl.text(
            MigrationMatsCompanyField.shippingStreet2,
            readableFunc: (l10n, crmL10n) => crmL10n.contact_address2,
            validatorFunc: (l10n, _) => null,
          );

  static ExtendedField<MigrationMatsCompanyField, ElbCrmLocalizations>
      get shippingPostalCode => ExtendedFieldImpl.text(
            MigrationMatsCompanyField.shippingPostalCode,
            readableFunc: (l10n, crmL10n) => crmL10n.contact_zip,
            validatorFunc: (l10n, _) => null,
          );

  static ExtendedField<MigrationMatsCompanyField, ElbCrmLocalizations>
      get shippingCity => ExtendedFieldImpl.text(
            MigrationMatsCompanyField.shippingCity,
            readableFunc: (l10n, crmL10n) => crmL10n.contact_city,
            validatorFunc: (l10n, _) => null,
          );

  static ExtendedField<MigrationMatsCompanyField, ElbCrmLocalizations>
      get shippingState => ExtendedFieldImpl.text(
            MigrationMatsCompanyField.shippingState,
            readableFunc: (l10n, crmL10n) => crmL10n.contact_state,
            validatorFunc: (l10n, _) => null,
          );

  static ExtendedField<MigrationMatsCompanyField, ElbCrmLocalizations>
      get shippingCountry => ExtendedFieldImpl.text(
            MigrationMatsCompanyField.shippingCountry,
            readableFunc: (l10n, crmL10n) => crmL10n.country,
            validatorFunc: (l10n, _) => null,
          );

  static ExtendedField<MigrationMatsCompanyField, ElbCrmLocalizations>
      get phone1 => ExtendedFieldImpl.text(
            MigrationMatsCompanyField.phone1,
            readableFunc: (l10n, crmL10n) => crmL10n.contact_phone,
            validatorFunc: (l10n, _) => (value) {
              if (value == null || value.isEmpty) return null;
              final isValidNumber = AppValidator.isValidPhoneNumber(value);
              if (!isValidNumber) {
                return l10n.validation_invalid_phone;
              }
              return null;
            },
          );

  static ExtendedField<MigrationMatsCompanyField, ElbCrmLocalizations>
      get phone2 => ExtendedFieldImpl.text(
            MigrationMatsCompanyField.phone2,
            readableFunc: (l10n, crmL10n) => crmL10n.contact_mobile,
            validatorFunc: (l10n, _) => (value) {
              if (value == null || value.isEmpty) return null;
              final isValidNumber = AppValidator.isValidPhoneNumber(value);
              if (!isValidNumber) {
                return l10n.validation_invalid_phone;
              }
              return null;
            },
          );

  static ExtendedField<MigrationMatsCompanyField, ElbCrmLocalizations>
      get fax => ExtendedFieldImpl.text(
            MigrationMatsCompanyField.fax,
            readableFunc: (l10n, crmL10n) => 'Fax'.hc,
            validatorFunc: (l10n, _) => null,
          );

  static ExtendedField<MigrationMatsCompanyField, ElbCrmLocalizations>
      get email => ExtendedFieldImpl.text(
            MigrationMatsCompanyField.email,
            readableFunc: (l10n, crmL10n) => crmL10n.contact_email,
            validatorFunc: (l10n, _) => (value) {
              if (value == null || value.isEmpty) return null;
              final isValidMail = AppValidator.isValidEmail(value);
              if (!isValidMail) {
                return l10n.validation_invalid_email;
              }
              return null;
            },
          );

  static ExtendedField<MigrationMatsCompanyField, ElbCrmLocalizations>
      get website => ExtendedFieldImpl.text(
            MigrationMatsCompanyField.website,
            readableFunc: (l10n, crmL10n) => crmL10n.contact_website,
            validatorFunc: (l10n, _) => (value) {
              if (value == null || value.isEmpty) return null;
              final isValidUrl = AppValidator.isValidUrl(value);
              if (!isValidUrl) {
                return l10n.validation_invalid_website;
              }
              return null;
            },
          );

  static ExtendedField<MigrationMatsCompanyField, ElbCrmLocalizations>
      get isMigrated => ExtendedFieldImpl.boolean(
            MigrationMatsCompanyField.isMigrated,
            readableFunc: (l10n, crmL10n) => 'Migriert'.hc,
            validatorFunc: (l10n, _) => null,
          );

  static ExtendedField<MigrationMatsCompanyField, ElbCrmLocalizations>
      get createdAt => ExtendedFieldImpl.date(
            MigrationMatsCompanyField.createdAt,
            readableFunc: (l10n, crmL10n) => l10n.gen_created_at,
            dateValidatorFunc: (l10n, _) => null,
          );

  static ExtendedField<MigrationMatsCompanyField, ElbCrmLocalizations>
      get createdBy => ExtendedFieldImpl.assignedUser(
            MigrationMatsCompanyField.createdBy,
            readableFunc: (l10n, crmL10n) => l10n.gen_created_by,
            isMandatory: true,
          );

  static ExtendedField<MigrationMatsCompanyField, ElbCrmLocalizations>
      get lastModifiedAt => ExtendedFieldImpl.date(
            MigrationMatsCompanyField.lastModifiedAt,
            readableFunc: (l10n, crmL10n) => l10n.gen_last_modified_at,
            dateValidatorFunc: (l10n, _) => null,
          );

  static ExtendedField<MigrationMatsCompanyField, ElbCrmLocalizations>
      get lastModifiedBy => ExtendedFieldImpl.assignedUser(
            MigrationMatsCompanyField.lastModifiedBy,
            readableFunc: (l10n, crmL10n) => l10n.gen_last_modified_by,
            isMandatory: false,
          );

  static ExtendedField<MigrationMatsCompanyField, ElbCrmLocalizations>
      get deletedAt => ExtendedFieldImpl.date(
            MigrationMatsCompanyField.deletedAt,
            readableFunc: (l10n, crmL10n) => l10n.gen_deleted_at,
            dateValidatorFunc: (l10n, _) => null,
          );

  static ExtendedField<MigrationMatsCompanyField, ElbCrmLocalizations>
      get isDraft => ExtendedFieldImpl.boolean(
            MigrationMatsCompanyField.isDraft,
            readableFunc: (l10n, crmL10n) => l10n.gen_is_draft,
            validatorFunc: (l10n, _) => null,
          );

  static ExtendedField<MigrationMatsCompanyField, ElbCrmLocalizations>
      get idAramis => ExtendedFieldImpl.text(
            MigrationMatsCompanyField.idAramis,
            readableFunc: (l10n, crmL10n) => 'Aramis ID'.hc,
            validatorFunc: (l10n, _) => null,
          );

  static ExtendedField<MigrationMatsCompanyField, ElbCrmLocalizations>
      get idStaff => ExtendedFieldImpl.text(
            MigrationMatsCompanyField.idStaff,
            readableFunc: (l10n, crmL10n) => 'Mitarbeiter ID'.hc,
            validatorFunc: (l10n, _) => null,
          );

  static ExtendedField<MigrationMatsCompanyField, ElbCrmLocalizations>
      get idAvVerantw => ExtendedFieldImpl.text(
            MigrationMatsCompanyField.idAvVerantw,
            readableFunc: (l10n, crmL10n) => 'Av Verantwortung'.hc,
            validatorFunc: (l10n, _) => null,
          );

  static ExtendedField<MigrationMatsCompanyField, ElbCrmLocalizations>
      get standort => ExtendedFieldImpl.text(
            MigrationMatsCompanyField.standort,
            readableFunc: (l10n, crmL10n) => 'Standort'.hc,
            validatorFunc: (l10n, _) => null,
          );

  // ========== Helper methods ==========

  /// Get ExtendedField from enum value
  static ExtendedField<MigrationMatsCompanyField, ElbCrmLocalizations> fromEnum(
    MigrationMatsCompanyField field,
  ) {
    return switch (field) {
      MigrationMatsCompanyField.idAccount => idAccount,
      MigrationMatsCompanyField.account => account,
      MigrationMatsCompanyField.account2 => account2,
      MigrationMatsCompanyField.shippingStreet1 => shippingStreet1,
      MigrationMatsCompanyField.shippingStreet2 => shippingStreet2,
      MigrationMatsCompanyField.shippingPostalCode => shippingPostalCode,
      MigrationMatsCompanyField.shippingCity => shippingCity,
      MigrationMatsCompanyField.shippingState => shippingState,
      MigrationMatsCompanyField.shippingCountry => shippingCountry,
      MigrationMatsCompanyField.phone1 => phone1,
      MigrationMatsCompanyField.phone2 => phone2,
      MigrationMatsCompanyField.fax => fax,
      MigrationMatsCompanyField.email => email,
      MigrationMatsCompanyField.website => website,
      MigrationMatsCompanyField.isMigrated => isMigrated,
      MigrationMatsCompanyField.createdAt => createdAt,
      MigrationMatsCompanyField.createdBy => createdBy,
      MigrationMatsCompanyField.lastModifiedAt => lastModifiedAt,
      MigrationMatsCompanyField.lastModifiedBy => lastModifiedBy,
      MigrationMatsCompanyField.deletedAt => deletedAt,
      MigrationMatsCompanyField.isDraft => isDraft,
      MigrationMatsCompanyField.idAramis => idAramis,
      MigrationMatsCompanyField.idStaff => idStaff,
      MigrationMatsCompanyField.idAvVerantw => idAvVerantw,
      MigrationMatsCompanyField.standort => standort,
    };
  }

  /// Get ExtendedField from field key string (with caching for performance)
  static ExtendedField<MigrationMatsCompanyField, ElbCrmLocalizations>
      fromFieldKey(
    String fieldKey,
  ) {
    // Check cache for already computed ExtendedField
    final cached = _fieldKeyCache[fieldKey];
    if (cached != null) {
      return cached;
    }

    // Use pre-built map for O(1) enum lookup instead of firstWhere O(n)
    final field = _fieldNameToEnum[fieldKey];
    if (field == null) {
      throw ArgumentError('Unknown field key: $fieldKey');
    }

    // Get the ExtendedField and cache it
    final extendedField = fromEnum(field);
    _fieldKeyCache[fieldKey] = extendedField;

    return extendedField;
  }
}

/// Extension methods for table operations (replacing MigrationMatsCompanyFieldsExt)
extension MigrationMatsCompanyFieldsTableExt
    on List<MigrationMatsCompanyField> {
  /// Returns a map of filterable fields with their labels
  Map<MigrationMatsCompanyField, TableFieldData> filterableWithLabels(
    ElbCoreLocalizations l10n,
    ElbCrmLocalizations crmL10n,
  ) {
    final map = <MigrationMatsCompanyField, TableFieldData>{};
    for (final field in this) {
      final extField = MigrationMatsCompanyFields.fromEnum(field);
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

  /// Returns a map of table columns with their labels
  Map<MigrationMatsCompanyField, TableColumnData> tableColumnsWithLabels(
    ElbCoreLocalizations l10n,
    ElbCrmLocalizations crmL10n,
  ) {
    final map = <MigrationMatsCompanyField, TableColumnData>{};
    for (final field in this) {
      final extField = MigrationMatsCompanyFields.fromEnum(field);
      map[field] = TableColumnData(
        readable: extField.readable(l10n, crmL10n),
        fieldConfig: extField.tableFieldConfig,
      );
    }
    return map;
  }

  /// Returns ordered fields for display
  List<MigrationMatsCompanyField> orderedFields(
    ElbCoreLocalizations l10n,
    ElbCrmLocalizations crmL10n,
  ) {
    final fields = toList()
      ..sort((a, b) {
        final aField = MigrationMatsCompanyFields.fromEnum(a);
        final bField = MigrationMatsCompanyFields.fromEnum(b);

        final aReadable = aField.readable(l10n, crmL10n);
        final bReadable = bField.readable(l10n, crmL10n);
        return aReadable.compareTo(bReadable);
      });

    return fields;
  }
}
