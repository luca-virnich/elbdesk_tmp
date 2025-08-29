import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_sales/l10n/elb_sales_localizations.dart';

/// UNIFIED SoiPrepareArtworkField fields with ALL features (forms + tables)
/// in ONE place
/// This replaces SoiPrepareArtworkFieldWrapper and SoiPrepareArtworkFieldsExt
class SoiPrepareArtworkFields {
  SoiPrepareArtworkFields._();

  // ==================== FIELD CACHE ====================

  static final _cache =
      FieldCache<SoiPrepareArtworkField, ElbSalesLocalizations>(
    values: SoiPrepareArtworkField.values,
    createField: _createField,
  );

  static ExtendedField<SoiPrepareArtworkField, ElbSalesLocalizations> fromEnum(
    SoiPrepareArtworkField field,
  ) =>
      _cache.fromEnum(field);

  static ExtendedField<SoiPrepareArtworkField, ElbSalesLocalizations>
      fromFieldKey(
    String fieldKey,
  ) =>
          _cache.fromFieldKey(fieldKey);

  static final List<TableFieldConfig> defaultColumns = List.unmodifiable([
    _cache.fromEnum(SoiPrepareArtworkField.salesOrderItemId).tableFieldConfig,
    _cache.fromEnum(SoiPrepareArtworkField.artworkId).tableFieldConfig,
    _cache.fromEnum(SoiPrepareArtworkField.description).tableFieldConfig,
    _cache.fromEnum(SoiPrepareArtworkField.assignedUser).tableFieldConfig,
    _cache.fromEnum(SoiPrepareArtworkField.salesOrderId).tableFieldConfig,
  ]);

  // ==================== FIELD DEFINITIONS ====================

  static ExtendedField<SoiPrepareArtworkField, ElbSalesLocalizations>
      _createField(
    SoiPrepareArtworkField field,
  ) {
    return switch (field) {
      // ========== Meta Fields ==========
      SoiPrepareArtworkField.deletedAt => ExtendedFieldImpl.date(
          SoiPrepareArtworkField.deletedAt,
          readableFunc: (l10n, _) => l10n.gen_deleted_at,
          dateValidatorFunc: (l10n, _) => null,
          filterTypes: DefaultFilterTypes.noFilter,
          excludeFromTable: true,
        ),
      SoiPrepareArtworkField.isDraft => ExtendedFieldImpl.boolean(
          SoiPrepareArtworkField.isDraft,
          readableFunc: (l10n, _) => l10n.gen_is_draft,
          validatorFunc: (l10n, _) => null,
          filterTypes: DefaultFilterTypes.noFilter,
          excludeFromTable: true,
        ),
      SoiPrepareArtworkField.createdAt => ExtendedFieldImpl.date(
          SoiPrepareArtworkField.createdAt,
          readableFunc: (l10n, _) => l10n.gen_created_at,
          dateValidatorFunc: (l10n, _) => null,
        ),
      SoiPrepareArtworkField.createdBy => ExtendedFieldImpl.text(
          SoiPrepareArtworkField.createdBy,
          readableFunc: (l10n, _) => l10n.gen_created_by,
          validatorFunc: (l10n, _) => null,
        ),
      SoiPrepareArtworkField.lastModifiedAt => ExtendedFieldImpl.date(
          SoiPrepareArtworkField.lastModifiedAt,
          readableFunc: (l10n, _) => l10n.gen_last_modified_at,
          dateValidatorFunc: (l10n, _) => null,
        ),
      SoiPrepareArtworkField.lastModifiedBy => ExtendedFieldImpl.text(
          SoiPrepareArtworkField.lastModifiedBy,
          readableFunc: (l10n, _) => l10n.gen_last_modified_by,
          validatorFunc: (l10n, _) => null,
        ),

      // ========== Entity Fields ==========
      SoiPrepareArtworkField.salesOrderItemId => ExtendedFieldImpl.text(
          SoiPrepareArtworkField.salesOrderItemId,
          readableFunc: (l10n, salesL10n) =>
              salesL10n.sales_order_item_singular,
          validatorFunc: (l10n, _) => null,
          cellWidth: 100,
        ),
      SoiPrepareArtworkField.assignedUser => ExtendedFieldImpl.assignedUser(
          SoiPrepareArtworkField.assignedUser,
          readableFunc: (l10n, salesL10n) =>
              salesL10n.sales_order_item_assigned_user,
          isMandatory: false,
        ),
      SoiPrepareArtworkField.billableTime => ExtendedFieldImpl.integer(
          SoiPrepareArtworkField.billableTime,
          readableFunc: (l10n, salesL10n) =>
              salesL10n.sales_order_item_planned_time,
          validatorFunc: (l10n, _) => null,
        ),
      SoiPrepareArtworkField.artworkId => ExtendedFieldImpl.text(
          SoiPrepareArtworkField.artworkId,
          readableFunc: (l10n, salesL10n) =>
              salesL10n.prepress_artwork_singular,
          validatorFunc: (l10n, _) => null,
        ),
      SoiPrepareArtworkField.description => ExtendedFieldImpl.text(
          SoiPrepareArtworkField.description,
          readableFunc: (l10n, _) => l10n.gen_description,
          validatorFunc: (l10n, _) => null,
        ),
      SoiPrepareArtworkField.salesOrderId => ExtendedFieldImpl.text(
          SoiPrepareArtworkField.salesOrderId,
          readableFunc: (l10n, salesL10n) => salesL10n.sales_order_singular,
          validatorFunc: (l10n, _) => null,
        ),
    };
  }
}

// ==================== LIST EXTENSIONS ====================

extension SoiPrepareArtworkFieldsTableExt on List<SoiPrepareArtworkField> {
  Map<SoiPrepareArtworkField, TableFieldData> filters(
    ElbCoreLocalizations l10n,
    ElbSalesLocalizations salesL10n,
  ) {
    return ExtendedFieldListExt<SoiPrepareArtworkField, ElbSalesLocalizations>(
      this,
    ).buildFilters(
      coreL10n: l10n,
      customL10n: salesL10n,
      fromEnum: SoiPrepareArtworkFields.fromEnum,
    );
  }

  Map<SoiPrepareArtworkField, TableColumnData> columns(
    ElbCoreLocalizations l10n,
    ElbSalesLocalizations salesL10n,
  ) {
    return ExtendedFieldListExt<SoiPrepareArtworkField, ElbSalesLocalizations>(
      this,
    ).buildColumns(
      coreL10n: l10n,
      customL10n: salesL10n,
      fromEnum: SoiPrepareArtworkFields.fromEnum,
    );
  }
}
