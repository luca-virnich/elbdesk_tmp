import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_sales/l10n/elb_sales_localizations.dart';
import 'package:elbdesk_sales/src/soi_step_and_repeat/extensions/soi_step_and_repeat_status_ext.dart';

/// UNIFIED SoiStepAndRepeatField fields with ALL features (forms + tables)
/// in ONE place
/// This replaces SoiStepAndRepeatFieldWrapper and SoiStepAndRepeatFieldsExt
class SoiStepAndRepeatFields {
  SoiStepAndRepeatFields._();

  // ==================== FIELD CACHE ====================

  static final _cache =
      FieldCache<SoiStepAndRepeatField, ElbSalesLocalizations>(
    values: SoiStepAndRepeatField.values,
    createField: _createField,
  );

  static ExtendedField<SoiStepAndRepeatField, ElbSalesLocalizations> fromEnum(
    SoiStepAndRepeatField field,
  ) =>
      _cache.fromEnum(field);

  static ExtendedField<SoiStepAndRepeatField, ElbSalesLocalizations>
      fromFieldKey(
    String fieldKey,
  ) =>
          _cache.fromFieldKey(fieldKey);

  // ==================== TABLE CONFIGURATIONS ====================

  static final List<TableFieldConfig> defaultColumns = List.unmodifiable([
    _cache.fromEnum(SoiStepAndRepeatField.soiId).tableFieldConfig,
    _cache.fromEnum(SoiStepAndRepeatField.description).tableFieldConfig,
    _cache.fromEnum(SoiStepAndRepeatField.status).tableFieldConfig,
    _cache.fromEnum(SoiStepAndRepeatField.artworks).tableFieldConfig,
    _cache.fromEnum(SoiStepAndRepeatField.salesOrder).tableFieldConfig,
  ]);

  // ==================== FIELD DEFINITIONS ====================

  static ExtendedField<SoiStepAndRepeatField, ElbSalesLocalizations>
      _createField(
    SoiStepAndRepeatField field,
  ) {
    return switch (field) {
      // ========== Meta Fields ==========
      SoiStepAndRepeatField.deletedAt => ExtendedFieldImpl.date(
          SoiStepAndRepeatField.deletedAt,
          readableFunc: (l10n, _) => l10n.gen_deleted_at,
          dateValidatorFunc: (l10n, _) => null,
          filterTypes: DefaultFilterTypes.noFilter,
          excludeFromTable: true,
        ),
      SoiStepAndRepeatField.isDraft => ExtendedFieldImpl.boolean(
          SoiStepAndRepeatField.isDraft,
          readableFunc: (l10n, _) => l10n.gen_is_draft,
          validatorFunc: (l10n, _) => null,
          filterTypes: DefaultFilterTypes.noFilter,
          excludeFromTable: true,
        ),
      SoiStepAndRepeatField.createdAt => ExtendedFieldImpl.date(
          SoiStepAndRepeatField.createdAt,
          readableFunc: (l10n, _) => l10n.gen_created_at,
          dateValidatorFunc: (l10n, _) => null,
        ),
      SoiStepAndRepeatField.createdBy => ExtendedFieldImpl.text(
          SoiStepAndRepeatField.createdBy,
          readableFunc: (l10n, _) => l10n.gen_created_by,
          validatorFunc: (l10n, _) => null,
        ),
      SoiStepAndRepeatField.lastModifiedAt => ExtendedFieldImpl.date(
          SoiStepAndRepeatField.lastModifiedAt,
          readableFunc: (l10n, _) => l10n.gen_last_modified_at,
          dateValidatorFunc: (l10n, _) => null,
        ),
      SoiStepAndRepeatField.lastModifiedBy => ExtendedFieldImpl.text(
          SoiStepAndRepeatField.lastModifiedBy,
          readableFunc: (l10n, _) => l10n.gen_last_modified_by,
          validatorFunc: (l10n, _) => null,
        ),

      // ========== Entity Fields ==========
      SoiStepAndRepeatField.soiId => ExtendedFieldImpl.text(
          SoiStepAndRepeatField.soiId,
          readableFunc: (l10n, salesL10n) =>
              salesL10n.sales_step_and_repeat_soi_id,
          validatorFunc: (l10n, _) => null,
          cellWidth: 100,
        ),
      SoiStepAndRepeatField.artworks => ExtendedFieldImpl.text(
          SoiStepAndRepeatField.artworks,
          readableFunc: (l10n, salesL10n) => salesL10n.prepress_artwork_plural,
          validatorFunc: (l10n, _) => null,
        ),
      SoiStepAndRepeatField.description => ExtendedFieldImpl.text(
          SoiStepAndRepeatField.description,
          readableFunc: (l10n, _) => l10n.gen_description,
          validatorFunc: (l10n, _) => null,
        ),
      SoiStepAndRepeatField.status => ExtendedFieldImpl.selection(
          SoiStepAndRepeatField.status,
          readableFunc: (l10n, salesL10n) =>
              salesL10n.sales_step_and_repeat_status,
          items: (l10n, salesL10n) => SoiStepAndRepeatStatus.values
              .map(
                (status) => DropdownItem.selection(
                  value: status,
                  color: status.color,
                  label: status.readable(l10n, salesL10n),
                ),
              )
              .toList(),
          // TODO(all): Is this mandatory?
          isMandatory: true,
        ),
      SoiStepAndRepeatField.salesOrder => ExtendedFieldImpl.text(
          SoiStepAndRepeatField.salesOrder,
          readableFunc: (l10n, salesL10n) => salesL10n.sales_order_singular,
          validatorFunc: (l10n, _) => null,
        ),
    };
  }

  // ==================== DROPDOWN ITEMS ====================

  static Map<SoiStepAndRepeatField, List<DropdownItem<dynamic>>>
      buildFilterDropdownItems(
    ElbCoreLocalizations l10n,
    ElbSalesLocalizations salesL10n,
  ) {
    return _cache.buildFilterDropdownItems(l10n, salesL10n);
  }
}

// ==================== LIST EXTENSIONS ====================

extension SoiStepAndRepeatFieldsTableExt on List<SoiStepAndRepeatField> {
  Map<SoiStepAndRepeatField, TableFieldData> filters(
    ElbCoreLocalizations l10n,
    ElbSalesLocalizations salesL10n,
  ) {
    return ExtendedFieldListExt<SoiStepAndRepeatField, ElbSalesLocalizations>(
      this,
    ).buildFilters(
      coreL10n: l10n,
      customL10n: salesL10n,
      fromEnum: SoiStepAndRepeatFields.fromEnum,
    );
  }

  Map<SoiStepAndRepeatField, TableColumnData> columns(
    ElbCoreLocalizations l10n,
    ElbSalesLocalizations salesL10n,
  ) {
    return ExtendedFieldListExt<SoiStepAndRepeatField, ElbSalesLocalizations>(
      this,
    ).buildColumns(
      coreL10n: l10n,
      customL10n: salesL10n,
      fromEnum: SoiStepAndRepeatFields.fromEnum,
    );
  }
}
