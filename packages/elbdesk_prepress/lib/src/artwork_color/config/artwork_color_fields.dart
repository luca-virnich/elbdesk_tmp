import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/l10n/elb_prepress_localizations.dart';

/// UNIFIED ArtworkColorField fields with ALL features (forms + tables) in
/// ONE place
/// This replaces ArtworkColorFieldWrapper and ArtworkColorFieldExt
class ArtworkColorFields {
  ArtworkColorFields._();

  // ==================== FIELD CACHE ====================

  static final _cache = FieldCache<ArtworkColorField, ElbPrepressLocalizations>(
    values: ArtworkColorField.values,
    createField: _createField,
  );

  static ExtendedField<ArtworkColorField, ElbPrepressLocalizations> fromEnum(
    ArtworkColorField field,
  ) =>
      _cache.fromEnum(field);

  static ExtendedField<ArtworkColorField, ElbPrepressLocalizations>
      fromFieldKey(String fieldKey) => _cache.fromFieldKey(fieldKey);

  static final List<TableFieldConfig> defaultTableColumns = List.unmodifiable([
    _cache.fromEnum(ArtworkColorField.colorName).tableFieldConfig,
    _cache.fromEnum(ArtworkColorField.shortName).tableFieldConfig,
    _cache.fromEnum(ArtworkColorField.color).tableFieldConfig,
  ]);

  static final List<TableFieldConfig> artworkTemplateTableColumns =
      List.unmodifiable([
    _cache.fromEnum(ArtworkColorField.move).tableFieldConfig,
    _cache.fromEnum(ArtworkColorField.colorName).tableFieldConfig,
    _cache.fromEnum(ArtworkColorField.colorType).tableFieldConfig,
    _cache.fromEnum(ArtworkColorField.verarbeitungsEbene).tableFieldConfig,
    _cache.fromEnum(ArtworkColorField.printProcess).tableFieldConfig,
    _cache.fromEnum(ArtworkColorField.screenAngle).tableFieldConfig,
    _cache.fromEnum(ArtworkColorField.screenLineature).tableFieldConfig,
    _cache.fromEnum(ArtworkColorField.screenPointForm).tableFieldConfig,
    _cache.fromEnum(ArtworkColorField.colorSpecType).tableFieldConfig,
    _cache.fromEnum(ArtworkColorField.boost).tableFieldConfig,
    _cache.fromEnum(ArtworkColorField.actions).tableFieldConfig,
  ]);

  static final List<TableFieldConfig> artworkQuarantineTableColumns =
      List.unmodifiable([
    _cache.fromEnum(ArtworkColorField.colorName).tableFieldConfig,
    _cache.fromEnum(ArtworkColorField.colorType).tableFieldConfig,
    _cache.fromEnum(ArtworkColorField.verarbeitungsEbene).tableFieldConfig,
    _cache.fromEnum(ArtworkColorField.printProcess).tableFieldConfig,
  ]);

  static final List<TableFieldConfig> selectArtworkColorInArtworkColumns =
      List.unmodifiable([
    _cache.fromEnum(ArtworkColorField.colorPalette).tableFieldConfig,
    _cache.fromEnum(ArtworkColorField.colorName).tableFieldConfig,
    _cache.fromEnum(ArtworkColorField.color).tableFieldConfig,
  ]);

  // ==================== FIELD DEFINITIONS ====================

