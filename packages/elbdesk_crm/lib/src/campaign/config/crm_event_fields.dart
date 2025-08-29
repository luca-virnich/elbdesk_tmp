import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations.dart';
import 'package:flutter/widgets.dart';

/// UNIFIED CrmEventField fields with ALL features (forms + tables) in ONE place
/// This replaces CrmEventFieldWrapper and CrmEventFieldExtension
class CrmEventFields {
  CrmEventFields._();

  // ==================== FIELD CACHE ====================

  static final _cache = FieldCache<CrmEventField, ElbCrmLocalizations>(
    values: CrmEventField.values,
    createField: _createField,
  );

  static ExtendedField<CrmEventField, ElbCrmLocalizations> fromEnum(
    CrmEventField field,
  ) =>
      _cache.fromEnum(field);

  static ExtendedField<CrmEventField, ElbCrmLocalizations> fromFieldKey(
    String fieldKey,
  ) =>
      _cache.fromFieldKey(fieldKey);

  static final List<TableFieldConfig> defaultTableColumns = List.unmodifiable([
    _cache.fromEnum(CrmEventField.id).tableFieldConfig,
    _cache.fromEnum(CrmEventField.name).tableFieldConfig,
    _cache.fromEnum(CrmEventField.description).tableFieldConfig,
    _cache.fromEnum(CrmEventField.startDate).tableFieldConfig,
    _cache.fromEnum(CrmEventField.endDate).tableFieldConfig,
    _cache.fromEnum(CrmEventField.status).tableFieldConfig,
  ]);

  // ==================== FIELD DEFINITIONS ====================

  static ExtendedField<CrmEventField, ElbCrmLocalizations> _createField(
    CrmEventField field,
  ) {
    return switch (field) {
      // ========== Core Fields ==========
      CrmEventField.id => const ExtendedFieldImpl.id(
          CrmEventField.id,
        ),
      CrmEventField.name => ExtendedFieldImpl.text(
          CrmEventField.name,
          readableFunc: (coreL10n, crmL10n) => crmL10n.event_name,
          validatorFunc: (coreL10n, crmL10n) => null,
        ),
      CrmEventField.description => ExtendedFieldImpl.text(
          CrmEventField.description,
          readableFunc: (coreL10n, crmL10n) => crmL10n.event_description,
          maxLines: 3,
          minLines: 3,
          keyboardType: TextInputType.multiline,
          validatorFunc: (coreL10n, crmL10n) => null,
        ),
      CrmEventField.startDate => ExtendedFieldImpl.date(
          CrmEventField.startDate,
          readableFunc: (coreL10n, crmL10n) => crmL10n.event_start_date,
          dateValidatorFunc: (coreL10n, crmL10n) => null,
        ),
      CrmEventField.endDate => ExtendedFieldImpl.date(
          CrmEventField.endDate,
          readableFunc: (coreL10n, crmL10n) => crmL10n.event_end_date,
          dateValidatorFunc: (coreL10n, crmL10n) => null,
        ),
      CrmEventField.status => ExtendedFieldImpl.selection(
          CrmEventField.status,
          readableFunc: (coreL10n, crmL10n) => crmL10n.event_status,
          isMandatory: true,
          items: (coreL10n, customL10n) => [
            // ! FIXME
          ],
        ),
      CrmEventField.executionDate => ExtendedFieldImpl.date(
          CrmEventField.executionDate,
          readableFunc: (coreL10n, crmL10n) => crmL10n.event_execution_date,
          dateValidatorFunc: (coreL10n, crmL10n) => null,
        ),
      CrmEventField.createdAt => ExtendedFieldImpl.date(
          CrmEventField.createdAt,
          readableFunc: (coreL10n, crmL10n) => coreL10n.gen_created_at,
          dateValidatorFunc: (coreL10n, crmL10n) => null,
        ),
      CrmEventField.createdBy => ExtendedFieldImpl.assignedUser(
          CrmEventField.createdBy,
          readableFunc: (coreL10n, crmL10n) => coreL10n.gen_created_by,
          isMandatory: true,
        ),
      CrmEventField.lastModifiedAt => ExtendedFieldImpl.date(
          CrmEventField.lastModifiedAt,
          readableFunc: (coreL10n, crmL10n) => coreL10n.gen_last_modified_at,
          dateValidatorFunc: (coreL10n, crmL10n) => null,
        ),
      CrmEventField.lastModifiedBy => ExtendedFieldImpl.assignedUser(
          CrmEventField.lastModifiedBy,
          readableFunc: (coreL10n, crmL10n) => coreL10n.gen_last_modified_by,
          isMandatory: true,
        ),
      CrmEventField.deletedAt => ExtendedFieldImpl.date(
          CrmEventField.deletedAt,
          readableFunc: (coreL10n, crmL10n) => coreL10n.gen_deleted_at,
          filterTypes: DefaultFilterTypes.noFilter,
          dateValidatorFunc: (coreL10n, crmL10n) => null,
        ),
      CrmEventField.isDraft => ExtendedFieldImpl.boolean(
          CrmEventField.isDraft,
          readableFunc: (coreL10n, crmL10n) => coreL10n.gen_is_draft,
          validatorFunc: (coreL10n, crmL10n) => null,
          filterTypes: DefaultFilterTypes.noFilter,
        ),
    };
  }
}

// ==================== LIST EXTENSIONS ====================

/// Extension methods for table operations
extension EventFieldsTableExt on List<CrmEventField> {
  /// Get filterable fields with labels
  Map<CrmEventField, TableFieldData> filterableWithLabels(
    ElbCoreLocalizations coreL10n,
    ElbCrmLocalizations crmL10n,
  ) {
    return ExtendedFieldListExt<CrmEventField, ElbCrmLocalizations>(this)
        .buildFilters(
      coreL10n: coreL10n,
      customL10n: crmL10n,
      fromEnum: CrmEventFields.fromEnum,
    );
  }

  /// Get table columns with labels
  Map<CrmEventField, TableColumnData> tableColumnsWithLabels(
    ElbCoreLocalizations coreL10n,
    ElbCrmLocalizations crmL10n,
  ) {
    const excludeFields = {
      CrmEventField.deletedAt,
      CrmEventField.isDraft,
      CrmEventField.id,
    };
    return ExtendedFieldListExt<CrmEventField, ElbCrmLocalizations>(this)
        .buildColumns(
      coreL10n: coreL10n,
      customL10n: crmL10n,
      fromEnum: CrmEventFields.fromEnum,
      excludeFields: excludeFields,
    );
  }
}
