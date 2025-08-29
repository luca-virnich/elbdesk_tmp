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

enum SalesOrderField implements _i1.SerializableModel {
  description,
  orderDate,
  keywords,
  status,
  orderNumber,
  billingAddress,
  assignedUser,
  customerId,
  customerName,
  customerContactPerson,
  customerCustomerContactPerson,
  customerCustomer,
  customerFirstReference,
  customerSecondReference,
  customerCustomerReference,
  shippingAddress,
  customId,
  customIdString,
  filterByIdOrName,
  createdAt,
  createdBy,
  lastModifiedAt,
  lastModifiedBy,
  deletedAt,
  isDraft;

  static SalesOrderField fromJson(String name) {
    switch (name) {
      case 'description':
        return SalesOrderField.description;
      case 'orderDate':
        return SalesOrderField.orderDate;
      case 'keywords':
        return SalesOrderField.keywords;
      case 'status':
        return SalesOrderField.status;
      case 'orderNumber':
        return SalesOrderField.orderNumber;
      case 'billingAddress':
        return SalesOrderField.billingAddress;
      case 'assignedUser':
        return SalesOrderField.assignedUser;
      case 'customerId':
        return SalesOrderField.customerId;
      case 'customerName':
        return SalesOrderField.customerName;
      case 'customerContactPerson':
        return SalesOrderField.customerContactPerson;
      case 'customerCustomerContactPerson':
        return SalesOrderField.customerCustomerContactPerson;
      case 'customerCustomer':
        return SalesOrderField.customerCustomer;
      case 'customerFirstReference':
        return SalesOrderField.customerFirstReference;
      case 'customerSecondReference':
        return SalesOrderField.customerSecondReference;
      case 'customerCustomerReference':
        return SalesOrderField.customerCustomerReference;
      case 'shippingAddress':
        return SalesOrderField.shippingAddress;
      case 'customId':
        return SalesOrderField.customId;
      case 'customIdString':
        return SalesOrderField.customIdString;
      case 'filterByIdOrName':
        return SalesOrderField.filterByIdOrName;
      case 'createdAt':
        return SalesOrderField.createdAt;
      case 'createdBy':
        return SalesOrderField.createdBy;
      case 'lastModifiedAt':
        return SalesOrderField.lastModifiedAt;
      case 'lastModifiedBy':
        return SalesOrderField.lastModifiedBy;
      case 'deletedAt':
        return SalesOrderField.deletedAt;
      case 'isDraft':
        return SalesOrderField.isDraft;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "SalesOrderField"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
