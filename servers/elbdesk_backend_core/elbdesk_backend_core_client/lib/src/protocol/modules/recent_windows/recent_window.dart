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

abstract class RecentWindowDTO implements _i1.SerializableModel {
  RecentWindowDTO._({
    this.id,
    required this.type,
    this.entityId,
    required this.label,
    this.timestamp,
    this.additionalData,
    this.userId,
  });

  factory RecentWindowDTO({
    int? id,
    required String type,
    int? entityId,
    required String label,
    DateTime? timestamp,
    String? additionalData,
    int? userId,
  }) = _RecentWindowDTOImpl;

  factory RecentWindowDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return RecentWindowDTO(
      id: jsonSerialization['id'] as int?,
      type: jsonSerialization['type'] as String,
      entityId: jsonSerialization['entityId'] as int?,
      label: jsonSerialization['label'] as String,
      timestamp: jsonSerialization['timestamp'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['timestamp']),
      additionalData: jsonSerialization['additionalData'] as String?,
      userId: jsonSerialization['userId'] as int?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String type;

  int? entityId;

  String label;

  DateTime? timestamp;

  String? additionalData;

  int? userId;

  /// Returns a shallow copy of this [RecentWindowDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RecentWindowDTO copyWith({
    int? id,
    String? type,
    int? entityId,
    String? label,
    DateTime? timestamp,
    String? additionalData,
    int? userId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'type': type,
      if (entityId != null) 'entityId': entityId,
      'label': label,
      if (timestamp != null) 'timestamp': timestamp?.toJson(),
      if (additionalData != null) 'additionalData': additionalData,
      if (userId != null) 'userId': userId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RecentWindowDTOImpl extends RecentWindowDTO {
  _RecentWindowDTOImpl({
    int? id,
    required String type,
    int? entityId,
    required String label,
    DateTime? timestamp,
    String? additionalData,
    int? userId,
  }) : super._(
          id: id,
          type: type,
          entityId: entityId,
          label: label,
          timestamp: timestamp,
          additionalData: additionalData,
          userId: userId,
        );

  /// Returns a shallow copy of this [RecentWindowDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RecentWindowDTO copyWith({
    Object? id = _Undefined,
    String? type,
    Object? entityId = _Undefined,
    String? label,
    Object? timestamp = _Undefined,
    Object? additionalData = _Undefined,
    Object? userId = _Undefined,
  }) {
    return RecentWindowDTO(
      id: id is int? ? id : this.id,
      type: type ?? this.type,
      entityId: entityId is int? ? entityId : this.entityId,
      label: label ?? this.label,
      timestamp: timestamp is DateTime? ? timestamp : this.timestamp,
      additionalData:
          additionalData is String? ? additionalData : this.additionalData,
      userId: userId is int? ? userId : this.userId,
    );
  }
}
