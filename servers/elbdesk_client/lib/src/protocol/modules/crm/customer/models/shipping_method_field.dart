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

enum ShippingMethodField implements _i1.SerializableModel {
  id,
  code,
  description,
  isActive,
  createdAt,
  createdBy,
  lastModifiedAt,
  lastModifiedBy,
  deletedAt,
  isDraft;

  static ShippingMethodField fromJson(String name) {
    switch (name) {
      case 'id':
        return ShippingMethodField.id;
      case 'code':
        return ShippingMethodField.code;
      case 'description':
        return ShippingMethodField.description;
      case 'isActive':
        return ShippingMethodField.isActive;
      case 'createdAt':
        return ShippingMethodField.createdAt;
      case 'createdBy':
        return ShippingMethodField.createdBy;
      case 'lastModifiedAt':
        return ShippingMethodField.lastModifiedAt;
      case 'lastModifiedBy':
        return ShippingMethodField.lastModifiedBy;
      case 'deletedAt':
        return ShippingMethodField.deletedAt;
      case 'isDraft':
        return ShippingMethodField.isDraft;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "ShippingMethodField"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
