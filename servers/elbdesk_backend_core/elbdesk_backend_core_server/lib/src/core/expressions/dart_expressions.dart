import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';

class DartExpressions {
  const DartExpressions._();

  static bool? matchesFieldDartExpression(
    FilterField filterField,
    dynamic comparsion,
  ) {
    if (comparsion is String) {
      return StringExpressions.matchesStringFilter(filterField, comparsion);
    }
    if (comparsion is num) {
      return NumExpressions.matchesNumExpression(filterField, comparsion);
    }

    if (comparsion is DateTime) {
      return DateTimeExpressions.matchesDateTimeExpression(
        filterField,
        comparsion,
      );
    }
    if (comparsion is bool) {
      return BoolExpressions.matchesBoolExpression(filterField, comparsion);
    }

    return null;
  }

  bool matchesDartExpression() {
    return true;
  }
  // String filters

  // DateTime filters
}

class StringExpressions {
  const StringExpressions._();

  static bool? matchesStringFilter(FilterField filterField, String comparison) {
    return switch (filterField.type) {
      FilterType.equal => stringEqual(filterField.value, comparison),
      FilterType.notEqual => stringNotEqual(filterField.value, comparison),
      FilterType.like => stringLike(filterField.value, comparison),
      FilterType.notLike => stringNotLike(filterField.value, comparison),
      FilterType.iLike => stringILike(filterField.value, comparison),
      FilterType.notILike => stringNotILike(filterField.value, comparison),
      FilterType.greaterThan => null,
      FilterType.greaterThanOrEqual => null,
      FilterType.lessThan => null,
      FilterType.lessThanOrEqual => null,
      FilterType.between => null,
      FilterType.notBetween => null,
      FilterType.inSet => null,
      FilterType.notInSet => null,
      FilterType.inList => null,
      FilterType.notInList => null,
    };
  }

  static bool stringEqual(String value, String comparison) =>
      value == comparison;

  static bool stringNotEqual(String value, String comparison) =>
      value != comparison;

  static bool stringLike(String value, String pattern) =>
      value.contains(pattern);

  static bool stringNotLike(String value, String pattern) =>
      !value.contains(pattern);

  static bool stringILike(String value, String pattern) =>
      value.toLowerCase().contains(pattern.toLowerCase());

  static bool stringNotILike(String value, String pattern) =>
      !value.toLowerCase().contains(pattern.toLowerCase());

  static bool stringIsIn(String value, List<String> values) =>
      values.contains(value);

  static bool stringNotIn(String value, List<String> values) =>
      !values.contains(value);

  static bool stringIsEmpty(String value) => value.isEmpty;

  static bool stringIsNotEmpty(String value) => value.isNotEmpty;
}

class NumExpressions {
  const NumExpressions._();

  static bool? matchesNumExpression(FilterField filterField, num comparison) {
    final value = num.tryParse(filterField.value);
    if (value == null) {
      return null;
    }
    return switch (filterField.type) {
      FilterType.equal => numEqual(value, comparison),
      FilterType.notEqual => numNotEqual(value, comparison),
      FilterType.greaterThan => numGreaterThan(value, comparison),
      FilterType.greaterThanOrEqual => numGreaterOrEqualThan(value, comparison),
      FilterType.lessThan => numLessThan(value, comparison),
      FilterType.lessThanOrEqual => numLessOrEqualThan(value, comparison),
      FilterType.between => null,
      FilterType.notBetween => null,
      FilterType.inSet => null,
      FilterType.notInSet => null,
      FilterType.inList => null,
      FilterType.notInList => null,
      FilterType.like => null,
      FilterType.notLike => null,
      FilterType.iLike => null,
      FilterType.notILike => null,
    };
  }

  // Num filters
  static bool numEqual(num value, num comparison) => value == comparison;

  static bool numNotEqual(num value, num comparison) => value != comparison;

  static bool numGreaterThan(num value, num comparison) => value > comparison;

  static bool numLessThan(num value, num comparison) => value < comparison;

  static bool numGreaterOrEqualThan(num value, num comparison) =>
      value >= comparison;

