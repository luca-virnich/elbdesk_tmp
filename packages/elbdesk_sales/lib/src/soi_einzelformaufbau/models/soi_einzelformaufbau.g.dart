// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'soi_einzelformaufbau.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SoiEinzelformaufbauImpl _$$SoiEinzelformaufbauImplFromJson(
        Map<String, dynamic> json) =>
    _$SoiEinzelformaufbauImpl(
      artwork: Artwork.fromJson(json['artwork'] as Map<String, dynamic>),
      salesOrder: json['salesOrder'] == null
          ? null
          : SalesOrder.fromJson(json['salesOrder'] as Map<String, dynamic>),
      salesOrderItemId: (json['salesOrderItemId'] as num).toInt(),
      artworkMasterId: (json['artworkMasterId'] as num).toInt(),
      salesOrderItem: json['salesOrderItem'] == null
          ? null
          : SalesOrderItem.fromJson(
              json['salesOrderItem'] as Map<String, dynamic>),
      version: (json['version'] as num).toInt(),
      meta: DataMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SoiEinzelformaufbauImplToJson(
        _$SoiEinzelformaufbauImpl instance) =>
    <String, dynamic>{
      'artwork': instance.artwork,
      'salesOrder': instance.salesOrder,
      'salesOrderItemId': instance.salesOrderItemId,
      'artworkMasterId': instance.artworkMasterId,
      'salesOrderItem': instance.salesOrderItem,
      'version': instance.version,
      'meta': instance.meta,
    };