  static ExtendedField<ArtworkColorField, ElbPrepressLocalizations>
      _createField(
    ArtworkColorField field,
  ) {
    return switch (field) {
      // ========== Meta Fields ==========
      ArtworkColorField.deletedAt => ExtendedFieldImpl.date(
          ArtworkColorField.deletedAt,
          readableFunc: (l10n, ppL10n) => l10n.gen_deleted_at,
          dateValidatorFunc: (l10n, ppL10n) => null,
          filterTypes: DefaultFilterTypes.noFilter,
          excludeFromTable: true,
        ),
      ArtworkColorField.isDraft => ExtendedFieldImpl.boolean(
          ArtworkColorField.isDraft,
          readableFunc: (l10n, ppL10n) => l10n.gen_is_draft,
          validatorFunc: (l10n, ppL10n) => null,
          filterTypes: DefaultFilterTypes.noFilter,
          excludeFromTable: true,
        ),
      ArtworkColorField.createdAt => ExtendedFieldImpl.date(
          ArtworkColorField.createdAt,
          readableFunc: (l10n, ppL10n) => l10n.gen_created_at,
          dateValidatorFunc: (l10n, ppL10n) => null,
        ),
      ArtworkColorField.createdBy => ExtendedFieldImpl.text(
          ArtworkColorField.createdBy,
          readableFunc: (l10n, ppL10n) => l10n.gen_created_by,
          validatorFunc: (l10n, ppL10n) => null,
        ),
      ArtworkColorField.lastModifiedAt => ExtendedFieldImpl.date(
          ArtworkColorField.lastModifiedAt,
          readableFunc: (l10n, ppL10n) => l10n.gen_last_modified_at,
          dateValidatorFunc: (l10n, ppL10n) => null,
        ),
      ArtworkColorField.lastModifiedBy => ExtendedFieldImpl.text(
          ArtworkColorField.lastModifiedBy,
          readableFunc: (l10n, ppL10n) => l10n.gen_last_modified_by,
          validatorFunc: (l10n, ppL10n) => null,
        ),
      ArtworkColorField.id => const ExtendedFieldImpl.id(
          ArtworkColorField.id,
        ),

      // ========== Entity Fields ==========

      ArtworkColorField.colorName => ExtendedFieldImpl.text(
          ArtworkColorField.colorName,
          readableFunc: (l10n, ppL10n) => ppL10n.color_name,
          validatorFunc: (l10n, ppL10n) => (value) {
            return TextFieldValidator.isTextNotEmptyOrNull(
              value,
              l10n.validation_name_required,
            );
          },
          cellWidth: 200,
        ),
      ArtworkColorField.shortName => ExtendedFieldImpl.text(
          ArtworkColorField.shortName,
          readableFunc: (l10n, ppL10n) => ppL10n.color_short_name,
          validatorFunc: (l10n, ppL10n) => null,
          cellWidth: 120,
        ),
      ArtworkColorField.color => ExtendedFieldImpl.text(
          ArtworkColorField.color,
          readableFunc: (l10n, ppL10n) => l10n.gen_color,
          validatorFunc: (l10n, ppL10n) => (value) {
            if (value == null || value.isEmpty) return null;
            if (!RegExp(r'^#?([0-9A-Fa-f]{6})$').hasMatch(value)) {
              return l10n.validation_required;
            }
            return null;
          },
          cellWidth: 120,
        ),
      ArtworkColorField.colorPalette => ExtendedFieldImpl.text(
          ArtworkColorField.colorPalette,
          readableFunc: (l10n, ppL10n) => ppL10n.color_palette_singular,
          validatorFunc: (l10n, ppL10n) => null,
          cellWidth: 200,
        ),
      ArtworkColorField.colorType => ExtendedFieldImpl.text(
          ArtworkColorField.colorType,
          readableFunc: (l10n, ppL10n) => ppL10n.color_type,
          validatorFunc: (l10n, ppL10n) => null,
        ),
      ArtworkColorField.colorSpecType => ExtendedFieldImpl.text(
          ArtworkColorField.colorSpecType,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_color_spec_type_short,
          validatorFunc: (l10n, ppL10n) => null,
        ),
      ArtworkColorField.l => ExtendedFieldImpl.double(
          ArtworkColorField.l,
          readableFunc: (l10n, ppL10n) => ppL10n.color_l,
          validatorFunc: (l10n, ppL10n) => null,
        ),
      ArtworkColorField.a => ExtendedFieldImpl.double(
          ArtworkColorField.a,
          readableFunc: (l10n, ppL10n) => ppL10n.color_a,
          validatorFunc: (l10n, ppL10n) => null,
        ),
      ArtworkColorField.b => ExtendedFieldImpl.double(
          ArtworkColorField.b,
          readableFunc: (l10n, ppL10n) => ppL10n.color_b,
          validatorFunc: (l10n, ppL10n) => null,
        ),
      ArtworkColorField.verarbeitungsEbene => ExtendedFieldImpl.text(
          ArtworkColorField.verarbeitungsEbene,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_v_layer,
          validatorFunc: (l10n, ppL10n) => null,
        ),
      ArtworkColorField.printProcess => ExtendedFieldImpl.text(
          ArtworkColorField.printProcess,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_print_process,
          validatorFunc: (l10n, ppL10n) => null,
        ),
      ArtworkColorField.screenLineature => ExtendedFieldImpl.double(
          ArtworkColorField.screenLineature,
          readableFunc: (l10n, ppL10n) => ppL10n.screen_lineature_short,
          validatorFunc: (l10n, ppL10n) => null,
        ),
      ArtworkColorField.screenAngle => ExtendedFieldImpl.double(
          ArtworkColorField.screenAngle,
          readableFunc: (l10n, ppL10n) => ppL10n.screen_angle_short,
          validatorFunc: (l10n, ppL10n) => null,
        ),
      ArtworkColorField.screenPointForm => ExtendedFieldImpl.text(
          ArtworkColorField.screenPointForm,
          readableFunc: (l10n, ppL10n) => ppL10n.screen_point_form_short,
          validatorFunc: (l10n, ppL10n) => null,
          cellWidth: 80,
        ),
      ArtworkColorField.boost => ExtendedFieldImpl.double(
          ArtworkColorField.boost,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_boost,
          validatorFunc: (l10n, ppL10n) => null,
        ),
      ArtworkColorField.move => ExtendedFieldImpl.boolean(
          ArtworkColorField.move,
          readableFunc: (l10n, ppL10n) => ''.fixed,
          validatorFunc: (l10n, ppL10n) => null,
          cellWidth: 60,
          filterTypes: DefaultFilterTypes.noFilter,
        ),
      ArtworkColorField.customText => ExtendedFieldImpl.text(
          ArtworkColorField.customText,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_custom_text,
          validatorFunc: (l10n, ppL10n) => null,
          filterTypes: DefaultFilterTypes.noFilter,
        ),
      ArtworkColorField.actions => ExtendedFieldImpl.boolean(
          ArtworkColorField.actions,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_actions,
          validatorFunc: (l10n, ppL10n) => null,
          filterTypes: DefaultFilterTypes.noFilter,
          cellWidth: 120,
        ),
    };
  }

