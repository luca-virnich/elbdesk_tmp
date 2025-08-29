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

enum DepartmentCodeField implements _i1.SerializableModel {
  id,
  code,
  description,
  createdAt,
  createdBy,
  lastModifiedAt,
  lastModifiedBy,
  deletedAt,
  isDraft;

  static DepartmentCodeField fromJson(String name) {
    switch (name) {
      case 'id':
        return DepartmentCodeField.id;
      case 'code':
        return DepartmentCodeField.code;
      case 'description':
        return DepartmentCodeField.description;
      case 'createdAt':
        return DepartmentCodeField.createdAt;
      case 'createdBy':
        return DepartmentCodeField.createdBy;
      case 'lastModifiedAt':
        return DepartmentCodeField.lastModifiedAt;
      case 'lastModifiedBy':
        return DepartmentCodeField.lastModifiedBy;
      case 'deletedAt':
        return DepartmentCodeField.deletedAt;
      case 'isDraft':
        return DepartmentCodeField.isDraft;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "DepartmentCodeField"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
