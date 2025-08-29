import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations.dart';

// TODO(mh): Refactor to new FieldCache pattern move to CRM package

/// UNIFIED MigrationMatsPerson fields with ALL features (forms + tables) in ONE place
/// This replaces MigrationMatsPersonFieldWrapper and MigrationMatsPersonFieldsExt
class MigrationMatsPersonFields {
  MigrationMatsPersonFields._();

  // Pre-built cache mapping field names to MigrationMatsPersonField enums for O(1)
  // lookup
  static final Map<String, MigrationMatsPersonField> _fieldNameToEnum = {
    for (final field in MigrationMatsPersonField.values) field.name: field,
  };

  // Cache for fromFieldKey results to avoid repeated fromEnum calls
  static final Map<String,
          ExtendedField<MigrationMatsPersonField, ElbCrmLocalizations>>
      _fieldKeyCache = {};

  // ========== Core Fields ==========

  static ExtendedField<MigrationMatsPersonField, ElbCrmLocalizations>
      get idContact => ExtendedFieldImpl.text(
            MigrationMatsPersonField.idContact,
            readableFunc: (l10n, crmL10n) =>
                '${crmL10n.contact_singular} ${l10n.gen_id}',
            validatorFunc: (l10n, _) => null,
          );

  static ExtendedField<MigrationMatsPersonField, ElbCrmLocalizations>
      get nameFirst => ExtendedFieldImpl.text(
            MigrationMatsPersonField.nameFirst,
            readableFunc: (l10n, crmL10n) => crmL10n.contact_first_name,
            validatorFunc: (l10n, _) => null,
          );

  static ExtendedField<MigrationMatsPersonField, ElbCrmLocalizations>
      get nameLast => ExtendedFieldImpl.text(
            MigrationMatsPersonField.nameLast,
            readableFunc: (l10n, crmL10n) => crmL10n.contact_last_name,
            validatorFunc: (l10n, _) => null,
          );

  static ExtendedField<MigrationMatsPersonField, ElbCrmLocalizations>
      get anrede => ExtendedFieldImpl.text(
            MigrationMatsPersonField.anrede,
            readableFunc: (l10n, crmL10n) => crmL10n.salutation_code_singular,
            validatorFunc: (l10n, _) => null,
          );

  static ExtendedField<MigrationMatsPersonField, ElbCrmLocalizations>
      get titel => ExtendedFieldImpl.text(
            MigrationMatsPersonField.titel,
            readableFunc: (l10n, crmL10n) => 'Titel'.hc,
            validatorFunc: (l10n, _) => null,
          );

  static ExtendedField<MigrationMatsPersonField, ElbCrmLocalizations>
      get department => ExtendedFieldImpl.text(
            MigrationMatsPersonField.department,
            readableFunc: (l10n, crmL10n) => crmL10n.department_code_singular,
            validatorFunc: (l10n, _) => null,
          );

  static ExtendedField<MigrationMatsPersonField, ElbCrmLocalizations>
      get position => ExtendedFieldImpl.text(
            MigrationMatsPersonField.position,
            readableFunc: (l10n, crmL10n) => 'Position'.hc,
            validatorFunc: (l10n, _) => null,
          );

  static ExtendedField<MigrationMatsPersonField, ElbCrmLocalizations>
      get anredeLang => ExtendedFieldImpl.text(
            MigrationMatsPersonField.anredeLang,
            readableFunc: (l10n, crmL10n) => 'Anrede Lang'.hc,
            validatorFunc: (l10n, _) => null,
          );

  static ExtendedField<MigrationMatsPersonField, ElbCrmLocalizations>
      get idAccount => ExtendedFieldImpl.text(
            MigrationMatsPersonField.idAccount,
            readableFunc: (l10n, crmL10n) => 'Account ID'.hc,
            validatorFunc: (l10n, _) => null,
          );

  static ExtendedField<MigrationMatsPersonField, ElbCrmLocalizations>
      get isPerson => ExtendedFieldImpl.boolean(
            MigrationMatsPersonField.isPerson,
            readableFunc: (l10n, crmL10n) => 'isPerson'.hc,
            validatorFunc: (l10n, _) => null,
          );

  static ExtendedField<MigrationMatsPersonField, ElbCrmLocalizations>
      get primaryStreet1 => ExtendedFieldImpl.text(
            MigrationMatsPersonField.primaryStreet1,
            readableFunc: (l10n, crmL10n) => crmL10n.contact_address,
            validatorFunc: (l10n, _) => null,
          );

  static ExtendedField<MigrationMatsPersonField, ElbCrmLocalizations>
      get primaryStreet2 => ExtendedFieldImpl.text(
            MigrationMatsPersonField.primaryStreet2,
            readableFunc: (l10n, crmL10n) => crmL10n.contact_address2,
            validatorFunc: (l10n, _) => null,
          );

  static ExtendedField<MigrationMatsPersonField, ElbCrmLocalizations>
      get primaryPostalCode => ExtendedFieldImpl.text(
            MigrationMatsPersonField.primaryPostalCode,
            readableFunc: (l10n, crmL10n) => crmL10n.contact_zip,
            validatorFunc: (l10n, _) => null,
          );

