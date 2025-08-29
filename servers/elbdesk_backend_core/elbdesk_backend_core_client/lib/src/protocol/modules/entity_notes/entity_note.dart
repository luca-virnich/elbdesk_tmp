/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../../modules/entity_notes/mention.dart' as _i2;

abstract class EntityNoteDTO implements _i1.SerializableModel {
  EntityNoteDTO._({
    this.id,
    required this.message,
    this.hint,
    required this.entityId,
    required this.tableType,
    required this.mentions,
    this.parentId,
    this.hardcodedSender,
    this.createdAt,
    this.createdById,
    this.lastModifiedAt,
    this.deletedAt,
  });

  factory EntityNoteDTO({
    int? id,
    required String message,
    String? hint,
    required int entityId,
    required String tableType,
    required List<_i2.MentionDTO> mentions,
    int? parentId,
    String? hardcodedSender,
    DateTime? createdAt,
    int? createdById,
    DateTime? lastModifiedAt,
    DateTime? deletedAt,
  }) = _EntityNoteDTOImpl;

  factory EntityNoteDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return EntityNoteDTO(
      id: jsonSerialization['id'] as int?,
      message: jsonSerialization['message'] as String,
      hint: jsonSerialization['hint'] as String?,
      entityId: jsonSerialization['entityId'] as int,
      tableType: jsonSerialization['tableType'] as String,
      mentions: (jsonSerialization['mentions'] as List)
          .map((e) => _i2.MentionDTO.fromJson((e as Map<String, dynamic>)))
          .toList(),
      parentId: jsonSerialization['parentId'] as int?,
      hardcodedSender: jsonSerialization['hardcodedSender'] as String?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      createdById: jsonSerialization['createdById'] as int?,
      lastModifiedAt: jsonSerialization['lastModifiedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastModifiedAt']),
      deletedAt: jsonSerialization['deletedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['deletedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String message;

  String? hint;

  int entityId;

  String tableType;

  List<_i2.MentionDTO> mentions;

  int? parentId;

  String? hardcodedSender;

  DateTime? createdAt;

  int? createdById;

  DateTime? lastModifiedAt;

  DateTime? deletedAt;

  /// Returns a shallow copy of this [EntityNoteDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  EntityNoteDTO copyWith({
    int? id,
    String? message,
    String? hint,
    int? entityId,
    String? tableType,
    List<_i2.MentionDTO>? mentions,
    int? parentId,
    String? hardcodedSender,
    DateTime? createdAt,
    int? createdById,
    DateTime? lastModifiedAt,
    DateTime? deletedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'message': message,
      if (hint != null) 'hint': hint,
      'entityId': entityId,
      'tableType': tableType,
      'mentions': mentions.toJson(valueToJson: (v) => v.toJson()),
      if (parentId != null) 'parentId': parentId,
      if (hardcodedSender != null) 'hardcodedSender': hardcodedSender,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      if (createdById != null) 'createdById': createdById,
      if (lastModifiedAt != null) 'lastModifiedAt': lastModifiedAt?.toJson(),
      if (deletedAt != null) 'deletedAt': deletedAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _EntityNoteDTOImpl extends EntityNoteDTO {
  _EntityNoteDTOImpl({
    int? id,
    required String message,
    String? hint,
    required int entityId,
    required String tableType,
    required List<_i2.MentionDTO> mentions,
    int? parentId,
    String? hardcodedSender,
    DateTime? createdAt,
    int? createdById,
    DateTime? lastModifiedAt,
    DateTime? deletedAt,
  }) : super._(
          id: id,
          message: message,
          hint: hint,
          entityId: entityId,
          tableType: tableType,
          mentions: mentions,
          parentId: parentId,
          hardcodedSender: hardcodedSender,
          createdAt: createdAt,
          createdById: createdById,
          lastModifiedAt: lastModifiedAt,
          deletedAt: deletedAt,
        );

  /// Returns a shallow copy of this [EntityNoteDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  EntityNoteDTO copyWith({
    Object? id = _Undefined,
    String? message,
    Object? hint = _Undefined,
    int? entityId,
    String? tableType,
    List<_i2.MentionDTO>? mentions,
    Object? parentId = _Undefined,
    Object? hardcodedSender = _Undefined,
    Object? createdAt = _Undefined,
    Object? createdById = _Undefined,
    Object? lastModifiedAt = _Undefined,
    Object? deletedAt = _Undefined,
  }) {
    return EntityNoteDTO(
      id: id is int? ? id : this.id,
      message: message ?? this.message,
      hint: hint is String? ? hint : this.hint,
      entityId: entityId ?? this.entityId,
      tableType: tableType ?? this.tableType,
      mentions: mentions ?? this.mentions.map((e0) => e0.copyWith()).toList(),
      parentId: parentId is int? ? parentId : this.parentId,
      hardcodedSender:
          hardcodedSender is String? ? hardcodedSender : this.hardcodedSender,
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
      createdById: createdById is int? ? createdById : this.createdById,
      lastModifiedAt:
          lastModifiedAt is DateTime? ? lastModifiedAt : this.lastModifiedAt,
      deletedAt: deletedAt is DateTime? ? deletedAt : this.deletedAt,
    );
  }
}
