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

enum CompanyCompanyField implements _i1.SerializableModel {
  id,
  company,
  employee,
  jobTitle,
  department,
  active,
  note,
  createdAt,
  createdBy,
  lastModifiedAt,
  lastModifiedBy,
  deletedAt,
  isDraft;

  static CompanyCompanyField fromJson(String name) {
    switch (name) {
      case 'id':
        return CompanyCompanyField.id;
      case 'company':
        return CompanyCompanyField.company;
      case 'employee':
        return CompanyCompanyField.employee;
      case 'jobTitle':
        return CompanyCompanyField.jobTitle;
      case 'department':
        return CompanyCompanyField.department;
      case 'active':
        return CompanyCompanyField.active;
      case 'note':
        return CompanyCompanyField.note;
      case 'createdAt':
        return CompanyCompanyField.createdAt;
      case 'createdBy':
        return CompanyCompanyField.createdBy;
      case 'lastModifiedAt':
        return CompanyCompanyField.lastModifiedAt;
      case 'lastModifiedBy':
        return CompanyCompanyField.lastModifiedBy;
      case 'deletedAt':
        return CompanyCompanyField.deletedAt;
      case 'isDraft':
        return CompanyCompanyField.isDraft;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "CompanyCompanyField"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
