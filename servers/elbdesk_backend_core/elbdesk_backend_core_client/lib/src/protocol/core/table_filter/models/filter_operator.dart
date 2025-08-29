/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

enum FilterOperator implements _i1.SerializableModel {
  and,
  or,
  none;

  static FilterOperator fromJson(String name) {
    switch (name) {
      case 'and':
        return FilterOperator.and;
      case 'or':
        return FilterOperator.or;
      case 'none':
        return FilterOperator.none;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "FilterOperator"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
