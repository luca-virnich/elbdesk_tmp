import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';

/// Returns the [Expression] for the given [FilterField].
///
/// The like expressions have an added "%" so that the user doesn't have to
/// enter it himself
Expression<dynamic>? stringExpression(
  ColumnString column,
  FilterField filterField,
) {
  switch (filterField.type) {
    case FilterType.equal:
      return column.equals(filterField.value);
    case FilterType.notEqual:
      return column.notEquals(filterField.value);
    case FilterType.like:
      return column.like('%${filterField.value}%');
    case FilterType.notLike:
      return column.notLike('%${filterField.value}%');
    case FilterType.iLike:
      return column.ilike('%${filterField.value}%');
    case FilterType.notILike:
      return column.notIlike('%${filterField.value}%');
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
      return null;
  }
}
