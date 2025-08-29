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

enum FilterFieldType implements _i1.SerializableModel {
  text,
  number,
  boolean,
  date,
  assignedUser;

  static FilterFieldType fromJson(String name) {
    switch (name) {
      case 'text':
        return FilterFieldType.text;
      case 'number':
        return FilterFieldType.number;
      case 'boolean':
        return FilterFieldType.boolean;
      case 'date':
        return FilterFieldType.date;
      case 'assignedUser':
        return FilterFieldType.assignedUser;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "FilterFieldType"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
