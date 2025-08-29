// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerImpl _$$CustomerImplFromJson(Map<String, dynamic> json) =>
    _$CustomerImpl(
      meta: DataMeta.fromJson(json['meta'] as Map<String, dynamic>),
      contact: json['contact'] == null
          ? null
          : Contact.fromJson(json['contact'] as Map<String, dynamic>),
      customId: (json['customId'] as num).toInt(),
      vatId: json['vatId'] as String,
      invoiceEmail: json['invoiceEmail'] as String,
      invoiceDeliveryMethod: $enumDecodeNullable(
          _$InvoiceDeliveryMethodEnumMap, json['invoiceDeliveryMethod']),
      salesOrderHints: CustomerSalesOrderHints.fromJson(
          json['salesOrderHints'] as Map<String, dynamic>),
      paymentCode: json['paymentCode'] == null
          ? null
          : PaymentCode.fromJson(json['paymentCode'] as Map<String, dynamic>),
      shippingMethod: json['shippingMethod'] == null
          ? null
          : ShippingMethod.fromJson(
              json['shippingMethod'] as Map<String, dynamic>),
      ftpInterfaces: (json['ftpInterfaces'] as List<dynamic>)
          .map((e) => FTPInterfaceDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      contractSovereignty: json['contractSovereignty'] == null
          ? null
          : AppClient.fromJson(
              json['contractSovereignty'] as Map<String, dynamic>),
      assignedUser: json['assignedUser'] == null
          ? null
          : LightUser.fromJson(json['assignedUser'] as Map<String, dynamic>),
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CustomerImplToJson(_$CustomerImpl instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'contact': instance.contact,
      'customId': instance.customId,
      'vatId': instance.vatId,
      'invoiceEmail': instance.invoiceEmail,
      'invoiceDeliveryMethod': instance.invoiceDeliveryMethod,
      'salesOrderHints': instance.salesOrderHints,
      'paymentCode': instance.paymentCode,
      'shippingMethod': instance.shippingMethod,
      'ftpInterfaces': instance.ftpInterfaces,
      'contractSovereignty': instance.contractSovereignty,
      'assignedUser': instance.assignedUser,
      'id': instance.id,
    };

const _$InvoiceDeliveryMethodEnumMap = {
  InvoiceDeliveryMethod.email: 'email',
  InvoiceDeliveryMethod.post: 'post',
};

_$CustomerSalesOrderHintsImpl _$$CustomerSalesOrderHintsImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerSalesOrderHintsImpl(
      firstReference: json['firstReference'] as String,
      secondReference: json['secondReference'] as String,
      orderNumber: json['orderNumber'] as String,
      keywords: json['keywords'] as String,
    );

Map<String, dynamic> _$$CustomerSalesOrderHintsImplToJson(
        _$CustomerSalesOrderHintsImpl instance) =>
    <String, dynamic>{
      'firstReference': instance.firstReference,
      'secondReference': instance.secondReference,
      'orderNumber': instance.orderNumber,
      'keywords': instance.keywords,
    };
