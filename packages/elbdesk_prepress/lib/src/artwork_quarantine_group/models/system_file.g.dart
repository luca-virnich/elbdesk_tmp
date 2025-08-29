// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SystemFileImpl _$$SystemFileImplFromJson(Map<String, dynamic> json) =>
    _$SystemFileImpl(
      id: json['id'] as String,
      path: json['path'] as String,
      filename: json['filename'] as String,
      attachmentType: $enumDecodeNullable(
          _$SystemFileAttachmentTypeEnumMap, json['attachmentType']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      originalPath: json['originalPath'] as String,
      fileSize: (json['fileSize'] as num?)?.toInt(),
      mimeType: json['mimeType'] as String?,
      createdById: (json['createdById'] as num?)?.toInt(),
      lastModifiedAt: json['lastModifiedAt'] == null
          ? null
          : DateTime.parse(json['lastModifiedAt'] as String),
      lastModifiedById: (json['lastModifiedById'] as num?)?.toInt(),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
      deletedById: (json['deletedById'] as num?)?.toInt(),
      isCopiedToOutputPath: json['isCopiedToOutputPath'] as bool? ?? false,
    );

Map<String, dynamic> _$$SystemFileImplToJson(_$SystemFileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'path': instance.path,
      'filename': instance.filename,
      'attachmentType': instance.attachmentType,
      'createdAt': instance.createdAt.toIso8601String(),
      'originalPath': instance.originalPath,
      'fileSize': instance.fileSize,
      'mimeType': instance.mimeType,
      'createdById': instance.createdById,
      'lastModifiedAt': instance.lastModifiedAt?.toIso8601String(),
      'lastModifiedById': instance.lastModifiedById,
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'deletedById': instance.deletedById,
      'isCopiedToOutputPath': instance.isCopiedToOutputPath,
    };

const _$SystemFileAttachmentTypeEnumMap = {
  SystemFileAttachmentType.general: 'general',
  SystemFileAttachmentType.email: 'email',
  SystemFileAttachmentType.order: 'order',
};
