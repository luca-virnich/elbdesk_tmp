import 'package:elbdesk_backend_core_client/elbdesk_backend_core_client.dart';
import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations.dart';
import 'package:elbdesk_shared/elbdesk_shared.dart';
import 'package:flutter/services.dart';

/// UNIFIED AppUser fields with ALL features (forms + tables) in ONE place
/// This replaces AppUserFieldWrapper and follows the ContactFields pattern
class AppUserFields {
  AppUserFields._();

  // ==================== FIELD CACHE ====================

  static final _cache = FieldCache<AppUserField, ElbCrmLocalizations>(
    values: AppUserField.values,
    createField: _createField,
  );

  static ExtendedField<AppUserField, ElbCrmLocalizations> fromEnum(
    AppUserField field,
  ) =>
      _cache.fromEnum(field);

  static ExtendedField<AppUserField, ElbCrmLocalizations> fromFieldKey(
    String fieldKey,
  ) =>
      _cache.fromFieldKey(fieldKey);

  static final List<TableFieldConfig> defaultTableColumns = List.unmodifiable([
    _cache.fromEnum(AppUserField.fullName).tableFieldConfig,
    _cache.fromEnum(AppUserField.initials).tableFieldConfig,
    _cache.fromEnum(AppUserField.department).tableFieldConfig,
    _cache.fromEnum(AppUserField.email).tableFieldConfig,
    _cache.fromEnum(AppUserField.blocked).tableFieldConfig,
  ]);

  // ==================== FIELD DEFINITIONS ====================

