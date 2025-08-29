import 'package:elbdesk_backend_core_client/elbdesk_backend_core_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'entity_note.freezed.dart';
part 'entity_note.g.dart';

@freezed
class EntityNote with _$EntityNote {
  /// Contact constructor
  const factory EntityNote({
    required String message,
    required String tableType,
    required int entityId,
    required List<EntityNote> children,
    required int? parentId,
    @Default([]) List<Mention> mentions,
    String? hardcodedSender,
    String? hint,
    int? id,
    DateTime? createdAt,
    int? createdById,
    DateTime? lastModifiedAt,
    DateTime? deletedAt,
  }) = _EntityNote;

  const EntityNote._();

  factory EntityNote.fromJson(Map<String, dynamic> json) =>
      _$EntityNoteFromJson(json);

  /// Contact from DTO
  factory EntityNote.fromDTO(EntityNoteDTO dto) {
    return EntityNote(
      children: [],
      parentId: dto.parentId,
      mentions: dto.mentions.map(Mention.fromDTO).toList(),
      id: dto.id,
      message: dto.message,
      tableType: dto.tableType,
      entityId: dto.entityId,
      hardcodedSender: dto.hardcodedSender,
      createdAt: dto.createdAt?.toLocal(),
      createdById: dto.createdById,
      lastModifiedAt: dto.lastModifiedAt?.toLocal(),
      deletedAt: dto.deletedAt?.toLocal(),
      hint: dto.hint,
    );
  }

  /// Note to DTO
  EntityNoteDTO toDTO() => EntityNoteDTO(
        id: id,
        parentId: parentId,
        message: message,
        tableType: tableType,
        entityId: entityId,
        createdAt: createdAt,
        createdById: createdById,
        lastModifiedAt: lastModifiedAt,
        deletedAt: deletedAt,
        hint: hint,
        mentions: mentions.map((e) => e.toDTO()).toList(),
      );
}

@freezed
class Mention with _$Mention {
  const factory Mention({
    required int userId,
    int? start,
    int? end,
    String? userName,
  }) = _Mention;

  const Mention._();

  factory Mention.fromJson(Map<String, dynamic> json) =>
      _$MentionFromJson(json);

  factory Mention.fromDTO(MentionDTO dto) {
    return Mention(
      userId: dto.userId,
    );
  }

  MentionDTO toDTO() => MentionDTO(
        userId: userId,
      );
}
