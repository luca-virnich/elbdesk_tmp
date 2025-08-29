import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:flutter/services.dart';

// TODO(mh): Refactor to new FieldCache pattern

/// UNIFIED FlutterLog fields with ALL features (forms + tables) in ONE place
/// This replaces FlutterLogFieldWrapper and FlutterLogFieldsExt
class FlutterLogFields {
  FlutterLogFields._();

  // Pre-built cache mapping field names to FlutterLogField enums for O(1)
  // lookup
  static final Map<String, FlutterLogField> _fieldNameToEnum = {
    for (final field in FlutterLogField.values) field.name: field,
  };

  // Cache for fromFieldKey results to avoid repeated fromEnum calls
  static final Map<String, ExtendedField<FlutterLogField, ElbCoreLocalizations>>
      _fieldKeyCache = {};

  // ========== Core Fields ==========

  static ExtendedField<FlutterLogField, ElbCoreLocalizations> get id =>
      ExtendedFieldImpl.number(
        FlutterLogField.id,
        readableFunc: (l10n, _) => l10n.id,
        validatorFunc: (l10n, _) => null,
        keyboardType: TextInputType.number,
      );

  static ExtendedField<FlutterLogField, ElbCoreLocalizations> get time =>
      ExtendedFieldImpl.date(
        FlutterLogField.time,
        readableFunc: (l10n, _) => l10n.flutter_log_entry_time,
        dateValidatorFunc: (l10n, _) => null,
      );

  static ExtendedField<FlutterLogField, ElbCoreLocalizations> get exception =>
      ExtendedFieldImpl.text(
        FlutterLogField.exception,
        readableFunc: (l10n, _) => l10n.flutter_log_entry_error,
        validatorFunc: (l10n, _) => null,
        cellWidth: 400,
      );

  static ExtendedField<FlutterLogField, ElbCoreLocalizations> get context =>
      ExtendedFieldImpl.text(
        FlutterLogField.context,
        readableFunc: (l10n, _) => l10n.flutter_log_entry_context,
        validatorFunc: (l10n, _) => null,
        cellWidth: 150,
      );

  static ExtendedField<FlutterLogField, ElbCoreLocalizations>
      get flutterLibrary => ExtendedFieldImpl.text(
            FlutterLogField.flutterLibrary,
            readableFunc: (l10n, _) => l10n.flutter_log_entry_library,
            validatorFunc: (l10n, _) => null,
            cellWidth: 150,
          );

  static ExtendedField<FlutterLogField, ElbCoreLocalizations> get stack =>
      ExtendedFieldImpl.text(
        FlutterLogField.stack,
        readableFunc: (l10n, _) => l10n.flutter_log_entry_stack_trace,
        validatorFunc: (l10n, _) => null,
        cellWidth: 300,
      );

  static ExtendedField<FlutterLogField, ElbCoreLocalizations> get information =>
      ExtendedFieldImpl.text(
        FlutterLogField.information,
        readableFunc: (l10n, _) => l10n.flutter_log_entry_information,
        validatorFunc: (l10n, _) => null,
        cellWidth: 300,
      );

  // ========== Device/User Fields ==========

  static ExtendedField<FlutterLogField, ElbCoreLocalizations> get deviceId =>
      ExtendedFieldImpl.text(
        FlutterLogField.deviceId,
        readableFunc: (l10n, _) => l10n.flutter_log_entry_device_id,
        validatorFunc: (l10n, _) => null,
        cellWidth: 150,
      );

  static ExtendedField<FlutterLogField, ElbCoreLocalizations> get userId =>
      ExtendedFieldImpl.number(
        FlutterLogField.userId,
        readableFunc: (l10n, _) => l10n.flutter_log_entry_user_id,
        validatorFunc: (l10n, _) => null,
        cellWidth: 150,
        keyboardType: TextInputType.number,
      );

  // ========== Platform/Version Fields ==========

  static ExtendedField<FlutterLogField, ElbCoreLocalizations> get platform =>
      ExtendedFieldImpl.text(
        FlutterLogField.platform,
        readableFunc: (l10n, _) => l10n.flutter_log_entry_platform,
        validatorFunc: (l10n, _) => null,
        cellWidth: 150,
      );

  static ExtendedField<FlutterLogField, ElbCoreLocalizations> get appVersion =>
      ExtendedFieldImpl.text(
        FlutterLogField.appVersion,
        readableFunc: (l10n, _) => l10n.flutter_log_entry_app_version,
        validatorFunc: (l10n, _) => null,
        cellWidth: 150,
      );

