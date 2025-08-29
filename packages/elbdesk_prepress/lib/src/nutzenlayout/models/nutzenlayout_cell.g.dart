// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutzenlayout_cell.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NutzenlayoutCellImpl _$$NutzenlayoutCellImplFromJson(
        Map<String, dynamic> json) =>
    _$NutzenlayoutCellImpl(
      width: (json['width'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      laufrichtung:
          $enumDecode(_$NutzenlayoutLaufrichtungEnumMap, json['laufrichtung']),
      gapHorizontal: (json['gapHorizontal'] as num).toDouble(),
      artworkId: (json['artworkId'] as num?)?.toInt(),
      artworkMasterId: (json['artworkMasterId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$NutzenlayoutCellImplToJson(
        _$NutzenlayoutCellImpl instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'laufrichtung': instance.laufrichtung,
      'gapHorizontal': instance.gapHorizontal,
      'artworkId': instance.artworkId,
      'artworkMasterId': instance.artworkMasterId,
    };

const _$NutzenlayoutLaufrichtungEnumMap = {
  NutzenlayoutLaufrichtung.footForward: 'footForward',
  NutzenlayoutLaufrichtung.headForward: 'headForward',
  NutzenlayoutLaufrichtung.wordStartForward: 'wordStartForward',
  NutzenlayoutLaufrichtung.wordEndForward: 'wordEndForward',
  NutzenlayoutLaufrichtung.mixed: 'mixed',
};
