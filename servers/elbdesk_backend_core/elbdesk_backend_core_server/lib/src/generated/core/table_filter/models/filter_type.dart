/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

enum FilterType implements _i1.SerializableModel {
  equal,
  notEqual,
  greaterThan,
  greaterThanOrEqual,
  lessThan,
  lessThanOrEqual,
  between,
  notBetween,
  inSet,
  notInSet,
  inList,
  notInList,
  like,
  notLike,
  iLike,
  notILike;

  static FilterType fromJson(String name) {
    switch (name) {
      case 'equal':
        return FilterType.equal;
      case 'notEqual':
        return FilterType.notEqual;
      case 'greaterThan':
        return FilterType.greaterThan;
      case 'greaterThanOrEqual':
        return FilterType.greaterThanOrEqual;
      case 'lessThan':
        return FilterType.lessThan;
      case 'lessThanOrEqual':
        return FilterType.lessThanOrEqual;
      case 'between':
        return FilterType.between;
      case 'notBetween':
        return FilterType.notBetween;
      case 'inSet':
        return FilterType.inSet;
      case 'notInSet':
        return FilterType.notInSet;
      case 'inList':
        return FilterType.inList;
      case 'notInList':
        return FilterType.notInList;
      case 'like':
        return FilterType.like;
      case 'notLike':
        return FilterType.notLike;
      case 'iLike':
        return FilterType.iLike;
      case 'notILike':
        return FilterType.notILike;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "FilterType"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
