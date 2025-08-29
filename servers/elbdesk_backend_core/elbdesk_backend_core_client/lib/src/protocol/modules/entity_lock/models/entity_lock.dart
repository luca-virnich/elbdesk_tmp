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

abstract class EntityLockDTO implements _i1.SerializableModel {
  EntityLockDTO._({
    required this.tableType,
    required this.entityId,
    required this.editingSessionId,
    required this.lockedAt,
    this.userId,
  });

  factory EntityLockDTO({
    required String tableType,
    required int entityId,
    required String editingSessionId,
    required DateTime lockedAt,
    int? userId,
  }) = _EntityLockDTOImpl;

  factory EntityLockDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return EntityLockDTO(
      tableType: jsonSerialization['tableType'] as String,
      entityId: jsonSerialization['entityId'] as int,
      editingSessionId: jsonSerialization['editingSessionId'] as String,
      lockedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['lockedAt']),
      userId: jsonSerialization['userId'] as int?,
    );
  }

  String tableType;

  int entityId;

  String editingSessionId;

  DateTime lockedAt;

  int? userId;

  /// Returns a shallow copy of this [EntityLockDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  EntityLockDTO copyWith({
    String? tableType,
    int? entityId,
    String? editingSessionId,
    DateTime? lockedAt,
    int? userId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'tableType': tableType,
      'entityId': entityId,
      'editingSessionId': editingSessionId,
      'lockedAt': lockedAt.toJson(),
      if (userId != null) 'userId': userId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _EntityLockDTOImpl extends EntityLockDTO {
  _EntityLockDTOImpl({
    required String tableType,
    required int entityId,
    required String editingSessionId,
    required DateTime lockedAt,
    int? userId,
  }) : super._(
          tableType: tableType,
          entityId: entityId,
          editingSessionId: editingSessionId,
          lockedAt: lockedAt,
          userId: userId,
        );

  /// Returns a shallow copy of this [EntityLockDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  EntityLockDTO copyWith({
    String? tableType,
    int? entityId,
    String? editingSessionId,
    DateTime? lockedAt,
    Object? userId = _Undefined,
  }) {
    return EntityLockDTO(
      tableType: tableType ?? this.tableType,
      entityId: entityId ?? this.entityId,
      editingSessionId: editingSessionId ?? this.editingSessionId,
      lockedAt: lockedAt ?? this.lockedAt,
      userId: userId is int? ? userId : this.userId,
    );
  }
}
