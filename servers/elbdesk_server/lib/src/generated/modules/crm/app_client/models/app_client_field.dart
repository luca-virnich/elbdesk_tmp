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

enum AppClientField implements _i1.SerializableModel {
  id,
  contact,
  description,
  automationEngine,
  employees,
  createdAt,
  createdBy,
  lastModifiedAt,
  lastModifiedBy,
  deletedAt,
  isDraft;

  static AppClientField fromJson(String name) {
    switch (name) {
      case 'id':
        return AppClientField.id;
      case 'contact':
        return AppClientField.contact;
      case 'description':
        return AppClientField.description;
      case 'automationEngine':
        return AppClientField.automationEngine;
      case 'employees':
        return AppClientField.employees;
      case 'createdAt':
        return AppClientField.createdAt;
      case 'createdBy':
        return AppClientField.createdBy;
      case 'lastModifiedAt':
        return AppClientField.lastModifiedAt;
      case 'lastModifiedBy':
        return AppClientField.lastModifiedBy;
      case 'deletedAt':
        return AppClientField.deletedAt;
      case 'isDraft':
        return AppClientField.isDraft;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "AppClientField"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