  static ExtendedField<MigrationMatsPersonField, ElbCrmLocalizations>
      get primaryCity => ExtendedFieldImpl.text(
            MigrationMatsPersonField.primaryCity,
            readableFunc: (l10n, crmL10n) => crmL10n.contact_city,
            validatorFunc: (l10n, _) => null,
          );

  static ExtendedField<MigrationMatsPersonField, ElbCrmLocalizations>
      get primaryCountry => ExtendedFieldImpl.text(
            MigrationMatsPersonField.primaryCountry,
            readableFunc: (l10n, crmL10n) => crmL10n.country_code_singular,
            validatorFunc: (l10n, _) => null,
          );

  static ExtendedField<MigrationMatsPersonField, ElbCrmLocalizations>
      get primaryState => ExtendedFieldImpl.text(
            MigrationMatsPersonField.primaryState,
            readableFunc: (l10n, crmL10n) => crmL10n.contact_state,
            validatorFunc: (l10n, _) => null,
          );

  static ExtendedField<MigrationMatsPersonField, ElbCrmLocalizations>
      get telefon1 => ExtendedFieldImpl.text(
            MigrationMatsPersonField.telefon1,
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

  static ExtendedField<MigrationMatsPersonField, ElbCrmLocalizations>
      get telefon2 => ExtendedFieldImpl.text(
            MigrationMatsPersonField.telefon2,
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

  static ExtendedField<MigrationMatsPersonField, ElbCrmLocalizations>
      get mobilTelefon => ExtendedFieldImpl.text(
            MigrationMatsPersonField.mobilTelefon,
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

  static ExtendedField<MigrationMatsPersonField, ElbCrmLocalizations> get fax =>
      ExtendedFieldImpl.text(
        MigrationMatsPersonField.fax,
        readableFunc: (l10n, crmL10n) => 'Fax'.hc,
        validatorFunc: (l10n, _) => null,
      );

  static ExtendedField<MigrationMatsPersonField, ElbCrmLocalizations>
      get email => ExtendedFieldImpl.text(
            MigrationMatsPersonField.email,
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

  static ExtendedField<MigrationMatsPersonField, ElbCrmLocalizations>
      get status => ExtendedFieldImpl.text(
            MigrationMatsPersonField.status,
            readableFunc: (l10n, crmL10n) => 'Status'.hc,
            validatorFunc: (l10n, _) => null,
          );

  static ExtendedField<MigrationMatsPersonField, ElbCrmLocalizations> get wK =>
      ExtendedFieldImpl.text(
        MigrationMatsPersonField.wK,
        readableFunc: (l10n, crmL10n) => 'WK'.hc,
        validatorFunc: (l10n, _) => null,
      );

  static ExtendedField<MigrationMatsPersonField, ElbCrmLocalizations> get wWf =>
      ExtendedFieldImpl.text(
        MigrationMatsPersonField.wWf,
        readableFunc: (l10n, crmL10n) => 'WWf'.hc,
        validatorFunc: (l10n, _) => null,
      );

  static ExtendedField<MigrationMatsPersonField, ElbCrmLocalizations> get wFp =>
      ExtendedFieldImpl.text(
        MigrationMatsPersonField.wFp,
        readableFunc: (l10n, crmL10n) => 'WFp'.hc,
        validatorFunc: (l10n, _) => null,
      );

  static ExtendedField<MigrationMatsPersonField, ElbCrmLocalizations>
      get contactInfor => ExtendedFieldImpl.text(
            MigrationMatsPersonField.contactInfor,
            readableFunc: (l10n, crmL10n) => 'Contact Info'.hc,
            validatorFunc: (l10n, _) => null,
          );

  static ExtendedField<MigrationMatsPersonField, ElbCrmLocalizations>
      get isMigrated => ExtendedFieldImpl.boolean(
            MigrationMatsPersonField.isMigrated,
            readableFunc: (l10n, crmL10n) => 'Migriert'.hc,
            validatorFunc: (l10n, _) => null,
          );

  static ExtendedField<MigrationMatsPersonField, ElbCrmLocalizations>
      get createdAt => ExtendedFieldImpl.date(
            MigrationMatsPersonField.createdAt,
            readableFunc: (l10n, crmL10n) => l10n.gen_created_at,
            dateValidatorFunc: (l10n, _) => null,
          );

  static ExtendedField<MigrationMatsPersonField, ElbCrmLocalizations>
      get createdBy => ExtendedFieldImpl.assignedUser(
            MigrationMatsPersonField.createdBy,
            readableFunc: (l10n, crmL10n) => l10n.gen_created_by,
            isMandatory: false,
          );

  static ExtendedField<MigrationMatsPersonField, ElbCrmLocalizations>
      get lastModifiedAt => ExtendedFieldImpl.date(
            MigrationMatsPersonField.lastModifiedAt,
            readableFunc: (l10n, crmL10n) => l10n.gen_last_modified_at,
            dateValidatorFunc: (l10n, _) => null,
          );

  static ExtendedField<MigrationMatsPersonField, ElbCrmLocalizations>
      get lastModifiedBy => ExtendedFieldImpl.assignedUser(
            MigrationMatsPersonField.lastModifiedBy,
            readableFunc: (l10n, crmL10n) => l10n.gen_last_modified_by,
            isMandatory: false,
          );

  static ExtendedField<MigrationMatsPersonField, ElbCrmLocalizations>
      get deletedAt => ExtendedFieldImpl.date(
            MigrationMatsPersonField.deletedAt,
            readableFunc: (l10n, crmL10n) => l10n.gen_deleted_at,
            dateValidatorFunc: (l10n, _) => null,
          );

  static ExtendedField<MigrationMatsPersonField, ElbCrmLocalizations>
      get isDraft => ExtendedFieldImpl.boolean(
            MigrationMatsPersonField.isDraft,
            readableFunc: (l10n, crmL10n) => l10n.gen_is_draft,
            validatorFunc: (l10n, _) => null,
            filterTypes: DefaultFilterTypes.noFilter,
          );

  // ========== Helper methods ==========

  /// Get ExtendedField from enum value
  static ExtendedField<MigrationMatsPersonField, ElbCrmLocalizations> fromEnum(
    MigrationMatsPersonField field,
  ) {
    return switch (field) {
      MigrationMatsPersonField.idContact => idContact,
      MigrationMatsPersonField.nameFirst => nameFirst,
      MigrationMatsPersonField.nameLast => nameLast,
      MigrationMatsPersonField.anrede => anrede,
      MigrationMatsPersonField.titel => titel,
      MigrationMatsPersonField.department => department,
      MigrationMatsPersonField.position => position,
      MigrationMatsPersonField.anredeLang => anredeLang,
      MigrationMatsPersonField.idAccount => idAccount,
      MigrationMatsPersonField.isPerson => isPerson,
      MigrationMatsPersonField.primaryStreet1 => primaryStreet1,
      MigrationMatsPersonField.primaryStreet2 => primaryStreet2,
      MigrationMatsPersonField.primaryPostalCode => primaryPostalCode,
      MigrationMatsPersonField.primaryCity => primaryCity,
      MigrationMatsPersonField.primaryCountry => primaryCountry,
      MigrationMatsPersonField.primaryState => primaryState,
      MigrationMatsPersonField.telefon1 => telefon1,
      MigrationMatsPersonField.telefon2 => telefon2,
      MigrationMatsPersonField.mobilTelefon => mobilTelefon,
      MigrationMatsPersonField.fax => fax,
      MigrationMatsPersonField.email => email,
      MigrationMatsPersonField.status => status,
      MigrationMatsPersonField.wK => wK,
      MigrationMatsPersonField.wWf => wWf,
      MigrationMatsPersonField.wFp => wFp,
      MigrationMatsPersonField.contactInfor => contactInfor,
      MigrationMatsPersonField.isMigrated => isMigrated,
      MigrationMatsPersonField.createdAt => createdAt,
      MigrationMatsPersonField.createdBy => createdBy,
      MigrationMatsPersonField.lastModifiedAt => lastModifiedAt,
      MigrationMatsPersonField.lastModifiedBy => lastModifiedBy,
      MigrationMatsPersonField.deletedAt => deletedAt,
      MigrationMatsPersonField.isDraft => isDraft,
    };
  }

  /// Get ExtendedField from field key string (with caching for performance)
  static ExtendedField<MigrationMatsPersonField, ElbCrmLocalizations>
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

/// Extension methods for table operations (replacing MigrationMatsPersonFieldsExt)
extension MigrationMatsPersonFieldsTableExt on List<MigrationMatsPersonField> {
  /// Returns a map of filterable fields with their labels
  Map<MigrationMatsPersonField, TableFieldData> filterableWithLabels(
    ElbCoreLocalizations l10n,
    ElbCrmLocalizations crmL10n,
  ) {
    final map = <MigrationMatsPersonField, TableFieldData>{};
    for (final field in this) {
      final extField = MigrationMatsPersonFields.fromEnum(field);
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
  Map<MigrationMatsPersonField, TableColumnData> tableColumnsWithLabels(
    ElbCoreLocalizations l10n,
    ElbCrmLocalizations crmL10n,
  ) {
    final map = <MigrationMatsPersonField, TableColumnData>{};
    for (final field in this) {
      final extField = MigrationMatsPersonFields.fromEnum(field);
      map[field] = TableColumnData(
        readable: extField.readable(l10n, crmL10n),
        fieldConfig: extField.tableFieldConfig,
      );
    }
    return map;
  }

  /// Returns ordered fields for display
  List<MigrationMatsPersonField> orderedFields(
    ElbCoreLocalizations l10n,
    ElbCrmLocalizations crmL10n,
  ) {
    final fields = toList()
      ..sort((a, b) {
        final aField = MigrationMatsPersonFields.fromEnum(a);
        final bField = MigrationMatsPersonFields.fromEnum(b);

        final aReadable = aField.readable(l10n, crmL10n);
        final bReadable = bField.readable(l10n, crmL10n);
        return aReadable.compareTo(bReadable);
      });

    return fields;
  }
}
