/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class EntityAssignmentDTO
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  EntityAssignmentDTO._({
    required this.tableType,
    required this.entityId,
    this.additionalData,
    this.deadline,
    required this.lightUserId,
  });

  factory EntityAssignmentDTO({
    required String tableType,
    required int entityId,
    String? additionalData,
    DateTime? deadline,
    required int lightUserId,
  }) = _EntityAssignmentDTOImpl;

  factory EntityAssignmentDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return EntityAssignmentDTO(
      tableType: jsonSerialization['tableType'] as String,
      entityId: jsonSerialization['entityId'] as int,
      additionalData: jsonSerialization['additionalData'] as String?,
      deadline: jsonSerialization['deadline'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['deadline']),
      lightUserId: jsonSerialization['lightUserId'] as int,
    );
  }

  String tableType;

  int entityId;

  String? additionalData;

  DateTime? deadline;

  int lightUserId;

  /// Returns a shallow copy of this [EntityAssignmentDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  EntityAssignmentDTO copyWith({
    String? tableType,
    int? entityId,
    String? additionalData,
    DateTime? deadline,
    int? lightUserId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'tableType': tableType,
      'entityId': entityId,
      if (additionalData != null) 'additionalData': additionalData,
      if (deadline != null) 'deadline': deadline?.toJson(),
      'lightUserId': lightUserId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'tableType': tableType,
      'entityId': entityId,
      if (additionalData != null) 'additionalData': additionalData,
      if (deadline != null) 'deadline': deadline?.toJson(),
      'lightUserId': lightUserId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _EntityAssignmentDTOImpl extends EntityAssignmentDTO {
  _EntityAssignmentDTOImpl({
    required String tableType,
    required int entityId,
    String? additionalData,
    DateTime? deadline,
    required int lightUserId,
  }) : super._(
          tableType: tableType,
          entityId: entityId,
          additionalData: additionalData,
          deadline: deadline,
          lightUserId: lightUserId,
        );

  /// Returns a shallow copy of this [EntityAssignmentDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  EntityAssignmentDTO copyWith({
    String? tableType,
    int? entityId,
    Object? additionalData = _Undefined,
    Object? deadline = _Undefined,
    int? lightUserId,
  }) {
    return EntityAssignmentDTO(
      tableType: tableType ?? this.tableType,
      entityId: entityId ?? this.entityId,
      additionalData:
          additionalData is String? ? additionalData : this.additionalData,
      deadline: deadline is DateTime? ? deadline : this.deadline,
      lightUserId: lightUserId ?? this.lightUserId,
    );
  }
}
