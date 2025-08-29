import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';

extension DatabaseQueryExceptionExtension on DatabaseQueryException {
  ElbException toElbException([
    ElbExceptionType? exceptionType,
    List<String>? artifacts,
    String? customMessage,
  ]) {
    String field = '';
    List<String> artifacts = [];
    final isDuplicateKeyError = message.contains('duplicate key value');
    if (isDuplicateKeyError) {
      if (detail != null) {
        final splitted = detail!.split('=');
        if (splitted.length == 2) {
          final fieldValue = splitted[0];
          final valueValue = splitted[1];
          field = _extractValueFromParenthesis(fieldValue) ?? '';
          final value = _extractValueFromParenthesis(valueValue);
          if (value != null) {
            artifacts.add(value);
          }
        }
      }
      exceptionType ??= ElbExceptionType.validationFieldError;
    }

    return ElbException(
      exceptionType: exceptionType ?? ElbExceptionType.unknown,
      message: customMessage ?? message,
      columnName: columnName,
      constraintName: constraintName,
      tableName: tableName,
      artifacts: artifacts,
      code: code,
      databaseExceptionMessage: message,
      field: field,
    );
  }
}

/// Extracts a value within the first pair of parentheses in the input string,
/// optionally removing surrounding double quotes if present.
///
/// For example, given the string: `Key ("value")=something`
/// this function will return `value`.
/// For `Key (value)=something`, it will return `value`.
///
/// Returns `null` if no such value is found.
String? _extractValueFromParenthesis(String value) {
  final start = value.indexOf('(');
  final end = value.indexOf(')', start + 1);

  if (start != -1 && end != -1 && end > start) {
    var raw = value.substring(start + 1, end);

    // Remove surrounding double quotes if present
    if (raw.length > 1 && raw.startsWith('"') && raw.endsWith('"')) {
      raw = raw.substring(1, raw.length - 1);
    }
    return raw;
  }
  return null;
}
