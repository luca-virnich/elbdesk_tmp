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

enum CustomerCustomerField implements _i1.SerializableModel {
  id,
  customer,
  customerCustomerContact,
  filterByCustomerCustomerContactIdOrFullName,
  customerCustomerContactCustomId,
  customerCustomerContactFullName,
  customerCustomerContactAddress,
  customerCustomerContactAddress2,
  customerCustomerContactPostCode,
  customerCustomerContactCity,
  customerCustomerContactState,
  customerCustomerContactPhone,
  customerCustomerContactEmail,
  customerCustomerContactMobile,
  customerCustomerContactCountryCode,
  customerCustomerContactLanguageCode,
  createdAt,
  createdBy,
  lastModifiedAt,
  lastModifiedBy,
  deletedAt,
  isDraft;

  static CustomerCustomerField fromJson(String name) {
    switch (name) {
      case 'id':
        return CustomerCustomerField.id;
      case 'customer':
        return CustomerCustomerField.customer;
      case 'customerCustomerContact':
        return CustomerCustomerField.customerCustomerContact;
      case 'filterByCustomerCustomerContactIdOrFullName':
        return CustomerCustomerField
            .filterByCustomerCustomerContactIdOrFullName;
      case 'customerCustomerContactCustomId':
        return CustomerCustomerField.customerCustomerContactCustomId;
      case 'customerCustomerContactFullName':
        return CustomerCustomerField.customerCustomerContactFullName;
      case 'customerCustomerContactAddress':
        return CustomerCustomerField.customerCustomerContactAddress;
      case 'customerCustomerContactAddress2':
        return CustomerCustomerField.customerCustomerContactAddress2;
      case 'customerCustomerContactPostCode':
        return CustomerCustomerField.customerCustomerContactPostCode;
      case 'customerCustomerContactCity':
        return CustomerCustomerField.customerCustomerContactCity;
      case 'customerCustomerContactState':
        return CustomerCustomerField.customerCustomerContactState;
      case 'customerCustomerContactPhone':
        return CustomerCustomerField.customerCustomerContactPhone;
      case 'customerCustomerContactEmail':
        return CustomerCustomerField.customerCustomerContactEmail;
      case 'customerCustomerContactMobile':
        return CustomerCustomerField.customerCustomerContactMobile;
      case 'customerCustomerContactCountryCode':
        return CustomerCustomerField.customerCustomerContactCountryCode;
      case 'customerCustomerContactLanguageCode':
        return CustomerCustomerField.customerCustomerContactLanguageCode;
      case 'createdAt':
        return CustomerCustomerField.createdAt;
      case 'createdBy':
        return CustomerCustomerField.createdBy;
      case 'lastModifiedAt':
        return CustomerCustomerField.lastModifiedAt;
      case 'lastModifiedBy':
        return CustomerCustomerField.lastModifiedBy;
      case 'deletedAt':
        return CustomerCustomerField.deletedAt;
      case 'isDraft':
        return CustomerCustomerField.isDraft;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "CustomerCustomerField"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
