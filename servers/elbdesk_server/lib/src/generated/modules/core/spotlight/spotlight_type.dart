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

enum SpotlightType implements _i1.SerializableModel {
  general,
  contact,
  newContact,
  newSalesOrder,
  salesOrder,
  customer,
  searchCustomer,
  searchContact,
  searchSalesOrder,
  settings;

  static SpotlightType fromJson(String name) {
    switch (name) {
      case 'general':
        return SpotlightType.general;
      case 'contact':
        return SpotlightType.contact;
      case 'newContact':
        return SpotlightType.newContact;
      case 'newSalesOrder':
        return SpotlightType.newSalesOrder;
      case 'salesOrder':
        return SpotlightType.salesOrder;
      case 'customer':
        return SpotlightType.customer;
      case 'searchCustomer':
        return SpotlightType.searchCustomer;
      case 'searchContact':
        return SpotlightType.searchContact;
      case 'searchSalesOrder':
        return SpotlightType.searchSalesOrder;
      case 'settings':
        return SpotlightType.settings;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "SpotlightType"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
