// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerCustomerImpl _$$CustomerCustomerImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerCustomerImpl(
      customerCustomerContact: json['customerCustomerContact'] == null
          ? null
          : Contact.fromJson(
              json['customerCustomerContact'] as Map<String, dynamic>),
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$$CustomerCustomerImplToJson(
        _$CustomerCustomerImpl instance) =>
    <String, dynamic>{
      'customerCustomerContact': instance.customerCustomerContact,
      'customer': instance.customer,
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'id': instance.id,
    };
