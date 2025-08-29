// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department_code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DepartmentCodeImpl _$$DepartmentCodeImplFromJson(Map<String, dynamic> json) =>
    _$DepartmentCodeImpl(
      code: json['code'] as String,
      description: json['description'] as String,
      meta: DataMeta.fromJson(json['meta'] as Map<String, dynamic>),
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$DepartmentCodeImplToJson(
        _$DepartmentCodeImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'description': instance.description,
      'meta': instance.meta,
      'id': instance.id,
    };
