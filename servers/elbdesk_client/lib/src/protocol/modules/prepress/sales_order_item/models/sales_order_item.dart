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
import '../../../../modules/sales/sales_order/models/sales_order.dart' as _i2;
import 'package:elbdesk_backend_core_client/elbdesk_backend_core_client.dart'
    as _i3;

abstract class SalesOrderItemDTO implements _i1.SerializableModel {
  SalesOrderItemDTO._({
    this.id,
    required this.salesOrderId,
    this.salesOrder,
    this.deadline,
    required this.description,
    required this.billableTime,
    required this.customerId,
    required this.status,
    required this.type,
    this.soiTypePrimaryKey,
    this.assignedUserId,
    this.assignedUser,
  });

  factory SalesOrderItemDTO({
    int? id,
    required int salesOrderId,
    _i2.SalesOrderDTO? salesOrder,
    DateTime? deadline,
    required String description,
    required int billableTime,
    required int customerId,
    required String status,
    required String type,
    int? soiTypePrimaryKey,
    int? assignedUserId,
    _i3.LightUserDTO? assignedUser,
  }) = _SalesOrderItemDTOImpl;

  factory SalesOrderItemDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return SalesOrderItemDTO(
      id: jsonSerialization['id'] as int?,
      salesOrderId: jsonSerialization['salesOrderId'] as int,
      salesOrder: jsonSerialization['salesOrder'] == null
          ? null
          : _i2.SalesOrderDTO.fromJson(
              (jsonSerialization['salesOrder'] as Map<String, dynamic>)),
      deadline: jsonSerialization['deadline'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['deadline']),
      description: jsonSerialization['description'] as String,
      billableTime: jsonSerialization['billableTime'] as int,
      customerId: jsonSerialization['customerId'] as int,
      status: jsonSerialization['status'] as String,
      type: jsonSerialization['type'] as String,
      soiTypePrimaryKey: jsonSerialization['soiTypePrimaryKey'] as int?,
      assignedUserId: jsonSerialization['assignedUserId'] as int?,
      assignedUser: jsonSerialization['assignedUser'] == null
          ? null
          : _i3.LightUserDTO.fromJson(
              (jsonSerialization['assignedUser'] as Map<String, dynamic>)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int salesOrderId;

  _i2.SalesOrderDTO? salesOrder;

  DateTime? deadline;

  String description;

  int billableTime;

  int customerId;

  String status;

  String type;

  int? soiTypePrimaryKey;

  int? assignedUserId;

  _i3.LightUserDTO? assignedUser;

  /// Returns a shallow copy of this [SalesOrderItemDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SalesOrderItemDTO copyWith({
    int? id,
    int? salesOrderId,
    _i2.SalesOrderDTO? salesOrder,
    DateTime? deadline,
    String? description,
    int? billableTime,
    int? customerId,
    String? status,
    String? type,
    int? soiTypePrimaryKey,
    int? assignedUserId,
    _i3.LightUserDTO? assignedUser,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'salesOrderId': salesOrderId,
      if (salesOrder != null) 'salesOrder': salesOrder?.toJson(),
      if (deadline != null) 'deadline': deadline?.toJson(),
      'description': description,
      'billableTime': billableTime,
      'customerId': customerId,
      'status': status,
      'type': type,
      if (soiTypePrimaryKey != null) 'soiTypePrimaryKey': soiTypePrimaryKey,
      if (assignedUserId != null) 'assignedUserId': assignedUserId,
      if (assignedUser != null) 'assignedUser': assignedUser?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SalesOrderItemDTOImpl extends SalesOrderItemDTO {
  _SalesOrderItemDTOImpl({
    int? id,
    required int salesOrderId,
    _i2.SalesOrderDTO? salesOrder,
    DateTime? deadline,
    required String description,
    required int billableTime,
    required int customerId,
    required String status,
    required String type,
    int? soiTypePrimaryKey,
    int? assignedUserId,
    _i3.LightUserDTO? assignedUser,
  }) : super._(
          id: id,
          salesOrderId: salesOrderId,
          salesOrder: salesOrder,
          deadline: deadline,
          description: description,
          billableTime: billableTime,
          customerId: customerId,
          status: status,
          type: type,
          soiTypePrimaryKey: soiTypePrimaryKey,
          assignedUserId: assignedUserId,
          assignedUser: assignedUser,
        );

  /// Returns a shallow copy of this [SalesOrderItemDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SalesOrderItemDTO copyWith({
    Object? id = _Undefined,
    int? salesOrderId,
    Object? salesOrder = _Undefined,
    Object? deadline = _Undefined,
    String? description,
    int? billableTime,
    int? customerId,
    String? status,
    String? type,
    Object? soiTypePrimaryKey = _Undefined,
    Object? assignedUserId = _Undefined,
    Object? assignedUser = _Undefined,
  }) {
    return SalesOrderItemDTO(
      id: id is int? ? id : this.id,
      salesOrderId: salesOrderId ?? this.salesOrderId,
      salesOrder: salesOrder is _i2.SalesOrderDTO?
          ? salesOrder
          : this.salesOrder?.copyWith(),
      deadline: deadline is DateTime? ? deadline : this.deadline,
      description: description ?? this.description,
      billableTime: billableTime ?? this.billableTime,
      customerId: customerId ?? this.customerId,
      status: status ?? this.status,
      type: type ?? this.type,
      soiTypePrimaryKey: soiTypePrimaryKey is int?
          ? soiTypePrimaryKey
          : this.soiTypePrimaryKey,
      assignedUserId:
          assignedUserId is int? ? assignedUserId : this.assignedUserId,
      assignedUser: assignedUser is _i3.LightUserDTO?
          ? assignedUser
          : this.assignedUser?.copyWith(),
    );
  }
}
