import 'package:elbdesk_backend_core_client/elbdesk_backend_core_client.dart';
import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:flutter/services.dart';

/// UNIFIED ServiceUser fields with ALL features (forms + tables) in ONE place
/// This replaces ServiceUserFieldWrapper and follows the modern FieldCache pattern
class ServiceUserFields {
  ServiceUserFields._();

  // ==================== FIELD CACHE ====================

  static final _cache = FieldCache<ServiceUserField, ElbCoreLocalizations>(
    values: ServiceUserField.values,
    createField: _createField,
  );

  static ExtendedField<ServiceUserField, ElbCoreLocalizations> fromEnum(
    ServiceUserField field,
  ) =>
      _cache.fromEnum(field);

  static ExtendedField<ServiceUserField, ElbCoreLocalizations> fromFieldKey(
    String fieldKey,
  ) =>
      _cache.fromFieldKey(fieldKey);

  static final List<TableFieldConfig> defaultTableColumns = List.unmodifiable([
    _cache.fromEnum(ServiceUserField.serviceName).tableFieldConfig,
    _cache.fromEnum(ServiceUserField.serviceDescription).tableFieldConfig,
    _cache.fromEnum(ServiceUserField.isActive).tableFieldConfig,
    _cache.fromEnum(ServiceUserField.createdBy).tableFieldConfig,
    _cache.fromEnum(ServiceUserField.createdAt).tableFieldConfig,
  ]);

  // ==================== FIELD DEFINITIONS ====================

  static ExtendedField<ServiceUserField, ElbCoreLocalizations> _createField(
    ServiceUserField field,
  ) {
    return switch (field) {
      // ========== Identification Fields ==========
      ServiceUserField.id => const ExtendedFieldImpl.id(
          ServiceUserField.id,
        ),
      ServiceUserField.userInfoId => ExtendedFieldImpl.number(
          ServiceUserField.userInfoId,
          readableFunc: (l10n, _) => l10n.service_user_user_info_id,
          validatorFunc: (l10n, _) => null,
          keyboardType: TextInputType.number,
          filterTypes: DefaultFilterTypes.noFilter,
        ),
      ServiceUserField.userIdentifier => ExtendedFieldImpl.text(
          ServiceUserField.userIdentifier,
          readableFunc: (l10n, _) => l10n.service_user_user_identifier,
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

      // ========== Service Fields ==========
      ServiceUserField.serviceName => ExtendedFieldImpl.text(
          ServiceUserField.serviceName,
          readableFunc: (l10n, _) => l10n.service_user_service_name,
          validatorFunc: (l10n, _) => (String? value) {
            if (value == null) return null;
            if (value.trim().isEmpty) return l10n.validation_name_required;
            return null;
          },
        ),
      ServiceUserField.serviceDescription => ExtendedFieldImpl.text(
          ServiceUserField.serviceDescription,
          readableFunc: (l10n, _) => l10n.service_user_service_description,
          validatorFunc: (l10n, _) => (String? value) {
            if (value == null) return null;
            if (value.isEmpty) return l10n.validation_name_required;
            return null;
          },
        ),
      ServiceUserField.scopeNames => ExtendedFieldImpl.text(
          ServiceUserField.scopeNames,
          readableFunc: (l10n, _) => l10n.service_user_scope_names,
          validatorFunc: (l10n, _) => null,
        ),

      // ========== Status Fields ==========
      ServiceUserField.blocked => ExtendedFieldImpl.boolean(
          ServiceUserField.blocked,
          readableFunc: (l10n, _) => l10n.service_user_blocked,
          validatorFunc: (l10n, _) => null,
        ),
      ServiceUserField.isActive => ExtendedFieldImpl.boolean(
          ServiceUserField.isActive,
          readableFunc: (l10n, _) => l10n.service_user_is_active,
          validatorFunc: (l10n, _) => null,
        ),
      ServiceUserField.isDraft => ExtendedFieldImpl.boolean(
          ServiceUserField.isDraft,
          readableFunc: (l10n, _) => l10n.gen_is_draft,
          validatorFunc: (l10n, _) => null,
          filterTypes: DefaultFilterTypes.noFilter,
        ),

      // ========== Date Fields ==========
      ServiceUserField.created => ExtendedFieldImpl.date(
          ServiceUserField.created,
          readableFunc: (l10n, _) => l10n.service_user_created,
          dateValidatorFunc: (l10n, _) => null,
        ),
      ServiceUserField.createdAt => ExtendedFieldImpl.date(
          ServiceUserField.createdAt,
          readableFunc: (l10n, _) => l10n.service_user_created_at,
          dateValidatorFunc: (l10n, _) => null,
        ),
      ServiceUserField.lastModifiedAt => ExtendedFieldImpl.date(
          ServiceUserField.lastModifiedAt,
          readableFunc: (l10n, _) => l10n.service_user_last_modified_at,
          dateValidatorFunc: (l10n, _) => null,
        ),
      ServiceUserField.deletedAt => ExtendedFieldImpl.date(
          ServiceUserField.deletedAt,
          readableFunc: (l10n, _) => l10n.service_user_deleted_at,
          dateValidatorFunc: (l10n, _) => null,
          filterTypes: DefaultFilterTypes.noFilter,
        ),

      // ========== System Fields ==========
      ServiceUserField.createdBy => ExtendedFieldImpl.assignedUser(
          ServiceUserField.createdBy,
          readableFunc: (l10n, _) => l10n.service_user_created_by,
          isMandatory: false,
        ),
      ServiceUserField.lastModifiedBy => ExtendedFieldImpl.assignedUser(
          ServiceUserField.lastModifiedBy,
          readableFunc: (l10n, _) => l10n.service_user_last_modified_by,
          isMandatory: false,
        ),
    };
  }
}

/// Extension methods for table operations
extension ServiceUserFieldsTableExt on List<ServiceUserField> {
  /// Returns a map of filterable fields with their labels
  Map<ServiceUserField, TableFieldData> filterableWithLabels(
    ElbCoreLocalizations l10n,
  ) {
    return ExtendedFieldListExt<ServiceUserField, ElbCoreLocalizations>(this)
        .buildFilters(
      coreL10n: l10n,
      customL10n: l10n,
      fromEnum: ServiceUserFields.fromEnum,
    );
  }

