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

enum CustomerField implements _i1.SerializableModel {
  id,
  type,
  customerName,
  address,
  address2,
  address3,
  postCode,
  city,
  state,
  selectCustomer,
  country,
  phone,
  mobile,
  email,
  website,
  customId,
  customIdString,
  assignedUser,
  vatId,
  paymentCode,
  invoiceEmail,
  invoiceDeliveryMethod,
  shippingMethod,
  contractSovereignty,
  filterByIdOrName,
  createdAt,
  createdBy,
  lastModifiedAt,
  lastModifiedBy,
  deletedAt,
  isDraft;

  static CustomerField fromJson(String name) {
    switch (name) {
      case 'id':
        return CustomerField.id;
      case 'type':
        return CustomerField.type;
      case 'customerName':
        return CustomerField.customerName;
      case 'address':
        return CustomerField.address;
      case 'address2':
        return CustomerField.address2;
      case 'address3':
        return CustomerField.address3;
      case 'postCode':
        return CustomerField.postCode;
      case 'city':
        return CustomerField.city;
      case 'state':
        return CustomerField.state;
      case 'selectCustomer':
        return CustomerField.selectCustomer;
      case 'country':
        return CustomerField.country;
      case 'phone':
        return CustomerField.phone;
      case 'mobile':
        return CustomerField.mobile;
      case 'email':
        return CustomerField.email;
      case 'website':
        return CustomerField.website;
      case 'customId':
        return CustomerField.customId;
      case 'customIdString':
        return CustomerField.customIdString;
      case 'assignedUser':
        return CustomerField.assignedUser;
      case 'vatId':
        return CustomerField.vatId;
      case 'paymentCode':
        return CustomerField.paymentCode;
      case 'invoiceEmail':
        return CustomerField.invoiceEmail;
      case 'invoiceDeliveryMethod':
        return CustomerField.invoiceDeliveryMethod;
      case 'shippingMethod':
        return CustomerField.shippingMethod;
      case 'contractSovereignty':
        return CustomerField.contractSovereignty;
      case 'filterByIdOrName':
        return CustomerField.filterByIdOrName;
      case 'createdAt':
        return CustomerField.createdAt;
      case 'createdBy':
        return CustomerField.createdBy;
      case 'lastModifiedAt':
        return CustomerField.lastModifiedAt;
      case 'lastModifiedBy':
        return CustomerField.lastModifiedBy;
      case 'deletedAt':
        return CustomerField.deletedAt;
      case 'isDraft':
        return CustomerField.isDraft;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "CustomerField"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
