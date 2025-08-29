// ignore_for_file: strict_raw_type

import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_backend_core_server/src/core/expressions/bool_expression.dart';
import 'package:elbdesk_backend_core_server/src/core/expressions/datetime_expression.dart';
import 'package:elbdesk_backend_core_server/src/core/expressions/double_expression.dart';
import 'package:elbdesk_backend_core_server/src/core/expressions/int_expression.dart';
import 'package:elbdesk_backend_core_server/src/core/expressions/string_expression.dart';
import 'package:serverpod/serverpod.dart';

Expression? buildFilterExpression<T extends Table, E extends Enum>({
  required T table,
  required Filter? filter,
  required E? Function(String fieldKey)? enumFromString,
  required Column<dynamic> Function(T table, E enumValue) getDbField,
  bool hideDrafts = true,
  bool hideDeleted = true,
}) {
  Expression? expression;
  Expression? deletedAtExpression;
  Expression? isDraftExpression;

  if (hideDeleted) {
    final deletedAtEnum = enumFromString?.call('deletedAt');
    if (deletedAtEnum != null) {
      final deletedAtColumn = getDbField(table, deletedAtEnum);
      if (deletedAtColumn is ColumnDateTime) {
        deletedAtExpression = deletedAtColumn.equals(null as DateTime?);
      }
    }
  }

  if (hideDrafts) {
    final isDraftEnum = enumFromString?.call('isDraft');
    if (isDraftEnum != null) {
      final isDraftColumn = getDbField(table, isDraftEnum);
      if (isDraftColumn is ColumnBool) {
        isDraftExpression = isDraftColumn.equals(false);
      }
    }
  }

  if (filter == null) {
    if (deletedAtExpression != null && isDraftExpression != null) {
      return deletedAtExpression & isDraftExpression;
    }
    if (deletedAtExpression != null) {
      return deletedAtExpression;
    }
    if (isDraftExpression != null) {
      return isDraftExpression;
    }
    return null;
  }

  // loop through filters
  for (final filterGroup in filter.filterGroups) {
    Expression? groupExpression;
    // filter for every group
    for (final filterField in filterGroup.filters) {
      final enumField = enumFromString?.call(filterField.fieldKey);
      if (enumField == null) {
        continue;
      }

      // get the db field for filter field
      final column = getDbField(table, enumField);

      final exp = fieldExpression(column, filterField);
      if (exp == null) {
        continue;
      }
      if (groupExpression == null ||
          filterField.filterOperator == FilterOperator.none) {
        groupExpression = exp;
      } else if (filterField.filterOperator == FilterOperator.and) {
        groupExpression = groupExpression & exp;
      } else if (filterField.filterOperator == FilterOperator.or) {
        groupExpression = groupExpression | exp;
      }
    }

    if (groupExpression == null) {
      continue;
    }
    if (expression == null || filterGroup.nextOperator == FilterOperator.none) {
      expression =
          expression != null ? expression & groupExpression : groupExpression;
    } else if (filterGroup.nextOperator == FilterOperator.and) {
      expression = expression & groupExpression;
    } else if (filterGroup.nextOperator == FilterOperator.or) {
      expression = expression | groupExpression;
    }
  }

  if (deletedAtExpression != null && isDraftExpression != null) {
    return expression != null
        ? expression & deletedAtExpression & isDraftExpression
        : deletedAtExpression & isDraftExpression;
  }
  if (deletedAtExpression != null) {
    return expression != null
        ? expression & deletedAtExpression
        : deletedAtExpression;
  }
  if (isDraftExpression != null) {
    return expression != null
        ? expression & isDraftExpression
        : isDraftExpression;
  }

  return expression;
}

Expression<dynamic>? fieldExpression(
  Column<dynamic> column,
  FilterField filterField,
) {
  if (column is ColumnString) {
    return stringExpression(column, filterField);
  }
  if (column is ColumnInt) {
    return intExpression(column, filterField);
  }
  if (column is ColumnDouble) {
    return doubleExpression(column, filterField);
  }

  if (column is ColumnDateTime) {
    return dateTimeExpression(column, filterField);
  }
  if (column is ColumnBool) {
    return boolExpression(column, filterField);
  }
  if (column is ColumnDuration) {
    return null;
  }
  if (column is ColumnEnum) {
    return null;
  }

  return null;
}