  static ExtendedField<AppUserField, ElbCrmLocalizations> _createField(
    AppUserField field,
  ) {
    return switch (field) {
      // ========== Identification Fields ==========
      AppUserField.id => const ExtendedFieldImpl.id(
          AppUserField.id,
        ),
      AppUserField.userInfoId => ExtendedFieldImpl.number(
          AppUserField.userInfoId,
          readableFunc: (l10n, _) => l10n.admin_user_user_info_id,
          validatorFunc: (l10n, _) => null,
          keyboardType: TextInputType.number,
        ),
      AppUserField.userIdentifier => ExtendedFieldImpl.text(
          AppUserField.userIdentifier,
          readableFunc: (l10n, _) => l10n.admin_user_user_identifier,
          validatorFunc: (l10n, _) => null,
        ),
      AppUserField.userName => ExtendedFieldImpl.text(
          AppUserField.userName,
          readableFunc: (l10n, _) => l10n.admin_user_user_name,
          validatorFunc: (l10n, _) => (String? value) {
            if (value == null) return null;
            if (value.trim().isEmpty) return l10n.validation_name_required;
            return null;
          },
        ),

      // ========== Name Fields ==========
      AppUserField.firstName => ExtendedFieldImpl.text(
          AppUserField.firstName,
          readableFunc: (l10n, crmL10n) => crmL10n.contact_first_name,
          validatorFunc: (l10n, _) => null,
        ),
      AppUserField.lastName => ExtendedFieldImpl.text(
          AppUserField.lastName,
          readableFunc: (l10n, crmL10n) => crmL10n.contact_last_name,
          validatorFunc: (l10n, _) => null,
        ),
      AppUserField.fullName => ExtendedFieldImpl.text(
          AppUserField.fullName,
          readableFunc: (l10n, crmL10n) => l10n.admin_user_full_name,
          validatorFunc: (l10n, _) => (String? value) {
            if (value == null) return null;
            if (value.isEmpty) return l10n.validation_name_required;
            return null;
          },
        ),
      AppUserField.initials => ExtendedFieldImpl.text(
          AppUserField.initials,
          readableFunc: (l10n, crmL10n) => crmL10n.initials,
          validatorFunc: (l10n, _) => (String? value) {
            if (TextInputValidator.isNullOrEmpty(value)) {
              return ElbValidationError.appUserInitialsCannotBeEmpty
                  .translate(l10n.localeName);
            }
            // max length 4 chars
            if (TextInputValidator.isTooLong(value, 4)) {
              return ElbValidationError.appUserInitialsTooLong
                  .translate(l10n.localeName);
            }
            return null;
          },
        ),

      // ========== Communication Fields ==========
      AppUserField.email => ExtendedFieldImpl.text(
          AppUserField.email,
          readableFunc: (l10n, crmL10n) => l10n.admin_user_email_work,
          validatorFunc: (l10n, _) => (String? value) {
            if (value == null || value.isEmpty) {
              return l10n.validation_invalid_email;
            }
            final isValidMail = AppValidator.isValidEmail(value);
            if (!isValidMail) {
              return l10n.validation_invalid_email;
            }
            return null;
          },
          keyboardType: TextInputType.emailAddress,
        ),
      AppUserField.privateEmail => ExtendedFieldImpl.text(
          AppUserField.privateEmail,
          readableFunc: (l10n, crmL10n) => l10n.admin_user_email_private,
          validatorFunc: (l10n, _) => (String? value) {
            if (value == null || value.isEmpty) return null;
            final isValidMail = AppValidator.isValidEmail(value);
            if (!isValidMail) {
              return l10n.validation_invalid_email;
            }
            return null;
          },
          keyboardType: TextInputType.emailAddress,
        ),
      AppUserField.phone => ExtendedFieldImpl.text(
          AppUserField.phone,
          readableFunc: (l10n, crmL10n) => crmL10n.contact_phone,
          validatorFunc: (l10n, _) => (String? value) {
            if (value == null || value.isEmpty) return null;
            final isValidNumber = AppValidator.isValidPhoneNumber(value);
            if (!isValidNumber) {
              return l10n.validation_invalid_phone;
            }
            return null;
          },
          keyboardType: TextInputType.phone,
        ),
      AppUserField.mobile => ExtendedFieldImpl.text(
          AppUserField.mobile,
          readableFunc: (l10n, crmL10n) => crmL10n.contact_mobile,
          validatorFunc: (l10n, _) => (String? value) {
            if (value == null || value.isEmpty) return null;
            final isValidNumber = AppValidator.isValidPhoneNumber(value);
            if (!isValidNumber) {
              return l10n.validation_invalid_phone;
            }
            return null;
          },
          keyboardType: TextInputType.phone,
        ),

      // ========== Address Fields ==========
      AppUserField.address => ExtendedFieldImpl.text(
          AppUserField.address,
          readableFunc: (l10n, crmL10n) => crmL10n.contact_address_singular,
          validatorFunc: (l10n, _) => null,
        ),
      AppUserField.address2 => ExtendedFieldImpl.text(
          AppUserField.address2,
          readableFunc: (l10n, crmL10n) => crmL10n.contact_address2,
          validatorFunc: (l10n, _) => null,
          maxLines: 2,
        ),
      AppUserField.postCode => ExtendedFieldImpl.text(
          AppUserField.postCode,
          readableFunc: (l10n, crmL10n) => crmL10n.contact_zip,
          validatorFunc: (l10n, _) => null,
        ),
      AppUserField.city => ExtendedFieldImpl.text(
          AppUserField.city,
          readableFunc: (l10n, crmL10n) => crmL10n.contact_city,
          validatorFunc: (l10n, _) => null,
        ),
      AppUserField.state => ExtendedFieldImpl.text(
          AppUserField.state,
          readableFunc: (l10n, crmL10n) => crmL10n.contact_state,
          validatorFunc: (l10n, _) => null,
        ),
      AppUserField.country => ExtendedFieldImpl.text(
          AppUserField.country,
          readableFunc: (l10n, crmL10n) => crmL10n.country_code_singular,
          validatorFunc: (l10n, _) => null,
        ),

      // ========== Employment Fields ==========
      AppUserField.employeeNumber => ExtendedFieldImpl.text(
          AppUserField.employeeNumber,
          readableFunc: (l10n, crmL10n) => l10n.app_user_employee_number,
          validatorFunc: (l10n, _) => null,
        ),
      AppUserField.entryDate => ExtendedFieldImpl.date(
          AppUserField.entryDate,
          readableFunc: (l10n, crmL10n) => l10n.app_user_entry_date,
          dateValidatorFunc: (l10n, _) => null,
        ),
      AppUserField.terminationDate => ExtendedFieldImpl.date(
          AppUserField.terminationDate,
          readableFunc: (l10n, crmL10n) => l10n.app_user_termination_date,
          dateValidatorFunc: (l10n, _) => null,
        ),
      AppUserField.department => ExtendedFieldImpl.text(
          AppUserField.department,
          readableFunc: (l10n, crmL10n) => l10n.app_user_department,
          validatorFunc: (l10n, _) => null,
        ),
      AppUserField.position => ExtendedFieldImpl.text(
          AppUserField.position,
          readableFunc: (l10n, crmL10n) => l10n.app_user_position,
          validatorFunc: (l10n, _) => null,
        ),
      AppUserField.costCenter => ExtendedFieldImpl.text(
          AppUserField.costCenter,
          readableFunc: (l10n, crmL10n) => l10n.app_user_cost_center,
          validatorFunc: (l10n, _) => null,
        ),

      // ========== Status Fields ==========
      AppUserField.isActive => ExtendedFieldImpl.boolean(
          AppUserField.isActive,
          readableFunc: (l10n, crmL10n) => l10n.app_user_is_active,
          validatorFunc: (l10n, _) => null,
        ),
      AppUserField.blocked => ExtendedFieldImpl.boolean(
          AppUserField.blocked,
          readableFunc: (l10n, crmL10n) => l10n.admin_user_blocked,
          validatorFunc: (l10n, _) => null,
        ),
      AppUserField.isDraft => ExtendedFieldImpl.boolean(
          AppUserField.isDraft,
          readableFunc: (l10n, crmL10n) => l10n.gen_is_draft,
          validatorFunc: (l10n, _) => null,
        ),

      // ========== User Info Fields ==========
      AppUserField.created => ExtendedFieldImpl.date(
          AppUserField.created,
          readableFunc: (l10n, crmL10n) => l10n.admin_user_created,
          dateValidatorFunc: (l10n, _) => null,
        ),
      AppUserField.imageUrl => ExtendedFieldImpl.text(
          AppUserField.imageUrl,
          readableFunc: (l10n, crmL10n) => l10n.admin_user_image_url,
          validatorFunc: (l10n, _) => null,
          filterTypes: DefaultFilterTypes.noFilter,
        ),
      AppUserField.scopeNames => ExtendedFieldImpl.text(
          AppUserField.scopeNames,
          readableFunc: (l10n, crmL10n) => l10n.admin_user_scope_names,
          validatorFunc: (l10n, _) => null,
          filterTypes: DefaultFilterTypes.noFilter,
        ),

      // ========== System Fields ==========
      AppUserField.createdAt => ExtendedFieldImpl.date(
          AppUserField.createdAt,
          readableFunc: (l10n, crmL10n) => l10n.gen_created_at,
          dateValidatorFunc: (l10n, _) => null,
        ),
      AppUserField.createdBy => ExtendedFieldImpl.assignedUser(
          AppUserField.createdBy,
          readableFunc: (l10n, crmL10n) => l10n.gen_created_by,
          isMandatory: false,
        ),
      AppUserField.lastModifiedAt => ExtendedFieldImpl.date(
          AppUserField.lastModifiedAt,
          readableFunc: (l10n, crmL10n) => l10n.gen_edited_at,
          dateValidatorFunc: (l10n, _) => null,
        ),
      AppUserField.lastModifiedBy => ExtendedFieldImpl.assignedUser(
          AppUserField.lastModifiedBy,
          readableFunc: (l10n, crmL10n) => l10n.gen_edited_by,
          isMandatory: false,
        ),
      AppUserField.deletedAt => ExtendedFieldImpl.date(
          AppUserField.deletedAt,
          readableFunc: (l10n, crmL10n) => l10n.gen_deleted_at,
          dateValidatorFunc: (l10n, _) => null,
        ),
    };
  }
}

