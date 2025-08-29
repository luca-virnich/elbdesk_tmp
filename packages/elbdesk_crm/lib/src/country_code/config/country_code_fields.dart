import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations.dart';

/// UNIFIED CountryCodeField fields with ALL features (forms + tables) in ONE place
/// This replaces the old individual static getters approach
class CountryCodeFields {
  CountryCodeFields._();

  // ==================== FIELD CACHE ====================

  static final _cache = FieldCache<CountryCodeField, ElbCrmLocalizations>(
    values: CountryCodeField.values,
    createField: _createField,
  );

  static ExtendedField<CountryCodeField, ElbCrmLocalizations> fromEnum(
    CountryCodeField field,
  ) =>
      _cache.fromEnum(field);

  static ExtendedField<CountryCodeField, ElbCrmLocalizations> fromFieldKey(
    String fieldKey,
  ) =>
      _cache.fromFieldKey(fieldKey);

  static final List<TableFieldConfig> defaultTableColumns = List.unmodifiable([
    _cache.fromEnum(CountryCodeField.code).tableFieldConfig,
    _cache.fromEnum(CountryCodeField.countryRegionName).tableFieldConfig,
    _cache.fromEnum(CountryCodeField.isoCode).tableFieldConfig,
    _cache.fromEnum(CountryCodeField.numericCode).tableFieldConfig,
    _cache.fromEnum(CountryCodeField.addressFormat).tableFieldConfig,
    _cache.fromEnum(CountryCodeField.contactAddressFormat).tableFieldConfig,
    _cache.fromEnum(CountryCodeField.isPrimary).tableFieldConfig,
  ]);

  // ==================== FIELD DEFINITIONS ====================

  static ExtendedField<CountryCodeField, ElbCrmLocalizations> _createField(
    CountryCodeField field,
  ) {
    return switch (field) {
      // ========== Meta Fields ==========
      CountryCodeField.deletedAt => ExtendedFieldImpl.date(
          CountryCodeField.deletedAt,
          readableFunc: (l10n, _) => l10n.gen_deleted_at,
          dateValidatorFunc: (l10n, _) => null,
          filterTypes: DefaultFilterTypes.noFilter,
        ),
      CountryCodeField.isDraft => ExtendedFieldImpl.boolean(
          CountryCodeField.isDraft,
          readableFunc: (l10n, _) => l10n.gen_is_draft,
          validatorFunc: (l10n, _) => null,
          filterTypes: DefaultFilterTypes.noFilter,
        ),
      CountryCodeField.createdBy => ExtendedFieldImpl.assignedUser(
          CountryCodeField.createdBy,
          readableFunc: (l10n, _) => l10n.gen_created_by,
          isMandatory: false,
        ),
      CountryCodeField.lastModifiedBy => ExtendedFieldImpl.assignedUser(
          CountryCodeField.lastModifiedBy,
          readableFunc: (l10n, _) => l10n.gen_last_modified_by,
          isMandatory: false,
        ),
      CountryCodeField.createdAt => ExtendedFieldImpl.date(
          CountryCodeField.createdAt,
          readableFunc: (l10n, _) => l10n.gen_created_at,
          dateValidatorFunc: (l10n, _) => null,
        ),
      CountryCodeField.lastModifiedAt => ExtendedFieldImpl.date(
          CountryCodeField.lastModifiedAt,
          readableFunc: (l10n, _) => l10n.gen_last_modified_at,
          dateValidatorFunc: (l10n, _) => null,
        ),
      CountryCodeField.id => const ExtendedFieldImpl.id(
          CountryCodeField.id,
        ),

      // ========== Core Country Fields ==========
      CountryCodeField.isPrimary => ExtendedFieldImpl.boolean(
          CountryCodeField.isPrimary,
          readableFunc: (l10n, crmL10n) => crmL10n.country_code_primary,
          validatorFunc: (l10n, _) => null,
          cellWidth: 120,
        ),
      CountryCodeField.showState => ExtendedFieldImpl.boolean(
          CountryCodeField.showState,
          readableFunc: (l10n, crmL10n) => crmL10n.country_code_show_state,
          validatorFunc: (l10n, _) => null,
        ),
      CountryCodeField.code => ExtendedFieldImpl.text(
          CountryCodeField.code,
          readableFunc: (l10n, crmL10n) => crmL10n.country_code_code,
          validatorFunc: (l10n, _) => (String? value) {
            return TextFieldValidator.isTextNotEmptyOrNull(
              value,
              l10n.validation_required,
            );
          },
        ),
      CountryCodeField.countryRegionName => ExtendedFieldImpl.text(
          CountryCodeField.countryRegionName,
          readableFunc: (l10n, crmL10n) => crmL10n.country_code_name,
          validatorFunc: (l10n, _) => (String? value) {
            return TextFieldValidator.isTextNotEmptyOrNull(
              value,
              l10n.validation_required,
            );
          },
          cellWidth: 140,
        ),
      CountryCodeField.isoCode => ExtendedFieldImpl.text(
          CountryCodeField.isoCode,
          readableFunc: (l10n, crmL10n) => crmL10n.country_code_iso_code,
          validatorFunc: (l10n, _) => (String? value) {
            return TextFieldValidator.isTextNotEmptyOrNull(
              value,
              l10n.validation_required,
            );
          },
          cellWidth: 140,
        ),
      CountryCodeField.numericCode => ExtendedFieldImpl.text(
          CountryCodeField.numericCode,
          readableFunc: (l10n, crmL10n) =>
              crmL10n.country_code_numeric_iso_code,
          validatorFunc: (l10n, _) => (String? value) {
            if (value == null || value.trim().isEmpty) {
              return l10n.validation_required;
            }
            final isInt = int.tryParse(value);
            if (isInt == null) {
              return l10n.validation_invalid_number;
            }
            return null;
          },
          cellWidth: 140,
        ),
      CountryCodeField.addressFormat => ExtendedFieldImpl.textDropdown(
          isMandatory: true,
          CountryCodeField.addressFormat,
          readableFunc: (l10n, crmL10n) => crmL10n.country_code_address_format,
          cellWidth: 140,
          items: (l10n, crmL10n) => [
            // ! FIXME
          ],
        ),
      CountryCodeField.contactAddressFormat => ExtendedFieldImpl.textDropdown(
          isMandatory: true,
          CountryCodeField.contactAddressFormat,
          readableFunc: (l10n, crmL10n) =>
              crmL10n.country_code_contact_address_format,
          cellWidth: 140,
          items: (l10n, crmL10n) => [
            // ! FIXME
          ],
        ),
      CountryCodeField.federalRegion => ExtendedFieldImpl.text(
          CountryCodeField.federalRegion,
          readableFunc: (l10n, crmL10n) => crmL10n.country_code_region,
          validatorFunc: (l10n, _) => null,
        ),
      CountryCodeField.euCode => ExtendedFieldImpl.text(
          CountryCodeField.euCode,
          readableFunc: (l10n, crmL10n) => crmL10n.country_code_eu_code,
          validatorFunc: (l10n, _) => null,
        ),
      CountryCodeField.intrastatCode => ExtendedFieldImpl.text(
          CountryCodeField.intrastatCode,
          readableFunc: (l10n, crmL10n) => crmL10n.country_code_intrastat_code,
          validatorFunc: (l10n, _) => null,
        ),
      CountryCodeField.taxScheme => ExtendedFieldImpl.text(
          CountryCodeField.taxScheme,
          readableFunc: (l10n, crmL10n) => crmL10n.country_code_tax_scheme,
          validatorFunc: (l10n, _) => null,
        ),
    };
  }
}

