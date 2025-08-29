// import 'package:elbdesk_client/elbdesk_client.dart';
// import 'package:elbdesk_core/elbdesk_core.dart';
// import 'package:flutter/widgets.dart';

// /// Extension for providing readable field names, filter types, and validators
// /// for ContactField
// extension type LogEntryFieldWrapper(HistoryLogEntryField field) {
//   /// Constructor with fromFieldKey
//   LogEntryFieldWrapper.fromFieldKey(String fieldKey) : this(_fromKey(fieldKey));

//   // cache for field key to field mapping
//   static final Map<String, HistoryLogEntryField> _fieldKeyCache = {
//     for (var field in HistoryLogEntryField.values) field.name: field,
//   };

//   static HistoryLogEntryField _fromKey(String fieldKey) {
//     return _fieldKeyCache[fieldKey] ??
//         (throw Exception('Invalid field key: $fieldKey'));
//   }

//   /// Returns the readable name of the field
//   String readable(ElbCoreLocalizations l10n) {
//     return switch (this) {
//       HistoryLogEntryField.id => l10n.id,
//       HistoryLogEntryField.field => l10n.history_log_field,
//       HistoryLogEntryField.oldValue => l10n.history_log_old_value,
//       HistoryLogEntryField.newValue => l10n.history_log_new_value,
//       HistoryLogEntryField.editingSince => l10n.gen_edited_at,
//       HistoryLogEntryField.editingBy => l10n.gen_edited_by,
//     };
//   }

//   /// Returns the alignment of the field
//   Alignment get cellAlignment {
//     return switch (this) {
//       _ => Alignment.centerLeft,
//     };
//   }

//   /// Returns the field configuration for the table
//   TableFieldConfig get toTableFieldConfig {
//     return TableFieldConfig(
//       width: 100,
//       fieldKey: field.name,
//     );
//   }

//   /// Returns the filter types available for the field. If the field is
//   /// not filterable, an empty list is returned.
//   List<FilterType> get filterTypes {
//     return switch (this) {
//       HistoryLogEntryField.id => [],
//       HistoryLogEntryField.field => [],
//       HistoryLogEntryField.oldValue => [FilterType.equal],
//       HistoryLogEntryField.newValue => [FilterType.equal],
//       HistoryLogEntryField.editingSince => [],
//       HistoryLogEntryField.editingBy => [],
//     };
//   }

//   /// Returns the validator for the field, if the field does not have a
//   /// validator, null is returned - this is used when edit a field
//   String? Function(String?)? validator(ElbCoreLocalizations l10n) {
//     return switch (this) {
//       HistoryLogEntryField.id => null,
//       HistoryLogEntryField.field => (value) {
//           if (value == null) return null;
//           if (value.trim().isEmpty) return l10n.validation_name_required;
//           return null;
//         },
//       HistoryLogEntryField.oldValue => (value) {
//           if (value == null) return null;
//           if (value.trim().isEmpty) return l10n.validation_name_required;
//           return null;
//         },
//       HistoryLogEntryField.newValue => (value) {
//           if (value == null) return null;
//           if (value.trim().isEmpty) return l10n.validation_name_required;
//           return null;
//         },
//       HistoryLogEntryField.editingSince => (value) {
//           if (value == null) return null;
//           if (value.trim().isEmpty) return l10n.validation_name_required;
//           return null;
//         },
//       HistoryLogEntryField.editingBy => (value) {
//           if (value == null) return null;
//           if (value.trim().isEmpty) return l10n.validation_name_required;
//           return null;
//         },
//     };
//   }

//   /// Returns the field type of the field
//   FilterFieldType get fieldType {
//     return switch (this) {
//       _ => FilterFieldType.text,
//     };
//   }
// }

// /// Extension for providing readable field names, filter types, and validators
// extension LogEntryFieldsExt on List<HistoryLogEntryField> {
//   /// Returns a map of filterable fields with labels
//   Map<HistoryLogEntryField, TableFieldData> filterableWithLabels(
//     ElbCoreLocalizations l10n,
//   ) {
//     final map = <HistoryLogEntryField, TableFieldData>{};
//     for (final field in this) {
//       final fieldWrapper = LogEntryFieldWrapper(field);
//       // only add filterable fields with non empty array
//       if (fieldWrapper.filterTypes.isNotEmpty) {
//         map[field] = TableFieldData(
//           readable: fieldWrapper.readable(l10n),
//           filterTypes: fieldWrapper.filterTypes,
//           validator: fieldWrapper.validator(l10n),
//           fieldType: fieldWrapper.fieldType,
//         );
//       }
//     }

//     return map;
//   }

//   /// Returns a map of table columns with labels
//   Map<HistoryLogEntryField, TableColumnData> tableColumnsWithLabels(
//     ElbCoreLocalizations l10n,
//   ) {
//     final map = <HistoryLogEntryField, TableColumnData>{};
//     for (final field in this) {
//       // we dont want to show the id field because it is not a real field
//       // in this context
//       if (field != HistoryLogEntryField.id) {
//         final fieldWrapper = LogEntryFieldWrapper(field);
//         map[field] = TableColumnData(
//           readable: fieldWrapper.readable(l10n),
//           fieldConfig: fieldWrapper.toTableFieldConfig,
//         );
//       }
//     }

//     return map;
//   }
// }
