import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/l10n/elb_prepress_localizations.dart';

/// UNIFIED ArtworkCodeField fields with ALL features (forms + tables) in
/// ONE place
/// This replaces ArtworkCodeFieldWrapper and ArtworkCodeFieldExt
class ArtworkCodeFields {
  ArtworkCodeFields._();

  // ==================== FIELD CACHE ====================

  static final _cache = FieldCache<ArtworkCodeField, ElbPrepressLocalizations>(
    values: ArtworkCodeField.values,
    createField: _createField,
  );

  static ExtendedField<ArtworkCodeField, ElbPrepressLocalizations> fromEnum(
    ArtworkCodeField field,
  ) =>
      _cache.fromEnum(field);

  static ExtendedField<ArtworkCodeField, ElbPrepressLocalizations> fromFieldKey(
    String fieldKey,
  ) =>
      _cache.fromFieldKey(fieldKey);

  // ==================== FIELD DEFINITIONS ====================

  static ExtendedField<ArtworkCodeField, ElbPrepressLocalizations> _createField(
    ArtworkCodeField field,
  ) {
    return switch (field) {
      // ========== Meta Fields ==========
      ArtworkCodeField.deletedAt => ExtendedFieldImpl.date(
          ArtworkCodeField.deletedAt,
          readableFunc: (l10n, ppL10n) => l10n.gen_deleted_at,
          dateValidatorFunc: (l10n, ppL10n) => null,
          filterTypes: DefaultFilterTypes.noFilter,
          excludeFromTable: true,
        ),
      ArtworkCodeField.createdAt => ExtendedFieldImpl.date(
          ArtworkCodeField.createdAt,
          readableFunc: (l10n, ppL10n) => l10n.window_bottom_status_bar_created,
          dateValidatorFunc: (l10n, ppL10n) => null,
        ),
      ArtworkCodeField.createdBy => ExtendedFieldImpl.text(
          ArtworkCodeField.createdBy,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_created_by,
          validatorFunc: (l10n, ppL10n) => null,
        ),
      ArtworkCodeField.lastModifiedAt => ExtendedFieldImpl.date(
          ArtworkCodeField.lastModifiedAt,
          readableFunc: (l10n, ppL10n) => l10n.window_bottom_status_bar_edited,
          dateValidatorFunc: (l10n, ppL10n) => null,
        ),
      ArtworkCodeField.lastModifiedBy => ExtendedFieldImpl.text(
          ArtworkCodeField.lastModifiedBy,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_last_modified_by,
          validatorFunc: (l10n, ppL10n) => null,
        ),
      ArtworkCodeField.id => const ExtendedFieldImpl.id(
          ArtworkCodeField.id,
        ),

      // ========== Entity Fields ==========

      ArtworkCodeField.artwork => ExtendedFieldImpl.text(
          ArtworkCodeField.artwork,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork,
          validatorFunc: (l10n, ppL10n) => null,
        ),
      ArtworkCodeField.value => ExtendedFieldImpl.text(
          ArtworkCodeField.value,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_reference,
          validatorFunc: (l10n, ppL10n) => null,
        ),
      ArtworkCodeField.description => ExtendedFieldImpl.text(
          ArtworkCodeField.description,
          readableFunc: (l10n, ppL10n) => l10n.gen_description,
          validatorFunc: (l10n, ppL10n) => null,
        ),
      ArtworkCodeField.code2of5 => ExtendedFieldImpl.text(
          ArtworkCodeField.code2of5,
          readableFunc: (l10n, ppL10n) => ppL10n.layer_type_die_cutter,
          validatorFunc: (l10n, ppL10n) => null,
        ),
      ArtworkCodeField.codeAztec => ExtendedFieldImpl.text(
          ArtworkCodeField.codeAztec,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_type,
          validatorFunc: (l10n, ppL10n) => null,
          isMandatory: true,
        ),
      ArtworkCodeField.codeTemplate => ExtendedFieldImpl.text(
          ArtworkCodeField.codeTemplate,
          readableFunc: (l10n, ppL10n) => ppL10n.print_process,
          isMandatory: true,
          validatorFunc: (l10n, ppL10n) => null,
        ),
      ArtworkCodeField.barWidthReduction => ExtendedFieldImpl.double(
          ArtworkCodeField.barWidthReduction,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_width,
          validatorFunc: (l10n, ppL10n) => null,
        ),
      ArtworkCodeField.deviceCompensation => ExtendedFieldImpl.double(
          ArtworkCodeField.deviceCompensation,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_height,
          validatorFunc: (l10n, ppL10n) => null,
        ),
      ArtworkCodeField.narrowBarWidth => ExtendedFieldImpl.double(
          ArtworkCodeField.narrowBarWidth,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_colors,
          validatorFunc: (l10n, ppL10n) => null,
          filterTypes: DefaultFilterTypes.noFilter,
        ),
      ArtworkCodeField.aspectRatio => ExtendedFieldImpl.double(
          ArtworkCodeField.aspectRatio,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_codes,
          validatorFunc: (l10n, ppL10n) => null,
          filterTypes: DefaultFilterTypes.noFilter,
        ),
    };
  }

  // ==================== DROPDOWN ITEMS ====================

  static Map<ArtworkCodeField, List<DropdownItem<dynamic>>>
      buildFilterDropdownItems(
    ElbCoreLocalizations l10n,
    ElbPrepressLocalizations ppL10n,
  ) {
    return _cache.buildFilterDropdownItems(l10n, ppL10n);
  }
}

// ==================== LIST EXTENSIONS ====================

/// Extension methods for table operations
extension ArtworkCodeFieldsTableExt on List<ArtworkCodeField> {
  /// Returns a map of filterable fields with labels
  Map<ArtworkCodeField, TableFieldData> filters(
    ElbCoreLocalizations l10n,
    ElbPrepressLocalizations ppL10n,
  ) {
    return ExtendedFieldListExt<ArtworkCodeField, ElbPrepressLocalizations>(
      this,
    ).buildFilters(
      coreL10n: l10n,
      customL10n: ppL10n,
      fromEnum: ArtworkCodeFields.fromEnum,
    );
  }

  /// Returns a map of table columns with labels
  Map<ArtworkCodeField, TableColumnData> columns(
    ElbCoreLocalizations l10n,
    ElbPrepressLocalizations ppL10n,
  ) {
    return ExtendedFieldListExt<ArtworkCodeField, ElbPrepressLocalizations>(
      this,
    ).buildColumns(
      coreL10n: l10n,
      customL10n: ppL10n,
      fromEnum: ArtworkCodeFields.fromEnum,
    );
  }
}
