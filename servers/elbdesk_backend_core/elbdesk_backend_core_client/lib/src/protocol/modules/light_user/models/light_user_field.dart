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

enum LightUserField implements _i1.SerializableModel {
  id,
  userInfoId,
  email,
  fullName,
  initials,
  imageUrl,
  createdAt,
  createdBy,
  lastModifiedAt,
  lastModifiedBy,
  deletedAt,
  isDraft;

  static LightUserField fromJson(String name) {
    switch (name) {
      case 'id':
        return LightUserField.id;
      case 'userInfoId':
        return LightUserField.userInfoId;
      case 'email':
        return LightUserField.email;
      case 'fullName':
        return LightUserField.fullName;
      case 'initials':
        return LightUserField.initials;
      case 'imageUrl':
        return LightUserField.imageUrl;
      case 'createdAt':
        return LightUserField.createdAt;
      case 'createdBy':
        return LightUserField.createdBy;
      case 'lastModifiedAt':
        return LightUserField.lastModifiedAt;
      case 'lastModifiedBy':
        return LightUserField.lastModifiedBy;
      case 'deletedAt':
        return LightUserField.deletedAt;
      case 'isDraft':
        return LightUserField.isDraft;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "LightUserField"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
