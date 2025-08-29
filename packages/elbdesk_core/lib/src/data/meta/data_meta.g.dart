// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataMetaImpl _$$DataMetaImplFromJson(Map<String, dynamic> json) =>
    _$DataMetaImpl(
      id: (json['id'] as num?)?.toInt(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      lastModifiedAt: json['lastModifiedAt'] == null
          ? null
          : DateTime.parse(json['lastModifiedAt'] as String),
      lastModifiedById: (json['lastModifiedById'] as num?)?.toInt(),
      isDraft: json['isDraft'] as bool,
      editingSessionId: json['editingSessionId'] as String?,
      createdById: (json['createdById'] as num?)?.toInt(),
      editingSince: json['editingSince'] == null
          ? null
          : DateTime.parse(json['editingSince'] as String),
      editingById: (json['editingById'] as num?)?.toInt(),
      deletedById: (json['deletedById'] as num?)?.toInt(),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$$DataMetaImplToJson(_$DataMetaImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'lastModifiedAt': instance.lastModifiedAt?.toIso8601String(),
      'lastModifiedById': instance.lastModifiedById,
      'isDraft': instance.isDraft,
      'editingSessionId': instance.editingSessionId,
      'createdById': instance.createdById,
      'editingSince': instance.editingSince?.toIso8601String(),
      'editingById': instance.editingById,
      'deletedById': instance.deletedById,
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };
