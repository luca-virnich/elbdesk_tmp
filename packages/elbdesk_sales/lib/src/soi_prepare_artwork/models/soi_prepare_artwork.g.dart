// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'soi_prepare_artwork.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SoiPrepareArtworkImpl _$$SoiPrepareArtworkImplFromJson(
        Map<String, dynamic> json) =>
    _$SoiPrepareArtworkImpl(
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
      eyeCStatus: $enumDecodeNullable(_$EyeCStatusEnumMap, json['eyeCStatus']),
      difficultyLevel: $enumDecodeNullable(
          _$SoiPrepareArtworkDifficultyLevelEnumMap, json['difficultyLevel']),
      meta: DataMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SoiPrepareArtworkImplToJson(
        _$SoiPrepareArtworkImpl instance) =>
    <String, dynamic>{
      'artwork': instance.artwork,
      'salesOrder': instance.salesOrder,
      'salesOrderItemId': instance.salesOrderItemId,
      'artworkMasterId': instance.artworkMasterId,
      'salesOrderItem': instance.salesOrderItem,
      'eyeCStatus': instance.eyeCStatus,
      'difficultyLevel': instance.difficultyLevel,
      'meta': instance.meta,
    };

const _$EyeCStatusEnumMap = {
  EyeCStatus.necessary: 'necessary',
  EyeCStatus.notNecessary: 'notNecessary',
  EyeCStatus.done: 'done',
};

const _$SoiPrepareArtworkDifficultyLevelEnumMap = {
  SoiPrepareArtworkDifficultyLevel.easy: 'easy',
  SoiPrepareArtworkDifficultyLevel.medium: 'medium',
  SoiPrepareArtworkDifficultyLevel.hard: 'hard',
};
