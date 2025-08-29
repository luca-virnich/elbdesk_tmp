import 'package:flutter/widgets.dart';

/// Extension to get the display name of a locale
extension LocaleDisplayNameExt on Locale {
  String get displayName {
    switch (languageCode) {
      case 'de':
        return 'Deutsch';
      case 'en':
        return 'English';
      default:
        throw UnimplementedError(
          '$languageCode is not implemented',
        );
    }
  }
}
