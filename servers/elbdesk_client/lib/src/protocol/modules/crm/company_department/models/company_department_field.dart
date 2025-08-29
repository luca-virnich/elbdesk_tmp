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

enum CompanyDepartmentField implements _i1.SerializableModel {
  id,
  name,
  description,
  createdAt,
  createdBy,
  lastModifiedAt,
  lastModifiedBy,
  isDraft,
  deletedAt;

  static CompanyDepartmentField fromJson(String name) {
    switch (name) {
      case 'id':
        return CompanyDepartmentField.id;
      case 'name':
        return CompanyDepartmentField.name;
      case 'description':
        return CompanyDepartmentField.description;
      case 'createdAt':
        return CompanyDepartmentField.createdAt;
      case 'createdBy':
        return CompanyDepartmentField.createdBy;
      case 'lastModifiedAt':
        return CompanyDepartmentField.lastModifiedAt;
      case 'lastModifiedBy':
        return CompanyDepartmentField.lastModifiedBy;
      case 'isDraft':
        return CompanyDepartmentField.isDraft;
      case 'deletedAt':
        return CompanyDepartmentField.deletedAt;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "CompanyDepartmentField"');
    }
  }

  @override
  String toJson() => this.name;
  @override
  String toString() => this.name;
}
