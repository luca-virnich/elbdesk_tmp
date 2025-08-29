import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';

Expression<dynamic>? dateTimeExpression(
  ColumnDateTime column,
  FilterField filterField,
) {
  final v = DateTime.tryParse(filterField.value);

  if (v == null) {
    return null;
  }

  switch (filterField.type) {
    case FilterType.equal:
      return column.between(v, v.add(const Duration(days: 1)));
    case FilterType.notEqual:
      return column.notBetween(v, v.add(const Duration(days: 1)));

    case FilterType.greaterThan:
      return column > v.add(const Duration(days: 1));
    case FilterType.greaterThanOrEqual:
      return column >= v;

    case FilterType.lessThan:
      return column < v;
    case FilterType.lessThanOrEqual:
      return column <= v.add(const Duration(days: 1));

    // TODO(all): Some of these could be implemented for a double expression
    // If we have a split input of min and max
    case FilterType.between:
    case FilterType.notBetween:
    case FilterType.inSet:
    case FilterType.notInSet:
    case FilterType.inList:
    case FilterType.notInList:
    case FilterType.like:
    case FilterType.notLike:
    case FilterType.iLike:
    case FilterType.notILike:
      return null;
  }
}
