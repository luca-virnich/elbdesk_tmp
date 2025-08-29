class LocalFilter {
  const LocalFilter._();
  // search string value with case insensitive/sensitive option
  bool searchString(String value, String search, bool caseSensitive) {
    if (caseSensitive) {
      return value.contains(search);
    }
    return value.toLowerCase().contains(search.toLowerCase());
  }
}

class FilterOperation {
  FilterOperation._();

  static bool stringContains(String value, String search, bool caseSensitive) {
    if (caseSensitive) {
      return value.contains(search);
    }
    return value.toLowerCase().contains(search.toLowerCase());
  }

  static bool stringEquals(String value, String search, bool caseSensitive) {
    if (caseSensitive) {
      return value == search;
    }
    return value.toLowerCase() == search.toLowerCase();
  }

  static bool stringDoesNotContain(
    String value,
    String search,
    bool caseSensitive,
  ) {
    if (caseSensitive) {
      return !value.contains(search);
    }
    return !value.toLowerCase().contains(search.toLowerCase());
  }

  static bool stringNotEquals(String value, String search, bool caseSensitive) {
    if (caseSensitive) {
      return value != search;
    }
    return value.toLowerCase() != search.toLowerCase();
  }

  static bool isBeforeDateTimeOrEqual(DateTime value, DateTime comparison) {
    return value.isBefore(comparison) || value.isAtSameMomentAs(comparison);
  }

  static bool isAfterDateTimeOrEqual(DateTime value, DateTime comparison) {
    return value.isAfter(comparison) || value.isAtSameMomentAs(comparison);
  }

  static bool isAfterDateTime(DateTime value, DateTime comparison) {
    return value.isAfter(comparison);
  }

  static bool isBeforeDateTime(DateTime value, DateTime comparison) {
    return value.isBefore(comparison);
  }

  static bool isBetweenOrEqualDateTime(
    DateTime value,
    DateTime start,
    DateTime end,
  ) {
    return (value.isAfter(start) || value.isAtSameMomentAs(start)) &&
        (value.isBefore(end) || value.isAtSameMomentAs(end));
  }
}
