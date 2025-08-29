import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/l10n/elb_prepress_localizations.dart';
import 'package:elbdesk_prepress/src/artwork/extensions/artwork_print_process_type_ext.dart';
import 'package:elbdesk_prepress/src/artwork/extensions/artwork_type_ext.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine_group/extensions/artwork_quarantine_status_extension.dart';
import 'package:elbdesk_prepress/src/product/extensions/product_type_extension.dart';
import 'package:flutter/services.dart';

/// UNIFIED ArtworkQuarantineField fields with ALL features (forms + tables)
/// in ONE place
/// This replaces ArtworkQuarantineFieldWrapper and ArtworkQuarantineFieldExt
class ArtworkQuarantineFields {
  ArtworkQuarantineFields._();

  // ==================== FIELD CACHE ====================

  static final _cache =
      FieldCache<ArtworkQuarantineField, ElbPrepressLocalizations>(
    values: ArtworkQuarantineField.values,
    createField: _createField,
  );

  static ExtendedField<ArtworkQuarantineField, ElbPrepressLocalizations>
      fromEnum(
    ArtworkQuarantineField field,
  ) =>
          _cache.fromEnum(field);

  static ExtendedField<ArtworkQuarantineField, ElbPrepressLocalizations>
      fromFieldKey(String fieldKey) => _cache.fromFieldKey(fieldKey);

  static final List<TableFieldConfig> defaultTableColumns = List.unmodifiable([
    _cache.fromEnum(ArtworkQuarantineField.createdAt).tableFieldConfig,
    _cache.fromEnum(ArtworkQuarantineField.customer).tableFieldConfig,
    _cache.fromEnum(ArtworkQuarantineField.description).tableFieldConfig,
  ]);

  static final List<TableFieldConfig> customerTableColumns = List.unmodifiable([
    _cache.fromEnum(ArtworkQuarantineField.description).tableFieldConfig,
    _cache.fromEnum(ArtworkQuarantineField.keywords).tableFieldConfig,
    _cache.fromEnum(ArtworkQuarantineField.colors).tableFieldConfig,
    _cache.fromEnum(ArtworkQuarantineField.width).tableFieldConfig,
    _cache.fromEnum(ArtworkQuarantineField.height).tableFieldConfig,
    _cache.fromEnum(ArtworkQuarantineField.createdAt).tableFieldConfig,
  ]);

  static final List<TableFieldConfig> dateneingangTableColumns =
      List.unmodifiable([
    _cache.fromEnum(ArtworkQuarantineField.createdAt).tableFieldConfig,
    _cache.fromEnum(ArtworkQuarantineField.customer).tableFieldConfig,
    _cache.fromEnum(ArtworkQuarantineField.customerId).tableFieldConfig,
    _cache.fromEnum(ArtworkQuarantineField.description).tableFieldConfig,
    _cache.fromEnum(ArtworkQuarantineField.createdBy).tableFieldConfig,
  ]);

  static final List<TableFieldConfig> salesOrderTableColumns =
      List.unmodifiable([
    _cache.fromEnum(ArtworkQuarantineField.createdAt).tableFieldConfig,
    _cache.fromEnum(ArtworkQuarantineField.description).tableFieldConfig,
    _cache.fromEnum(ArtworkQuarantineField.createProduct).tableFieldConfig,
    _cache.fromEnum(ArtworkQuarantineField.createProductPart).tableFieldConfig,
    _cache.fromEnum(ArtworkQuarantineField.width).tableFieldConfig,
    _cache.fromEnum(ArtworkQuarantineField.height).tableFieldConfig,
  ]);

  static final List<TableFieldConfig> salesOrderByGroupTableColumns =
      List.unmodifiable([
    _cache.fromEnum(ArtworkQuarantineField.description).tableFieldConfig,
    _cache.fromEnum(ArtworkQuarantineField.width).tableFieldConfig,
    _cache.fromEnum(ArtworkQuarantineField.height).tableFieldConfig,
    _cache.fromEnum(ArtworkQuarantineField.status).tableFieldConfig,
    _cache.fromEnum(ArtworkQuarantineField.keywords).tableFieldConfig,
    _cache.fromEnum(ArtworkQuarantineField.createProduct).tableFieldConfig,
    _cache.fromEnum(ArtworkQuarantineField.createProductPart).tableFieldConfig,
  ]);

  // ==================== FIELD DEFINITIONS ====================

