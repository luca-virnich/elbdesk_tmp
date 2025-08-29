import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_sales/l10n/elb_sales_localizations.dart';

/// UNIFIED SoiConsultingField fields with ALL features (forms + tables) in
/// ONE place
/// This replaces SoiConsultingFieldWrapper and SoiConsultingFieldsExt
class SoiConsultingFields {
  SoiConsultingFields._();

  // ==================== FIELD CACHE ====================

  static final _cache = FieldCache<SoiConsultingField, ElbSalesLocalizations>(
    values: SoiConsultingField.values,
    createField: _createField,
  );

  static ExtendedField<SoiConsultingField, ElbSalesLocalizations> fromEnum(
    SoiConsultingField field,
  ) =>
      _cache.fromEnum(field);

  static ExtendedField<SoiConsultingField, ElbSalesLocalizations> fromFieldKey(
    String fieldKey,
  ) =>
      _cache.fromFieldKey(fieldKey);

  // ==================== FIELD DEFINITIONS ====================

  static ExtendedField<SoiConsultingField, ElbSalesLocalizations> _createField(
    SoiConsultingField field,
  ) {
    return switch (field) {
      // ========== Meta Fields ==========
      SoiConsultingField.deletedAt => ExtendedFieldImpl.date(
          SoiConsultingField.deletedAt,
          readableFunc: (l10n, _) => l10n.gen_deleted_at,
          dateValidatorFunc: (l10n, _) => null,
          filterTypes: DefaultFilterTypes.noFilter,
          excludeFromTable: true,
        ),
      SoiConsultingField.isDraft => ExtendedFieldImpl.boolean(
          SoiConsultingField.isDraft,
          readableFunc: (l10n, _) => l10n.gen_is_draft,
          validatorFunc: (l10n, _) => null,
          filterTypes: DefaultFilterTypes.noFilter,
          excludeFromTable: true,
        ),
      SoiConsultingField.createdAt => ExtendedFieldImpl.date(
          SoiConsultingField.createdAt,
          readableFunc: (l10n, _) => l10n.gen_created_at,
          dateValidatorFunc: (l10n, _) => null,
        ),
      SoiConsultingField.createdBy => ExtendedFieldImpl.text(
          SoiConsultingField.createdBy,
          readableFunc: (l10n, _) => l10n.gen_created_by,
          validatorFunc: (l10n, _) => null,
        ),
      SoiConsultingField.lastModifiedAt => ExtendedFieldImpl.date(
          SoiConsultingField.lastModifiedAt,
          readableFunc: (l10n, _) => l10n.gen_last_modified_at,
          dateValidatorFunc: (l10n, _) => null,
        ),
      SoiConsultingField.lastModifiedBy => ExtendedFieldImpl.text(
          SoiConsultingField.lastModifiedBy,
          readableFunc: (l10n, _) => l10n.gen_last_modified_by,
          validatorFunc: (l10n, _) => null,
        ),

      // ========== Entity Fields ==========
      SoiConsultingField.salesOrderItemId => ExtendedFieldImpl.text(
          SoiConsultingField.salesOrderItemId,
          readableFunc: (l10n, salesL10n) =>
              salesL10n.sales_order_item_singular,
          validatorFunc: (l10n, _) => null,
        ),
      SoiConsultingField.assignedUser => ExtendedFieldImpl.assignedUser(
          SoiConsultingField.assignedUser,
          readableFunc: (l10n, salesL10n) =>
              salesL10n.sales_order_item_assigned_user,
          isMandatory: false,
        ),
      SoiConsultingField.billableTime => ExtendedFieldImpl.integer(
          SoiConsultingField.billableTime,
          readableFunc: (l10n, salesL10n) =>
              salesL10n.sales_order_item_planned_time,
          validatorFunc: (l10n, _) => null,
        ),
      SoiConsultingField.description => ExtendedFieldImpl.text(
          SoiConsultingField.description,
          readableFunc: (l10n, _) => l10n.gen_description,
          validatorFunc: (l10n, _) => null,
          cellWidth: 200,
        ),
      SoiConsultingField.salesOrderId => ExtendedFieldImpl.text(
          SoiConsultingField.salesOrderId,
          readableFunc: (l10n, salesL10n) => salesL10n.sales_order_singular,
          validatorFunc: (l10n, _) => null,
        ),
    };
  }

  // ==================== DROPDOWN ITEMS ====================

  Map<SoiConsultingField, List<DropdownItem<dynamic>>> buildFilterDropdownItems(
    ElbCoreLocalizations l10n,
    ElbSalesLocalizations salesL10n,
  ) {
    return _cache.buildFilterDropdownItems(l10n, salesL10n);
  }
}

// ==================== LIST EXTENSIONS ====================

extension SoiConsultingFieldsTableExt on List<SoiConsultingField> {
  Map<SoiConsultingField, TableFieldData> filters(
    ElbCoreLocalizations l10n,
    ElbSalesLocalizations salesL10n,
  ) {
    return ExtendedFieldListExt<SoiConsultingField, ElbSalesLocalizations>(
      this,
    ).buildFilters(
      coreL10n: l10n,
      customL10n: salesL10n,
      fromEnum: SoiConsultingFields.fromEnum,
    );
  }

  Map<SoiConsultingField, TableColumnData> columns(
    ElbCoreLocalizations l10n,
    ElbSalesLocalizations salesL10n,
  ) {
    return ExtendedFieldListExt<SoiConsultingField, ElbSalesLocalizations>(
      this,
    ).buildColumns(
      coreL10n: l10n,
      customL10n: salesL10n,
      fromEnum: SoiConsultingFields.fromEnum,
    );
  }
}
