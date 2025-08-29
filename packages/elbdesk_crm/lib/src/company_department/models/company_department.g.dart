// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_department.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CompanyDepartmentImpl _$$CompanyDepartmentImplFromJson(
        Map<String, dynamic> json) =>
    _$CompanyDepartmentImpl(
      name: json['name'] as String,
      description: json['description'] as String,
      companyEmployees: (json['companyEmployees'] as List<dynamic>)
          .map((e) => CompanyEmployee.fromJson(e as Map<String, dynamic>))
          .toList(),
      company: json['company'] == null
          ? null
          : Contact.fromJson(json['company'] as Map<String, dynamic>),
      meta: DataMeta.fromJson(json['meta'] as Map<String, dynamic>),
      companyId: (json['companyId'] as num).toInt(),
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CompanyDepartmentImplToJson(
        _$CompanyDepartmentImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'companyEmployees': instance.companyEmployees,
      'company': instance.company,
      'meta': instance.meta,
      'companyId': instance.companyId,
      'id': instance.id,
    };
