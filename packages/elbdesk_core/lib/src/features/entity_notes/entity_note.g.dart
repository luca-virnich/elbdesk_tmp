// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EntityNoteImpl _$$EntityNoteImplFromJson(Map<String, dynamic> json) =>
    _$EntityNoteImpl(
      message: json['message'] as String,
      tableType: json['tableType'] as String,
      entityId: (json['entityId'] as num).toInt(),
      children: (json['children'] as List<dynamic>)
          .map((e) => EntityNote.fromJson(e as Map<String, dynamic>))
          .toList(),
      parentId: (json['parentId'] as num?)?.toInt(),
      mentions: (json['mentions'] as List<dynamic>?)
              ?.map((e) => Mention.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      hardcodedSender: json['hardcodedSender'] as String?,
      hint: json['hint'] as String?,
      id: (json['id'] as num?)?.toInt(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      createdById: (json['createdById'] as num?)?.toInt(),
      lastModifiedAt: json['lastModifiedAt'] == null
          ? null
          : DateTime.parse(json['lastModifiedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$$EntityNoteImplToJson(_$EntityNoteImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'tableType': instance.tableType,
      'entityId': instance.entityId,
      'children': instance.children,
      'parentId': instance.parentId,
      'mentions': instance.mentions,
      'hardcodedSender': instance.hardcodedSender,
      'hint': instance.hint,
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'createdById': instance.createdById,
      'lastModifiedAt': instance.lastModifiedAt?.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };

_$MentionImpl _$$MentionImplFromJson(Map<String, dynamic> json) =>
    _$MentionImpl(
      userId: (json['userId'] as num).toInt(),
      start: (json['start'] as num?)?.toInt(),
      end: (json['end'] as num?)?.toInt(),
      userName: json['userName'] as String?,
    );

Map<String, dynamic> _$$MentionImplToJson(_$MentionImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'start': instance.start,
      'end': instance.end,
      'userName': instance.userName,
    };
