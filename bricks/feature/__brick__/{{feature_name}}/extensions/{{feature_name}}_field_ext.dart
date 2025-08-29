import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:flutter/widgets.dart';

extension type {{#pascalCase}}{{feature_name}}{{/pascalCase}}FieldWrapper({{#pascalCase}}{{feature_name}}{{/pascalCase}}Field field) {
  /// Constructor with fromFieldKey
  {{#pascalCase}}{{feature_name}}{{/pascalCase}}FieldWrapper.fromFieldKey(String fieldKey)
      : this(_fromKey(fieldKey));

  // cache for field key to field mapping
  static final Map<String, {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field> _fieldKeyCache = {
    for (var field in {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.values) field.name: field,
  };

  static {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field _fromKey(String fieldKey) {
    return _fieldKeyCache[fieldKey] ??
        (throw Exception('Invalid field key: $fieldKey'));
  }

  /// Returns the readable name of the field
  String readable(AppLocalizations l10n) {
    return switch (field) {
      {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.name => 'Name'.hc,
      {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.id => l10n.id,
      {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.description => 'Description'.hc,
      {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.createdAt => l10n.gen_created_at,
      {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.createdBy => l10n.gen_created_by,
      {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.lastModifiedAt => l10n.gen_last_modified_at,
      {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.lastModifiedBy => l10n.gen_last_modified_by,
      {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.deletedAt => l10n.gen_deleted_at,
      {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.isDraft => l10n.gen_is_draft,
    };
  }

  /// Returns the alignment of the field
  Alignment get cellAlignment {
    return switch (field) {
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

  /// Returns the filter types available for the field, if the field is
  /// not filterable, an empty list is returned
  List<FilterType> get filterTypes {
    return switch (field) {
      _ => [],
    };
  }

  /// Returns the field type of the field
  FilterFieldType get fieldType {
    return switch (field) {
      _ => FilterFieldType.text,
    };
  }

  /// Returns the validator for the field, if the field does not have a
  /// validator, null is returned - this is used when edit a field
  String? Function(String?)? validator(AppLocalizations l10n) {
    return switch (field) {
      _ => null,
    };
  }
}

/// Extension for providing readable field names, filter types, and validators
extension {{#pascalCase}}{{feature_name}}{{/pascalCase}}FieldsExt on List<{{#pascalCase}}{{feature_name}}{{/pascalCase}}Field> {
  /// Returns a map of filterable fields with labels
  Map<{{#pascalCase}}{{feature_name}}{{/pascalCase}}Field, TableFieldData> filterableWithLabels(
    AppLocalizations l10n,
  ) {
    final map = <{{#pascalCase}}{{feature_name}}{{/pascalCase}}Field, TableFieldData>{};
    for (final field in this) {
      final fieldWrapper = {{#pascalCase}}{{feature_name}}{{/pascalCase}}FieldWrapper(field);
      // only add filterable fields with non empty array
      if (fieldWrapper.filterTypes.isNotEmpty) {
        map[field] = TableFieldData(
          readable: fieldWrapper.readable(l10n),
          filterTypes: fieldWrapper.filterTypes,
          validator: fieldWrapper.validator(l10n),
          fieldType: fieldWrapper.fieldType,
        );
      }
    }

    return map;
  }

  /// Returns a map of table columns with labels
  Map<{{#pascalCase}}{{feature_name}}{{/pascalCase}}Field, TableColumnData> tableColumnsWithLabels(
    AppLocalizations l10n,
  ) {
    final excludeFields = [
      {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.deletedAt,
      {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.isDraft,
    ];
    final map = <{{#pascalCase}}{{feature_name}}{{/pascalCase}}Field, TableColumnData>{};
    for (final field in this) {
      if (excludeFields.contains(field)) continue;
      final fieldWrapper = {{#pascalCase}}{{feature_name}}{{/pascalCase}}FieldWrapper(field);
      map[field] = TableColumnData(
        readable: fieldWrapper.readable(l10n),
        fieldConfig: fieldWrapper.toTableFieldConfig,
      );
    }

    return map;
  }
}
