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

enum ContactField implements _i1.SerializableModel {
  id,
  type,
  firstName,
  lastName,
  fullName,
  birthDate,
  importantNote,
  address,
  address2,
  address3,
  postCode,
  city,
  state,
  customId,
  customIdString,
  countryCode,
  languageCode,
  salutationCode,
  phone,
  mobile,
  email,
  website,
  customer,
  customerId,
  customerCustomId,
  createdAt,
  createdBy,
  lastModifiedAt,
  lastModifiedBy,
  selectContact,
  filterByIdOrFullName,
  actions,
  deletedAt,
  isDraft;

  static ContactField fromJson(String name) {
    switch (name) {
      case 'id':
        return ContactField.id;
      case 'type':
        return ContactField.type;
      case 'firstName':
        return ContactField.firstName;
      case 'lastName':
        return ContactField.lastName;
      case 'fullName':
        return ContactField.fullName;
      case 'birthDate':
        return ContactField.birthDate;
      case 'importantNote':
        return ContactField.importantNote;
      case 'address':
        return ContactField.address;
      case 'address2':
        return ContactField.address2;
      case 'address3':
        return ContactField.address3;
      case 'postCode':
        return ContactField.postCode;
      case 'city':
        return ContactField.city;
      case 'state':
        return ContactField.state;
      case 'customId':
        return ContactField.customId;
      case 'customIdString':
        return ContactField.customIdString;
      case 'countryCode':
        return ContactField.countryCode;
      case 'languageCode':
        return ContactField.languageCode;
      case 'salutationCode':
        return ContactField.salutationCode;
      case 'phone':
        return ContactField.phone;
      case 'mobile':
        return ContactField.mobile;
      case 'email':
        return ContactField.email;
      case 'website':
        return ContactField.website;
      case 'customer':
        return ContactField.customer;
      case 'customerId':
        return ContactField.customerId;
      case 'customerCustomId':
        return ContactField.customerCustomId;
      case 'createdAt':
        return ContactField.createdAt;
      case 'createdBy':
        return ContactField.createdBy;
      case 'lastModifiedAt':
        return ContactField.lastModifiedAt;
      case 'lastModifiedBy':
        return ContactField.lastModifiedBy;
      case 'selectContact':
        return ContactField.selectContact;
      case 'filterByIdOrFullName':
        return ContactField.filterByIdOrFullName;
      case 'actions':
        return ContactField.actions;
      case 'deletedAt':
        return ContactField.deletedAt;
      case 'isDraft':
        return ContactField.isDraft;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "ContactField"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
