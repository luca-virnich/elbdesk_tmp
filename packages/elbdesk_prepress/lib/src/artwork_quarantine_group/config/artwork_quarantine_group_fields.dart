import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/l10n/elb_prepress_localizations.dart';
import 'package:elbdesk_prepress/src/artwork/extensions/artwork_print_process_type_ext.dart';
import 'package:elbdesk_prepress/src/artwork/extensions/artwork_type_ext.dart';
import 'package:elbdesk_prepress/src/product/extensions/product_type_extension.dart';
import 'package:flutter/widgets.dart';

/// UNIFIED ArtworkQuarantineGroupField fields with ALL features
/// (forms + tables) in ONE place
/// This replaces ArtworkQuarantineGroupFieldWrapper and
/// ArtworkQuarantineGroupFieldExt
class ArtworkQuarantineGroupFields {
  ArtworkQuarantineGroupFields._();

  // ==================== FIELD CACHE ====================

  static final _cache =
      FieldCache<ArtworkQuarantineGroupField, ElbPrepressLocalizations>(
    values: ArtworkQuarantineGroupField.values,
    createField: _createField,
  );

  static ExtendedField<ArtworkQuarantineGroupField, ElbPrepressLocalizations>
      fromEnum(
    ArtworkQuarantineGroupField field,
  ) =>
          _cache.fromEnum(field);

  static ExtendedField<ArtworkQuarantineGroupField, ElbPrepressLocalizations>
      fromFieldKey(
    String fieldKey,
  ) =>
          _cache.fromFieldKey(fieldKey);

  static final List<TableFieldConfig> defaultTableColumns = List.unmodifiable([
    _cache.fromEnum(ArtworkQuarantineGroupField.id).tableFieldConfig,
    _cache.fromEnum(ArtworkQuarantineGroupField.status).tableFieldConfig,
    _cache.fromEnum(ArtworkQuarantineGroupField.type).tableFieldConfig,
    _cache
        .fromEnum(ArtworkQuarantineGroupField.selectedProductSeriesId)
        .tableFieldConfig,
    _cache.fromEnum(ArtworkQuarantineGroupField.createdAt).tableFieldConfig,
    _cache.fromEnum(ArtworkQuarantineGroupField.createdBy).tableFieldConfig,
  ]);

  // ==================== FIELD DEFINITIONS ====================

