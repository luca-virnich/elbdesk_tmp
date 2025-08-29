// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'soi_request_artwork_approval.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SoiRequestArtworkApprovalImpl _$$SoiRequestArtworkApprovalImplFromJson(
        Map<String, dynamic> json) =>
    _$SoiRequestArtworkApprovalImpl(
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
      type: $enumDecodeNullable(
          _$SoiRequestArtworkApprovalTypeEnumMap, json['type']),
      meta: DataMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SoiRequestArtworkApprovalImplToJson(
        _$SoiRequestArtworkApprovalImpl instance) =>
    <String, dynamic>{
      'artwork': instance.artwork,
      'salesOrder': instance.salesOrder,
      'salesOrderItemId': instance.salesOrderItemId,
      'artworkMasterId': instance.artworkMasterId,
      'salesOrderItem': instance.salesOrderItem,
      'type': instance.type,
      'meta': instance.meta,
    };

const _$SoiRequestArtworkApprovalTypeEnumMap = {
  SoiRequestArtworkApprovalType.digital: 'digital',
  SoiRequestArtworkApprovalType.proof: 'proof',
};
