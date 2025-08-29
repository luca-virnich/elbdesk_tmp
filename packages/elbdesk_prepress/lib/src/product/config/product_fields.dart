import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/l10n/elb_prepress_localizations.dart';
import 'package:elbdesk_prepress/src/artwork/extensions/artwork_print_process_type_ext.dart';
import 'package:elbdesk_prepress/src/product/extensions/product_type_extension.dart';

/// UNIFIED ProductField fields with ALL features (forms + tables) in ONE place
/// This replaces ProductFieldWrapper and ProductFieldExt
class ProductFields {
  ProductFields._();

  // ==================== FIELD CACHE ====================

  static final _cache = FieldCache<ProductField, ElbPrepressLocalizations>(
    values: ProductField.values,
    createField: _createField,
  );

  static ExtendedField<ProductField, ElbPrepressLocalizations> fromEnum(
    ProductField field,
  ) =>
      _cache.fromEnum(field);

  static ExtendedField<ProductField, ElbPrepressLocalizations> fromFieldKey(
    String fieldKey,
  ) =>
      _cache.fromFieldKey(fieldKey);

  static final List<TableFieldConfig> defaultTableColumns = List.unmodifiable([
    _cache.fromEnum(ProductField.serienIdString).tableFieldConfig,
    _cache.fromEnum(ProductField.artworks).tableFieldConfig,
    _cache.fromEnum(ProductField.keywords).tableFieldConfig,
    _cache.fromEnum(ProductField.description).tableFieldConfig,
  ]);

  // ==================== FIELD DEFINITIONS ====================

  static ExtendedField<ProductField, ElbPrepressLocalizations> _createField(
    ProductField field,
  ) {
    return switch (field) {
      // ========== Meta Fields ==========
      ProductField.deletedAt => ExtendedFieldImpl.date(
          ProductField.deletedAt,
          readableFunc: (l10n, _) => l10n.gen_deleted_at,
          dateValidatorFunc: (l10n, _) => null,
          filterTypes: DefaultFilterTypes.noFilter,
          excludeFromTable: true,
        ),
      ProductField.isDraft => ExtendedFieldImpl.boolean(
          ProductField.isDraft,
          readableFunc: (l10n, _) => l10n.gen_is_draft,
          validatorFunc: (l10n, _) => null,
          filterTypes: DefaultFilterTypes.noFilter,
          excludeFromTable: true,
        ),
      ProductField.createdAt => ExtendedFieldImpl.date(
          ProductField.createdAt,
          readableFunc: (l10n, _) => l10n.gen_created_at,
          dateValidatorFunc: (l10n, _) => null,
        ),
      ProductField.createdBy => ExtendedFieldImpl.assignedUser(
          ProductField.createdBy,
          readableFunc: (l10n, _) => l10n.gen_created_by,
          filterTypes: [FilterType.equal],
          isMandatory: false,
        ),
      ProductField.lastModifiedAt => ExtendedFieldImpl.date(
          ProductField.lastModifiedAt,
          readableFunc: (l10n, _) => l10n.gen_last_modified_at,
          dateValidatorFunc: (l10n, _) => null,
        ),
      ProductField.lastModifiedBy => ExtendedFieldImpl.assignedUser(
          ProductField.lastModifiedBy,
          readableFunc: (l10n, _) => l10n.gen_last_modified_by,
          filterTypes: [FilterType.equal],
          isMandatory: false,
        ),
      ProductField.id => const ExtendedFieldImpl.id(
          ProductField.id,
        ),

      // ========== Entity Fields ==========

      ProductField.productType => ExtendedFieldImpl.textDropdown(
          ProductField.productType,
          readableFunc: (l10n, ppL10n) => ppL10n.product_type,
          isMandatory: true,
          items: (l10n, ppL10n) => ProductType.values
              .map(
                (e) => DropdownItem.text(value: e, label: e.readable(ppL10n)),
              )
              .toList(),
        ),
      ProductField.keywords => ExtendedFieldImpl.text(
          ProductField.keywords,
          readableFunc: (l10n, ppl10n) => ppl10n.product_keywords,
          validatorFunc: (l10n, _) => null,
          cellWidth: 250,
        ),
      ProductField.serienIdString => ExtendedFieldImpl.text(
          ProductField.serienIdString,
          readableFunc: (l10n, ppL10n) => ppL10n.product_series,
          validatorFunc: (l10n, _) => null,
          cellWidth: 200,
        ),
      ProductField.description => ExtendedFieldImpl.text(
          ProductField.description,
          readableFunc: (l10n, ppL10n) => ppL10n.product_description,
          validatorFunc: (l10n, _) => null,
          cellWidth: 250,
        ),
      ProductField.serienId => ExtendedFieldImpl.integer(
          ProductField.serienId,
          readableFunc: (l10n, ppL10n) => ppL10n.product_serial_number,
          validatorFunc: (l10n, _) => null,
        ),
      ProductField.serienIndex => ExtendedFieldImpl.text(
          ProductField.serienIndex,
          readableFunc: (l10n, ppL10n) => ppL10n.product_index_number,
          validatorFunc: (l10n, _) => null,
        ),
      ProductField.productMaster => ExtendedFieldImpl.text(
          ProductField.productMaster,
          readableFunc: (l10n, ppL10n) => ppL10n.product_master_singular,
          validatorFunc: (l10n, _) => null,
        ),
      ProductField.productId => ExtendedFieldImpl.text(
          ProductField.productId,
          readableFunc: (l10n, ppL10n) => ppL10n.product_id,
          validatorFunc: (l10n, _) => null,
        ),
      ProductField.productPartId => ExtendedFieldImpl.text(
          ProductField.productPartId,
          readableFunc: (l10n, ppL10n) => ppL10n.product_part_id,
          validatorFunc: (l10n, _) => null,
        ),
      ProductField.artworks => ExtendedFieldImpl.text(
          ProductField.artworks,
          readableFunc: (l10n, ppL10n) => ppL10n.artworks,
          validatorFunc: (l10n, _) => null,
          cellWidth: 80,
        ),
      ProductField.salesOrder => ExtendedFieldImpl.text(
          ProductField.salesOrder,
          readableFunc: (l10n, ppL10n) => ppL10n.sales_sales_order_singular,
          validatorFunc: (l10n, _) => null,
        ),
      ProductField.customer => ExtendedFieldImpl.text(
          ProductField.customer,
          readableFunc: (l10n, ppL10n) => ppL10n.customer,
          validatorFunc: (l10n, _) => null,
        ),
      ProductField.customerReference => ExtendedFieldImpl.text(
          ProductField.customerReference,
          readableFunc: (l10n, ppL10n) => ppL10n.product_customer_ref,
          validatorFunc: (l10n, _) => null,
        ),
      ProductField.printProcessType => ExtendedFieldImpl.textDropdown(
          ProductField.printProcessType,
          readableFunc: (l10n, ppL10n) => ppL10n.main_print_process,
          isMandatory: true,
          items: (l10n, ppL10n) => ArtworkPrintProcessType.values
              .map(
                (e) => DropdownItem.text(
                  value: e,
                  label: e.readable(ppL10n),
                ),
              )
              .toList(),
        ),
    };
  }

