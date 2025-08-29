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

enum SalesOrderStatusField implements _i1.SerializableModel {
  id,
  description,
  color,
  orderId,
  createdAt,
  createdBy,
  lastModifiedAt,
  lastModifiedBy,
  deletedAt,
  isDraft;

  static SalesOrderStatusField fromJson(String name) {
    switch (name) {
      case 'id':
        return SalesOrderStatusField.id;
      case 'description':
        return SalesOrderStatusField.description;
      case 'color':
        return SalesOrderStatusField.color;
      case 'orderId':
        return SalesOrderStatusField.orderId;
      case 'createdAt':
        return SalesOrderStatusField.createdAt;
      case 'createdBy':
        return SalesOrderStatusField.createdBy;
      case 'lastModifiedAt':
        return SalesOrderStatusField.lastModifiedAt;
      case 'lastModifiedBy':
        return SalesOrderStatusField.lastModifiedBy;
      case 'deletedAt':
        return SalesOrderStatusField.deletedAt;
      case 'isDraft':
        return SalesOrderStatusField.isDraft;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "SalesOrderStatusField"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
