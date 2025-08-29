// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crm_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CrmEventImpl _$$CrmEventImplFromJson(Map<String, dynamic> json) =>
    _$CrmEventImpl(
      meta: DataMeta.fromJson(json['meta'] as Map<String, dynamic>),
      name: json['name'] as String,
      description: json['description'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      contacts: (json['contacts'] as List<dynamic>)
          .map((e) => Contact.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: $enumDecode(_$CrmEventStatusEnumMap, json['status']),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      executionDate: json['executionDate'] == null
          ? null
          : DateTime.parse(json['executionDate'] as String),
    );

Map<String, dynamic> _$$CrmEventImplToJson(_$CrmEventImpl instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'name': instance.name,
      'description': instance.description,
      'startDate': instance.startDate.toIso8601String(),
      'contacts': instance.contacts,
      'status': instance.status,
      'endDate': instance.endDate?.toIso8601String(),
      'executionDate': instance.executionDate?.toIso8601String(),
    };

const _$CrmEventStatusEnumMap = {
  CrmEventStatus.scheduled: 'scheduled',
  CrmEventStatus.inProgress: 'inProgress',
  CrmEventStatus.completed: 'completed',
  CrmEventStatus.cancelled: 'cancelled',
};
