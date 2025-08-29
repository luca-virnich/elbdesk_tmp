import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations.dart';
import 'package:elbdesk_crm/src/contact/extensions/contact_type_extension.dart';
import 'package:flutter/material.dart';

class ContactFields {
  ContactFields._();

  // ==================== FIELD CACHE ====================

  static final _cache = FieldCache<ContactField, ElbCrmLocalizations>(
    values: ContactField.values,
    createField: _createField,
  );

  static ExtendedField<ContactField, ElbCrmLocalizations> fromEnum(
    ContactField field,
  ) =>
      _cache.fromEnum(field);

  static ExtendedField<ContactField, ElbCrmLocalizations> fromFieldKey(
    String fieldKey,
  ) =>
      _cache.fromFieldKey(fieldKey);

  static final List<TableFieldConfig> defaultTableColumns = List.unmodifiable([
    _cache.fromEnum(ContactField.customIdString).tableFieldConfig,
    _cache.fromEnum(ContactField.fullName).tableFieldConfig,
    _cache.fromEnum(ContactField.phone).tableFieldConfig,
    _cache.fromEnum(ContactField.mobile).tableFieldConfig,
    _cache.fromEnum(ContactField.email).tableFieldConfig,
    _cache.fromEnum(ContactField.city).tableFieldConfig,
    _cache.fromEnum(ContactField.countryCode).tableFieldConfig,
    _cache.fromEnum(ContactField.customerCustomId).tableFieldConfig,
    _cache.fromEnum(ContactField.actions).tableFieldConfig,
  ]);

  static final List<TableFieldConfig> defaultPersonsTableColumns =
      List.unmodifiable([
    _cache.fromEnum(ContactField.customIdString).tableFieldConfig,
    _cache.fromEnum(ContactField.fullName).tableFieldConfig,
    _cache.fromEnum(ContactField.phone).tableFieldConfig,
    _cache.fromEnum(ContactField.mobile).tableFieldConfig,
    _cache.fromEnum(ContactField.email).tableFieldConfig,
    _cache.fromEnum(ContactField.city).tableFieldConfig,
    _cache.fromEnum(ContactField.countryCode).tableFieldConfig,
  ]);

  static final List<TableFieldConfig> defaultCompanyTableColumns =
      List.unmodifiable([
    _cache.fromEnum(ContactField.customIdString).tableFieldConfig,
    _cache.fromEnum(ContactField.fullName).tableFieldConfig,
    _cache.fromEnum(ContactField.phone).tableFieldConfig,
    _cache.fromEnum(ContactField.mobile).tableFieldConfig,
    _cache.fromEnum(ContactField.email).tableFieldConfig,
    _cache.fromEnum(ContactField.city).tableFieldConfig,
    _cache.fromEnum(ContactField.countryCode).tableFieldConfig,
    _cache.fromEnum(ContactField.customerCustomId).tableFieldConfig,
  ]);

  static final List<TableFieldConfig> defaultSelectionTableColumns =
      List.unmodifiable([
    _cache.fromEnum(ContactField.customIdString).tableFieldConfig,
    _cache.fromEnum(ContactField.fullName).tableFieldConfig,
    _cache.fromEnum(ContactField.address).tableFieldConfig,
    _cache.fromEnum(ContactField.postCode).tableFieldConfig,
    _cache.fromEnum(ContactField.city).tableFieldConfig,
    _cache.fromEnum(ContactField.countryCode).tableFieldConfig,
  ]);

  static final List<TableFieldConfig>
      defaultSelectionShippingAddressTableColumns = List.unmodifiable([
    _cache.fromEnum(ContactField.fullName).tableFieldConfig,
    _cache.fromEnum(ContactField.address).tableFieldConfig,
    _cache.fromEnum(ContactField.address2).tableFieldConfig,
    _cache.fromEnum(ContactField.postCode).tableFieldConfig,
    _cache.fromEnum(ContactField.city).tableFieldConfig,
    _cache.fromEnum(ContactField.countryCode).tableFieldConfig,
  ]);

