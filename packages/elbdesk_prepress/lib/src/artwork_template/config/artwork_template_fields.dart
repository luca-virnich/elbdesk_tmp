import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/l10n/elb_prepress_localizations.dart';

/// UNIFIED ArtworkTemplateField fields with ALL features (forms + tables) in ONE place
/// This replaces ArtworkTemplateFieldWrapper and ArtworkTemplateFieldExt
class ArtworkTemplateFields {
  ArtworkTemplateFields._();

  // ==================== FIELD CACHE ====================

  static final _cache =
      FieldCache<ArtworkTemplateField, ElbPrepressLocalizations>(
    values: ArtworkTemplateField.values,
    createField: _createField,
  );

  static ExtendedField<ArtworkTemplateField, ElbPrepressLocalizations> fromEnum(
    ArtworkTemplateField field,
  ) =>
      _cache.fromEnum(field);

  static ExtendedField<ArtworkTemplateField, ElbPrepressLocalizations>
      fromFieldKey(String fieldKey) => _cache.fromFieldKey(fieldKey);

  static final List<TableFieldConfig> defaultTableColumns = List.unmodifiable([
    _cache
        .fromEnum(ArtworkTemplateField.artworkTemplatePreSelection)
        .tableFieldConfig,
    _cache
        .fromEnum(ArtworkTemplateField.artworkTemplateSelection)
        .tableFieldConfig,
    _cache.fromEnum(ArtworkTemplateField.description).tableFieldConfig,
  ]);

  static final List<TableFieldConfig> defaultTableColumnsWithCustomer =
      List.unmodifiable([
    _cache.fromEnum(ArtworkTemplateField.templateType).tableFieldConfig,
    _cache
        .fromEnum(ArtworkTemplateField.artworkTemplatePreSelection)
        .tableFieldConfig,
    _cache
        .fromEnum(ArtworkTemplateField.artworkTemplateSelection)
        .tableFieldConfig,
    _cache.fromEnum(ArtworkTemplateField.description).tableFieldConfig,
  ]);

  // ==================== FIELD DEFINITIONS ====================