  static ExtendedField<ArtworkQuarantineField, ElbPrepressLocalizations>
      _createField(
    ArtworkQuarantineField field,
  ) {
    return switch (field) {
      // ========== Meta Fields ==========
      ArtworkQuarantineField.deletedAt => ExtendedFieldImpl.date(
          ArtworkQuarantineField.deletedAt,
          readableFunc: (l10n, ppL10n) => l10n.gen_deleted_at,
          dateValidatorFunc: (l10n, ppL10n) => null,
          filterTypes: DefaultFilterTypes.noFilter,
          excludeFromTable: true,
        ),
      ArtworkQuarantineField.isDraft => ExtendedFieldImpl.boolean(
          ArtworkQuarantineField.isDraft,
          readableFunc: (l10n, ppL10n) => l10n.gen_is_draft,
          validatorFunc: (l10n, ppL10n) => null,
          filterTypes: DefaultFilterTypes.noFilter,
          excludeFromTable: true,
        ),
      ArtworkQuarantineField.createdAt => ExtendedFieldImpl.date(
          ArtworkQuarantineField.createdAt,
          readableFunc: (l10n, ppL10n) => l10n.gen_created_at,
          dateValidatorFunc: (l10n, ppL10n) => null,
          cellWidth: 140,
        ),
      ArtworkQuarantineField.createdBy => ExtendedFieldImpl.text(
          ArtworkQuarantineField.createdBy,
          readableFunc: (l10n, ppL10n) => l10n.gen_created_by,
          validatorFunc: (l10n, ppL10n) => null,
          cellWidth: 200,
        ),
      ArtworkQuarantineField.lastModifiedAt => ExtendedFieldImpl.date(
          ArtworkQuarantineField.lastModifiedAt,
          readableFunc: (l10n, ppL10n) => l10n.gen_last_modified_at,
          dateValidatorFunc: (l10n, ppL10n) => null,
        ),
      ArtworkQuarantineField.lastModifiedBy => ExtendedFieldImpl.assignedUser(
          ArtworkQuarantineField.lastModifiedBy,
          readableFunc: (l10n, ppL10n) => l10n.gen_last_modified_by,
          isMandatory: false,
        ),
      ArtworkQuarantineField.id => const ExtendedFieldImpl.id(
          ArtworkQuarantineField.id,
        ),

      // ========== Entity Fields ==========

      ArtworkQuarantineField.description => ExtendedFieldImpl.text(
          ArtworkQuarantineField.description,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_quarantine_description,
          validatorFunc: (l10n, ppL10n) => null,
          cellWidth: 200,
        ),
      ArtworkQuarantineField.status => ExtendedFieldImpl.selection(
          ArtworkQuarantineField.status,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_quarantine_status,
          isMandatory: false,
          items: (l10n, ppL10n) =>
              ArtworkQuarantineGroupStatus.values.orderedStatus.map((status) {
            return DropdownItem.selection(
              label: status.readable(ppL10n),
              value: status,
              color: status.color,
            );
          }).toList(),
        ),
      ArtworkQuarantineField.keywords => ExtendedFieldImpl.text(
          ArtworkQuarantineField.keywords,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_quarantine_keywords,
          validatorFunc: (l10n, ppL10n) => null,
        ),
      ArtworkQuarantineField.colors => ExtendedFieldImpl.text(
          ArtworkQuarantineField.colors,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_quarantine_colors,
          validatorFunc: (l10n, ppL10n) => null,
        ),
      ArtworkQuarantineField.customer => ExtendedFieldImpl.text(
          ArtworkQuarantineField.customer,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_quarantine_customer,
          validatorFunc: (l10n, ppL10n) => null,
          cellWidth: 200,
        ),
      ArtworkQuarantineField.customerId => ExtendedFieldImpl.number(
          ArtworkQuarantineField.customerId,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_quarantine_customer_id,
          validatorFunc: (l10n, ppL10n) => null,
          keyboardType: TextInputType.number,
          cellWidth: 100,
        ),
      ArtworkQuarantineField.groupStatus => ExtendedFieldImpl.selection(
          ArtworkQuarantineField.groupStatus,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_quarantine_status,
          isMandatory: false,
          items: (l10n, ppL10n) =>
              ArtworkQuarantineGroupStatus.values.orderedStatus.map((status) {
            return DropdownItem.selection(
              label: status.readable(ppL10n),
              value: status,
              color: status.color,
            );
          }).toList(),
        ),
      ArtworkQuarantineField.artwork => ExtendedFieldImpl.text(
          ArtworkQuarantineField.artwork,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_quarantine_singular,
          validatorFunc: (l10n, _) => null,
        ),
      ArtworkQuarantineField.width => ExtendedFieldImpl.number(
          ArtworkQuarantineField.width,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_width,
          validatorFunc: (l10n, ppL10n) => null,
          keyboardType: TextInputType.number,
          cellWidth: 80,
        ),
      ArtworkQuarantineField.height => ExtendedFieldImpl.number(
          ArtworkQuarantineField.height,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_height,
          validatorFunc: (l10n, ppL10n) => null,
          keyboardType: TextInputType.number,
          cellWidth: 80,
        ),
      ArtworkQuarantineField.cornerRadius => ExtendedFieldImpl.number(
          ArtworkQuarantineField.cornerRadius,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_corner_radius,
          validatorFunc: (l10n, ppL10n) => null,
          keyboardType: TextInputType.number,
          cellWidth: 80,
        ),
      ArtworkQuarantineField.printProcessType => ExtendedFieldImpl.textDropdown(
          ArtworkQuarantineField.printProcessType,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_print_process,
          isMandatory: false,
          items: (l10n, ppL10n) =>
              ArtworkPrintProcessType.values.ordered.map((type) {
            return DropdownItem.text(
              value: type,
              label: type.readable(ppL10n),
            );
          }).toList(),
        ),
      ArtworkQuarantineField.productType => ExtendedFieldImpl.textDropdown(
          ArtworkQuarantineField.productType,
          readableFunc: (l10n, ppL10n) => ppL10n.product_type,
          isMandatory: false,
          items: (l10n, ppL10n) => ProductType.values.ordered.map((type) {
            return DropdownItem.text(
              value: type,
              label: type.readable(ppL10n),
            );
          }).toList(),
        ),
      ArtworkQuarantineField.artworkType => ExtendedFieldImpl.textDropdown(
          ArtworkQuarantineField.artworkType,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_type,
          isMandatory: false,
          items: (l10n, ppL10n) => ArtworkType.values.ordered.map((type) {
            return DropdownItem.text(
              value: type,
              label: type.readable(ppL10n),
            );
          }).toList(),
        ),
      ArtworkQuarantineField.createProductPart => ExtendedFieldImpl.text(
          ArtworkQuarantineField.createProductPart,
          readableFunc: (l10n, ppL10n) =>
              l10n.gen_create_entity(ppL10n.product_part_singular),
          validatorFunc: (l10n, ppL10n) => null,
          filterTypes: DefaultFilterTypes.noFilter,
          cellWidth: 200,
        ),
      ArtworkQuarantineField.deleteArtworkQuarantine => ExtendedFieldImpl.text(
          ArtworkQuarantineField.deleteArtworkQuarantine,
          readableFunc: (l10n, ppL10n) => ppL10n.artwork_quarantine_delete,
          validatorFunc: (l10n, _) => null,
          filterTypes: DefaultFilterTypes.noFilter,
        ),
      ArtworkQuarantineField.createProduct => ExtendedFieldImpl.text(
          ArtworkQuarantineField.createProduct,
          readableFunc: (l10n, ppL10n) =>
              l10n.gen_create_entity(ppL10n.product_singular),
          validatorFunc: (l10n, ppL10n) => null,
          filterTypes: DefaultFilterTypes.noFilter,
          cellWidth: 180,
        ),
      ArtworkQuarantineField.productSeriesId => ExtendedFieldImpl.text(
          ArtworkQuarantineField.productSeriesId,
          readableFunc: (l10n, ppL10n) => ppL10n.product_series,
          validatorFunc: (l10n, ppL10n) => null,
          cellWidth: 180,
        ),
    };
  }

