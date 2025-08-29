import 'package:intl/intl.dart';

/// Extension for [DateTime] class
extension DateTimeExt on DateTime {
  /// Converts the [DateTime] to a readable string
  /// in the format: 'dd.MM.yyyy / HH:mm'
  String toTimestamp(String localeName) {
    final date = toDate(localeName);
    final time = toTimeWithoutSeconds(localeName);
    return '$date $time';
  }

  String toTimeWithoutSeconds(String localeName) {
    return DateFormat.Hm(localeName).format(this);
  }

  String toDate(String localeName) {
    return DateFormat.yMd(localeName).format(this);
  }

  String toDateAndTime(String localeName) {
    final date = DateFormat.yMd(localeName).format(this);
    final time = DateFormat.Hm(localeName).format(this);
    return '$date - $time';
  }
}
