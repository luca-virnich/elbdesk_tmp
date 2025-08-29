import 'package:elbdesk_core/src/utils/parser.dart';

class AppValidator {
  const AppValidator._();

  // * Phone number validation
  static bool isValidPhoneNumber(String phoneNumber) {
    final phoneRegex = RegExp(r'^\+?[0-9 ]+(?:\([0]\))?(?:[-]?[0-9 ]+)*$');
    final hasMatch = phoneRegex.hasMatch(phoneNumber);
    return hasMatch && Parser.parsePhoneNumber(phoneNumber).length > 4;
  }

  static bool isValidEmail(String email) {
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email);
  }

  static bool isValidUrl(String url) {
    final urlRegex = RegExp(r'^https?:\/\/[^\s]+|^www\.[^\s]+|[^\s]+$');
    return urlRegex.hasMatch(url);
  }

  static bool isValidDouble(String value) {
    return Parser.parseDouble(value) != null;
  }

  // static double? parseDouble(String value) {
  //   final parsed = value.replaceAll(',', '.').trim();
  //   return double.tryParse(parsed);
  // }

  static bool isValidDateValidator(
    String value,
    DateTime? minDate,
    DateTime? maxDate,
  ) {
    final dateTime = DateTime.tryParse(value);
    if (dateTime == null) return false;
    if (minDate != null && dateTime.isBefore(minDate)) return false;
    if (maxDate != null && dateTime.isAfter(maxDate)) return false;
    return true;
  }

  static bool isValidDate(String value) {
    final dateTime = DateTime.tryParse(value);
    return dateTime != null;
  }

  static DateTime? isDate(String value) {
    final dateTime = DateTime.tryParse(value);
    return dateTime;
  }

  static bool isTextNotEmptyOrNull(String? value) {
    if (value == null) return false;
    return value.trim().isNotEmpty;
  }

  static bool isValidNumber(String value) {
    final isValid = double.tryParse(value) != null;
    return isValid;
  }

  static bool isValidBoolean(String value) {
    final isValid =
        value.toLowerCase() == 'true' || value.toLowerCase() == 'false';
    return isValid;
  }

  static bool isValidJsonKey(String value) {
    final jsonKeyRegex = RegExp(r'^[a-zA-Z0-9_-]+$');
    return jsonKeyRegex.hasMatch(value);
  }

  static bool isStringDateInput(String input) {
    final trimmed = input.trim().toLowerCase();
    final parts = trimmed.split('.');
    final englishParts = trimmed.split('/');
    if (parts.length == 3) {
      final day = int.tryParse(parts[0]);
      final month = int.tryParse(parts[1]);
      final year = int.tryParse(parts[2]);
      if (day != null && month != null && year != null) {
        return true;
      }
    } else if (englishParts.length == 3) {
      final month = int.tryParse(englishParts[0]);
      final day = int.tryParse(englishParts[1]);
      final year = int.tryParse(englishParts[2]);
      if (day != null && month != null && year != null) {
        return true;
      }
    }
    return false;
  }

  // static bool isValidWebsite(String website) {
  //   final websiteRegex = RegExp(r'^https?:\/\/[^\s]+$');
  //   return websiteRegex.hasMatch(website);
  // }

  /// Parses a string input and returns a DateTime object based on various
  /// formats and keywords.
  ///
  /// This function supports the following input formats:
  /// - 'h': Returns the current date
  /// - '+1': Returns tomorrow's date
  /// - '+n' or '-n': Adds or subtracts n days from the current date
  /// - '+nw' or '-nw': Adds or subtracts n weeks from the current date
  /// - '+nm' or '-nm': Adds or subtracts n months from the current date
  /// - 'w': Returns the date of the first day of the current week (Monday)
  /// - 'n': Returns the date of the last day of the current week (Sunday)
  /// - 'B': Returns the first day of the current month
  /// - 'E': Returns the last day of the current month
  /// - 'qn': Returns the first day of the nth quarter of the current year
  /// - 'ly': Returns the first day of the previous year
  /// - 'n': Returns the nth day of the current month if n is a valid day
  /// - 'dd.mm.yyyy': Parses the date in the format day.month.year
  ///
  /// If the input doesn't match any of these formats, the function returns
  /// null.
  ///
  /// @param input The string input to parse
  /// @return A DateTime object if the input is valid, null otherwise
  ///
  static DateTime? parseDateInput(String input) {
    // the input can be 10/10/2024 or 10.10.2024
    // we need to check if it is a valid date

    final trimmed = input.trim().toLowerCase();
    final fullNow = DateTime.now();
    final now = DateTime(fullNow.year, fullNow.month, fullNow.day);

    if (trimmed == 'h') {
      return now;
    } else if (trimmed == '+1') {
      return now.add(const Duration(days: 1));
    } else if (trimmed.startsWith('+') || trimmed.startsWith('-')) {
      final isAddition = trimmed.startsWith('+');
      final number = int.tryParse(trimmed.substring(1));
      if (number != null) {
        if (trimmed.endsWith('w')) {
          return isAddition
              ? now.add(Duration(days: 7 * number))
              : now.subtract(Duration(days: 7 * number));
        } else if (trimmed.endsWith('m')) {
          return isAddition
              ? DateTime(now.year, now.month + number, now.day)
              : DateTime(now.year, now.month - number, now.day);
        } else {
          return isAddition
              ? now.add(Duration(days: number))
              : now.subtract(Duration(days: number));
        }
      }
    } else if (trimmed == 'w') {
      return now.subtract(Duration(days: now.weekday - 1));
    } else if (trimmed == 'n') {
      return now.add(Duration(days: 7 - now.weekday));
    } else if (trimmed == 'b') {
      return DateTime(now.year, now.month);
    } else if (trimmed == 'e') {
      return DateTime(now.year, now.month + 1, 0);
    } else if (trimmed.startsWith('q')) {
      final quarter = int.tryParse(trimmed.substring(1));
      if (quarter != null && quarter >= 1 && quarter <= 4) {
        final month = (quarter - 1) * 3 + 1;
        return DateTime(now.year, month);
      }
    } else if (trimmed == 'ly') {
      return DateTime(now.year - 1);
    } else {
      final number = int.tryParse(trimmed);
      if (number != null && number > 0) {
        final daysInMonth = DateTime(now.year, now.month + 1, 0).day;
        if (number <= daysInMonth) {
          return DateTime(now.year, now.month, number);
        }
      }
      final parts = trimmed.split('.');
      final englishParts = trimmed.split('/');
      if (parts.length == 3) {
        final day = int.tryParse(parts[0]);
        final month = int.tryParse(parts[1]);
        final year = int.tryParse(parts[2]);
        if (day != null && month != null && year != null) {
          return DateTime(year, month, day);
        }
      } else if (englishParts.length == 3) {
        final month = int.tryParse(englishParts[0]);
        final day = int.tryParse(englishParts[1]);
        final year = int.tryParse(englishParts[2]);
        if (day != null && month != null && year != null) {
          return DateTime(year, month, day);
        }
      }
    }
    return null;
  }

  static bool isValidDateFormat(String value) {
    if (value.isEmpty) return false;

    final parts = value.trim().split('.');
    if (parts.length != 3) return false;

    final day = int.tryParse(parts[0]);
    final month = int.tryParse(parts[1]);
    final year = int.tryParse(parts[2]);

    if (day == null || month == null || year == null) return false;
    if (day < 1 || day > 31) return false;
    if (month < 1 || month > 12) return false;
    if (year < 1000 || year > 9999) return false;

    // Check for valid days in month
    final daysInMonth = DateTime(year, month + 1, 0).day;
    if (day > daysInMonth) return false;

    return true;
  }

  static bool isIntNotZero(String value) {
    final intValue = int.tryParse(value);
    return intValue != null && intValue != 0;
  }

  static bool isDoubleNotZero(String value) {
    final doubleValue = Parser.parseDouble(value);
    return doubleValue != null && doubleValue != 0;
  }

  static bool isDoubleNotNegative(String value) {
    final doubleValue = Parser.parseDouble(value);
    return doubleValue != null && doubleValue >= 0;
  }

  static bool isDoubleGreaterZero(String? value) {
    if (value == null) return false;
    final doubleValue = Parser.parseDouble(value);
    return doubleValue != null && doubleValue > 0;
  }

  static bool isDoubleBetween(String? value, double min, double max) {
    if (value == null) return false;
    final doubleValue = Parser.parseDouble(value);
    return doubleValue != null && doubleValue >= min && doubleValue <= max;
  }

  static bool isIntGreaterZero(String value) {
    final intValue = int.tryParse(value);
    return intValue != null && intValue > 0;
  }

  static bool isTextNotEmpty(String? value) {
    if (value == null) return false;

    return value.trim().isNotEmpty;
  }
}

