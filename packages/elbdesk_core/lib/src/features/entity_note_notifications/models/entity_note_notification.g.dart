// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_note_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EntityNoteNotificationImpl _$$EntityNoteNotificationImplFromJson(
        Map<String, dynamic> json) =>
    _$EntityNoteNotificationImpl(
      id: (json['id'] as num).toInt(),
      tableType: json['tableType'] as String,
      entityId: (json['entityId'] as num).toInt(),
      label: json['label'] as String,
      message: json['message'] as String,
      hardcodedSender: json['hardcodedSender'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      readAt: json['readAt'] == null
          ? null
          : DateTime.parse(json['readAt'] as String),
      clearedAt: json['clearedAt'] == null
          ? null
          : DateTime.parse(json['clearedAt'] as String),
      additionalData: json['additionalData'] as Map<String, dynamic>?,
      senderId: (json['senderId'] as num?)?.toInt(),
      isUpdate: json['isUpdate'] as bool,
      parentId: (json['parentId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$EntityNoteNotificationImplToJson(
        _$EntityNoteNotificationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tableType': instance.tableType,
      'entityId': instance.entityId,
      'label': instance.label,
      'message': instance.message,
      'hardcodedSender': instance.hardcodedSender,
      'createdAt': instance.createdAt.toIso8601String(),
      'readAt': instance.readAt?.toIso8601String(),
      'clearedAt': instance.clearedAt?.toIso8601String(),
      'additionalData': instance.additionalData,
      'senderId': instance.senderId,
      'isUpdate': instance.isUpdate,
      'parentId': instance.parentId,
    };
