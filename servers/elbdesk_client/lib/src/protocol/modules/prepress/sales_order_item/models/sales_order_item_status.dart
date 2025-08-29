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

enum SalesOrderItemStatus implements _i1.SerializableModel {
  preperation,
  inProgress,
  onHold,
  completed,
  canceled,
  atCustomer,
  waitingForApproval,
  todo,
  inClarification;

  static SalesOrderItemStatus fromJson(String name) {
    switch (name) {
      case 'preperation':
        return SalesOrderItemStatus.preperation;
      case 'inProgress':
        return SalesOrderItemStatus.inProgress;
      case 'onHold':
        return SalesOrderItemStatus.onHold;
      case 'completed':
        return SalesOrderItemStatus.completed;
      case 'canceled':
        return SalesOrderItemStatus.canceled;
      case 'atCustomer':
        return SalesOrderItemStatus.atCustomer;
      case 'waitingForApproval':
        return SalesOrderItemStatus.waitingForApproval;
      case 'todo':
        return SalesOrderItemStatus.todo;
      case 'inClarification':
        return SalesOrderItemStatus.inClarification;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "SalesOrderItemStatus"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
