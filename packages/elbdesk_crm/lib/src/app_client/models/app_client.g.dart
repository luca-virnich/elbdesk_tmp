// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppClientImpl _$$AppClientImplFromJson(Map<String, dynamic> json) =>
    _$AppClientImpl(
      contact: json['contact'] == null
          ? null
          : Contact.fromJson(json['contact'] as Map<String, dynamic>),
      automationEngine: json['automationEngine'] as String,
      description: json['description'] as String,
      meta: DataMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AppClientImplToJson(_$AppClientImpl instance) =>
    <String, dynamic>{
      'contact': instance.contact,
      'automationEngine': instance.automationEngine,
      'description': instance.description,
      'meta': instance.meta,
    };
