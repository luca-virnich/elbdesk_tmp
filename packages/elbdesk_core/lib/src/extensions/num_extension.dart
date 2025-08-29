import 'package:intl/intl.dart';

extension NumExt on num {
  String formatted(
    String localeName, {
    int fractionsWhenDoubleInt = 0,
    int fractionsWhenDoubleDouble = 2,
  }) {
    if (this is int) {
      return toString();
    }

    final isWholeNumber = (this % 1) == 0;
    if (isWholeNumber) {
      if (fractionsWhenDoubleInt == 0) {
        return NumberFormat('#,##0', localeName).format(this);
      }
      return NumberFormat('#,##0.${'0' * fractionsWhenDoubleInt}', localeName)
          .format(this);
    }

    return NumberFormat('#,##0.${'0' * fractionsWhenDoubleDouble}', localeName)
        .format(this);
  }

  double mmToInch() {
    return this / 25.4;
  }

  double mmToTeeth() {
    final result = (this / 3.175).toStringAsFixed(3);
    return double.parse(result);
  }

  double inchToMm() {
    return this * 25.4;
  }

  double inchToTeeth() {
    return this / 0.125;
  }

  double teethToMm() {
    return this * 3.175;
  }

  double teethToInch() {
    return this * 0.125;
  }
}
