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

enum CustomerShippingContactField implements _i1.SerializableModel {
  id,
  customer,
  shippingContact,
  filterByShippingContactIdOrFullName,
  shippingContactCustomId,
  shippingContactFullName,
  shippingContactAddress,
  shippingContactAddress2,
  shippingContactPostCode,
  shippingContactCity,
  shippingContactState,
  shippingContactPhone,
  shippingContactEmail,
  shippingContactMobile,
  shippingContactCountryCode,
  shippingContactLanguageCode;

  static CustomerShippingContactField fromJson(String name) {
    switch (name) {
      case 'id':
        return CustomerShippingContactField.id;
      case 'customer':
        return CustomerShippingContactField.customer;
      case 'shippingContact':
        return CustomerShippingContactField.shippingContact;
      case 'filterByShippingContactIdOrFullName':
        return CustomerShippingContactField.filterByShippingContactIdOrFullName;
      case 'shippingContactCustomId':
        return CustomerShippingContactField.shippingContactCustomId;
      case 'shippingContactFullName':
        return CustomerShippingContactField.shippingContactFullName;
      case 'shippingContactAddress':
        return CustomerShippingContactField.shippingContactAddress;
      case 'shippingContactAddress2':
        return CustomerShippingContactField.shippingContactAddress2;
      case 'shippingContactPostCode':
        return CustomerShippingContactField.shippingContactPostCode;
      case 'shippingContactCity':
        return CustomerShippingContactField.shippingContactCity;
      case 'shippingContactState':
        return CustomerShippingContactField.shippingContactState;
      case 'shippingContactPhone':
        return CustomerShippingContactField.shippingContactPhone;
      case 'shippingContactEmail':
        return CustomerShippingContactField.shippingContactEmail;
      case 'shippingContactMobile':
        return CustomerShippingContactField.shippingContactMobile;
      case 'shippingContactCountryCode':
        return CustomerShippingContactField.shippingContactCountryCode;
      case 'shippingContactLanguageCode':
        return CustomerShippingContactField.shippingContactLanguageCode;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "CustomerShippingContactField"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