  static ExtendedField<FlutterLogField, ElbCoreLocalizations> get buildNumber =>
      ExtendedFieldImpl.text(
        FlutterLogField.buildNumber,
        readableFunc: (l10n, _) => l10n.flutter_log_entry_build_number,
        validatorFunc: (l10n, _) => null,
        cellWidth: 150,
      );

  static ExtendedField<FlutterLogField, ElbCoreLocalizations> get silent =>
      ExtendedFieldImpl.boolean(
        FlutterLogField.silent,
        readableFunc: (l10n, _) => l10n.flutter_log_entry_silent,
        validatorFunc: (l10n, _) => null,
        cellWidth: 150,
      );

  // ========== Helper methods ==========

  /// Get ExtendedField from enum value
  static ExtendedField<FlutterLogField, ElbCoreLocalizations> fromEnum(
    FlutterLogField field,
  ) {
    return switch (field) {
      FlutterLogField.id => id,
      FlutterLogField.time => time,
      FlutterLogField.exception => exception,
      FlutterLogField.context => context,
      FlutterLogField.flutterLibrary => flutterLibrary,
      FlutterLogField.stack => stack,
      FlutterLogField.information => information,
      FlutterLogField.deviceId => deviceId,
      FlutterLogField.userId => userId,
      FlutterLogField.platform => platform,
      FlutterLogField.appVersion => appVersion,
      FlutterLogField.buildNumber => buildNumber,
      FlutterLogField.silent => silent,
    };
  }

  /// Get ExtendedField from field key string (with caching for performance)
  static ExtendedField<FlutterLogField, ElbCoreLocalizations> fromFieldKey(
    String fieldKey,
  ) {
    // Check cache for already computed ExtendedField
    final cached = _fieldKeyCache[fieldKey];
    if (cached != null) {
      return cached;
    }

    // Use pre-built map for O(1) enum lookup instead of firstWhere O(n)
    final field = _fieldNameToEnum[fieldKey];
    if (field == null) {
      throw ArgumentError('Unknown field key: $fieldKey');
    }

    // Get the ExtendedField and cache it
    final extendedField = fromEnum(field);
    _fieldKeyCache[fieldKey] = extendedField;

    return extendedField;
  }
}

/// Extension methods for table operations (replacing FlutterLogFieldsExt)
extension FlutterLogFieldsTableExt on List<FlutterLogField> {
  /// Returns a map of filterable fields with their labels
  Map<FlutterLogField, TableFieldData> filterableWithLabels(
    ElbCoreLocalizations l10n,
  ) {
    final map = <FlutterLogField, TableFieldData>{};
    for (final field in this) {
      final extField = FlutterLogFields.fromEnum(field);
      if (extField.filterTypes.isNotEmpty) {
        map[field] = TableFieldData(
          readable: extField.readable(l10n, l10n),
          filterTypes: extField.filterTypes,
          fieldType: extField.fieldType,
        );
      }
    }
    return map;
  }

  /// Returns quick search filter fields
  Map<FlutterLogField, TableFieldData> quickSearchFields(
    ElbCoreLocalizations l10n,
  ) {
    final map = <FlutterLogField, TableFieldData>{};
    final fields = [
      FlutterLogField.exception,
      FlutterLogField.context,
      FlutterLogField.deviceId,
    ];

    for (final field in fields.orderedFields(l10n)) {
      final extField = FlutterLogFields.fromEnum(field);
      if (extField.filterTypes.isNotEmpty) {
        map[field] = TableFieldData(
          readable: extField.readable(l10n, l10n),
          filterTypes: extField.filterTypes,
          fieldType: extField.fieldType,
        );
      }
    }
    return map;
  }

  /// Returns a map of table columns with their labels
  Map<FlutterLogField, TableColumnData> tableColumnsWithLabels(
    ElbCoreLocalizations l10n,
  ) {
    final map = <FlutterLogField, TableColumnData>{};
    for (final field in this) {
      final extField = FlutterLogFields.fromEnum(field);
      map[field] = TableColumnData(
        readable: extField.readable(l10n, l10n),
        fieldConfig: extField.tableFieldConfig,
      );
    }
    return map;
  }

  /// Returns ordered fields with priority
  List<FlutterLogField> orderedFields(ElbCoreLocalizations l10n) {
    final fields = toList()
      ..sort((a, b) {
        // Place exception at the top
        if (a == FlutterLogField.exception) return -1;
        if (b == FlutterLogField.exception) return 1;

        // Sort remaining fields alphabetically by their readable names
        final aField = FlutterLogFields.fromEnum(a);
        final bField = FlutterLogFields.fromEnum(b);

        final aReadable = aField.readable(l10n, l10n);
        final bReadable = bField.readable(l10n, l10n);
        return aReadable.compareTo(bReadable);
      });

    return fields;
  }
}
