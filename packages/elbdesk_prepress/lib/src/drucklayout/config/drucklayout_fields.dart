import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/l10n/elb_prepress_localizations.dart';

/// UNIFIED DrucklayoutField fields with ALL features (forms + tables) in
/// ONE place
/// This replaces DrucklayoutFieldWrapper and DrucklayoutFieldExt
class DrucklayoutFields {
  DrucklayoutFields._();

  // ==================== FIELD CACHE ====================

  static final _cache = FieldCache<DrucklayoutField, ElbPrepressLocalizations>(
    values: DrucklayoutField.values,
    createField: _createField,
  );

  static ExtendedField<DrucklayoutField, ElbPrepressLocalizations> fromEnum(
    DrucklayoutField field,
  ) =>
      _cache.fromEnum(field);

  static ExtendedField<DrucklayoutField, ElbPrepressLocalizations> fromFieldKey(
    String fieldKey,
  ) =>
      _cache.fromFieldKey(fieldKey);

  static final List<TableFieldConfig> defaultTableColumns = List.unmodifiable([
    _cache.fromEnum(DrucklayoutField.id).tableFieldConfig,
    _cache.fromEnum(DrucklayoutField.drucklayoutPreSelection).tableFieldConfig,
    _cache.fromEnum(DrucklayoutField.drucklayoutSelection).tableFieldConfig,
    _cache.fromEnum(DrucklayoutField.title).tableFieldConfig,
    _cache.fromEnum(DrucklayoutField.description).tableFieldConfig,
    _cache.fromEnum(DrucklayoutField.createdAt).tableFieldConfig,
    _cache.fromEnum(DrucklayoutField.createdBy).tableFieldConfig,
  ]);

  // ==================== FIELD DEFINITIONS ====================

  static ExtendedField<DrucklayoutField, ElbPrepressLocalizations> _createField(
    DrucklayoutField field,
  ) {
    return switch (field) {
      // ========== Meta Fields ==========
      DrucklayoutField.deletedAt => ExtendedFieldImpl.date(
          DrucklayoutField.deletedAt,
          readableFunc: (l10n, _) => l10n.gen_deleted_at,
          dateValidatorFunc: (_, __) => null,
          filterTypes: DefaultFilterTypes.noFilter,
          excludeFromTable: true,
        ),
      DrucklayoutField.isDraft => ExtendedFieldImpl.boolean(
          DrucklayoutField.isDraft,
          readableFunc: (l10n, _) => l10n.gen_is_draft,
          validatorFunc: (_, __) => null,
          filterTypes: DefaultFilterTypes.noFilter,
          excludeFromTable: true,
        ),
      DrucklayoutField.createdAt => ExtendedFieldImpl.date(
          DrucklayoutField.createdAt,
          readableFunc: (l10n, _) => l10n.gen_created_at,
          dateValidatorFunc: (_, __) => null,
        ),
      DrucklayoutField.createdBy => ExtendedFieldImpl.text(
          DrucklayoutField.createdBy,
          readableFunc: (l10n, _) => l10n.gen_created_by,
          validatorFunc: (_, __) => null,
        ),
      DrucklayoutField.lastModifiedAt => ExtendedFieldImpl.date(
          DrucklayoutField.lastModifiedAt,
          readableFunc: (l10n, _) => l10n.gen_last_modified_at,
          dateValidatorFunc: (_, __) => null,
        ),
      DrucklayoutField.lastModifiedBy => ExtendedFieldImpl.text(
          DrucklayoutField.lastModifiedBy,
          readableFunc: (l10n, _) => l10n.gen_last_modified_by,
          validatorFunc: (_, __) => null,
        ),

      // ========== Entity Fields ==========
      DrucklayoutField.id => const ExtendedFieldImpl.id(
          DrucklayoutField.id,
        ),
      DrucklayoutField.title => ExtendedFieldImpl.text(
          DrucklayoutField.title,
          readableFunc: (l10n, ppL10n) => ppL10n.drucklayout_title,
          validatorFunc: (_, __) => null,
          cellWidth: 180,
        ),
      DrucklayoutField.description => ExtendedFieldImpl.text(
          DrucklayoutField.description,
          readableFunc: (l10n, ppL10n) => ppL10n.drucklayout_description,
          validatorFunc: (_, __) => null,
        ),
      DrucklayoutField.customerId => ExtendedFieldImpl.integer(
          DrucklayoutField.customerId,
          readableFunc: (l10n, ppL10n) => ppL10n.customer,
          validatorFunc: (_, __) => null,
        ),
      DrucklayoutField.drucklayoutPreSelection =>
        ExtendedFieldImpl.lazyTextDropdown(
          DrucklayoutField.drucklayoutPreSelection,
          readableFunc: (l10n, ppL10n) =>
              ppL10n.drucklayout_preselection_singular,
          validatorFunc: (_, __) => null,
          isMandatory: true,
          cellWidth: 130,
        ),
      DrucklayoutField.drucklayoutSelection =>
        ExtendedFieldImpl.lazyTextDropdown(
          DrucklayoutField.drucklayoutSelection,
          readableFunc: (l10n, ppL10n) => ppL10n.drucklayout_selection_singular,
          validatorFunc: (_, __) => null,
          isMandatory: true,
          cellWidth: 130,
        ),
    };
  }
  // ==================== DROPDOWN ITEMS ====================

  static Map<DrucklayoutField, List<DropdownItem<dynamic>>>
      buildFilterDropdownItems(
    ElbCoreLocalizations l10n,
    ElbPrepressLocalizations ppL10n,
  ) {
    return _cache.buildFilterDropdownItems(l10n, ppL10n);
  }
}

// ==================== LIST EXTENSIONS ====================

extension DrucklayoutFieldsTableExt on List<DrucklayoutField> {
  Map<DrucklayoutField, TableFieldData> filters(
    ElbCoreLocalizations l10n,
    ElbPrepressLocalizations ppL10n,
  ) {
    return ExtendedFieldListExt<DrucklayoutField, ElbPrepressLocalizations>(
      this,
    ).buildFilters(
      coreL10n: l10n,
      customL10n: ppL10n,
      fromEnum: DrucklayoutFields.fromEnum,
    );
  }

  Map<DrucklayoutField, TableColumnData> columns(
    ElbCoreLocalizations l10n,
    ElbPrepressLocalizations ppL10n,
  ) {
    return ExtendedFieldListExt<DrucklayoutField, ElbPrepressLocalizations>(
      this,
    ).buildColumns(
      coreL10n: l10n,
      customL10n: ppL10n,
      fromEnum: DrucklayoutFields.fromEnum,
    );
  }

  Map<DrucklayoutField, TableFieldData> quickSearchFilters(
    ElbCoreLocalizations l10n,
    ElbPrepressLocalizations ppL10n,
  ) {
    return [
      DrucklayoutField.title,
    ].buildQuickSearch(
      coreL10n: l10n,
      customL10n: ppL10n,
      fromEnum: DrucklayoutFields.fromEnum,
    );
  }
}
