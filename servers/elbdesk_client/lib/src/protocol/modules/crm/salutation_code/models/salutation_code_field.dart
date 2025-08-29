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

enum SalutationCodeField implements _i1.SerializableModel {
  id,
  code,
  description,
  isPrimaryPerson,
  isPrimaryCompany,
  createdAt,
  createdBy,
  lastModifiedAt,
  lastModifiedBy,
  deletedAt,
  isDraft;

  static SalutationCodeField fromJson(String name) {
    switch (name) {
      case 'id':
        return SalutationCodeField.id;
      case 'code':
        return SalutationCodeField.code;
      case 'description':
        return SalutationCodeField.description;
      case 'isPrimaryPerson':
        return SalutationCodeField.isPrimaryPerson;
      case 'isPrimaryCompany':
        return SalutationCodeField.isPrimaryCompany;
      case 'createdAt':
        return SalutationCodeField.createdAt;
      case 'createdBy':
        return SalutationCodeField.createdBy;
      case 'lastModifiedAt':
        return SalutationCodeField.lastModifiedAt;
      case 'lastModifiedBy':
        return SalutationCodeField.lastModifiedBy;
      case 'deletedAt':
        return SalutationCodeField.deletedAt;
      case 'isDraft':
        return SalutationCodeField.isDraft;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "SalutationCodeField"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
