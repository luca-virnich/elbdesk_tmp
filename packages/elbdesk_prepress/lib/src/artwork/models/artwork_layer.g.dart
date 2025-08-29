// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artwork_layer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArtworkLayerImpl _$$ArtworkLayerImplFromJson(Map<String, dynamic> json) =>
    _$ArtworkLayerImpl(
      layerName: json['layerName'] as String,
      layerType:
          $enumDecodeNullable(_$ArtworkLayerTypeEnumMap, json['layerType']),
      printable: json['printable'] as bool,
      locked: json['locked'] as bool,
      runtimeId: json['runtimeId'] as String,
    );

Map<String, dynamic> _$$ArtworkLayerImplToJson(_$ArtworkLayerImpl instance) =>
    <String, dynamic>{
      'layerName': instance.layerName,
      'layerType': instance.layerType,
      'printable': instance.printable,
      'locked': instance.locked,
      'runtimeId': instance.runtimeId,
    };

const _$ArtworkLayerTypeEnumMap = {
  ArtworkLayerType.none: 'none',
  ArtworkLayerType.die_cut: 'die_cut',
  ArtworkLayerType.opaque_white: 'opaque_white',
  ArtworkLayerType.varnish: 'varnish',
  ArtworkLayerType.dimensions: 'dimensions',
};
