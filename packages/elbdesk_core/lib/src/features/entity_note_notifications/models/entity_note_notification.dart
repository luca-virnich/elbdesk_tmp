import 'dart:convert';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'entity_note_notification.freezed.dart';
part 'entity_note_notification.g.dart';

@freezed
class EntityNoteNotification with _$EntityNoteNotification {
  factory EntityNoteNotification({
    required int id,
    required String tableType,
    required int entityId,
    required String label,
    required String message,
    required String? hardcodedSender,
    required DateTime createdAt,
    required DateTime? readAt,
    required DateTime? clearedAt,
    required Map<String, dynamic>? additionalData,
    required int? senderId,
    required bool isUpdate,
    required int? parentId,
  }) = _EntityNoteNotification;

  factory EntityNoteNotification.fromDTO(EntityNoteNotificationDTO dto) {
    return EntityNoteNotification(
      id: dto.id!,
      isUpdate: dto.isUpdate,
      parentId: dto.parentId,
      tableType: dto.tableType,
      entityId: dto.entityId,
      senderId: dto.senderId,
      label: dto.label,
      message: dto.message,
      hardcodedSender: dto.hardcodedSender,
      createdAt: dto.createdAt.toLocal(),
      readAt: dto.readAt?.toLocal(),
      clearedAt: dto.clearedAt?.toLocal(),
      additionalData: dto.additionalData != null
          ? jsonDecode(dto.additionalData!) as Map<String, dynamic>?
          : null,
    );
  }
  const EntityNoteNotification._();

  factory EntityNoteNotification.fromJson(Map<String, dynamic> json) =>
      _$EntityNoteNotificationFromJson(json);

  bool get isThread => parentId != null;
}
