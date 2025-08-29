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

enum AppUserField implements _i1.SerializableModel {
  id,
  userInfoId,
  userIdentifier,
  userName,
  email,
  created,
  imageUrl,
  scopeNames,
  blocked,
  firstName,
  lastName,
  fullName,
  initials,
  address,
  address2,
  postCode,
  city,
  state,
  country,
  phone,
  mobile,
  privateEmail,
  employeeNumber,
  entryDate,
  terminationDate,
  department,
  position,
  costCenter,
  isActive,
  createdAt,
  createdBy,
  lastModifiedAt,
  lastModifiedBy,
  deletedAt,
  isDraft;

  static AppUserField fromJson(String name) {
    switch (name) {
      case 'id':
        return AppUserField.id;
      case 'userInfoId':
        return AppUserField.userInfoId;
      case 'userIdentifier':
        return AppUserField.userIdentifier;
      case 'userName':
        return AppUserField.userName;
      case 'email':
        return AppUserField.email;
      case 'created':
        return AppUserField.created;
      case 'imageUrl':
        return AppUserField.imageUrl;
      case 'scopeNames':
        return AppUserField.scopeNames;
      case 'blocked':
        return AppUserField.blocked;
      case 'firstName':
        return AppUserField.firstName;
      case 'lastName':
        return AppUserField.lastName;
      case 'fullName':
        return AppUserField.fullName;
      case 'initials':
        return AppUserField.initials;
      case 'address':
        return AppUserField.address;
      case 'address2':
        return AppUserField.address2;
      case 'postCode':
        return AppUserField.postCode;
      case 'city':
        return AppUserField.city;
      case 'state':
        return AppUserField.state;
      case 'country':
        return AppUserField.country;
      case 'phone':
        return AppUserField.phone;
      case 'mobile':
        return AppUserField.mobile;
      case 'privateEmail':
        return AppUserField.privateEmail;
      case 'employeeNumber':
        return AppUserField.employeeNumber;
      case 'entryDate':
        return AppUserField.entryDate;
      case 'terminationDate':
        return AppUserField.terminationDate;
      case 'department':
        return AppUserField.department;
      case 'position':
        return AppUserField.position;
      case 'costCenter':
        return AppUserField.costCenter;
      case 'isActive':
        return AppUserField.isActive;
      case 'createdAt':
        return AppUserField.createdAt;
      case 'createdBy':
        return AppUserField.createdBy;
      case 'lastModifiedAt':
        return AppUserField.lastModifiedAt;
      case 'lastModifiedBy':
        return AppUserField.lastModifiedBy;
      case 'deletedAt':
        return AppUserField.deletedAt;
      case 'isDraft':
        return AppUserField.isDraft;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "AppUserField"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
