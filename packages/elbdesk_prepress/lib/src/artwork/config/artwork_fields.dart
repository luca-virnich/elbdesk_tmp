import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/l10n/elb_prepress_localizations.dart';
import 'package:elbdesk_prepress/src/artwork/extensions/artwork_print_process_type_ext.dart';
import 'package:elbdesk_prepress/src/artwork/extensions/artwork_type_ext.dart';

/// UNIFIED ArtworkField fields with ALL features (forms + tables) in ONE place
/// This replaces ArtworkFieldWrapper and ArtworkFieldExt
class ArtworkFields {
  ArtworkFields._();

  // ==================== FIELD CACHE ====================

  static final _cache = FieldCache<ArtworkField, ElbPrepressLocalizations>(
    values: ArtworkField.values,
    createField: _createField,
  );

  static ExtendedField<ArtworkField, ElbPrepressLocalizations> fromEnum(
    ArtworkField field,
  ) =>
      _cache.fromEnum(field);

  static ExtendedField<ArtworkField, ElbPrepressLocalizations> fromFieldKey(
    String fieldKey,
  ) =>
      _cache.fromFieldKey(fieldKey);

  static final List<TableFieldConfig> defaultColumns = List.unmodifiable([
    _cache.fromEnum(ArtworkField.id).tableFieldConfig,
    _cache.fromEnum(ArtworkField.description).tableFieldConfig,
    _cache.fromEnum(ArtworkField.width).tableFieldConfig,
    _cache.fromEnum(ArtworkField.height).tableFieldConfig,
    _cache.fromEnum(ArtworkField.colors).tableFieldConfig,
  ]);

  static final List<TableFieldConfig> defaultSalesOrderColumns =
      List.unmodifiable([
    _cache.fromEnum(ArtworkField.id).tableFieldConfig,
    _cache.fromEnum(ArtworkField.description).tableFieldConfig,
    _cache.fromEnum(ArtworkField.colors).tableFieldConfig,
    _cache.fromEnum(ArtworkField.actions).tableFieldConfig,
  ]);

  // ==================== FIELD DEFINITIONS ====================

