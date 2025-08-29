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

abstract class EntityNoteNotificationDTO implements _i1.SerializableModel {
  EntityNoteNotificationDTO._({
    this.id,
    required this.tableType,
    required this.entityId,
    required this.label,
    required this.message,
    required this.isUpdate,
    this.hardcodedSender,
    required this.createdAt,
    this.readAt,
    this.clearedAt,
    this.parentId,
    this.additionalData,
    this.senderId,
    this.userId,
    required this.noteId,
  });

  factory EntityNoteNotificationDTO({
    int? id,
    required String tableType,
    required int entityId,
    required String label,
    required String message,
    required bool isUpdate,
    String? hardcodedSender,
    required DateTime createdAt,
    DateTime? readAt,
    DateTime? clearedAt,
    int? parentId,
    String? additionalData,
    int? senderId,
    int? userId,
    required int noteId,
  }) = _EntityNoteNotificationDTOImpl;

  factory EntityNoteNotificationDTO.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return EntityNoteNotificationDTO(
      id: jsonSerialization['id'] as int?,
      tableType: jsonSerialization['tableType'] as String,
      entityId: jsonSerialization['entityId'] as int,
      label: jsonSerialization['label'] as String,
      message: jsonSerialization['message'] as String,
      isUpdate: jsonSerialization['isUpdate'] as bool,
      hardcodedSender: jsonSerialization['hardcodedSender'] as String?,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      readAt: jsonSerialization['readAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['readAt']),
      clearedAt: jsonSerialization['clearedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['clearedAt']),
      parentId: jsonSerialization['parentId'] as int?,
      additionalData: jsonSerialization['additionalData'] as String?,
      senderId: jsonSerialization['senderId'] as int?,
      userId: jsonSerialization['userId'] as int?,
      noteId: jsonSerialization['noteId'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String tableType;

  int entityId;

  String label;

  String message;

  bool isUpdate;

  String? hardcodedSender;

  DateTime createdAt;

  DateTime? readAt;

  DateTime? clearedAt;

  int? parentId;

  String? additionalData;

  int? senderId;

  int? userId;

  int noteId;

  /// Returns a shallow copy of this [EntityNoteNotificationDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  EntityNoteNotificationDTO copyWith({
    int? id,
    String? tableType,
    int? entityId,
    String? label,
    String? message,
    bool? isUpdate,
    String? hardcodedSender,
    DateTime? createdAt,
    DateTime? readAt,
    DateTime? clearedAt,
    int? parentId,
    String? additionalData,
    int? senderId,
    int? userId,
    int? noteId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'tableType': tableType,
      'entityId': entityId,
      'label': label,
      'message': message,
      'isUpdate': isUpdate,
      if (hardcodedSender != null) 'hardcodedSender': hardcodedSender,
      'createdAt': createdAt.toJson(),
      if (readAt != null) 'readAt': readAt?.toJson(),
      if (clearedAt != null) 'clearedAt': clearedAt?.toJson(),
      if (parentId != null) 'parentId': parentId,
      if (additionalData != null) 'additionalData': additionalData,
      if (senderId != null) 'senderId': senderId,
      if (userId != null) 'userId': userId,
      'noteId': noteId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _EntityNoteNotificationDTOImpl extends EntityNoteNotificationDTO {
  _EntityNoteNotificationDTOImpl({
    int? id,
    required String tableType,
    required int entityId,
    required String label,
    required String message,
    required bool isUpdate,
    String? hardcodedSender,
    required DateTime createdAt,
    DateTime? readAt,
    DateTime? clearedAt,
    int? parentId,
    String? additionalData,
    int? senderId,
    int? userId,
    required int noteId,
  }) : super._(
          id: id,
          tableType: tableType,
          entityId: entityId,
          label: label,
          message: message,
          isUpdate: isUpdate,
          hardcodedSender: hardcodedSender,
          createdAt: createdAt,
          readAt: readAt,
          clearedAt: clearedAt,
          parentId: parentId,
          additionalData: additionalData,
          senderId: senderId,
          userId: userId,
          noteId: noteId,
        );

  /// Returns a shallow copy of this [EntityNoteNotificationDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  EntityNoteNotificationDTO copyWith({
    Object? id = _Undefined,
    String? tableType,
    int? entityId,
    String? label,
    String? message,
    bool? isUpdate,
    Object? hardcodedSender = _Undefined,
    DateTime? createdAt,
    Object? readAt = _Undefined,
    Object? clearedAt = _Undefined,
    Object? parentId = _Undefined,
    Object? additionalData = _Undefined,
    Object? senderId = _Undefined,
    Object? userId = _Undefined,
    int? noteId,
  }) {
    return EntityNoteNotificationDTO(
      id: id is int? ? id : this.id,
      tableType: tableType ?? this.tableType,
      entityId: entityId ?? this.entityId,
      label: label ?? this.label,
      message: message ?? this.message,
      isUpdate: isUpdate ?? this.isUpdate,
      hardcodedSender:
          hardcodedSender is String? ? hardcodedSender : this.hardcodedSender,
      createdAt: createdAt ?? this.createdAt,
      readAt: readAt is DateTime? ? readAt : this.readAt,
      clearedAt: clearedAt is DateTime? ? clearedAt : this.clearedAt,
      parentId: parentId is int? ? parentId : this.parentId,
      additionalData:
          additionalData is String? ? additionalData : this.additionalData,
      senderId: senderId is int? ? senderId : this.senderId,
      userId: userId is int? ? userId : this.userId,
      noteId: noteId ?? this.noteId,
    );
  }
}
