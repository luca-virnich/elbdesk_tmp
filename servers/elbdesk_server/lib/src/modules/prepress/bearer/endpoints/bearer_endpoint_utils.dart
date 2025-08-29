// // ignore_for_file: strict_raw_type

// part of 'bearer_endpoint.dart';

// /// Maps the Enum values to the corresponding database fields
// Column<dynamic> Function(BearerDTOTable) _bearerDbFieldFromEnum(
//   BearerField sortFieldEnum,
// ) {
//   switch (sortFieldEnum) {
//     case BearerField.bearerName:
//       return (BearerDTOTable t) => t.bearerName;
//     case BearerField.id:
//       return (BearerDTOTable t) => t.id;
//     case BearerField.type:
//       return (BearerDTOTable t) => t.type;
//     case BearerField.description:
//       return (BearerDTOTable t) => t.description;
//     case BearerField.longText:
//       return (BearerDTOTable t) => t.longText;
//     case BearerField.costCenterCode:
//       return (BearerDTOTable t) => t.costCenterCode;
//     case BearerField.createdAt:
//       return (BearerDTOTable t) => t.createdAt;
//     case BearerField.createdBy:
//       return (BearerDTOTable t) => t.createdById;
//     case BearerField.editingSince:
//       return (BearerDTOTable t) => t.editingSince;
//     case BearerField.editingBy:
//       return (BearerDTOTable t) => t.editingById;
//     case BearerField.deletedAt:
//       return (BearerDTOTable t) => t.deletedAt;
//     case BearerField.isDraft:
//       return (BearerDTOTable t) => t.isDraft;
//   }
// }

// // Get bearers
// Future<List<BearerDTO>> _getBearers(
//   Session session, {
//   Sort? sort,
//   Filter? filter,
// }) async {
//   final sortByField = BearerField.values.firstWhereOrNull(
//     (e) => e.name == sort?.fieldKey,
//   );

//   final filterExpression = _getBearerFilter(BearerDTOTable(), filter);

//   return BearerDTO.db.find(
//     session,
//     where: filterExpression == null
//         ? (t) => t.deletedAt.equals(null)
//         : (t) => filterExpression,
//     orderBy: sortByField != null ? _bearerDbFieldFromEnum(sortByField) : null,
//     orderDescending: sort?.orderDescending ?? false,
//     include: BearerDTO.include(
//       type1: BearerType1DTO.include(),
//       type2: BearerType2DTO.include(),
//     ),
//   );
// }

// /// Returns the expression for the filter
// Expression? _getBearerFilter(BearerDTOTable t, Filter? filter) {
//   Expression? expression;
//   if (filter == null) {
//     return t.deletedAt.equals(null);
//   }

//   // loop through filters
//   for (final filterGroup in filter.filterGroups) {
//     Expression? groupExpression;
//     // filter for every group
//     for (final filterField in filterGroup.filters) {
//       final bearerField = BearerField.values.firstWhereOrNull(
//         (e) => e.name == filterField.fieldKey,
//       );
//       if (bearerField == null) {
//         continue;
//       }
//       // get the db field for filter field
//       final column = _bearerDbFieldFromEnum(bearerField)(t);

//       final exp = fieldExpression(column, filterField);
//       if (exp == null) {
//         continue;
//       }
//       if (groupExpression == null ||
//           filterField.filterOperator == FilterOperator.none) {
//         groupExpression = exp;
//       } else if (filterField.filterOperator == FilterOperator.and) {
//         groupExpression = groupExpression & exp;
//       } else if (filterField.filterOperator == FilterOperator.or) {
//         groupExpression = groupExpression | exp;
//       }
//     }

//     if (groupExpression == null) {
//       continue;
//     }
//     if (expression == null || filterGroup.nextOperator == FilterOperator.none) {
//       expression = groupExpression;
//     } else if (filterGroup.nextOperator == FilterOperator.and) {
//       expression = expression & groupExpression;
//     } else if (filterGroup.nextOperator == FilterOperator.or) {
//       expression = expression | groupExpression;
//     }
//   }
//   // Ensure the filter is always applied
//   final isDraftFilter = t.deletedAt.equals(null);
//   if (expression == null) {
//     expression = isDraftFilter;
//   } else {
//     expression = expression & isDraftFilter;
//   }

//   return expression;
// }

// // Initial bearer
// BearerDTO initialBearer(
//   int? userId,
//   String? sessionId,
// ) {
//   return BearerDTO(
//     bearerName: '',
//     description: '',
//     longText: '',
//     costCenterCode: '',
//     type: BearerType.none,
//     createdAt: DateTime.now(),
//     createdById: userId,
//     editingSession: sessionId,
//     isDraft: true,
//   );
// }