  static ExtendedField<ArtworkTemplateField, ElbPrepressLocalizations>
      _createField(
    ArtworkTemplateField field,
  ) {
    return switch (field) {
      // ========== Meta Fields ==========
      ArtworkTemplateField.deletedAt => ExtendedFieldImpl.date(
          ArtworkTemplateField.deletedAt,
          readableFunc: (l10n, _) => l10n.gen_deleted_at,
          dateValidatorFunc: (_, __) => null,
          filterTypes: DefaultFilterTypes.noFilter,
          excludeFromTable: true,
        ),
      ArtworkTemplateField.isDraft => ExtendedFieldImpl.boolean(
          ArtworkTemplateField.isDraft,
          readableFunc: (l10n, _) => l10n.gen_is_draft,
          validatorFunc: (_, __) => null,
          filterTypes: DefaultFilterTypes.noFilter,
          excludeFromTable: true,
        ),
      ArtworkTemplateField.createdAt => ExtendedFieldImpl.date(
          ArtworkTemplateField.createdAt,
          readableFunc: (l10n, _) => l10n.gen_created_at,
          dateValidatorFunc: (_, __) => null,
        ),
      ArtworkTemplateField.createdBy => ExtendedFieldImpl.text(
          ArtworkTemplateField.createdBy,
          readableFunc: (l10n, _) => l10n.gen_created_by,
          validatorFunc: (_, __) => null,
        ),
      ArtworkTemplateField.lastModifiedAt => ExtendedFieldImpl.date(
          ArtworkTemplateField.lastModifiedAt,
          readableFunc: (l10n, _) => l10n.gen_last_modified_at,
          dateValidatorFunc: (_, __) => null,
        ),
      ArtworkTemplateField.lastModifiedBy => ExtendedFieldImpl.text(
          ArtworkTemplateField.lastModifiedBy,
          readableFunc: (l10n, _) => l10n.gen_last_modified_by,
          validatorFunc: (_, __) => null,
        ),
      ArtworkTemplateField.id => const ExtendedFieldImpl.id(
          ArtworkTemplateField.id,
        ),

      // ========== Entity Fields ==========

      ArtworkTemplateField.description => ExtendedFieldImpl.text(
          ArtworkTemplateField.description,
          readableFunc: (l10n, _) => l10n.gen_description,
          validatorFunc: (l10n, _) => (value) {
            return TextFieldValidator.isTextNotEmptyOrNull(
              value,
              l10n.validation_required,
            );
          },
        ),
      ArtworkTemplateField.customer => ExtendedFieldImpl.text(
          ArtworkTemplateField.customer,
          readableFunc: (l10n, ppL10n) => ppL10n.customer,
          validatorFunc: (_, __) => null,
        ),
      ArtworkTemplateField.templateType => ExtendedFieldImpl.text(
          ArtworkTemplateField.templateType,
          readableFunc: (l10n, _) => l10n.gen_type,
          validatorFunc: (_, __) => null,
        ),
      ArtworkTemplateField.trappNormal => ExtendedFieldImpl.double(
          ArtworkTemplateField.trappNormal,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_trapping_normal,
          validatorFunc: (_, __) => null,
        ),
      ArtworkTemplateField.trappBlack => ExtendedFieldImpl.double(
          ArtworkTemplateField.trappBlack,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_trapping_black,
          validatorFunc: (_, __) => null,
        ),
      ArtworkTemplateField.trappBilder => ExtendedFieldImpl.double(
          ArtworkTemplateField.trappBilder,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_trapping_pictures,
          validatorFunc: (_, __) => null,
        ),
      ArtworkTemplateField.trappSonderfarben => ExtendedFieldImpl.double(
          ArtworkTemplateField.trappSonderfarben,
          readableFunc: (l10n, ppL10n) =>
              ppL10n.artwork_trapping_special_colors,
          validatorFunc: (_, __) => null,
        ),
      ArtworkTemplateField.trappRueckzug => ExtendedFieldImpl.double(
          ArtworkTemplateField.trappRueckzug,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_trapping_pullback,
          validatorFunc: (_, __) => null,
        ),
      ArtworkTemplateField.anschnitt => ExtendedFieldImpl.double(
          ArtworkTemplateField.anschnitt,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_bleed,
          validatorFunc: (_, __) => null,
        ),
      ArtworkTemplateField.layers => ExtendedFieldImpl.integer(
          ArtworkTemplateField.layers,
          readableFunc: (l10n, ppL10n) => ppL10n.layers,
          validatorFunc: (_, __) => null,
        ),
      ArtworkTemplateField.artworkTemplateSelection => ExtendedFieldImpl.text(
          ArtworkTemplateField.artworkTemplateSelection,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_template_selection,
          validatorFunc: (_, __) => null,
        ),
      ArtworkTemplateField.artworkTemplatePreSelection =>
        ExtendedFieldImpl.text(
          ArtworkTemplateField.artworkTemplatePreSelection,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_template_preselection,
          validatorFunc: (_, __) => null,
        ),
    };
  }
  // ==================== DROPDOWN ITEMS ====================

  static Map<ArtworkTemplateField, List<DropdownItem<dynamic>>>
      buildFilterDropdownItems(
    ElbCoreLocalizations l10n,
    ElbPrepressLocalizations ppL10n,
  ) {
    return _cache.buildFilterDropdownItems(l10n, ppL10n);
  }
}

// ==================== LIST EXTENSIONS ====================

extension ArtworkTemplateFieldsTableExt on List<ArtworkTemplateField> {
  Map<ArtworkTemplateField, TableFieldData> filters(
    ElbCoreLocalizations l10n,
    ElbPrepressLocalizations ppL10n,
  ) {
    return ExtendedFieldListExt<ArtworkTemplateField, ElbPrepressLocalizations>(
      this,
    ).buildFilters(
      coreL10n: l10n,
      customL10n: ppL10n,
      fromEnum: ArtworkTemplateFields.fromEnum,
    );
  }

  Map<ArtworkTemplateField, TableColumnData> columns(
    ElbCoreLocalizations l10n,
    ElbPrepressLocalizations ppL10n,
  ) {
    const excludeFields = {
      ArtworkTemplateField.deletedAt,
      ArtworkTemplateField.isDraft,
    };
    return ExtendedFieldListExt<ArtworkTemplateField, ElbPrepressLocalizations>(
      this,
    ).buildColumns(
      coreL10n: l10n,
      customL10n: ppL10n,
      fromEnum: ArtworkTemplateFields.fromEnum,
      excludeFields: excludeFields,
    );
  }

  Map<ArtworkTemplateField, TableFieldData> quickSearchFilters(
    ElbCoreLocalizations l10n,
    ElbPrepressLocalizations ppL10n,
  ) {
    return [
      ArtworkTemplateField.description,
    ].buildQuickSearch(
      coreL10n: l10n,
      customL10n: ppL10n,
      fromEnum: ArtworkTemplateFields.fromEnum,
    );
  }
}