  // ==================== FIELD DEFINITIONS ====================

  static ExtendedField<ContactField, ElbCrmLocalizations> _createField(
    ContactField field,
  ) {
    return switch (field) {
      // ========== Meta Fields ==========
      ContactField.deletedAt =>
        ExtendedFieldImpl<ContactField, ElbCrmLocalizations>.date(
          ContactField.deletedAt,
          readableFunc: (coreL10n, _) => coreL10n.gen_deleted_at,
          dateValidatorFunc: (_, __) => null,
          filterTypes: DefaultFilterTypes.noFilter,
          excludeFromTable: true,
        ),
      ContactField.isDraft =>
        ExtendedFieldImpl<ContactField, ElbCrmLocalizations>.boolean(
          ContactField.isDraft,
          readableFunc: (coreL10n, _) => coreL10n.gen_is_draft,
          validatorFunc: (_, __) => null,
          filterTypes: DefaultFilterTypes.noFilter,
          excludeFromTable: true,
        ),
      ContactField.createdAt =>
        ExtendedFieldImpl<ContactField, ElbCrmLocalizations>.date(
          ContactField.createdAt,
          readableFunc: (coreL10n, _) => coreL10n.gen_created_at,
          dateValidatorFunc: (_, __) => null,
        ),
      ContactField.createdBy =>
        ExtendedFieldImpl<ContactField, ElbCrmLocalizations>.assignedUser(
          ContactField.createdBy,
          readableFunc: (coreL10n, _) => coreL10n.gen_created_by,
          isMandatory: false,
        ),
      ContactField.lastModifiedAt =>
        ExtendedFieldImpl<ContactField, ElbCrmLocalizations>.date(
          ContactField.lastModifiedAt,
          readableFunc: (coreL10n, _) => coreL10n.gen_last_modified_at,
          dateValidatorFunc: (_, __) => null,
        ),
      ContactField.lastModifiedBy =>
        ExtendedFieldImpl<ContactField, ElbCrmLocalizations>.assignedUser(
          ContactField.lastModifiedBy,
          readableFunc: (coreL10n, _) => coreL10n.gen_last_modified_by,
          isMandatory: false,
        ),
      ContactField.id =>
        ExtendedFieldImpl<ContactField, ElbCrmLocalizations>.text(
          ContactField.id,
          readableFunc: (coreL10n, _) => coreL10n.primary_key,
          validatorFunc: (_, __) => null,
        ),
      ContactField.customId =>
        const ExtendedFieldImpl<ContactField, ElbCrmLocalizations>.ignore(
          ContactField.customId,
        ),
      ContactField.customIdString =>
        ExtendedFieldImpl<ContactField, ElbCrmLocalizations>.text(
          ContactField.customIdString,
          readableFunc: (coreL10n, _) => coreL10n.gen_id,
          validatorFunc: (_, __) => null,
          cellWidth: 80,
        ),
      ContactField.filterByIdOrFullName =>
        ExtendedFieldImpl<ContactField, ElbCrmLocalizations>.text(
          ContactField.filterByIdOrFullName,
          readableFunc: (_, crmL10n) => crmL10n.contact_id_and_fullname,
          validatorFunc: (_, __) => null,
          excludeFromTable: true,
        ),

      // ========== Name Fields ==========
      ContactField.firstName => ExtendedFieldImpl.text(
          ContactField.firstName,
          readableFunc: (_, crmL10n) => crmL10n.contact_first_name,
          validatorFunc: (coreL10n, _) => (String? value) {
            if (TextInputValidator.isNullOrEmpty(value)) {
              return coreL10n.validation_name_required;
            }
            return null;
          },
        ),
      ContactField.lastName => ExtendedFieldImpl.text(
          ContactField.lastName,
          readableFunc: (_, crmL10n) => crmL10n.contact_last_name,
          validatorFunc: (coreL10n, _) => (String? value) {
            if (TextInputValidator.isNullOrEmpty(value)) {
              return coreL10n.validation_name_required;
            }
            return null;
          },
        ),
      ContactField.fullName => ExtendedFieldImpl.text(
          ContactField.fullName,
          readableFunc: (_, crmL10n) => crmL10n.contact_name,
          validatorFunc: (coreL10n, _) => (String? value) {
            if (TextInputValidator.isNullOrEmpty(value)) {
              return coreL10n.validation_name_required;
            }
            return null;
          },
          cellWidth: 140,
        ),

      // ========== Communication Fields ==========
      ContactField.email => ExtendedFieldImpl.text(
          ContactField.email,
          readableFunc: (_, crmL10n) => crmL10n.contact_email,
          validatorFunc: (coreL10n, _) => (String? value) {
            if (value == null || value.isEmpty) return null;
            return AppValidator.isValidEmail(value)
                ? null
                : coreL10n.validation_invalid_email;
          },
          keyboardType: TextInputType.emailAddress,
          cellWidth: 140,
        ),
      ContactField.phone => ExtendedFieldImpl.text(
          ContactField.phone,
          readableFunc: (_, crmL10n) => crmL10n.contact_phone,
          validatorFunc: (coreL10n, _) => (String? value) {
            if (value == null || value.isEmpty) return null;
            return AppValidator.isValidPhoneNumber(value)
                ? null
                : coreL10n.validation_invalid_phone;
          },
          keyboardType: TextInputType.phone,
          cellWidth: 140,
        ),
      ContactField.mobile => ExtendedFieldImpl.text(
          ContactField.mobile,
          readableFunc: (_, crmL10n) => crmL10n.contact_mobile,
          validatorFunc: (coreL10n, _) => (String? value) {
            if (value == null || value.isEmpty) return null;
            return AppValidator.isValidPhoneNumber(value)
                ? null
                : coreL10n.validation_invalid_phone;
          },
          keyboardType: TextInputType.phone,
          cellWidth: 140,
        ),
      ContactField.website => ExtendedFieldImpl.text(
          ContactField.website,
          readableFunc: (_, crmL10n) => crmL10n.contact_website,
          validatorFunc: (_, __) => null,
          keyboardType: TextInputType.url,
          cellWidth: 140,
        ),

      // ========== Address Fields ==========
      ContactField.address => ExtendedFieldImpl.text(
          ContactField.address,
          readableFunc: (_, crmL10n) => crmL10n.contact_address_singular,
          validatorFunc: (_, __) => null,
        ),
      ContactField.address2 => ExtendedFieldImpl.text(
          ContactField.address2,
          readableFunc: (_, crmL10n) => crmL10n.contact_address2,
          validatorFunc: (_, __) => null,
          maxLines: 2,
        ),
      ContactField.address3 => ExtendedFieldImpl.text(
          ContactField.address3,
          readableFunc: (_, crmL10n) => crmL10n.contact_address3,
          validatorFunc: (_, __) => null,
          excludeFromTable: true,
        ),
      ContactField.postCode => ExtendedFieldImpl.text(
          ContactField.postCode,
          readableFunc: (_, crmL10n) => crmL10n.contact_zip,
          validatorFunc: (_, __) => null,
        ),
      ContactField.city => ExtendedFieldImpl.text(
          ContactField.city,
          readableFunc: (_, crmL10n) => crmL10n.contact_city,
          validatorFunc: (_, __) => null,
          cellWidth: 140,
        ),
      ContactField.state => ExtendedFieldImpl.text(
          ContactField.state,
          readableFunc: (_, crmL10n) => crmL10n.contact_state,
          validatorFunc: (_, __) => null,
        ),

      // ========== Type/Category Fields ==========
      ContactField.type => ExtendedFieldImpl.textDropdown(
          ContactField.type,
          readableFunc: (_, crmL10n) => crmL10n.type,
          isMandatory: true,
          excludeFromTable: true,
          items: (coreL10n, crmL10n) => ContactType.values
              .map(
                (type) => DropdownItem.text(
                  value: type,
                  label: type.readable(crmL10n),
                ),
              )
              .toList(),
        ),
      ContactField.salutationCode => ExtendedFieldImpl.lazyTextDropdown(
          isMandatory: true,
          ContactField.salutationCode,
          readableFunc: (_, crmL10n) => crmL10n.salutation_code_singular,
          validatorFunc: (_, __) => null,
        ),
      ContactField.countryCode => ExtendedFieldImpl.lazyTextDropdown(
          ContactField.countryCode,
          readableFunc: (_, crmL10n) => crmL10n.country_code_singular,
          validatorFunc: (_, __) => null,
          isMandatory: true,
          cellWidth: 140,
        ),
      ContactField.languageCode => ExtendedFieldImpl.lazyTextDropdown(
          isMandatory: true,
          ContactField.languageCode,
          readableFunc: (_, crmL10n) => crmL10n.language_code_singular,
          validatorFunc: (_, __) => null,
        ),

      // ========== Customer Relations ==========
      ContactField.customer => ExtendedFieldImpl.text(
          ContactField.customer,
          readableFunc: (_, crmL10n) => crmL10n.customer_singular,
          validatorFunc: (_, __) => null,
          excludeFromTable: true,
        ),
      ContactField.customerId => ExtendedFieldImpl.number(
          ContactField.customerId,
          readableFunc: (_, crmL10n) => crmL10n.customer_id,
          validatorFunc: (_, __) => null,
          keyboardType: TextInputType.number,
          excludeFromTable: true,
        ),
      ContactField.customerCustomId => ExtendedFieldImpl.text(
          ContactField.customerCustomId,
          readableFunc: (_, crmL10n) => crmL10n.customer_id,
          validatorFunc: (_, __) => null,
        ),

      // ========== Metadata Fields ==========
      ContactField.importantNote => ExtendedFieldImpl.text(
          ContactField.importantNote,
          readableFunc: (coreL10n, _) => coreL10n.gen_important_note,
          validatorFunc: (_, __) => null,
          keyboardType: TextInputType.multiline,
          maxLines: 3,
          minLines: 3,
        ),
      ContactField.birthDate => ExtendedFieldImpl.date(
          ContactField.birthDate,
          readableFunc: (_, crmL10n) => crmL10n.contact_birthday,
          dateValidatorFunc: (_, __) => null,
        ),

      // ========== UI/Action Fields ==========
      ContactField.selectContact => ExtendedFieldImpl.text(
          ContactField.selectContact,
          readableFunc: (coreL10n, _) => coreL10n.gen_table_select_entity,
          validatorFunc: (_, __) => null,
          excludeFromTable: true,
        ),
      ContactField.actions => ExtendedFieldImpl.text(
          ContactField.actions,
          readableFunc: (coreL10n, _) => coreL10n.gen_actions,
          validatorFunc: (_, __) => null,
          cellWidth: 140,
          excludeFromTable: true,
        ),
    };
  }
  // ==================== DROPDOWN ITEMS ====================

