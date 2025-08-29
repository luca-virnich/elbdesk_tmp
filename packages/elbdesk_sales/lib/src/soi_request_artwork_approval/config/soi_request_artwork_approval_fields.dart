import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_sales/l10n/elb_sales_localizations.dart';
import 'package:elbdesk_sales/src/soi_request_artwork_approval/extensions/soi_request_artwork_approval_type_ext.dart';

/// UNIFIED SoiRequestArtworkApprovalField fields with ALL features
/// (forms + tables)
/// in ONE place
/// This replaces SoiRequestArtworkApprovalFieldWrapper and
/// SoiRequestArtworkApprovalFieldsExt
class SoiRequestArtworkApprovalFields {
  SoiRequestArtworkApprovalFields._();

  // ==================== FIELD CACHE ====================

  static final _cache =
      FieldCache<SoiRequestArtworkApprovalField, ElbSalesLocalizations>(
    values: SoiRequestArtworkApprovalField.values,
    createField: _createField,
  );

  static ExtendedField<SoiRequestArtworkApprovalField, ElbSalesLocalizations>
      fromEnum(
    SoiRequestArtworkApprovalField field,
  ) =>
          _cache.fromEnum(field);

  static ExtendedField<SoiRequestArtworkApprovalField, ElbSalesLocalizations>
      fromFieldKey(
    String fieldKey,
  ) =>
          _cache.fromFieldKey(fieldKey);

  // ==================== FIELD DEFINITIONS ====================

  static ExtendedField<SoiRequestArtworkApprovalField, ElbSalesLocalizations>
      _createField(
    SoiRequestArtworkApprovalField field,
  ) {
    return switch (field) {
      // ========== Meta Fields ==========
      SoiRequestArtworkApprovalField.deletedAt => ExtendedFieldImpl.date(
          SoiRequestArtworkApprovalField.deletedAt,
          readableFunc: (l10n, _) => l10n.gen_deleted_at,
          dateValidatorFunc: (l10n, _) => null,
          filterTypes: DefaultFilterTypes.noFilter,
          excludeFromTable: true,
        ),
      SoiRequestArtworkApprovalField.isDraft => ExtendedFieldImpl.boolean(
          SoiRequestArtworkApprovalField.isDraft,
          readableFunc: (l10n, _) => l10n.gen_is_draft,
          validatorFunc: (l10n, _) => null,
          filterTypes: DefaultFilterTypes.noFilter,
          excludeFromTable: true,
        ),
      SoiRequestArtworkApprovalField.createdAt => ExtendedFieldImpl.date(
          SoiRequestArtworkApprovalField.createdAt,
          readableFunc: (l10n, _) => l10n.gen_created_at,
          dateValidatorFunc: (l10n, _) => null,
        ),
      SoiRequestArtworkApprovalField.createdBy => ExtendedFieldImpl.text(
          SoiRequestArtworkApprovalField.createdBy,
          readableFunc: (l10n, _) => l10n.gen_created_by,
          validatorFunc: (l10n, _) => null,
        ),
      SoiRequestArtworkApprovalField.lastModifiedAt => ExtendedFieldImpl.date(
          SoiRequestArtworkApprovalField.lastModifiedAt,
          readableFunc: (l10n, _) => l10n.gen_last_modified_at,
          dateValidatorFunc: (l10n, _) => null,
        ),
      SoiRequestArtworkApprovalField.lastModifiedBy => ExtendedFieldImpl.text(
          SoiRequestArtworkApprovalField.lastModifiedBy,
          readableFunc: (l10n, _) => l10n.gen_last_modified_by,
          validatorFunc: (l10n, _) => null,
        ),

      // ========== Entity Fields ==========
      SoiRequestArtworkApprovalField.salesOrderItemId => ExtendedFieldImpl.text(
          SoiRequestArtworkApprovalField.salesOrderItemId,
          readableFunc: (l10n, salesL10n) =>
              salesL10n.sales_order_item_singular,
          validatorFunc: (l10n, _) => null,
        ),
      SoiRequestArtworkApprovalField.assignedUser =>
        ExtendedFieldImpl.assignedUser(
          SoiRequestArtworkApprovalField.assignedUser,
          readableFunc: (l10n, salesL10n) =>
              salesL10n.sales_order_item_assigned_user,
          isMandatory: false,
        ),
      SoiRequestArtworkApprovalField.billableTime => ExtendedFieldImpl.integer(
          SoiRequestArtworkApprovalField.billableTime,
          readableFunc: (l10n, salesL10n) =>
              salesL10n.sales_order_item_planned_time,
          validatorFunc: (l10n, _) => null,
        ),
      SoiRequestArtworkApprovalField.artworkId => ExtendedFieldImpl.text(
          SoiRequestArtworkApprovalField.artworkId,
          readableFunc: (l10n, salesL10n) =>
              salesL10n.prepress_artwork_singular,
          validatorFunc: (l10n, _) => null,
        ),
      SoiRequestArtworkApprovalField.description => ExtendedFieldImpl.text(
          SoiRequestArtworkApprovalField.description,
          readableFunc: (l10n, _) => l10n.gen_description,
          validatorFunc: (l10n, _) => null,
        ),
      SoiRequestArtworkApprovalField.salesOrderId => ExtendedFieldImpl.text(
          SoiRequestArtworkApprovalField.salesOrderId,
          readableFunc: (l10n, salesL10n) => salesL10n.sales_order_singular,
          validatorFunc: (l10n, _) => null,
        ),
      SoiRequestArtworkApprovalField.approvalType =>
        ExtendedFieldImpl.selection(
          SoiRequestArtworkApprovalField.approvalType,
          readableFunc: (l10n, salesL10n) =>
              salesL10n.prepress_artwork_approval_type,
          isMandatory: false,
          items: (l10n, salesL10n) => SoiRequestArtworkApprovalType.values
              .map(
                (type) => DropdownItem.selection(
                  value: type,
                  color: type.color,
                  label: type.readable(l10n, salesL10n),
                ),
              )
              .toList(),
        ),
    };
  }

  // ==================== DROPDOWN HELPERS ====================

  /// Build filter dropdown items for all fields with items
  /// Delegates to cache which converts selection items to text-only
  static Map<SoiRequestArtworkApprovalField, List<DropdownItem<dynamic>>>
      buildFilterDropdownItems(
    ElbCoreLocalizations l10n,
    ElbSalesLocalizations salesL10n,
  ) {
    return _cache.buildFilterDropdownItems(l10n, salesL10n);
  }
}

// ==================== LIST EXTENSIONS ====================

extension SoiRequestArtworkApprovalFieldsTableExt
    on List<SoiRequestArtworkApprovalField> {
  Map<SoiRequestArtworkApprovalField, TableFieldData> filters(
    ElbCoreLocalizations l10n,
    ElbSalesLocalizations salesL10n,
  ) {
    return ExtendedFieldListExt<SoiRequestArtworkApprovalField,
        ElbSalesLocalizations>(
      this,
    ).buildFilters(
      coreL10n: l10n,
      customL10n: salesL10n,
      fromEnum: SoiRequestArtworkApprovalFields.fromEnum,
    );
  }

  Map<SoiRequestArtworkApprovalField, TableColumnData> columns(
    ElbCoreLocalizations l10n,
    ElbSalesLocalizations salesL10n,
  ) {
    return ExtendedFieldListExt<SoiRequestArtworkApprovalField,
        ElbSalesLocalizations>(
      this,
    ).buildColumns(
      coreL10n: l10n,
      customL10n: salesL10n,
      fromEnum: SoiRequestArtworkApprovalFields.fromEnum,
    );
  }
}
