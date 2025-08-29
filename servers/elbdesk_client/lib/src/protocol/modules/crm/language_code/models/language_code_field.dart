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

enum LanguageCodeField implements _i1.SerializableModel {
  id,
  code,
  languageName,
  isPrimary,
  createdAt,
  createdBy,
  lastModifiedAt,
  lastModifiedBy,
  deletedAt,
  isDraft;

  static LanguageCodeField fromJson(String name) {
    switch (name) {
      case 'id':
        return LanguageCodeField.id;
      case 'code':
        return LanguageCodeField.code;
      case 'languageName':
        return LanguageCodeField.languageName;
      case 'isPrimary':
        return LanguageCodeField.isPrimary;
      case 'createdAt':
        return LanguageCodeField.createdAt;
      case 'createdBy':
        return LanguageCodeField.createdBy;
      case 'lastModifiedAt':
        return LanguageCodeField.lastModifiedAt;
      case 'lastModifiedBy':
        return LanguageCodeField.lastModifiedBy;
      case 'deletedAt':
        return LanguageCodeField.deletedAt;
      case 'isDraft':
        return LanguageCodeField.isDraft;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "LanguageCodeField"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
