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

enum ServiceUserField implements _i1.SerializableModel {
  id,
  userInfoId,
  userIdentifier,
  created,
  scopeNames,
  blocked,
  serviceName,
  serviceDescription,
  isActive,
  createdAt,
  createdBy,
  lastModifiedAt,
  lastModifiedBy,
  deletedAt,
  isDraft;

  static ServiceUserField fromJson(String name) {
    switch (name) {
      case 'id':
        return ServiceUserField.id;
      case 'userInfoId':
        return ServiceUserField.userInfoId;
      case 'userIdentifier':
        return ServiceUserField.userIdentifier;
      case 'created':
        return ServiceUserField.created;
      case 'scopeNames':
        return ServiceUserField.scopeNames;
      case 'blocked':
        return ServiceUserField.blocked;
      case 'serviceName':
        return ServiceUserField.serviceName;
      case 'serviceDescription':
        return ServiceUserField.serviceDescription;
      case 'isActive':
        return ServiceUserField.isActive;
      case 'createdAt':
        return ServiceUserField.createdAt;
      case 'createdBy':
        return ServiceUserField.createdBy;
      case 'lastModifiedAt':
        return ServiceUserField.lastModifiedAt;
      case 'lastModifiedBy':
        return ServiceUserField.lastModifiedBy;
      case 'deletedAt':
        return ServiceUserField.deletedAt;
      case 'isDraft':
        return ServiceUserField.isDraft;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "ServiceUserField"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