// ==================== LIST EXTENSIONS ====================

/// Extension methods for table operations
extension CountryCodeFieldsTableExt on List<CountryCodeField> {
  /// Returns a map of filterable fields with labels
  Map<CountryCodeField, TableFieldData> filterableWithLabels(
    ElbCoreLocalizations l10n,
    ElbCrmLocalizations crmL10n,
  ) {
    return ExtendedFieldListExt<CountryCodeField, ElbCrmLocalizations>(this)
        .buildFilters(
      coreL10n: l10n,
      customL10n: crmL10n,
      fromEnum: CountryCodeFields.fromEnum,
    );
  }

  /// Returns a map of table columns with labels
  Map<CountryCodeField, TableColumnData> tableColumnsWithLabels(
    ElbCoreLocalizations l10n,
    ElbCrmLocalizations crmL10n,
  ) {
    const excludeFields = {
      CountryCodeField.deletedAt,
      CountryCodeField.isDraft,
      CountryCodeField.id,
    };
    return ExtendedFieldListExt<CountryCodeField, ElbCrmLocalizations>(this)
        .buildColumns(
      coreL10n: l10n,
      customL10n: crmL10n,
      fromEnum: CountryCodeFields.fromEnum,
      excludeFields: excludeFields,
    );
  }
}

extension CountryCodeAddressFormatExt on CountryCodeAddressFormat {
  String readable(ElbCrmLocalizations crmL10n) {
    return switch (this) {
      CountryCodeAddressFormat.postCode_city =>
        crmL10n.country_code_address_format_postcode_city,
      CountryCodeAddressFormat.city_postCode =>
        crmL10n.country_code_address_format_city_postcode,
      CountryCodeAddressFormat.city_country_postCode =>
        crmL10n.country_code_address_format_city_country_postCode,
      CountryCodeAddressFormat.blank_postCode_city =>
        crmL10n.country_code_address_format_blank_postCode_city,
    };
  }
}

extension CountryCodeContactAddressFormatExt
    on CountryCodeContactAddressFormat {
  String readable(ElbCrmLocalizations crmL10n) {
    return switch (this) {
      CountryCodeContactAddressFormat.afterCompanyName =>
        crmL10n.country_code_contact_address_format_after_company_name,
      CountryCodeContactAddressFormat.first =>
        crmL10n.country_code_contact_address_format_first,
      CountryCodeContactAddressFormat.last =>
        crmL10n.country_code_contact_address_format_last,
    };
  }
}