/// Extension methods for table operations (replacing AppUserFieldsExt)
extension AppUserFieldsTableExt on List<AppUserField> {
  /// Returns a map of filterable fields with their labels
  Map<AppUserField, TableFieldData> filterableWithLabels(
    ElbCoreLocalizations l10n,
    ElbCrmLocalizations crmL10n,
  ) {
    return ExtendedFieldListExt<AppUserField, ElbCrmLocalizations>(this)
        .buildFilters(
      coreL10n: l10n,
      customL10n: crmL10n,
      fromEnum: AppUserFields.fromEnum,
    );
  }

  /// Quick search filter for persons
  Map<AppUserField, TableFieldData> quickSearchFilterPersons(
    ElbCoreLocalizations l10n,
    ElbCrmLocalizations crmL10n,
  ) {
    final fields = [
      AppUserField.fullName,
      AppUserField.email,
      AppUserField.initials,
      AppUserField.department,
    ];

    return ExtendedFieldListExt<AppUserField, ElbCrmLocalizations>(
      AppUserFieldsTableExt(fields).orderedFields(l10n, crmL10n),
    ).buildFilters(
      coreL10n: l10n,
      customL10n: crmL10n,
      fromEnum: AppUserFields.fromEnum,
    );
  }

  /// Returns a map of table columns with their labels
  Map<AppUserField, TableColumnData> tableColumnsWithLabels(
    ElbCoreLocalizations l10n,
    ElbCrmLocalizations crmL10n,
  ) {
    const excludeFields = {
      AppUserField.deletedAt,
      AppUserField.isDraft,
      AppUserField.userInfoId,
      AppUserField.userIdentifier,
      AppUserField.scopeNames,
      AppUserField.imageUrl,
      AppUserField.userName,
      // this is userInfo.created
      AppUserField.created,
    };

    return ExtendedFieldListExt<AppUserField, ElbCrmLocalizations>(this)
        .buildColumns(
      coreL10n: l10n,
      customL10n: crmL10n,
      fromEnum: AppUserFields.fromEnum,
      excludeFields: excludeFields,
    );
  }

  /// Returns ordered fields with priority
  List<AppUserField> orderedFields(
    ElbCoreLocalizations l10n,
    ElbCrmLocalizations crmL10n,
  ) {
    final fields = toList()
      ..sort((a, b) {
        // Place fullName at the very top
        if (a == AppUserField.fullName) return -1;
        if (b == AppUserField.fullName) return 1;

        // Sort remaining fields alphabetically by their readable names
        final aField = AppUserFields.fromEnum(a);
        final bField = AppUserFields.fromEnum(b);

        final aReadable = aField.readable(l10n, crmL10n);
        final bReadable = bField.readable(l10n, crmL10n);
        return aReadable.compareTo(bReadable);
      });

    return fields;
  }
}
