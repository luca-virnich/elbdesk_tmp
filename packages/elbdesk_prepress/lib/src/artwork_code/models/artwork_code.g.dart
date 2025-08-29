// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artwork_code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArtworkCodeImpl _$$ArtworkCodeImplFromJson(Map<String, dynamic> json) =>
    _$ArtworkCodeImpl(
      value: json['value'] as String,
      artworkCodeType:
          $enumDecode(_$ArtworkCodeTypeEnumMap, json['artworkCodeType']),
      code2of5: json['code2of5'] == null
          ? null
          : TwoOf5Code.fromJson(json['code2of5'] as Map<String, dynamic>),
      codeAztec: json['codeAztec'] == null
          ? null
          : AztecCode.fromJson(json['codeAztec'] as Map<String, dynamic>),
      codeTemplate: json['codeTemplate'] == null
          ? null
          : TemplateCode.fromJson(json['codeTemplate'] as Map<String, dynamic>),
      runtimeId: json['runtimeId'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$ArtworkCodeImplToJson(_$ArtworkCodeImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'artworkCodeType': instance.artworkCodeType,
      'code2of5': instance.code2of5,
      'codeAztec': instance.codeAztec,
      'codeTemplate': instance.codeTemplate,
      'runtimeId': instance.runtimeId,
      'description': instance.description,
    };

const _$ArtworkCodeTypeEnumMap = {
  ArtworkCodeType.twoOf5: 'twoOf5',
  ArtworkCodeType.aztec: 'aztec',
  ArtworkCodeType.template: 'template',
};