  static ExtendedField<ArtworkQuarantineGroupField, ElbPrepressLocalizations>
      _createField(
    ArtworkQuarantineGroupField field,
  ) {
    return switch (field) {
      // ========== Meta Fields ==========
      ArtworkQuarantineGroupField.deletedAt => ExtendedFieldImpl.date(
          ArtworkQuarantineGroupField.deletedAt,
          readableFunc: (l10n, _) => l10n.gen_deleted_at,
          dateValidatorFunc: (l10n, _) => null,
          filterTypes: DefaultFilterTypes.noFilter,
          excludeFromTable: true,
        ),
      ArtworkQuarantineGroupField.createdAt => ExtendedFieldImpl.date(
          ArtworkQuarantineGroupField.createdAt,
          readableFunc: (l10n, _) => l10n.gen_created_at,
          dateValidatorFunc: (l10n, _) => null,
        ),
      ArtworkQuarantineGroupField.createdBy => ExtendedFieldImpl.text(
          ArtworkQuarantineGroupField.createdBy,
          readableFunc: (l10n, _) => l10n.gen_created_by,
          validatorFunc: (l10n, _) => null,
        ),
      ArtworkQuarantineGroupField.lastModifiedAt => ExtendedFieldImpl.date(
          ArtworkQuarantineGroupField.lastModifiedAt,
          readableFunc: (l10n, _) => l10n.gen_last_modified_at,
          dateValidatorFunc: (l10n, _) => null,
        ),
      ArtworkQuarantineGroupField.lastModifiedBy => ExtendedFieldImpl.text(
          ArtworkQuarantineGroupField.lastModifiedBy,
          readableFunc: (l10n, _) => l10n.gen_last_modified_by,
          validatorFunc: (l10n, _) => null,
        ),
      ArtworkQuarantineGroupField.id => const ExtendedFieldImpl.id(
          ArtworkQuarantineGroupField.id,
        ),

      // ========== Entity Fields ==========

      ArtworkQuarantineGroupField.status => ExtendedFieldImpl.text(
          ArtworkQuarantineGroupField.status,
          readableFunc: (l10n, ppL10n) =>
              ppL10n.artwork_quarantine_group_status,
          validatorFunc: (l10n, _) => null,
          cellWidth: 140,
        ),
      ArtworkQuarantineGroupField.type => ExtendedFieldImpl.text(
          ArtworkQuarantineGroupField.type,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_quarantine_group_type,
          validatorFunc: (l10n, _) => null,
        ),
      ArtworkQuarantineGroupField.selectedProductSeriesId =>
        ExtendedFieldImpl.text(
          ArtworkQuarantineGroupField.selectedProductSeriesId,
          readableFunc: (l10n, ppL10n) =>
              ppL10n.artwork_quarantine_group_selected_product_series,
          validatorFunc: (l10n, _) => null,
          filterTypes: DefaultFilterTypes.noFilter,
          cellWidth: 160,
        ),
      ArtworkQuarantineGroupField.outputPath => ExtendedFieldImpl.text(
          ArtworkQuarantineGroupField.outputPath,
          readableFunc: (l10n, ppL10n) =>
              ppL10n.artwork_quarantine_group_output_path,
          validatorFunc: (l10n, _) => null,
        ),
      ArtworkQuarantineGroupField.attachments => ExtendedFieldImpl.text(
          ArtworkQuarantineGroupField.attachments,
          readableFunc: (l10n, ppL10n) =>
              ppL10n.artwork_quarantine_group_attachments,
          filterTypes: DefaultFilterTypes.noFilter,
          validatorFunc: (l10n, _) => null,
        ),
      ArtworkQuarantineGroupField.customer => ExtendedFieldImpl.text(
          ArtworkQuarantineGroupField.customer,
          readableFunc: (l10n, ppL10n) => ppL10n.customer,
          validatorFunc: (l10n, _) => null,
          cellWidth: 200,
        ),
      ArtworkQuarantineGroupField.artworkType => ExtendedFieldImpl.textDropdown(
          ArtworkQuarantineGroupField.artworkType,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_type,
          isMandatory: false,
          items: (l10n, ppL10n) => ArtworkType.values.ordered.map((type) {
            return DropdownItem.text(
              label: type.readable(ppL10n),
              value: type,
            );
          }).toList(),
        ),
      ArtworkQuarantineGroupField.productType => ExtendedFieldImpl.textDropdown(
          ArtworkQuarantineGroupField.productType,
          readableFunc: (l10n, ppL10n) => ppL10n.product_type,
          isMandatory: false,
          items: (l10n, ppL10n) => ProductType.values.ordered.map((type) {
            return DropdownItem.text(
              label: type.readable(ppL10n),
              value: type,
            );
          }).toList(),
        ),
      ArtworkQuarantineGroupField.printProcessType =>
        ExtendedFieldImpl.textDropdown(
          ArtworkQuarantineGroupField.printProcessType,
          readableFunc: (l10n, ppL10n) => ppL10n.print_process,
          isMandatory: false,
          items: (l10n, ppL10n) =>
              ArtworkPrintProcessType.values.ordered.map((type) {
            return DropdownItem.text(
              value: type,
              label: type.readable(ppL10n),
            );
          }).toList(),
        ),
      ArtworkQuarantineGroupField.width => ExtendedFieldImpl.double(
          ArtworkQuarantineGroupField.width,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_width,
          validatorFunc: (l10n, _) => null,
        ),
      ArtworkQuarantineGroupField.height => ExtendedFieldImpl.double(
          ArtworkQuarantineGroupField.height,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_height,
          validatorFunc: (l10n, _) => null,
        ),
      ArtworkQuarantineGroupField.cornerRadius => ExtendedFieldImpl.double(
          ArtworkQuarantineGroupField.cornerRadius,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_corner_radius,
          validatorFunc: (l10n, _) => null,
        ),
      ArtworkQuarantineGroupField.description => ExtendedFieldImpl.text(
          ArtworkQuarantineGroupField.description,
          readableFunc: (l10n, ppL10n) => l10n.gen_description,
          validatorFunc: (l10n, _) => null,
          keyboardType: TextInputType.multiline,
          maxLines: 3,
          minLines: 3,
        ),
      ArtworkQuarantineGroupField.assignedUser =>
        ExtendedFieldImpl.assignedUser(
          ArtworkQuarantineGroupField.assignedUser,
          readableFunc: (l10n, ppL10n) => 'Sachbearbeiter'.hc,
          isMandatory: true,
        ),
      ArtworkQuarantineGroupField.sendToAeAt => ExtendedFieldImpl.date(
          ArtworkQuarantineGroupField.sendToAeAt,
          readableFunc: (l10n, ppL10n) => 'Send to AE At'.hc,
          dateValidatorFunc: (l10n, _) => null,
        ),
      ArtworkQuarantineGroupField.sendToAeBy => ExtendedFieldImpl.text(
          ArtworkQuarantineGroupField.sendToAeBy,
          readableFunc: (l10n, ppL10n) => 'Send to AE By'.hc,
          validatorFunc: (l10n, _) => null,
        ),
      ArtworkQuarantineGroupField.artworkQuarantines => ExtendedFieldImpl.text(
          ArtworkQuarantineGroupField.artworkQuarantines,
          readableFunc: (l10n, ppL10n) => 'Artwork Quarantines'.hc,
          validatorFunc: (l10n, _) => null,
        ),
    };
  }

