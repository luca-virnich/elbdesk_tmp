import 'dart:ui';

extension ColorExtension on Color {
  String get toRadixDbString {
    return value.toRadixString(16).toUpperCase();
  }
}
