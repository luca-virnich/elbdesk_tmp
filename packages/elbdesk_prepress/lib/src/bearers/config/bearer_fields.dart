import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/l10n/elb_prepress_localizations.dart';

/// UNIFIED BearerField fields with ALL features (forms + tables) in ONE place
/// This replaces BearerFieldWrapper and BearerFieldExt
class BearerFields {
  BearerFields._();

  // ==================== FIELD CACHE ====================

  static final _cache = FieldCache<BearerField, ElbPrepressLocalizations>(
    values: BearerField.values,
    createField: _createField,
  );

  static ExtendedField<BearerField, ElbPrepressLocalizations> fromEnum(
    BearerField field,
  ) =>
      _cache.fromEnum(field);

  static ExtendedField<BearerField, ElbPrepressLocalizations> fromFieldKey(
    String fieldKey,
  ) =>
      _cache.fromFieldKey(fieldKey);

  static final List<TableFieldConfig> defaultTableColumns = List.unmodifiable([
    _cache.fromEnum(BearerField.id).tableFieldConfig,
    _cache.fromEnum(BearerField.type).tableFieldConfig,
    _cache.fromEnum(BearerField.bearerName).tableFieldConfig,
    _cache.fromEnum(BearerField.description).tableFieldConfig,
    _cache.fromEnum(BearerField.longText).tableFieldConfig,
    _cache.fromEnum(BearerField.costCenterCode).tableFieldConfig,
  ]);

  // ==================== FIELD DEFINITIONS ====================

  static ExtendedField<BearerField, ElbPrepressLocalizations> _createField(
    BearerField field,
  ) {
    return switch (field) {
      // ========== Meta Fields ==========
      BearerField.deletedAt => ExtendedFieldImpl.date(
          BearerField.deletedAt,
          readableFunc: (l10n, _) => l10n.gen_deleted_at,
          dateValidatorFunc: (_, __) => null,
          filterTypes: DefaultFilterTypes.noFilter,
          excludeFromTable: true,
        ),
      BearerField.isDraft => ExtendedFieldImpl.boolean(
          BearerField.isDraft,
          readableFunc: (l10n, _) => l10n.gen_is_draft,
          validatorFunc: (_, __) => null,
          filterTypes: DefaultFilterTypes.noFilter,
          excludeFromTable: true,
        ),
      BearerField.createdAt => ExtendedFieldImpl.date(
          BearerField.createdAt,
          readableFunc: (l10n, _) => l10n.gen_created_at,
          dateValidatorFunc: (_, __) => null,
        ),
      BearerField.createdBy => ExtendedFieldImpl.text(
          BearerField.createdBy,
          readableFunc: (l10n, _) => l10n.gen_created_by,
          validatorFunc: (l10n, _) => (value) {
            return TextFieldValidator.isTextNotEmptyOrNull(
              value,
              l10n.validation_name_required,
            );
          },
        ),
      BearerField.editingSince => ExtendedFieldImpl.date(
          BearerField.editingSince,
          readableFunc: (l10n, _) => l10n.gen_edited_at,
          dateValidatorFunc: (_, __) => null,
        ),
      BearerField.editingBy => ExtendedFieldImpl.text(
          BearerField.editingBy,
          readableFunc: (l10n, _) => l10n.gen_edited_by,
          validatorFunc: (l10n, _) => (value) {
            return TextFieldValidator.isTextNotEmptyOrNull(
              value,
              l10n.validation_name_required,
            );
          },
        ),
      BearerField.id => const ExtendedFieldImpl.id(
          BearerField.id,
          cellWidth: 80,
        ),

      // ========== Entity Fields ==========

      BearerField.type => ExtendedFieldImpl.text(
          BearerField.type,
          readableFunc: (l10n, _) => 'Typ'.hc,
          validatorFunc: (l10n, _) => (value) {
            return TextFieldValidator.isTextNotEmptyOrNull(
              value,
              l10n.validation_type_required,
            );
          },
          cellWidth: 150,
        ),
      BearerField.bearerName => ExtendedFieldImpl.text(
          BearerField.bearerName,
          readableFunc: (l10n, _) => l10n.bearer_name,
          validatorFunc: (l10n, _) => (value) {
            return TextFieldValidator.isTextNotEmptyOrNull(
              value,
              l10n.validation_name_required,
            );
          },
          cellWidth: 140,
        ),
      BearerField.description => ExtendedFieldImpl.text(
          BearerField.description,
          readableFunc: (l10n, _) => l10n.bearer_description,
          validatorFunc: (l10n, _) => (value) {
            return TextFieldValidator.isTextNotEmptyOrNull(
              value,
              l10n.validation_name_required,
            );
          },
          cellWidth: 200,
        ),
      BearerField.longText => ExtendedFieldImpl.text(
          BearerField.longText,
          readableFunc: (l10n, _) => l10n.bearer_long_text,
          validatorFunc: (l10n, _) => (value) {
            return TextFieldValidator.isTextNotEmptyOrNull(
              value,
              l10n.validation_name_required,
            );
          },
          cellWidth: 200,
        ),
      BearerField.costCenterCode => ExtendedFieldImpl.text(
          BearerField.costCenterCode,
          readableFunc: (l10n, _) => l10n.bearer_cost_center_code,
          validatorFunc: (l10n, _) => (value) {
            return TextFieldValidator.isTextNotEmptyOrNull(
              value,
              l10n.validation_name_required,
            );
          },
          cellWidth: 150,
        ),
    };
  }
  // ==================== DROPDOWN ITEMS ====================

  static Map<BearerField, List<DropdownItem<dynamic>>> buildFilterDropdownItems(
    ElbCoreLocalizations l10n,
    ElbPrepressLocalizations ppL10n,
  ) {
    return _cache.buildFilterDropdownItems(l10n, ppL10n);
  }
}

// ==================== LIST EXTENSIONS ====================

extension BearerFieldsTableExt on List<BearerField> {
  Map<BearerField, TableFieldData> filters(
    ElbCoreLocalizations l10n,
    ElbPrepressLocalizations ppL10n,
  ) {
    return ExtendedFieldListExt<BearerField, ElbPrepressLocalizations>(this)
        .buildFilters(
      coreL10n: l10n,
      customL10n: ppL10n,
      fromEnum: BearerFields.fromEnum,
    );
  }

  Map<BearerField, TableColumnData> columns(
    ElbCoreLocalizations l10n,
    ElbPrepressLocalizations ppL10n,
  ) {
    return ExtendedFieldListExt<BearerField, ElbPrepressLocalizations>(this)
        .buildColumns(
      coreL10n: l10n,
      customL10n: ppL10n,
      fromEnum: BearerFields.fromEnum,
    );
  }
}
