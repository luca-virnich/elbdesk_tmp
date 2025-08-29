// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artwork_color.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArtworkColorImpl _$$ArtworkColorImplFromJson(Map<String, dynamic> json) =>
    _$ArtworkColorImpl(
      colorName: json['colorName'] as String,
      shortName: json['shortName'] as String,
      l: (json['l'] as num).toDouble(),
      a: (json['a'] as num).toDouble(),
      b: (json['b'] as num).toDouble(),
      color: const ColorConverter().fromJson(json['color'] as String?),
      colorPalette: json['colorPalette'] == null
          ? null
          : PrepressColorPalette.fromJson(
              json['colorPalette'] as Map<String, dynamic>),
      colorType:
          $enumDecodeNullable(_$ArtworkColorTypeEnumMap, json['colorType']),
      colorSpecType: $enumDecodeNullable(
          _$ArtworkColorSpecTypeEnumMap, json['colorSpecType']),
      verarbeitungsEbene: $enumDecodeNullable(
          _$ArtworkVerarbeitungsebeneTypeEnumMap, json['verarbeitungsEbene']),
      printProcess: $enumDecodeNullable(
          _$ArtworkColorPrintProcessTypeEnumMap, json['printProcess']),
      screenPointForm: json['screenPointForm'] as String?,
      screenLineature: (json['screenLineature'] as num?)?.toDouble(),
      screenAngle: (json['screenAngle'] as num?)?.toDouble(),
      boost: (json['boost'] as num?)?.toDouble(),
      customText: json['customText'] as String?,
      meta: DataMeta.fromJson(json['meta'] as Map<String, dynamic>),
      runtimeId: json['runtimeId'] as String,
    );

Map<String, dynamic> _$$ArtworkColorImplToJson(_$ArtworkColorImpl instance) =>
    <String, dynamic>{
      'colorName': instance.colorName,
      'shortName': instance.shortName,
      'l': instance.l,
      'a': instance.a,
      'b': instance.b,
      'color': const ColorConverter().toJson(instance.color),
      'colorPalette': instance.colorPalette,
      'colorType': instance.colorType,
      'colorSpecType': instance.colorSpecType,
      'verarbeitungsEbene': instance.verarbeitungsEbene,
      'printProcess': instance.printProcess,
      'screenPointForm': instance.screenPointForm,
      'screenLineature': instance.screenLineature,
      'screenAngle': instance.screenAngle,
      'boost': instance.boost,
      'customText': instance.customText,
      'meta': instance.meta,
      'runtimeId': instance.runtimeId,
    };

const _$ArtworkColorTypeEnumMap = {
  ArtworkColorType.normal: 'normal',
  ArtworkColorType.opak: 'opak',
  ArtworkColorType.nichtDruckend: 'nichtDruckend',
};

const _$ArtworkColorSpecTypeEnumMap = {
  ArtworkColorSpecType.standard: 'standard',
  ArtworkColorSpecType.kodak: 'kodak',
  ArtworkColorSpecType.quartz: 'quartz',
  ArtworkColorSpecType.verarbeitungsSchritt: 'verarbeitungsSchritt',
};

const _$ArtworkVerarbeitungsebeneTypeEnumMap = {
  ArtworkVerarbeitungsebeneType.stanzen: 'stanzen',
  ArtworkVerarbeitungsebeneType.bemassung: 'bemassung',
  ArtworkVerarbeitungsebeneType.lack: 'lack',
  ArtworkVerarbeitungsebeneType.keine: 'keine',
};

const _$ArtworkColorPrintProcessTypeEnumMap = {
  ArtworkColorPrintProcessType.flexo: 'flexo',
  ArtworkColorPrintProcessType.flexoRef: 'flexoRef',
  ArtworkColorPrintProcessType.siebdruck: 'siebdruck',
  ArtworkColorPrintProcessType.siebdruckRef: 'siebdruckRef',
  ArtworkColorPrintProcessType.buchdruck: 'buchdruck',
  ArtworkColorPrintProcessType.buchdruckRef: 'buchdruckRef',
  ArtworkColorPrintProcessType.digitaldruck: 'digitaldruck',
  ArtworkColorPrintProcessType.digitaldruckRef: 'digitaldruckRef',
  ArtworkColorPrintProcessType.offsetdruck: 'offsetdruck',
  ArtworkColorPrintProcessType.offsetdruckRef: 'offsetdruckRef',
  ArtworkColorPrintProcessType.nichtDruckend: 'nichtDruckend',
};
