// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CompanyEmployeeImpl _$$CompanyEmployeeImplFromJson(
        Map<String, dynamic> json) =>
    _$CompanyEmployeeImpl(
      company: Contact.fromJson(json['company'] as Map<String, dynamic>),
      employee: Contact.fromJson(json['employee'] as Map<String, dynamic>),
      position: json['position'] as String,
      departments: (json['departments'] as List<dynamic>?)
          ?.map((e) => CompanyDepartment.fromJson(e as Map<String, dynamic>))
          .toList(),
      active: json['active'] as bool,
      note: json['note'] as String,
      meta: DataMeta.fromJson(json['meta'] as Map<String, dynamic>),
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CompanyEmployeeImplToJson(
        _$CompanyEmployeeImpl instance) =>
    <String, dynamic>{
      'company': instance.company,
      'employee': instance.employee,
      'position': instance.position,
      'departments': instance.departments,
      'active': instance.active,
      'note': instance.note,
      'meta': instance.meta,
      'id': instance.id,
    };
