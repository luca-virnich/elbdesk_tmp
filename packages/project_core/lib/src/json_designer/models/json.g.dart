// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JsonImpl _$$JsonImplFromJson(Map<String, dynamic> json) => _$JsonImpl(
      name: json['name'] as String,
      type: $enumDecode(_$JsonFieldTypeEnumMap, json['type']),
      jsonKey: json['jsonKey'] as String,
      jsonValue: json['jsonValue'],
      uuid: json['uuid'] as String,
      children: (json['children'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, Json.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$JsonImplToJson(_$JsonImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'jsonKey': instance.jsonKey,
      'jsonValue': instance.jsonValue,
      'uuid': instance.uuid,
      'children': instance.children,
    };

const _$JsonFieldTypeEnumMap = {
  JsonFieldType.text: 'text',
  JsonFieldType.number: 'number',
  JsonFieldType.boolean: 'boolean',
  JsonFieldType.array: 'array',
  JsonFieldType.object: 'object',
};
