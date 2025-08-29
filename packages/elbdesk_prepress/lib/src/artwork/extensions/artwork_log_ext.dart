import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/l10n/elb_prepress_localizations.dart';
import 'package:flutter/widgets.dart';

/// Extension for providing readable field names, filter types, and validators
/// for ContactField
extension type ArtworkLogFieldWrapper(ArtworkLogField field) {
  /// Constructor with fromFieldKey
  ArtworkLogFieldWrapper.fromFieldKey(String fieldKey)
      : this(_fromKey(fieldKey));

  // cache for field key to field mapping
  static final Map<String, ArtworkLogField> _fieldKeyCache = {
    for (var field in ArtworkLogField.values) field.name: field,
  };

  static ArtworkLogField _fromKey(String fieldKey) {
    return _fieldKeyCache[fieldKey] ??
        (throw Exception('Invalid field key: $fieldKey'));
  }

  /// Returns the readable name of the field
  String readable(ElbCoreLocalizations l10n, ElbPrepressLocalizations ppL10n) {
    return switch (this) {
      ArtworkLogField.id => l10n.id,
      ArtworkLogField.field => l10n.history_log_field,
      ArtworkLogField.oldValue => l10n.history_log_old_value,
      ArtworkLogField.newValue => l10n.history_log_new_value,
      ArtworkLogField.updatedAt => l10n.gen_edited_at,
      ArtworkLogField.updatedBy => l10n.gen_edited_by,
      ArtworkLogField.salesOrderCustomId => ppL10n.sales_sales_order_singular,
      ArtworkLogField.salesOrderId => ppL10n.sales_sales_order_singular,
      ArtworkLogField.entityId => l10n.id,
      ArtworkLogField.tableType => l10n.gen_table_type,
    };
  }

  /// Returns the alignment of the field
  Alignment get cellAlignment {
    return switch (this) {
      _ => Alignment.centerLeft,
    };
  }

  /// Returns the field configuration for the table
  TableFieldConfig get toTableFieldConfig {
    return TableFieldConfig(
      width: 100,
      fieldKey: field.name,
    );
  }

  /// Returns the filter types available for the field. If the field is
  /// not filterable, an empty list is returned.
  List<FilterType> get filterTypes {
    return switch (this) {
      ArtworkLogField.id => [],
      ArtworkLogField.field => [],
      ArtworkLogField.oldValue => [FilterType.equal],
      ArtworkLogField.newValue => [FilterType.equal],
      ArtworkLogField.updatedAt => [],
      ArtworkLogField.updatedBy => [],
      _ => [],
    };
  }

  /// Returns the validator for the field, if the field does not have a
  /// validator, null is returned - this is used when edit a field
  String? Function(String?)? validator(ElbCoreLocalizations l10n) {
    return switch (this) {
      _ => null,
    };
  }

  /// Returns the field type of the field
  FilterFieldType get fieldType {
    return switch (this) {
      _ => FilterFieldType.text,
    };
  }
}

/// Extension for providing readable field names, filter types, and validators
extension ArtworkLogFieldsExt on List<ArtworkLogField> {
  /// Returns a map of filterable fields with labels
  Map<ArtworkLogField, TableFieldData> filterableWithLabels(
    ElbCoreLocalizations l10n,
    ElbPrepressLocalizations ppL10n,
  ) {
    final map = <ArtworkLogField, TableFieldData>{};
    for (final field in this) {
      final fieldWrapper = ArtworkLogFieldWrapper(field);
      // only add filterable fields with non empty array
      if (fieldWrapper.filterTypes.isNotEmpty) {
        map[field] = TableFieldData(
          readable: fieldWrapper.readable(l10n, ppL10n),
          filterTypes: fieldWrapper.filterTypes,
          validator: fieldWrapper.validator(l10n),
          fieldType: fieldWrapper.fieldType,
        );
      }
    }

    return map;
  }

  /// Returns a map of table columns with labels
  Map<ArtworkLogField, TableColumnData> tableColumnsWithLabels(
    ElbCoreLocalizations l10n,
    ElbPrepressLocalizations ppL10n,
  ) {
    final map = <ArtworkLogField, TableColumnData>{};
    for (final field in this) {
      // we dont want to show the id field because it is not a real field
      // in this context
      if (field != ArtworkLogField.id) {
        final fieldWrapper = ArtworkLogFieldWrapper(field);
        map[field] = TableColumnData(
          readable: fieldWrapper.readable(l10n, ppL10n),
          fieldConfig: fieldWrapper.toTableFieldConfig,
        );
      }
    }

    return map;
  }
}
