import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:flutter/services.dart';

/// UNIFIED EntityLock fields with ALL features (forms + tables) in ONE place
/// This replaces EntityLockFieldWrapper and EntityLockFieldsExt
class EntityLockFields {
  EntityLockFields._();

  // ==================== FIELD CACHE ====================

  static final _cache = FieldCache<EntityLockField, ElbCoreLocalizations>(
    values: EntityLockField.values,
    createField: _createField,
  );

  static ExtendedField<EntityLockField, ElbCoreLocalizations> fromEnum(
    EntityLockField field,
  ) =>
      _cache.fromEnum(field);

  static ExtendedField<EntityLockField, ElbCoreLocalizations> fromFieldKey(
    String fieldKey,
  ) =>
      _cache.fromFieldKey(fieldKey);

  // ==================== FIELD DEFINITIONS ====================

  static ExtendedField<EntityLockField, ElbCoreLocalizations> _createField(
    EntityLockField field,
  ) {
    return switch (field) {
      // ========== Core Fields ==========
      EntityLockField.entityId => ExtendedFieldImpl.number(
          EntityLockField.entityId,
          readableFunc: (l10n, _) => l10n.entity_obj_id,
          validatorFunc: (l10n, _) => null,
          filterTypes: DefaultFilterTypes.noFilter,
          keyboardType: TextInputType.number,
        ),
      EntityLockField.entityType => ExtendedFieldImpl.text(
          EntityLockField.entityType,
          readableFunc: (l10n, _) => l10n.entity_table,
          validatorFunc: (l10n, _) => null,
          filterTypes: DefaultFilterTypes.noFilter,
        ),
      EntityLockField.editingSessionId => ExtendedFieldImpl.text(
          EntityLockField.editingSessionId,
          readableFunc: (l10n, _) => l10n.entity_session_id,
          validatorFunc: (l10n, _) => null,
          filterTypes: DefaultFilterTypes.noFilter,
        ),
      EntityLockField.lockedAt => ExtendedFieldImpl.date(
          EntityLockField.lockedAt,
          readableFunc: (l10n, _) => l10n.entity_locked_at,
          dateValidatorFunc: (l10n, _) => null,
        ),
      EntityLockField.lockedBy => ExtendedFieldImpl.assignedUser(
          EntityLockField.lockedBy,
          readableFunc: (l10n, _) => l10n.entity_locked_by,
          isMandatory: false,
        ),
      EntityLockField.deleteButton => ExtendedFieldImpl.boolean(
          EntityLockField.deleteButton,
          readableFunc: (l10n, _) => l10n.entity_delete_lock,
          validatorFunc: (l10n, _) => null,
        ),
    };
  }
}

/// Extension methods for table operations (replacing EntityLockFieldsExt)
extension EntityLockFieldsTableExt on List<EntityLockField> {
  /// Returns a map of filterable fields with their labels
  Map<EntityLockField, TableFieldData> filterableWithLabels(
    ElbCoreLocalizations l10n,
  ) {
    return ExtendedFieldListExt<EntityLockField, ElbCoreLocalizations>(this)
        .buildFilters(
      coreL10n: l10n,
      customL10n: l10n,
      fromEnum: EntityLockFields.fromEnum,
    );
  }

  /// Returns a map of table columns with their labels
  Map<EntityLockField, TableColumnData> tableColumnsWithLabels(
    ElbCoreLocalizations l10n,
  ) {
    return ExtendedFieldListExt<EntityLockField, ElbCoreLocalizations>(this)
        .buildColumns(
      coreL10n: l10n,
      customL10n: l10n,
      fromEnum: EntityLockFields.fromEnum,
    );
  }
}
