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

enum SalesOrderItemField implements _i1.SerializableModel {
  salesOrderId,
  salesOrderCustomId,
  description,
  billableTime,
  status,
  type,
  soiTypePrimaryKey,
  assignedUser,
  customerName,
  customId,
  deadline;

  static SalesOrderItemField fromJson(String name) {
    switch (name) {
      case 'salesOrderId':
        return SalesOrderItemField.salesOrderId;
      case 'salesOrderCustomId':
        return SalesOrderItemField.salesOrderCustomId;
      case 'description':
        return SalesOrderItemField.description;
      case 'billableTime':
        return SalesOrderItemField.billableTime;
      case 'status':
        return SalesOrderItemField.status;
      case 'type':
        return SalesOrderItemField.type;
      case 'soiTypePrimaryKey':
        return SalesOrderItemField.soiTypePrimaryKey;
      case 'assignedUser':
        return SalesOrderItemField.assignedUser;
      case 'customerName':
        return SalesOrderItemField.customerName;
      case 'customId':
        return SalesOrderItemField.customId;
      case 'deadline':
        return SalesOrderItemField.deadline;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "SalesOrderItemField"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