  static bool numLessOrEqualThan(num value, num comparison) =>
      value <= comparison;

  static bool numBetween(num value, num start, num end) =>
      value > start && value < end;

  static bool numBetweenOrEqual(num value, num start, num end) =>
      value >= start && value <= end;

  static bool numIsIn(num value, List<num> values) => values.contains(value);

  static bool numNotIn(num value, List<num> values) => !values.contains(value);

  static bool numNotBetween(num value, num start, num end) =>
      value < start || value > end;
}

class BoolExpressions {
  const BoolExpressions._();

  static bool? matchesBoolExpression(FilterField filterField, bool comparison) {
    final value = bool.tryParse(filterField.value);
    if (value == null) {
      return null;
    }
    return switch (filterField.type) {
      FilterType.equal => boolEqual(value, comparison),
      FilterType.notEqual => boolNotEqual(value, comparison),
      FilterType.like => null,
      FilterType.notLike => null,
      FilterType.iLike => null,
      FilterType.notILike => null,
      FilterType.greaterThan => null,
      FilterType.greaterThanOrEqual => null,
      FilterType.lessThan => null,
      FilterType.lessThanOrEqual => null,
      FilterType.between => null,
      FilterType.notBetween => null,
      FilterType.inSet => null,
      FilterType.notInSet => null,
      FilterType.inList => null,
      FilterType.notInList => null,
    };
  }

  static bool boolEqual(bool value, bool comparison) => value == comparison;

  static bool boolNotEqual(bool value, bool comparison) => value != comparison;
}

class DateTimeExpressions {
  const DateTimeExpressions._();

  static bool? matchesDateTimeExpression(
    FilterField filterField,
    DateTime comparison,
  ) {
    final value = DateTime.tryParse(filterField.value);
    if (value == null) {
      return null;
    }
    return switch (filterField.type) {
      FilterType.equal => dateTimeEqual(value, comparison),
      FilterType.notEqual => dateTimeNotEqual(value, comparison),
      FilterType.greaterThan => dateTimeAfter(value, comparison),
      FilterType.greaterThanOrEqual => dateTimeAfterOrEqual(value, comparison),
      FilterType.lessThan => dateTimeBefore(value, comparison),
      FilterType.lessThanOrEqual => dateTimeBeforeOrEqual(value, comparison),
      FilterType.between => null,
      FilterType.notBetween => null,
      FilterType.inSet => null,
      FilterType.notInSet => null,
      FilterType.inList => null,
      FilterType.notInList => null,
      FilterType.like => null,
      FilterType.notLike => null,
      FilterType.iLike => null,
      FilterType.notILike => null,
    };
  }

  static bool dateTimeBefore(DateTime value, DateTime comparison) =>
      value.isBefore(comparison);

  static bool dateTimeAfter(DateTime value, DateTime comparison) =>
      value.isAfter(comparison);

  static bool dateTimeBeforeOrEqual(DateTime value, DateTime comparison) =>
      value.isBefore(comparison) || value.isAtSameMomentAs(comparison);

  static bool dateTimeAfterOrEqual(DateTime value, DateTime comparison) =>
      value.isAfter(comparison) || value.isAtSameMomentAs(comparison);

  static bool dateTimeBetween(DateTime value, DateTime start, DateTime end) =>
      value.isAfter(start) && value.isBefore(end);

  static bool dateTimeBetweenOrEqual(
    DateTime value,
    DateTime start,
    DateTime end,
  ) =>
      (value.isAfter(start) || value.isAtSameMomentAs(start)) &&
      (value.isBefore(end) || value.isAtSameMomentAs(end));

  static bool dateTimeIsIn(DateTime value, List<DateTime> values) =>
      values.contains(value);

  static bool dateTimeNotIn(DateTime value, List<DateTime> values) =>
      !values.contains(value);

  static bool dateTimeEqual(DateTime value, DateTime comparison) =>
      value.isAtSameMomentAs(comparison);

  static bool dateTimeNotEqual(DateTime value, DateTime comparison) =>
      !value.isAtSameMomentAs(comparison);
}
