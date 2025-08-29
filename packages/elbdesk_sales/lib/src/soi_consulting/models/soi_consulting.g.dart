// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'soi_consulting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SoiConsultingImpl _$$SoiConsultingImplFromJson(Map<String, dynamic> json) =>
    _$SoiConsultingImpl(
      salesOrder: json['salesOrder'] == null
          ? null
          : SalesOrder.fromJson(json['salesOrder'] as Map<String, dynamic>),
      salesOrderItemId: (json['salesOrderItemId'] as num).toInt(),
      salesOrderItem: json['salesOrderItem'] == null
          ? null
          : SalesOrderItem.fromJson(
              json['salesOrderItem'] as Map<String, dynamic>),
      meta: DataMeta.fromJson(json['meta'] as Map<String, dynamic>),
      text: json['text'] as String,
    );

Map<String, dynamic> _$$SoiConsultingImplToJson(_$SoiConsultingImpl instance) =>
    <String, dynamic>{
      'salesOrder': instance.salesOrder,
      'salesOrderItemId': instance.salesOrderItemId,
      'salesOrderItem': instance.salesOrderItem,
      'meta': instance.meta,
      'text': instance.text,
    };