  static ExtendedField<ArtworkField, ElbPrepressLocalizations> _createField(
    ArtworkField field,
  ) {
    return switch (field) {
      // ========== Meta Fields ==========
      ArtworkField.deletedAt => ExtendedFieldImpl.date(
          ArtworkField.deletedAt,
          readableFunc: (l10n, ppL10n) => l10n.gen_deleted_at,
          dateValidatorFunc: (l10n, ppL10n) => null,
          filterTypes: DefaultFilterTypes.noFilter,
          excludeFromTable: true,
        ),
      ArtworkField.isDraft => ExtendedFieldImpl.boolean(
          ArtworkField.isDraft,
          readableFunc: (l10n, ppL10n) => l10n.gen_is_draft,
          validatorFunc: (l10n, ppL10n) => null,
          filterTypes: DefaultFilterTypes.noFilter,
          excludeFromTable: true,
        ),
      ArtworkField.createdAt => ExtendedFieldImpl.date(
          ArtworkField.createdAt,
          readableFunc: (l10n, ppL10n) => l10n.window_bottom_status_bar_created,
          dateValidatorFunc: (l10n, ppL10n) => null,
        ),
      ArtworkField.createdBy => ExtendedFieldImpl.text(
          ArtworkField.createdBy,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_created_by,
          validatorFunc: (l10n, ppL10n) => null,
        ),
      ArtworkField.lastModifiedAt => ExtendedFieldImpl.date(
          ArtworkField.lastModifiedAt,
          readableFunc: (l10n, ppL10n) => l10n.window_bottom_status_bar_edited,
          dateValidatorFunc: (l10n, ppL10n) => null,
        ),
      ArtworkField.lastModifiedBy => ExtendedFieldImpl.text(
          ArtworkField.lastModifiedBy,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_last_modified_by,
          validatorFunc: (l10n, ppL10n) => null,
        ),
      ArtworkField.id => const ExtendedFieldImpl.id(
          ArtworkField.id,
        ),

      // ========== Entity Fields ==========

      ArtworkField.reference => ExtendedFieldImpl.text(
          ArtworkField.reference,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_reference,
          validatorFunc: (l10n, ppL10n) => null,
        ),
      ArtworkField.description => ExtendedFieldImpl.text(
          ArtworkField.description,
          readableFunc: (l10n, ppL10n) => l10n.gen_description,
          validatorFunc: (l10n, ppL10n) => null,
        ),
      ArtworkField.version => ExtendedFieldImpl.integer(
          ArtworkField.version,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_version,
          validatorFunc: (l10n, ppL10n) => null,
        ),
      ArtworkField.dieCutterType => ExtendedFieldImpl.text(
          ArtworkField.dieCutterType,
          readableFunc: (l10n, ppL10n) => ppL10n.layer_type_die_cutter,
          validatorFunc: (l10n, ppL10n) => null,
        ),
      ArtworkField.artworkType => ExtendedFieldImpl.textDropdown(
          ArtworkField.artworkType,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_type,
          isMandatory: true,
          items: (coreL10n, ppL10n) => ArtworkType.values
              .map(
                (type) => DropdownItem.text(
                  value: type,
                  label: type.readable(ppL10n),
                ),
              )
              .toList(),
        ),
      ArtworkField.printProcessType => ExtendedFieldImpl.textDropdown(
          ArtworkField.printProcessType,
          readableFunc: (l10n, ppL10n) => ppL10n.print_process,
          isMandatory: true,
          items: (coreL10n, ppL10n) => ArtworkPrintProcessType.values
              .map(
                (type) => DropdownItem.text(
                  value: type,
                  label: type.readable(ppL10n),
                ),
              )
              .toList(),
        ),
      ArtworkField.width => ExtendedFieldImpl.double(
          ArtworkField.width,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_width,
          validatorFunc: (l10n, ppL10n) => (String? value) {
            return TextFieldValidator.isDoubleGreaterZero(
              value,
              'Muss größer 0 sein'.hc,
            );
          },
        ),
      ArtworkField.height => ExtendedFieldImpl.double(
          ArtworkField.height,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_height,
          validatorFunc: (l10n, ppL10n) => null,
        ),
      ArtworkField.colors => ExtendedFieldImpl.integer(
          ArtworkField.colors,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_colors,
          validatorFunc: (l10n, ppL10n) => null,
          filterTypes: DefaultFilterTypes.noFilter,
        ),
      ArtworkField.codes => ExtendedFieldImpl.integer(
          ArtworkField.codes,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_codes,
          validatorFunc: (l10n, ppL10n) => null,
          filterTypes: DefaultFilterTypes.noFilter,
        ),
      ArtworkField.layers => ExtendedFieldImpl.integer(
          ArtworkField.layers,
          readableFunc: (l10n, ppL10n) => ppL10n.layers,
          validatorFunc: (l10n, ppL10n) => null,
        ),
      ArtworkField.customer => ExtendedFieldImpl.text(
          ArtworkField.customer,
          readableFunc: (l10n, ppL10n) => ppL10n.customer,
          validatorFunc: (l10n, _) => null,
        ),
      ArtworkField.customerId => ExtendedFieldImpl.integer(
          ArtworkField.customerId,
          readableFunc: (l10n, ppL10n) => ppL10n.customer,
          validatorFunc: (l10n, _) => null,
        ),
      ArtworkField.salesOrderId => ExtendedFieldImpl.integer(
          ArtworkField.salesOrderId,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_sales_order,
          validatorFunc: (l10n, ppL10n) => null,
        ),
      ArtworkField.layerId => ExtendedFieldImpl.integer(
          ArtworkField.layerId,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_layer_id,
          validatorFunc: (l10n, ppL10n) => null,
        ),
      ArtworkField.abzug => ExtendedFieldImpl.integer(
          ArtworkField.abzug,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_deduction,
          validatorFunc: (l10n, ppL10n) => null,
        ),
      ArtworkField.anschnitt => ExtendedFieldImpl.double(
          ArtworkField.anschnitt,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_bleed,
          validatorFunc: (l10n, ppL10n) => null,
        ),
      ArtworkField.cornerRadius => ExtendedFieldImpl.double(
          ArtworkField.cornerRadius,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_corner_radius,
          validatorFunc: (l10n, ppL10n) => null,
        ),
      ArtworkField.trappNormal => ExtendedFieldImpl.double(
          ArtworkField.trappNormal,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_trapping_normal,
          validatorFunc: (l10n, ppL10n) => null,
        ),
      ArtworkField.trappBlack => ExtendedFieldImpl.double(
          ArtworkField.trappBlack,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_trapping_black,
          validatorFunc: (l10n, ppL10n) => null,
        ),
      ArtworkField.trappBilder => ExtendedFieldImpl.double(
          ArtworkField.trappBilder,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_trapping_pictures,
          validatorFunc: (l10n, ppL10n) => null,
        ),
      ArtworkField.trappSonderfarben => ExtendedFieldImpl.double(
          ArtworkField.trappSonderfarben,
          readableFunc: (l10n, ppL10n) =>
              ppL10n.artwork_trapping_special_colors,
          validatorFunc: (l10n, ppL10n) => null,
        ),
      ArtworkField.trappRueckzug => ExtendedFieldImpl.double(
          ArtworkField.trappRueckzug,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_trapping_pullback,
          validatorFunc: (l10n, ppL10n) => null,
        ),
      ArtworkField.actions => ExtendedFieldImpl.boolean(
          ArtworkField.actions,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_actions,
          validatorFunc: (l10n, ppL10n) => null,
        ),
    };
  }

  // ==================== DROPDOWN ITEMS ====================

  static Map<ArtworkField, List<DropdownItem<dynamic>>>
      buildFilterDropdownItems(
    ElbCoreLocalizations l10n,
    ElbPrepressLocalizations ppL10n,
  ) {
    return _cache.buildFilterDropdownItems(l10n, ppL10n);
  }
}

// ==================== LIST EXTENSIONS ====================

/// Extension methods for table operations
extension ArtworkFieldsTableExt on List<ArtworkField> {
  /// Returns a map of filterable fields with labels
  Map<ArtworkField, TableFieldData> filters(
    ElbCoreLocalizations l10n,
    ElbPrepressLocalizations ppL10n,
  ) {
    return ExtendedFieldListExt<ArtworkField, ElbPrepressLocalizations>(this)
        .buildFilters(
      coreL10n: l10n,
      customL10n: ppL10n,
      fromEnum: ArtworkFields.fromEnum,
    );
  }

  /// Returns a map of table columns with labels
  Map<ArtworkField, TableColumnData> columns(
    ElbCoreLocalizations l10n,
    ElbPrepressLocalizations ppL10n,
  ) {
    return ExtendedFieldListExt<ArtworkField, ElbPrepressLocalizations>(this)
        .buildColumns(
      coreL10n: l10n,
      customL10n: ppL10n,
      fromEnum: ArtworkFields.fromEnum,
    );
  }
}
