// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_order_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SalesOrderItemImpl _$$SalesOrderItemImplFromJson(Map<String, dynamic> json) =>
    _$SalesOrderItemImpl(
      id: (json['id'] as num).toInt(),
      type: $enumDecode(_$SalesOrderItemTypeEnumMap, json['type']),
      status: $enumDecode(_$SalesOrderItemStatusEnumMap, json['status']),
      salesOrderId: (json['salesOrderId'] as num).toInt(),
      salesOrder: json['salesOrder'] == null
          ? null
          : SalesOrder.fromJson(json['salesOrder'] as Map<String, dynamic>),
      soiTypePrimaryKey: (json['soiTypePrimaryKey'] as num).toInt(),
      assignedUser: json['assignedUser'] == null
          ? null
          : LightUser.fromJson(json['assignedUser'] as Map<String, dynamic>),
      description: json['description'] as String,
      billableTime: (json['billableTime'] as num).toInt(),
      customerId: (json['customerId'] as num).toInt(),
      deadline: json['deadline'] == null
          ? null
          : DateTime.parse(json['deadline'] as String),
    );

Map<String, dynamic> _$$SalesOrderItemImplToJson(
        _$SalesOrderItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'status': instance.status,
      'salesOrderId': instance.salesOrderId,
      'salesOrder': instance.salesOrder,
      'soiTypePrimaryKey': instance.soiTypePrimaryKey,
      'assignedUser': instance.assignedUser,
      'description': instance.description,
      'billableTime': instance.billableTime,
      'customerId': instance.customerId,
      'deadline': instance.deadline?.toIso8601String(),
    };

const _$SalesOrderItemTypeEnumMap = {
  SalesOrderItemType.prepareArtwork: 'prepareArtwork',
  SalesOrderItemType.requestArtworkApproval: 'requestArtworkApproval',
  SalesOrderItemType.einzelformaufbau: 'einzelformaufbau',
  SalesOrderItemType.consulting: 'consulting',
};

const _$SalesOrderItemStatusEnumMap = {
  SalesOrderItemStatus.preperation: 'preperation',
  SalesOrderItemStatus.inProgress: 'inProgress',
  SalesOrderItemStatus.onHold: 'onHold',
  SalesOrderItemStatus.completed: 'completed',
  SalesOrderItemStatus.canceled: 'canceled',
  SalesOrderItemStatus.atCustomer: 'atCustomer',
  SalesOrderItemStatus.waitingForApproval: 'waitingForApproval',
  SalesOrderItemStatus.todo: 'todo',
  SalesOrderItemStatus.inClarification: 'inClarification',
};
