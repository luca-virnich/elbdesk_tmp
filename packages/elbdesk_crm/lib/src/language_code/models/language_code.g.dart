// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LanguageCodeImpl _$$LanguageCodeImplFromJson(Map<String, dynamic> json) =>
    _$LanguageCodeImpl(
      code: json['code'] as String,
      name: json['name'] as String,
      meta: DataMeta.fromJson(json['meta'] as Map<String, dynamic>),
      isPrimary: json['isPrimary'] as bool,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$LanguageCodeImplToJson(_$LanguageCodeImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'meta': instance.meta,
      'isPrimary': instance.isPrimary,
      'id': instance.id,
    };