  // ==================== DROPDOWN ITEMS ====================

  static Map<ArtworkQuarantineField, List<DropdownItem<dynamic>>>
      buildFilterDropdownItems(
    ElbCoreLocalizations l10n,
    ElbPrepressLocalizations ppL10n,
  ) {
    return _cache.buildFilterDropdownItems(l10n, ppL10n);
  }
}

// ==================== LIST EXTENSIONS ====================

extension ArtworkQuarantineFieldsTableExt on List<ArtworkQuarantineField> {
  Map<ArtworkQuarantineField, TableFieldData> filterableWithLabels(
    ElbCoreLocalizations l10n,
    ElbPrepressLocalizations ppL10n,
  ) {
    return ExtendedFieldListExt<ArtworkQuarantineField,
            ElbPrepressLocalizations>(this)
        .buildFilters(
      coreL10n: l10n,
      customL10n: ppL10n,
      fromEnum: ArtworkQuarantineFields.fromEnum,
    );
  }

  Map<ArtworkQuarantineField, TableColumnData> tableColumnsWithLabels(
    ElbCoreLocalizations l10n,
    ElbPrepressLocalizations ppL10n,
  ) {
    const excludeFields = {
      ArtworkQuarantineField.createProductPart,
      ArtworkQuarantineField.deleteArtworkQuarantine,
      ArtworkQuarantineField.createProduct,
    };
    return ExtendedFieldListExt<ArtworkQuarantineField,
            ElbPrepressLocalizations>(this)
        .buildColumns(
      coreL10n: l10n,
      customL10n: ppL10n,
      fromEnum: ArtworkQuarantineFields.fromEnum,
      excludeFields: excludeFields,
    );
  }
}
