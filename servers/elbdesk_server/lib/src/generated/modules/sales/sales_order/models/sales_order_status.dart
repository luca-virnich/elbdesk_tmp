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

enum SalesOrderStatus implements _i1.SerializableModel {
  preperation,
  inProgress,
  onHold,
  completed,
  canceled;

  static SalesOrderStatus fromJson(String name) {
    switch (name) {
      case 'preperation':
        return SalesOrderStatus.preperation;
      case 'inProgress':
        return SalesOrderStatus.inProgress;
      case 'onHold':
        return SalesOrderStatus.onHold;
      case 'completed':
        return SalesOrderStatus.completed;
      case 'canceled':
        return SalesOrderStatus.canceled;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "SalesOrderStatus"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