  // ==================== DROPDOWN ITEMS ====================

  static Map<ArtworkQuarantineGroupField, List<DropdownItem<dynamic>>>
      buildFilterDropdownItems(
    ElbCoreLocalizations l10n,
    ElbPrepressLocalizations ppL10n,
  ) {
    return _cache.buildFilterDropdownItems(l10n, ppL10n);
  }
}

// ==================== LIST EXTENSIONS ====================

/// Extension methods for table operations
extension ArtworkQuarantineGroupFieldsTableExt
    on List<ArtworkQuarantineGroupField> {
  /// Returns a map of filterable fields with labels
  Map<ArtworkQuarantineGroupField, TableFieldData> filters(
    ElbCoreLocalizations l10n,
    ElbPrepressLocalizations ppL10n,
  ) {
    const excludeFields = {
      ArtworkQuarantineGroupField.id,
    };

    return ExtendedFieldListExt<ArtworkQuarantineGroupField,
            ElbPrepressLocalizations>(this)
        .buildFilters(
      coreL10n: l10n,
      customL10n: ppL10n,
      fromEnum: ArtworkQuarantineGroupFields.fromEnum,
      excludeFields: excludeFields,
    );
  }

  /// Returns a map of table columns with labels
  Map<ArtworkQuarantineGroupField, TableColumnData> columns(
    ElbCoreLocalizations l10n,
    ElbPrepressLocalizations ppL10n,
  ) {
    const excludeFields = {
      ArtworkQuarantineGroupField.lastModifiedAt,
      ArtworkQuarantineGroupField.lastModifiedBy,
    };

    return ExtendedFieldListExt<ArtworkQuarantineGroupField,
            ElbPrepressLocalizations>(this)
        .buildColumns(
      coreL10n: l10n,
      customL10n: ppL10n,
      fromEnum: ArtworkQuarantineGroupFields.fromEnum,
      excludeFields: excludeFields,
    );
  }

  /// Returns a map of quick search filter fields
  Map<ArtworkQuarantineGroupField, TableFieldData> quickSearchFilters(
    ElbCoreLocalizations l10n,
    ElbPrepressLocalizations ppL10n,
  ) {
    const fields = [
      ArtworkQuarantineGroupField.status,
    ];

    return ExtendedFieldListExt<ArtworkQuarantineGroupField,
            ElbPrepressLocalizations>(fields)
        .buildFilters(
      coreL10n: l10n,
      customL10n: ppL10n,
      fromEnum: ArtworkQuarantineGroupFields.fromEnum,
    );
  }
}
