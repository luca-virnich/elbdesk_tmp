import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:flutter/services.dart';

/// UNIFIED EntityLog fields with ALL features (forms + tables) in ONE place
/// This replaces EntityLogFieldWrapper and EntityLogFieldsExt
class EntityLogFields {
  EntityLogFields._();

  // ==================== FIELD CACHE ====================

  static final _cache = FieldCache<EntityLogField, ElbCoreLocalizations>(
    values: EntityLogField.values,
    createField: _createField,
  );

  static ExtendedField<EntityLogField, ElbCoreLocalizations> fromEnum(
    EntityLogField field,
  ) =>
      _cache.fromEnum(field);

  static ExtendedField<EntityLogField, ElbCoreLocalizations> fromFieldKey(
    String fieldKey,
  ) =>
      _cache.fromFieldKey(fieldKey);

  // ==================== FIELD DEFINITIONS ====================

  static ExtendedField<EntityLogField, ElbCoreLocalizations> _createField(
    EntityLogField field,
  ) {
    return switch (field) {
      // ========== Core Fields ==========
      EntityLogField.id => const ExtendedFieldImpl.id(
          EntityLogField.id,
        ),
      EntityLogField.field => ExtendedFieldImpl.text(
          EntityLogField.field,
          readableFunc: (l10n, _) => l10n.history_log_field,
          validatorFunc: (l10n, _) => null,
        ),
      EntityLogField.oldValue => ExtendedFieldImpl.text(
          EntityLogField.oldValue,
          readableFunc: (l10n, _) => l10n.history_log_old_value,
          validatorFunc: (l10n, _) => null,
        ),
      EntityLogField.newValue => ExtendedFieldImpl.text(
          EntityLogField.newValue,
          readableFunc: (l10n, _) => l10n.history_log_new_value,
          validatorFunc: (l10n, _) => null,
        ),
      EntityLogField.editedAt => ExtendedFieldImpl.date(
          EntityLogField.editedAt,
          readableFunc: (l10n, _) => l10n.gen_edited_at,
          dateValidatorFunc: (l10n, _) => null,
        ),
      EntityLogField.editedById => ExtendedFieldImpl.assignedUser(
          EntityLogField.editedById,
          readableFunc: (l10n, _) => l10n.gen_edited_by,
          isMandatory: false,
        ),
      EntityLogField.entityId => ExtendedFieldImpl.number(
          EntityLogField.entityId,
          readableFunc: (l10n, _) => l10n.id,
          validatorFunc: (l10n, _) => null,
          keyboardType: TextInputType.number,
        ),
      EntityLogField.tableType => ExtendedFieldImpl.text(
          EntityLogField.tableType,
          readableFunc: (l10n, _) => '',
          validatorFunc: (l10n, _) => null,
        ),
    };
  }
}

/// Extension methods for table operations (replacing EntityLogFieldsExt)
extension EntityLogFieldsTableExt on List<EntityLogField> {
  /// Returns a map of filterable fields with their labels
  Map<EntityLogField, TableFieldData> filterableWithLabels(
    ElbCoreLocalizations l10n,
  ) {
    return ExtendedFieldListExt<EntityLogField, ElbCoreLocalizations>(this)
        .buildFilters(
      coreL10n: l10n,
      customL10n: l10n,
      fromEnum: EntityLogFields.fromEnum,
    );
  }

  /// Returns a map of table columns with their labels
  Map<EntityLogField, TableColumnData> tableColumnsWithLabels(
    ElbCoreLocalizations l10n,
  ) {
    const excludeFields = {
      EntityLogField.id,
    };

    return ExtendedFieldListExt<EntityLogField, ElbCoreLocalizations>(this)
        .buildColumns(
      coreL10n: l10n,
      customL10n: l10n,
      fromEnum: EntityLogFields.fromEnum,
      excludeFields: excludeFields,
    );
  }
}
