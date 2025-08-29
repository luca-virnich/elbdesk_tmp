import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/l10n/elb_prepress_localizations.dart';

/// UNIFIED ArtworkLayerField fields with ALL features (forms + tables) in ONE place
/// This replaces ArtworkLayerFieldWrapper and ArtworkLayerFieldExt
class ArtworkLayerFields {
  ArtworkLayerFields._();

  // ==================== FIELD CACHE ====================

  static final _cache = FieldCache<ArtworkLayerField, ElbPrepressLocalizations>(
    values: ArtworkLayerField.values,
    createField: _createField,
  );

  static ExtendedField<ArtworkLayerField, ElbPrepressLocalizations> fromEnum(
    ArtworkLayerField field,
  ) =>
      _cache.fromEnum(field);

  static ExtendedField<ArtworkLayerField, ElbPrepressLocalizations>
      fromFieldKey(
    String fieldKey,
  ) =>
          _cache.fromFieldKey(fieldKey);

  // ==================== DEFAULT COLUMNS ====================

  static final List<TableFieldConfig> artworkLayerTableDefaultColumns =
      List.unmodifiable([
    _cache.fromEnum(ArtworkLayerField.layerName).tableFieldConfig,
    _cache.fromEnum(ArtworkLayerField.layerType).tableFieldConfig,
    _cache.fromEnum(ArtworkLayerField.printable).tableFieldConfig,
    _cache.fromEnum(ArtworkLayerField.locked).tableFieldConfig,
    _cache.fromEnum(ArtworkLayerField.actions).tableFieldConfig,
  ]);

  // ==================== FIELD DEFINITIONS ====================

  static ExtendedField<ArtworkLayerField, ElbPrepressLocalizations>
      _createField(
    ArtworkLayerField field,
  ) {
    return switch (field) {
      ArtworkLayerField.id => const ExtendedFieldImpl.id(
          ArtworkLayerField.id,
        ),

      // ========== Text Fields ==========
      ArtworkLayerField.move => ExtendedFieldImpl.text(
          ArtworkLayerField.move,
          readableFunc: (l10n, _) => ''.fixed,
          validatorFunc: (l10n, _) => null,
          filterTypes: DefaultFilterTypes.noFilter,
        ),
      ArtworkLayerField.layerType => ExtendedFieldImpl.text(
          ArtworkLayerField.layerType,
          readableFunc: (l10n, ppL10n) => ppL10n.layer_type,
          validatorFunc: (l10n, _) => null,
          cellWidth: 120,
        ),
      ArtworkLayerField.layerName => ExtendedFieldImpl.text(
          ArtworkLayerField.layerName,
          readableFunc: (l10n, ppL10n) => ppL10n.layer_name,
          validatorFunc: (l10n, ppL10n) => (String? value) {
            if (value == null) return null;
            if (value.isEmpty) return l10n.validation_name_required;
            return null;
          },
        ),

      // ========== Boolean Fields ==========
      ArtworkLayerField.printable => ExtendedFieldImpl.boolean(
          ArtworkLayerField.printable,
          readableFunc: (l10n, ppL10n) => ppL10n.layer_printable,
          validatorFunc: (l10n, ppL10n) => null,
        ),
      ArtworkLayerField.locked => ExtendedFieldImpl.boolean(
          ArtworkLayerField.locked,
          readableFunc: (l10n, ppL10n) => ppL10n.layer_locked,
          validatorFunc: (l10n, ppL10n) => null,
        ),
      ArtworkLayerField.actions => ExtendedFieldImpl.boolean(
          ArtworkLayerField.actions,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_actions,
          validatorFunc: (l10n, ppL10n) => null,
          filterTypes: DefaultFilterTypes.noFilter,
        ),
    };
  }
  // ==================== DROPDOWN ITEMS ====================

  static Map<ArtworkLayerField, List<DropdownItem<dynamic>>>
      buildFilterDropdownItems(
    ElbCoreLocalizations l10n,
    ElbPrepressLocalizations ppL10n,
  ) {
    return _cache.buildFilterDropdownItems(l10n, ppL10n);
  }
}

// ==================== LIST EXTENSIONS ====================

/// Extension methods for table operations
extension ArtworkLayerFieldsTableExt on List<ArtworkLayerField> {
  /// Returns a map of filterable fields with labels
  Map<ArtworkLayerField, TableFieldData> filters(
    ElbCoreLocalizations l10n,
    ElbPrepressLocalizations ppL10n,
  ) {
    return ExtendedFieldListExt<ArtworkLayerField, ElbPrepressLocalizations>(
      this,
    ).buildFilters(
      coreL10n: l10n,
      customL10n: ppL10n,
      fromEnum: ArtworkLayerFields.fromEnum,
    );
  }

  /// Returns a map of table columns with labels
  Map<ArtworkLayerField, TableColumnData> columns(
    ElbCoreLocalizations l10n,
    ElbPrepressLocalizations ppL10n,
  ) {
    return ExtendedFieldListExt<ArtworkLayerField, ElbPrepressLocalizations>(
      this,
    ).buildColumns(
      coreL10n: l10n,
      customL10n: ppL10n,
      fromEnum: ArtworkLayerFields.fromEnum,
    );
  }

  /// Returns a map of quick search filter fields
  Map<ArtworkLayerField, TableFieldData> quickSearchFilters(
    ElbCoreLocalizations l10n,
    ElbPrepressLocalizations ppL10n,
  ) {
    return [
      ArtworkLayerField.layerName,
    ].buildQuickSearch(
      coreL10n: l10n,
      customL10n: ppL10n,
      fromEnum: ArtworkLayerFields.fromEnum,
    );
  }
}