  // ==================== DROPDOWN ITEMS ====================

  static Map<ArtworkColorField, List<DropdownItem<dynamic>>>
      buildFilterDropdownItems(
    ElbCoreLocalizations l10n,
    ElbPrepressLocalizations ppL10n,
  ) {
    return _cache.buildFilterDropdownItems(l10n, ppL10n);
  }
}

// ==================== LIST EXTENSIONS ====================

extension ArtworkColorFieldsTableExt on List<ArtworkColorField> {
  Map<ArtworkColorField, TableFieldData> filters(
    ElbCoreLocalizations l10n,
    ElbPrepressLocalizations ppL10n,
  ) {
    return ExtendedFieldListExt<ArtworkColorField, ElbPrepressLocalizations>(
      this,
    ).buildFilters(
      coreL10n: l10n,
      customL10n: ppL10n,
      fromEnum: ArtworkColorFields.fromEnum,
    );
  }

  Map<ArtworkColorField, TableColumnData> columns(
    ElbCoreLocalizations l10n,
    ElbPrepressLocalizations ppL10n,
  ) {
    const excludeFields = {
      ArtworkColorField.deletedAt,
      ArtworkColorField.isDraft,
      ArtworkColorField.move,
      ArtworkColorField.customText,
      ArtworkColorField.actions,
    };
    return ExtendedFieldListExt<ArtworkColorField, ElbPrepressLocalizations>(
      this,
    ).buildColumns(
      coreL10n: l10n,
      customL10n: ppL10n,
      fromEnum: ArtworkColorFields.fromEnum,
      excludeFields: excludeFields,
    );
  }

  Map<ArtworkColorField, TableFieldData> quickSearchFields(
    ElbCoreLocalizations l10n,
    ElbPrepressLocalizations ppL10n,
  ) {
    return [
      ArtworkColorField.colorName,
    ].buildQuickSearch(
      coreL10n: l10n,
      customL10n: ppL10n,
      fromEnum: ArtworkColorFields.fromEnum,
    );
  }
}