  // ==================== DROPDOWN ITEMS ====================

  static Map<ProductField, List<DropdownItem<dynamic>>>
      buildFilterDropdownItems(
    ElbCoreLocalizations l10n,
    ElbPrepressLocalizations ppL10n,
  ) {
    return _cache.buildFilterDropdownItems(l10n, ppL10n);
  }
}
// ==================== LIST EXTENSIONS ====================

extension ProductFieldsTableExt on List<ProductField> {
  Map<ProductField, TableFieldData> filters(
    ElbCoreLocalizations l10n,
    ElbPrepressLocalizations ppL10n,
  ) {
    return ExtendedFieldListExt<ProductField, ElbPrepressLocalizations>(this)
        .buildFilters(
      coreL10n: l10n,
      customL10n: ppL10n,
      fromEnum: ProductFields.fromEnum,
    );
  }

  Map<ProductField, TableColumnData> columns(
    ElbCoreLocalizations l10n,
    ElbPrepressLocalizations ppL10n,
  ) {
    return ExtendedFieldListExt<ProductField, ElbPrepressLocalizations>(this)
        .buildColumns(
      coreL10n: l10n,
      customL10n: ppL10n,
      fromEnum: ProductFields.fromEnum,
    );
  }

  /// Returns a map of quick search filter fields
  Map<ProductField, TableFieldData> quickSearchFilters(
    ElbCoreLocalizations l10n,
    ElbPrepressLocalizations ppL10n,
  ) {
    const fields = [
      ProductField.serienIdString,
      ProductField.keywords,
      ProductField.description,
    ];
    return ExtendedFieldListExt<ProductField, ElbPrepressLocalizations>(fields)
        .buildFilters(
      coreL10n: l10n,
      customL10n: ppL10n,
      fromEnum: ProductFields.fromEnum,
    );
  }
}
