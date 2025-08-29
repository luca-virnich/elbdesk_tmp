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
import '../../../modules/unsorted/dashboard_grid/dashboard_tile_type.dart'
    as _i2;

abstract class DashboardTileConfigDTO
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  DashboardTileConfigDTO._({
    required this.id,
    required this.slotIndex,
    required this.stackPosition,
    required this.columnSpan,
    required this.height,
    required this.type,
    this.entityId,
    this.childEntityIds,
  });

  factory DashboardTileConfigDTO({
    required String id,
    required int slotIndex,
    required int stackPosition,
    required int columnSpan,
    required double height,
    required _i2.DashboardTileType type,
    int? entityId,
    List<int>? childEntityIds,
  }) = _DashboardTileConfigDTOImpl;

  factory DashboardTileConfigDTO.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return DashboardTileConfigDTO(
      id: jsonSerialization['id'] as String,
      slotIndex: jsonSerialization['slotIndex'] as int,
      stackPosition: jsonSerialization['stackPosition'] as int,
      columnSpan: jsonSerialization['columnSpan'] as int,
      height: (jsonSerialization['height'] as num).toDouble(),
      type:
          _i2.DashboardTileType.fromJson((jsonSerialization['type'] as String)),
      entityId: jsonSerialization['entityId'] as int?,
      childEntityIds: (jsonSerialization['childEntityIds'] as List?)
          ?.map((e) => e as int)
          .toList(),
    );
  }

  String id;

  int slotIndex;

  int stackPosition;

  int columnSpan;

  double height;

  _i2.DashboardTileType type;

  int? entityId;

  List<int>? childEntityIds;

  /// Returns a shallow copy of this [DashboardTileConfigDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DashboardTileConfigDTO copyWith({
    String? id,
    int? slotIndex,
    int? stackPosition,
    int? columnSpan,
    double? height,
    _i2.DashboardTileType? type,
    int? entityId,
    List<int>? childEntityIds,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'slotIndex': slotIndex,
      'stackPosition': stackPosition,
      'columnSpan': columnSpan,
      'height': height,
      'type': type.toJson(),
      if (entityId != null) 'entityId': entityId,
      if (childEntityIds != null) 'childEntityIds': childEntityIds?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'id': id,
      'slotIndex': slotIndex,
      'stackPosition': stackPosition,
      'columnSpan': columnSpan,
      'height': height,
      'type': type.toJson(),
      if (entityId != null) 'entityId': entityId,
      if (childEntityIds != null) 'childEntityIds': childEntityIds?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DashboardTileConfigDTOImpl extends DashboardTileConfigDTO {
  _DashboardTileConfigDTOImpl({
    required String id,
    required int slotIndex,
    required int stackPosition,
    required int columnSpan,
    required double height,
    required _i2.DashboardTileType type,
    int? entityId,
    List<int>? childEntityIds,
  }) : super._(
          id: id,
          slotIndex: slotIndex,
          stackPosition: stackPosition,
          columnSpan: columnSpan,
          height: height,
          type: type,
          entityId: entityId,
          childEntityIds: childEntityIds,
        );

  /// Returns a shallow copy of this [DashboardTileConfigDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DashboardTileConfigDTO copyWith({
    String? id,
    int? slotIndex,
    int? stackPosition,
    int? columnSpan,
    double? height,
    _i2.DashboardTileType? type,
    Object? entityId = _Undefined,
    Object? childEntityIds = _Undefined,
  }) {
    return DashboardTileConfigDTO(
      id: id ?? this.id,
      slotIndex: slotIndex ?? this.slotIndex,
      stackPosition: stackPosition ?? this.stackPosition,
      columnSpan: columnSpan ?? this.columnSpan,
      height: height ?? this.height,
      type: type ?? this.type,
      entityId: entityId is int? ? entityId : this.entityId,
      childEntityIds: childEntityIds is List<int>?
          ? childEntityIds
          : this.childEntityIds?.map((e0) => e0).toList(),
    );
  }
}
