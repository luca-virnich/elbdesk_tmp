// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SalesOrderImpl _$$SalesOrderImplFromJson(Map<String, dynamic> json) =>
    _$SalesOrderImpl(
      description: json['description'] as String,
      customId: (json['customId'] as num).toInt(),
      orderDate: json['orderDate'] == null
          ? null
          : DateTime.parse(json['orderDate'] as String),
      assignedUser: json['assignedUser'] == null
          ? null
          : LightUser.fromJson(json['assignedUser'] as Map<String, dynamic>),
      keywords: json['keywords'] as String,
      orderNumber: json['orderNumber'] as String,
      status: $enumDecode(_$SalesOrderStatusEnumMap, json['status']),
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
      customerContactPerson: json['customerContactPerson'] == null
          ? null
          : Contact.fromJson(
              json['customerContactPerson'] as Map<String, dynamic>),
      customerCustomerContactPerson: json['customerCustomerContactPerson'] ==
              null
          ? null
          : Contact.fromJson(
              json['customerCustomerContactPerson'] as Map<String, dynamic>),
      customerCustomer: json['customerCustomer'] == null
          ? null
          : CustomerCustomer.fromJson(
              json['customerCustomer'] as Map<String, dynamic>),
      customerFirstReference: json['customerFirstReference'] as String,
      customerSecondReference: json['customerSecondReference'] as String,
      customerCustomerReference: json['customerCustomerReference'] as String,
      shippingAddress: json['shippingAddress'] == null
          ? null
          : Contact.fromJson(json['shippingAddress'] as Map<String, dynamic>),
      billingAddress: json['billingAddress'] == null
          ? null
          : Customer.fromJson(json['billingAddress'] as Map<String, dynamic>),
      meta: DataMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SalesOrderImplToJson(_$SalesOrderImpl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'customId': instance.customId,
      'orderDate': instance.orderDate?.toIso8601String(),
      'assignedUser': instance.assignedUser,
      'keywords': instance.keywords,
      'orderNumber': instance.orderNumber,
      'status': instance.status,
      'customer': instance.customer,
      'customerContactPerson': instance.customerContactPerson,
      'customerCustomerContactPerson': instance.customerCustomerContactPerson,
      'customerCustomer': instance.customerCustomer,
      'customerFirstReference': instance.customerFirstReference,
      'customerSecondReference': instance.customerSecondReference,
      'customerCustomerReference': instance.customerCustomerReference,
      'shippingAddress': instance.shippingAddress,
      'billingAddress': instance.billingAddress,
      'meta': instance.meta,
    };

const _$SalesOrderStatusEnumMap = {
  SalesOrderStatus.preperation: 'preperation',
  SalesOrderStatus.inProgress: 'inProgress',
  SalesOrderStatus.onHold: 'onHold',
  SalesOrderStatus.completed: 'completed',
  SalesOrderStatus.canceled: 'canceled',
};
