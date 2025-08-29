import 'package:flutter/services.dart';

class AppInputFormatters {
  const AppInputFormatters._();

  static TextInputFormatter onlyDigits({bool allowNegative = false}) {
    return TextInputFormatter.withFunction(
      (oldValue, newValue) {
        final newText = newValue.text;

        if (newText.isEmpty) {
          return newValue;
        }

        final regex = allowNegative ? RegExp(r'^-?\d*$') : RegExp(r'^\d*$');

        if (regex.hasMatch(newText)) {
          return newValue;
        }

        return oldValue;
      },
    );
  }

  static TextInputFormatter onlyDigitsNoLeadingZero({
    bool allowNegative = false,
  }) {
    return TextInputFormatter.withFunction(
      (oldValue, newValue) {
        final regex = allowNegative
            ? RegExp(r'^-?[1-9][0-9]*$') // Allow negative at start
            : RegExp(r'^[1-9][0-9]*$');

        if (newValue.text.isEmpty || regex.hasMatch(newValue.text)) {
          return newValue;
        }

        // Special case: allow just "-" as an intermediate state when typing
        if (allowNegative && newValue.text == '-') {
          return newValue;
        }

        return oldValue;
      },
    );
  }

  static TextInputFormatter onlyDigitsAndSingleDecimal({
    int? maxDecimalPlaces,
    bool allowNegative = false,
  }) {
    return TextInputFormatter.withFunction((oldValue, newValue) {
      final text = newValue.text;

      // ① Zwischen-State „-” zulassen
      if (allowNegative && text == '-') return newValue;

      if (text.isEmpty) return newValue;

      final regex = allowNegative
          ? RegExp(r'^-?(?:0|[1-9][0-9]*)(?:[.,][0-9]*)?$')
          : RegExp(r'^(?:0|[1-9][0-9]*)(?:[.,][0-9]*)?$');

      if (!regex.hasMatch(text)) return oldValue;

      // … Rest wie gehabt …
      // (ein Dezimaltrenner + maxDecimalPlaces-Logik)
      // --------------------------------------------
      final sepCount =
          ','.allMatches(text).length + '.'.allMatches(text).length;
      if (sepCount > 1) return oldValue;

      if (maxDecimalPlaces != null && sepCount == 1) {
        final sep = text.contains(',') ? ',' : '.';
        final parts = text.split(sep);
        if (parts[1].length > maxDecimalPlaces) {
          final truncated = parts[1].substring(0, maxDecimalPlaces);
          final corrected = '${parts[0]}$sep$truncated';
          return TextEditingValue(
            text: corrected,
            selection: TextSelection.collapsed(offset: corrected.length),
          );
        }
      }

      return newValue;
    });
  }

  static final noStartingSpace = TextInputFormatter.withFunction(
    (oldValue, newValue) {
      if (newValue.text.startsWith(' ')) {
        return oldValue;
      }
      return newValue;
    },
  );

  static final onlyDartDouble = FilteringTextInputFormatter.allow(
    RegExp(r'^[0-9]+\.?[0-9]*$'),
  );
}
