import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:flutter/services.dart';

// TODO(mh): Refactor to new FieldCache pattern

/// UNIFIED ServerpodLog fields with ALL features (forms + tables) in ONE place
/// This replaces ServerpodLogFieldWrapper and ServerpodLogFieldsExt
class ServerpodLogFields {
  ServerpodLogFields._();

  // Pre-built cache mapping field names to ServerpodLogField enums for O(1)
  // lookup
  static final Map<String, ServerpodLogField> _fieldNameToEnum = {
    for (final field in ServerpodLogField.values) field.name: field,
  };

  // Cache for fromFieldKey results to avoid repeated fromEnum calls
  static final Map<String,
          ExtendedField<ServerpodLogField, ElbCoreLocalizations>>
      _fieldKeyCache = {};

  // ========== Core Fields ==========

  static ExtendedField<ServerpodLogField, ElbCoreLocalizations> get id =>
      const ExtendedFieldImpl.id(
        ServerpodLogField.id,
      );

  static ExtendedField<ServerpodLogField, ElbCoreLocalizations> get time =>
      ExtendedFieldImpl.date(
        ServerpodLogField.time,
        readableFunc: (l10n, _) => l10n.serverpod_log_entry_time,
        dateValidatorFunc: (l10n, _) => null,
      );

  static ExtendedField<ServerpodLogField, ElbCoreLocalizations> get message =>
      ExtendedFieldImpl.text(
        ServerpodLogField.message,
        readableFunc: (l10n, _) => l10n.serverpod_log_entry_message,
        validatorFunc: (l10n, _) => null,
        cellWidth: 400,
      );

  static ExtendedField<ServerpodLogField, ElbCoreLocalizations> get logLevel =>
      ExtendedFieldImpl.number(
        ServerpodLogField.logLevel,
        readableFunc: (l10n, _) => l10n.serverpod_log_entry_level,
        validatorFunc: (l10n, _) => null,
        cellWidth: 100,
        keyboardType: TextInputType.number,
      );

  static ExtendedField<ServerpodLogField, ElbCoreLocalizations> get error =>
      ExtendedFieldImpl.text(
        ServerpodLogField.error,
        readableFunc: (l10n, _) => l10n.serverpod_log_entry_error,
        validatorFunc: (l10n, _) => null,
        cellWidth: 300,
      );

  static ExtendedField<ServerpodLogField, ElbCoreLocalizations>
      get stackTrace => ExtendedFieldImpl.text(
            ServerpodLogField.stackTrace,
            readableFunc: (l10n, _) => l10n.serverpod_log_entry_stack_trace,
            validatorFunc: (l10n, _) => null,
            cellWidth: 300,
          );

  static ExtendedField<ServerpodLogField, ElbCoreLocalizations> get reference =>
      ExtendedFieldImpl.text(
        ServerpodLogField.reference,
        readableFunc: (l10n, _) => l10n.serverpod_log_entry_reference,
        validatorFunc: (l10n, _) => null,
        cellWidth: 150,
      );

  static ExtendedField<ServerpodLogField, ElbCoreLocalizations> get serverId =>
      ExtendedFieldImpl.text(
        ServerpodLogField.serverId,
        readableFunc: (l10n, _) => l10n.serverpod_log_entry_server_id,
        validatorFunc: (l10n, _) => null,
        cellWidth: 150,
      );

  static ExtendedField<ServerpodLogField, ElbCoreLocalizations>
      get sessionLogId => ExtendedFieldImpl.text(
            ServerpodLogField.sessionLogId,
            readableFunc: (l10n, _) => l10n.serverpod_log_entry_session_id,
            validatorFunc: (l10n, _) => null,
            cellWidth: 150,
          );

  static ExtendedField<ServerpodLogField, ElbCoreLocalizations> get messageId =>
      ExtendedFieldImpl.text(
        ServerpodLogField.messageId,
        readableFunc: (l10n, _) => l10n.serverpod_log_entry_message_id,
        validatorFunc: (l10n, _) => null,
        cellWidth: 150,
      );

  // ========== Helper methods ==========

  /// Get ExtendedField from enum value
  static ExtendedField<ServerpodLogField, ElbCoreLocalizations> fromEnum(
    ServerpodLogField field,
  ) {
    return switch (field) {
      ServerpodLogField.id => id,
      ServerpodLogField.time => time,
      ServerpodLogField.message => message,
      ServerpodLogField.logLevel => logLevel,
      ServerpodLogField.error => error,
      ServerpodLogField.stackTrace => stackTrace,
      ServerpodLogField.reference => reference,
      ServerpodLogField.serverId => serverId,
      ServerpodLogField.sessionLogId => sessionLogId,
      ServerpodLogField.messageId => messageId,
    };
  }

  /// Get ExtendedField from field key string (with caching for performance)
  static ExtendedField<ServerpodLogField, ElbCoreLocalizations> fromFieldKey(
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

  /// Returns the readable name of the log level
  /// Naming as used by Serverpod
  static String getLevelReadable(int level, ElbCoreLocalizations l10n) {
    return switch (level) {
      1 => l10n.serverpod_log_entry_level_debug,
      2 => l10n.serverpod_log_entry_level_info,
      3 => l10n.serverpod_log_entry_level_warning,
      4 => l10n.serverpod_log_entry_level_error,
      5 => l10n.serverpod_log_entry_level_fatal,
      _ => l10n.serverpod_log_entry_level_unknown,
    };
  }
}

/// Extension methods for table operations (replacing ServerpodLogFieldsExt)
extension ServerpodLogFieldsTableExt on List<ServerpodLogField> {
  /// Returns a map of filterable fields with their labels
  Map<ServerpodLogField, TableFieldData> filterableWithLabels(
    ElbCoreLocalizations l10n,
  ) {
    final map = <ServerpodLogField, TableFieldData>{};
    for (final field in this) {
      final extField = ServerpodLogFields.fromEnum(field);
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
  Map<ServerpodLogField, TableFieldData> quickSearchFields(
    ElbCoreLocalizations l10n,
  ) {
    final map = <ServerpodLogField, TableFieldData>{};
    final fields = [
      ServerpodLogField.message,
      ServerpodLogField.reference,
      ServerpodLogField.serverId,
    ];

    for (final field in fields.orderedFields(l10n)) {
      final extField = ServerpodLogFields.fromEnum(field);
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
  Map<ServerpodLogField, TableColumnData> tableColumnsWithLabels(
    ElbCoreLocalizations l10n,
  ) {
    final map = <ServerpodLogField, TableColumnData>{};
    for (final field in this) {
      final extField = ServerpodLogFields.fromEnum(field);
      map[field] = TableColumnData(
        readable: extField.readable(l10n, l10n),
        fieldConfig: extField.tableFieldConfig,
      );
    }
    return map;
  }

  /// Returns ordered fields with priority
  List<ServerpodLogField> orderedFields(ElbCoreLocalizations l10n) {
    final fields = toList()
      ..sort((a, b) {
        // Place message at the top
        if (a == ServerpodLogField.message) return -1;
        if (b == ServerpodLogField.message) return 1;

        // Sort remaining fields alphabetically by their readable names
        final aField = ServerpodLogFields.fromEnum(a);
        final bField = ServerpodLogFields.fromEnum(b);

        final aReadable = aField.readable(l10n, l10n);
        final bReadable = bField.readable(l10n, l10n);
        return aReadable.compareTo(bReadable);
      });

    return fields;
  }
}
