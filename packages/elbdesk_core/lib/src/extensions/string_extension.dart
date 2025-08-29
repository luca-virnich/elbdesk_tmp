import 'package:flutter/widgets.dart';

/// Extension methods for the [String] class.
extension StringExt on String {
  /// Used to mark a string as hardcoded
  /// With this extension we can easily search for hardcoded strings
  /// and replace them with translations.
  String get hc {
    return this;
  }

  /// Used to mark a string as fixed, this should not be translated!
  String get fixed {
    return this;
  }

  /// Returns if the string is empty when trimmed
  bool get isTrimmedEmpty {
    return trim().isEmpty;
  }

  /// Returns if the string is not empty when trimmed
  bool get isTrimmedNotEmpty {
    return trim().isNotEmpty;
  }

  /// Really basic email validation. This is not a replacement for a proper
  /// email validation. This is just a simple check to see if the email is
  /// formatted correctly.
  bool get isValidEmail {
    return RegExp(r'^[\w.+-]+@[\w.-]+\.[a-zA-Z]{2,}$').hasMatch(this);
  }

  Color get radixDbToColor {
    final colorInt = int.parse(replaceFirst('0x', ''), radix: 16);
    return Color(colorInt);
  }

  /// Calculates the width of the string with the given text style.
  /// Does not take into account the system scaleFactor.
  double calculateWidth({required TextStyle textStyle}) {
    final textPainter = TextPainter(
      text: TextSpan(text: this, style: textStyle),
      textDirection: TextDirection.ltr,
      maxLines: 1,
    )..layout();

    return textPainter.width;
  }

  String get dashWhenNullOrEmpty {
    if (trim().isEmpty) {
      return '-';
    }

    return this;
  }
}

extension StringExtNullable on String? {
  String get dashWhenNullOrEmpty {
    if (this == null) {
      return '-';
    }
    if (this!.trim().isEmpty) {
      return '-';
    }

    return this!;
  }
}