  static Map<ContactField, List<DropdownItem<dynamic>>>
      buildFilterDropdownItems(
    ElbCoreLocalizations l10n,
    ElbCrmLocalizations crmL10n,
  ) {
    return _cache.buildFilterDropdownItems(l10n, crmL10n);
  }
}

// ==================== LIST EXTENSIONS ====================

extension ContactFieldsTableExt on List<ContactField> {
  /// Get filterable fields with labels for companies
  TableFilters<ContactField> filtersCompanies(
    ElbCoreLocalizations l10n,
    ElbCrmLocalizations crmL10n,
  ) {
    final excludeFields = {
      ContactField.firstName,
      ContactField.lastName,
      ContactField.birthDate,
    };
    final priorityFields = [
      ContactField.filterByIdOrFullName,
    ];

    return ExtendedFieldListExt<ContactField, ElbCrmLocalizations>(
      this,
    ).buildFilters(
      coreL10n: l10n,
      customL10n: crmL10n,
      fromEnum: ContactFields.fromEnum,
      excludeFields: excludeFields,
      priorityFields: priorityFields,
    );
  }

  TableFilters<ContactField> filtersPersons(
    ElbCoreLocalizations l10n,
    ElbCrmLocalizations crmL10n,
  ) {
    final priorityFields = [
      ContactField.filterByIdOrFullName,
    ];
    final excludeFields = {
      ContactField.customerCustomId,
    };

    return ExtendedFieldListExt<ContactField, ElbCrmLocalizations>(
      this,
    ).buildFilters(
      coreL10n: l10n,
      customL10n: crmL10n,
      fromEnum: ContactFields.fromEnum,
      priorityFields: priorityFields,
      excludeFields: excludeFields,
    );
  }

