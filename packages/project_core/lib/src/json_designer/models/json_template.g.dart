// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JsonTemplateImpl _$$JsonTemplateImplFromJson(Map<String, dynamic> json) =>
    _$JsonTemplateImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
      type: $enumDecode(_$JsonTemplateTypeEnumMap, json['type']),
      jsonTree: Json.fromJson(json['jsonTree'] as Map<String, dynamic>),
      meta: DataMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$JsonTemplateImplToJson(_$JsonTemplateImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'jsonTree': instance.jsonTree,
      'meta': instance.meta,
    };

const _$JsonTemplateTypeEnumMap = {
  JsonTemplateType.speedy: 'speedy',
  JsonTemplateType.production_order: 'production_order',
};
