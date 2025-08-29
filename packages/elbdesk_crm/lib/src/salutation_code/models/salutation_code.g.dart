// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salutation_code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SalutationCodeImpl _$$SalutationCodeImplFromJson(Map<String, dynamic> json) =>
    _$SalutationCodeImpl(
      code: json['code'] as String,
      description: json['description'] as String,
      isPrimaryPerson: json['isPrimaryPerson'] as bool,
      isPrimaryCompany: json['isPrimaryCompany'] as bool,
      meta: DataMeta.fromJson(json['meta'] as Map<String, dynamic>),
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SalutationCodeImplToJson(
        _$SalutationCodeImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'description': instance.description,
      'isPrimaryPerson': instance.isPrimaryPerson,
      'isPrimaryCompany': instance.isPrimaryCompany,
      'meta': instance.meta,
      'id': instance.id,
    };
