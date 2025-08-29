import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';

Expression<dynamic>? boolExpression(
  ColumnBool column,
  FilterField filterField,
) {
  final v = bool.tryParse(filterField.value);
  if (v == null) {
    return null;
  }

  switch (filterField.type) {
    case FilterType.equal:
      return column.equals(v);
    case FilterType.notEqual:
      return column.notEquals(v);

    case FilterType.greaterThan:
    case FilterType.greaterThanOrEqual:
    case FilterType.lessThan:
    case FilterType.lessThanOrEqual:
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