// USE THIS FOR FIELD VALIDATORS
class TextFieldValidator {
  const TextFieldValidator._();

  static String? isDoubleGreaterZero(String? value, String errorMsg) {
    final isValid = AppValidator.isDoubleGreaterZero(value);
    if (!isValid) {
      return errorMsg;
    }
    return null;
  }

  static String? isDoubleBetween({
    required String? value,
    required double min,
    required double max,
    required String errorMsg,
  }) {
    final isValid = AppValidator.isDoubleBetween(value, min, max);
    if (!isValid) {
      return errorMsg;
    }
    return null;
  }

  static String? isTextNotEmpty(String? value, String errorMsg) {
    final isValid = AppValidator.isTextNotEmpty(value);
    if (!isValid) {
      return errorMsg;
    }
    return null;
  }

  static String? isTextNotEmptyOrNull(String? value, String errorMsg) {
    final isValid = AppValidator.isTextNotEmptyOrNull(value);
    if (!isValid) {
      return errorMsg;
    }
    return null;
  }

  static String? isIntOrEmpty(String? value, String errorMsg) {
    if (value == null) {
      return null;
    }
    if (value.trim().isEmpty) {
      return null;
    }
    final isInt = int.tryParse(value);
    if (isInt == null) {
      return errorMsg;
    }
    return null;
  }
}

class TextInputValidator {
  const TextInputValidator._();
  static bool isNullOrEmpty(String? value) {
    return value == null || value.isEmpty;
  }

  static bool isMinLength(String? value, int minLength) {
    return value != null && value.length >= minLength;
  }

  static bool isTooLong(String? value, int maxLength) {
    return value != null && value.length > maxLength;
  }
}
