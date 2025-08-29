import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_sales/l10n/elb_sales_localizations.dart';

/// UNIFIED SoiEinzelformaufbauField fields with ALL features (forms + tables)
/// in ONE place
/// This replaces SoiEinzelformaufbauFieldWrapper and
/// SoiEinzelformaufbauFieldsExt
class SoiEinzelformaufbauFields {
  SoiEinzelformaufbauFields._();

  // ==================== FIELD CACHE ====================

  static final _cache =
      FieldCache<SoiEinzelformaufbauField, ElbSalesLocalizations>(
    values: SoiEinzelformaufbauField.values,
    createField: _createField,
  );

  static ExtendedField<SoiEinzelformaufbauField, ElbSalesLocalizations>
      fromEnum(
    SoiEinzelformaufbauField field,
  ) =>
          _cache.fromEnum(field);

  static ExtendedField<SoiEinzelformaufbauField, ElbSalesLocalizations>
      fromFieldKey(
    String fieldKey,
  ) =>
          _cache.fromFieldKey(fieldKey);

  // ==================== FIELD DEFINITIONS ====================

  static ExtendedField<SoiEinzelformaufbauField, ElbSalesLocalizations>
      _createField(
    SoiEinzelformaufbauField field,
  ) {
    return switch (field) {
      // ========== Meta Fields ==========
      SoiEinzelformaufbauField.deletedAt => ExtendedFieldImpl.date(
          SoiEinzelformaufbauField.deletedAt,
          readableFunc: (l10n, _) => l10n.gen_deleted_at,
          dateValidatorFunc: (l10n, _) => null,
          filterTypes: DefaultFilterTypes.noFilter,
          excludeFromTable: true,
        ),
      SoiEinzelformaufbauField.isDraft => ExtendedFieldImpl.boolean(
          SoiEinzelformaufbauField.isDraft,
          readableFunc: (l10n, _) => l10n.gen_is_draft,
          validatorFunc: (l10n, _) => null,
          filterTypes: DefaultFilterTypes.noFilter,
          excludeFromTable: true,
        ),
      SoiEinzelformaufbauField.createdAt => ExtendedFieldImpl.date(
          SoiEinzelformaufbauField.createdAt,
          readableFunc: (l10n, _) => l10n.gen_created_at,
          dateValidatorFunc: (l10n, _) => null,
        ),
      SoiEinzelformaufbauField.createdBy => ExtendedFieldImpl.text(
          SoiEinzelformaufbauField.createdBy,
          readableFunc: (l10n, _) => l10n.gen_created_by,
          validatorFunc: (l10n, _) => null,
        ),
      SoiEinzelformaufbauField.lastModifiedAt => ExtendedFieldImpl.date(
          SoiEinzelformaufbauField.lastModifiedAt,
          readableFunc: (l10n, _) => l10n.gen_last_modified_at,
          dateValidatorFunc: (l10n, _) => null,
        ),
      SoiEinzelformaufbauField.lastModifiedBy => ExtendedFieldImpl.text(
          SoiEinzelformaufbauField.lastModifiedBy,
          readableFunc: (l10n, _) => l10n.gen_last_modified_by,
          validatorFunc: (l10n, _) => null,
        ),

      // ========== Entity Fields ==========
      SoiEinzelformaufbauField.salesOrderItemId => ExtendedFieldImpl.text(
          SoiEinzelformaufbauField.salesOrderItemId,
          readableFunc: (l10n, salesL10n) =>
              salesL10n.sales_order_item_singular,
          validatorFunc: (l10n, _) => null,
        ),
      SoiEinzelformaufbauField.assignedUser => ExtendedFieldImpl.assignedUser(
          SoiEinzelformaufbauField.assignedUser,
          readableFunc: (l10n, salesL10n) =>
              salesL10n.sales_order_item_assigned_user,
          isMandatory: false,
        ),
      SoiEinzelformaufbauField.billableTime => ExtendedFieldImpl.integer(
          SoiEinzelformaufbauField.billableTime,
          readableFunc: (l10n, salesL10n) =>
              salesL10n.sales_order_item_planned_time,
          validatorFunc: (l10n, _) => null,
        ),
      SoiEinzelformaufbauField.artworkId => ExtendedFieldImpl.text(
          SoiEinzelformaufbauField.artworkId,
          readableFunc: (l10n, salesL10n) =>
              salesL10n.prepress_artwork_singular,
          validatorFunc: (l10n, _) => null,
        ),
      SoiEinzelformaufbauField.description => ExtendedFieldImpl.text(
          SoiEinzelformaufbauField.description,
          readableFunc: (l10n, _) => l10n.gen_description,
          validatorFunc: (l10n, _) => null,
        ),
      SoiEinzelformaufbauField.salesOrderId => ExtendedFieldImpl.text(
          SoiEinzelformaufbauField.salesOrderId,
          readableFunc: (l10n, salesL10n) => salesL10n.sales_order_singular,
          validatorFunc: (l10n, _) => null,
        ),
      SoiEinzelformaufbauField.version => ExtendedFieldImpl.integer(
          SoiEinzelformaufbauField.version,
          readableFunc: (l10n, salesL10n) =>
              salesL10n.soi_einzelformaufbau_version,
          validatorFunc: (l10n, _) => null,
        ),
    };
  }
}

// ==================== LIST EXTENSIONS ====================

extension SoiEinzelformaufbauFieldsTableExt on List<SoiEinzelformaufbauField> {
  Map<SoiEinzelformaufbauField, TableFieldData> filters(
    ElbCoreLocalizations l10n,
    ElbSalesLocalizations salesL10n,
  ) {
    return ExtendedFieldListExt<SoiEinzelformaufbauField,
        ElbSalesLocalizations>(
      this,
    ).buildFilters(
      coreL10n: l10n,
      customL10n: salesL10n,
      fromEnum: SoiEinzelformaufbauFields.fromEnum,
    );
  }

  Map<SoiEinzelformaufbauField, TableColumnData> columns(
    ElbCoreLocalizations l10n,
    ElbSalesLocalizations salesL10n,
  ) {
    return ExtendedFieldListExt<SoiEinzelformaufbauField,
        ElbSalesLocalizations>(
      this,
    ).buildColumns(
      coreL10n: l10n,
      customL10n: salesL10n,
      fromEnum: SoiEinzelformaufbauFields.fromEnum,
    );
  }
}
