import 'package:elbdesk_backend_core_client/elbdesk_backend_core_client.dart';

class DefaultFilterTypes {
  const DefaultFilterTypes._();
  static const List<FilterType> text = [
    FilterType.iLike,
    FilterType.equal,
    FilterType.notEqual,
    FilterType.notILike,
  ];

  static const List<FilterType> selection = [
    FilterType.equal,
    FilterType.notEqual,
  ];

  static const List<FilterType> number = [
    FilterType.equal,
    FilterType.notEqual,
    FilterType.greaterThan,
    FilterType.greaterThanOrEqual,
    FilterType.lessThan,
    FilterType.lessThanOrEqual,
  ];

  static const List<FilterType> boolean = [
    FilterType.equal,
    FilterType.notEqual,
  ];
  static const List<FilterType> dateTime = [
    FilterType.equal,
    FilterType.notEqual,
    FilterType.greaterThan,
    FilterType.greaterThanOrEqual,
    FilterType.lessThan,
    FilterType.lessThanOrEqual,
  ];
  static const List<FilterType> assignedUser = [
    FilterType.equal,
    FilterType.notEqual,
  ];
  static const List<FilterType> enumeration = [
    FilterType.equal,
    FilterType.notEqual,
  ];

  static const List<FilterType> noFilter = [];
}
