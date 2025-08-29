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

enum CustomerBillingCustomerField implements _i1.SerializableModel {
  id,
  customer,
  billingCustomer,
  isPrimary,
  filterByBillingCustomerIdOrFullName,
  billingCustomerCustomId,
  billingCustomerFullName,
  billingCustomerAddress,
  billingCustomerAddress2,
  billingCustomerPostCode,
  billingCustomerCity,
  billingCustomerState,
  billingCustomerPhone,
  billingCustomerEmail,
  billingCustomerMobile,
  billingCustomerCountryCode,
  billingCustomerLanguageCode;

  static CustomerBillingCustomerField fromJson(String name) {
    switch (name) {
      case 'id':
        return CustomerBillingCustomerField.id;
      case 'customer':
        return CustomerBillingCustomerField.customer;
      case 'billingCustomer':
        return CustomerBillingCustomerField.billingCustomer;
      case 'isPrimary':
        return CustomerBillingCustomerField.isPrimary;
      case 'filterByBillingCustomerIdOrFullName':
        return CustomerBillingCustomerField.filterByBillingCustomerIdOrFullName;
      case 'billingCustomerCustomId':
        return CustomerBillingCustomerField.billingCustomerCustomId;
      case 'billingCustomerFullName':
        return CustomerBillingCustomerField.billingCustomerFullName;
      case 'billingCustomerAddress':
        return CustomerBillingCustomerField.billingCustomerAddress;
      case 'billingCustomerAddress2':
        return CustomerBillingCustomerField.billingCustomerAddress2;
      case 'billingCustomerPostCode':
        return CustomerBillingCustomerField.billingCustomerPostCode;
      case 'billingCustomerCity':
        return CustomerBillingCustomerField.billingCustomerCity;
      case 'billingCustomerState':
        return CustomerBillingCustomerField.billingCustomerState;
      case 'billingCustomerPhone':
        return CustomerBillingCustomerField.billingCustomerPhone;
      case 'billingCustomerEmail':
        return CustomerBillingCustomerField.billingCustomerEmail;
      case 'billingCustomerMobile':
        return CustomerBillingCustomerField.billingCustomerMobile;
      case 'billingCustomerCountryCode':
        return CustomerBillingCustomerField.billingCustomerCountryCode;
      case 'billingCustomerLanguageCode':
        return CustomerBillingCustomerField.billingCustomerLanguageCode;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "CustomerBillingCustomerField"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
