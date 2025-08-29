import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/l10n/elb_prepress_localizations.dart';

/// UNIFIED PrepressColorPaletteField fields with ALL features (forms + tables)
/// in ONE place
/// This replaces PrepressColorPaletteFieldWrapper and
/// PrepressColorPaletteFieldExt
class PrepressColorPaletteFields {
  PrepressColorPaletteFields._();

  // ==================== FIELD CACHE ====================

  static final _cache =
      FieldCache<PrepressColorPaletteField, ElbPrepressLocalizations>(
    values: PrepressColorPaletteField.values,
    createField: _createField,
  );

  static ExtendedField<PrepressColorPaletteField, ElbPrepressLocalizations>
      fromEnum(
    PrepressColorPaletteField field,
  ) =>
          _cache.fromEnum(field);

  static ExtendedField<PrepressColorPaletteField, ElbPrepressLocalizations>
      fromFieldKey(
    String fieldKey,
  ) =>
          _cache.fromFieldKey(fieldKey);

  static final List<TableFieldConfig> defaultTableColumns = List.unmodifiable([
    _cache.fromEnum(PrepressColorPaletteField.paletteName).tableFieldConfig,
    _cache.fromEnum(PrepressColorPaletteField.customer).tableFieldConfig,
  ]);

  static final List<TableFieldConfig> customerTableColumns = List.unmodifiable([
    _cache.fromEnum(PrepressColorPaletteField.paletteName).tableFieldConfig,
  ]);

  // ==================== FIELD DEFINITIONS ====================

  static ExtendedField<PrepressColorPaletteField, ElbPrepressLocalizations>
      _createField(
    PrepressColorPaletteField field,
  ) {
    return switch (field) {
      // ========== Meta Fields ==========
      PrepressColorPaletteField.deletedAt => ExtendedFieldImpl.date(
          PrepressColorPaletteField.deletedAt,
          readableFunc: (l10n, _) => l10n.gen_deleted_at,
          dateValidatorFunc: (_, __) => null,
          filterTypes: DefaultFilterTypes.noFilter,
          excludeFromTable: true,
        ),
      PrepressColorPaletteField.isDraft => ExtendedFieldImpl.boolean(
          PrepressColorPaletteField.isDraft,
          readableFunc: (l10n, _) => l10n.gen_is_draft,
          validatorFunc: (_, __) => null,
          filterTypes: DefaultFilterTypes.noFilter,
          excludeFromTable: true,
        ),
      PrepressColorPaletteField.createdAt => ExtendedFieldImpl.date(
          PrepressColorPaletteField.createdAt,
          readableFunc: (l10n, _) => l10n.gen_created_at,
          dateValidatorFunc: (_, __) => null,
        ),
      PrepressColorPaletteField.createdBy => ExtendedFieldImpl.text(
          PrepressColorPaletteField.createdBy,
          readableFunc: (l10n, _) => l10n.gen_created_by,
          validatorFunc: (_, __) => null,
        ),
      PrepressColorPaletteField.lastModifiedAt => ExtendedFieldImpl.date(
          PrepressColorPaletteField.lastModifiedAt,
          readableFunc: (l10n, _) => l10n.gen_last_modified_at,
          dateValidatorFunc: (_, __) => null,
        ),
      PrepressColorPaletteField.lastModifiedBy => ExtendedFieldImpl.text(
          PrepressColorPaletteField.lastModifiedBy,
          readableFunc: (l10n, _) => l10n.gen_last_modified_by,
          validatorFunc: (_, __) => null,
        ),
      PrepressColorPaletteField.id => const ExtendedFieldImpl.id(
          PrepressColorPaletteField.id,
        ),

      // ========== Entity Fields ==========

      PrepressColorPaletteField.paletteName => ExtendedFieldImpl.text(
          PrepressColorPaletteField.paletteName,
          readableFunc: (l10n, ppL10n) => ppL10n.color_palette_name,
          validatorFunc: (l10n, _) => (value) {
            return TextFieldValidator.isTextNotEmptyOrNull(
              value?.trim(),
              l10n.validation_name_required,
            );
          },
          cellWidth: 400,
        ),
      PrepressColorPaletteField.description => ExtendedFieldImpl.text(
          PrepressColorPaletteField.description,
          readableFunc: (l10n, ppL10n) => ppL10n.color_palette_description,
          validatorFunc: (l10n, _) => null,
        ),
      PrepressColorPaletteField.customer => ExtendedFieldImpl.text(
          PrepressColorPaletteField.customer,
          readableFunc: (l10n, ppL10n) => ppL10n.customer,
          validatorFunc: (l10n, _) => null,
          cellWidth: 250,
        ),
      PrepressColorPaletteField.customerId => ExtendedFieldImpl.text(
          PrepressColorPaletteField.customerId,
          readableFunc: (l10n, ppL10n) => ppL10n.customer_id,
          validatorFunc: (l10n, _) => null,
        ),
    };
  }
  // ==================== DROPDOWN ITEMS ====================

  static Map<PrepressColorPaletteField, List<DropdownItem<dynamic>>>
      buildFilterDropdownItems(
    ElbCoreLocalizations l10n,
    ElbPrepressLocalizations ppL10n,
  ) {
    return _cache.buildFilterDropdownItems(l10n, ppL10n);
  }
}

// ==================== LIST EXTENSIONS ====================

extension PrepressColorPaletteFieldsTableExt
    on List<PrepressColorPaletteField> {
  Map<PrepressColorPaletteField, TableFieldData> filters(
    ElbCoreLocalizations l10n,
    ElbPrepressLocalizations ppL10n,
  ) {
    return ExtendedFieldListExt<PrepressColorPaletteField,
            ElbPrepressLocalizations>(this)
        .buildFilters(
      coreL10n: l10n,
      customL10n: ppL10n,
      fromEnum: PrepressColorPaletteFields.fromEnum,
    );
  }

  Map<PrepressColorPaletteField, TableColumnData> columns(
    ElbCoreLocalizations l10n,
    ElbPrepressLocalizations ppL10n,
  ) {
    return ExtendedFieldListExt<PrepressColorPaletteField,
            ElbPrepressLocalizations>(this)
        .buildColumns(
      coreL10n: l10n,
      customL10n: ppL10n,
      fromEnum: PrepressColorPaletteFields.fromEnum,
    );
  }

  Map<PrepressColorPaletteField, TableFieldData> quickSearchFilters(
    ElbCoreLocalizations l10n,
    ElbPrepressLocalizations ppL10n,
  ) {
    return [
      PrepressColorPaletteField.paletteName,
    ].buildQuickSearch(
      coreL10n: l10n,
      customL10n: ppL10n,
      fromEnum: PrepressColorPaletteFields.fromEnum,
    );
  }
}