  /// Quick search filter for service users
  Map<ServiceUserField, TableFieldData> quickSearchFilterPersons(
    ElbCoreLocalizations l10n,
  ) {
    final fields = [
      ServiceUserField.serviceName,
      ServiceUserField.serviceDescription,
      ServiceUserField.userIdentifier,
    ];

    return ExtendedFieldListExt<ServiceUserField, ElbCoreLocalizations>(
      ServiceUserFieldsTableExt(fields).orderedFields(l10n),
    ).buildFilters(
      coreL10n: l10n,
      customL10n: l10n,
      fromEnum: ServiceUserFields.fromEnum,
    );
  }

  /// Returns a map of table columns with their labels
  Map<ServiceUserField, TableColumnData> tableColumnsWithLabels(
    ElbCoreLocalizations l10n,
  ) {
    const excludeFields = {
      ServiceUserField.deletedAt,
      ServiceUserField.isDraft,
      ServiceUserField.userInfoId,
      ServiceUserField.userIdentifier,
    };

    return ExtendedFieldListExt<ServiceUserField, ElbCoreLocalizations>(this)
        .buildColumns(
      coreL10n: l10n,
      customL10n: l10n,
      fromEnum: ServiceUserFields.fromEnum,
      excludeFields: excludeFields,
    );
  }

  /// Returns ordered fields with priority
  List<ServiceUserField> orderedFields(ElbCoreLocalizations l10n) {
    final fields = toList()
      ..sort((a, b) {
        // Place serviceName at the very top
        if (a == ServiceUserField.serviceName) return -1;
        if (b == ServiceUserField.serviceName) return 1;

        // Sort remaining fields alphabetically by their readable names
        final aField = ServiceUserFields.fromEnum(a);
        final bField = ServiceUserFields.fromEnum(b);

        final aReadable = aField.readable(l10n, l10n);
        final bReadable = bField.readable(l10n, l10n);
        return aReadable.compareTo(bReadable);
      });

    return fields;
  }
}