  /// Get filterable fields with labels for all contacts
  TableFilters<ContactField> filtersContacts(
    ElbCoreLocalizations l10n,
    ElbCrmLocalizations crmL10n,
  ) {
    final priorityFields = [
      ContactField.filterByIdOrFullName,
    ];
    final includeFields = {
      ContactField.type,
    };
    final excludeFields = {
      ContactField.customerCustomId,
    };
    return ExtendedFieldListExt<ContactField, ElbCrmLocalizations>(
      this,
    ).buildFilters(
      coreL10n: l10n,
      customL10n: crmL10n,
      fromEnum: ContactFields.fromEnum,
      priorityFields: priorityFields,
      includeFields: includeFields,
      excludeFields: excludeFields,
    );
  }

  /// Get quick search filter fields for companies
  TableFilters<ContactField> quickSearchFilters(
    ElbCoreLocalizations l10n,
    ElbCrmLocalizations crmL10n,
  ) {
    return [
      ContactField.filterByIdOrFullName,
    ].buildQuickSearch(
      coreL10n: l10n,
      customL10n: crmL10n,
      fromEnum: ContactFields.fromEnum,
    );
  }

  /// Get table columns with labels for all contacts
  TableColumns<ContactField> columnsContacts(
    ElbCoreLocalizations l10n,
    ElbCrmLocalizations crmL10n,
  ) {
    final excludeFields = {
      ContactField.filterByIdOrFullName,
      ContactField.customerCustomId,
    };

    return ExtendedFieldListExt<ContactField, ElbCrmLocalizations>(
      this,
    ).buildColumns(
      coreL10n: l10n,
      customL10n: crmL10n,
      fromEnum: ContactFields.fromEnum,
      excludeFields: excludeFields,
    );
  }

  TableColumns<ContactField> columnsPersons(
    ElbCoreLocalizations l10n,
    ElbCrmLocalizations crmL10n,
  ) {
    final excludeFields = {
      ContactField.filterByIdOrFullName,
      ContactField.customerCustomId,
    };
    return ExtendedFieldListExt<ContactField, ElbCrmLocalizations>(
      this,
    ).buildColumns(
      coreL10n: l10n,
      customL10n: crmL10n,
      fromEnum: ContactFields.fromEnum,
      excludeFields: excludeFields,
    );
  }

  /// Get table columns for companies (excluding person-specific fields)
  TableColumns<ContactField> columnsCompanies(
    ElbCoreLocalizations l10n,
    ElbCrmLocalizations crmL10n,
  ) {
    const excludeFields = {
      ContactField.filterByIdOrFullName,
      ContactField.firstName,
      ContactField.lastName,
      ContactField.birthDate,
    };
    return ExtendedFieldListExt<ContactField, ElbCrmLocalizations>(
      this,
    ).buildColumns(
      coreL10n: l10n,
      customL10n: crmL10n,
      fromEnum: ContactFields.fromEnum,
      excludeFields: excludeFields,
    );
  }
}
