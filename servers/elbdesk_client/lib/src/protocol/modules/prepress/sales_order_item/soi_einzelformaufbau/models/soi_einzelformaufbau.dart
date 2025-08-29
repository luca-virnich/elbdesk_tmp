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
import '../../../../../modules/prepress/artwork/models/artwork.dart' as _i2;
import '../../../../../modules/prepress/sales_order_item/models/sales_order_item.dart'
    as _i3;

abstract class SoiEinzelformaufbauDTO implements _i1.SerializableModel {
  SoiEinzelformaufbauDTO._({
    this.id,
    required this.artworkId,
    this.artwork,
    required this.artworkMasterId,
    required this.version,
    required this.salesOrderItemId,
    this.salesOrderItem,
    required this.createdAt,
    this.createdById,
    this.lastModifiedAt,
    this.lastModifiedById,
    this.deletedAt,
    this.deletedById,
    this.editingById,
    this.editingSince,
    required this.isDraft,
    this.editingSession,
  });

  factory SoiEinzelformaufbauDTO({
    int? id,
    required int artworkId,
    _i2.ArtworkDTO? artwork,
    required int artworkMasterId,
    required int version,
    required int salesOrderItemId,
    _i3.SalesOrderItemDTO? salesOrderItem,
    required DateTime createdAt,
    int? createdById,
    DateTime? lastModifiedAt,
    int? lastModifiedById,
    DateTime? deletedAt,
    int? deletedById,
    int? editingById,
    DateTime? editingSince,
    required bool isDraft,
    String? editingSession,
  }) = _SoiEinzelformaufbauDTOImpl;

  factory SoiEinzelformaufbauDTO.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return SoiEinzelformaufbauDTO(
      id: jsonSerialization['id'] as int?,
      artworkId: jsonSerialization['artworkId'] as int,
      artwork: jsonSerialization['artwork'] == null
          ? null
          : _i2.ArtworkDTO.fromJson(
              (jsonSerialization['artwork'] as Map<String, dynamic>)),
      artworkMasterId: jsonSerialization['artworkMasterId'] as int,
      version: jsonSerialization['version'] as int,
      salesOrderItemId: jsonSerialization['salesOrderItemId'] as int,
      salesOrderItem: jsonSerialization['salesOrderItem'] == null
          ? null
          : _i3.SalesOrderItemDTO.fromJson(
              (jsonSerialization['salesOrderItem'] as Map<String, dynamic>)),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      createdById: jsonSerialization['createdById'] as int?,
      lastModifiedAt: jsonSerialization['lastModifiedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastModifiedAt']),
      lastModifiedById: jsonSerialization['lastModifiedById'] as int?,
      deletedAt: jsonSerialization['deletedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['deletedAt']),
      deletedById: jsonSerialization['deletedById'] as int?,
      editingById: jsonSerialization['editingById'] as int?,
      editingSince: jsonSerialization['editingSince'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['editingSince']),
      isDraft: jsonSerialization['isDraft'] as bool,
      editingSession: jsonSerialization['editingSession'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int artworkId;

  _i2.ArtworkDTO? artwork;

  int artworkMasterId;

  int version;

  int salesOrderItemId;

  _i3.SalesOrderItemDTO? salesOrderItem;

  DateTime createdAt;

  int? createdById;

  DateTime? lastModifiedAt;

  int? lastModifiedById;

  DateTime? deletedAt;

  int? deletedById;

  int? editingById;

  DateTime? editingSince;

  bool isDraft;

  String? editingSession;

  /// Returns a shallow copy of this [SoiEinzelformaufbauDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SoiEinzelformaufbauDTO copyWith({
    int? id,
    int? artworkId,
    _i2.ArtworkDTO? artwork,
    int? artworkMasterId,
    int? version,
    int? salesOrderItemId,
    _i3.SalesOrderItemDTO? salesOrderItem,
    DateTime? createdAt,
    int? createdById,
    DateTime? lastModifiedAt,
    int? lastModifiedById,
    DateTime? deletedAt,
    int? deletedById,
    int? editingById,
    DateTime? editingSince,
    bool? isDraft,
    String? editingSession,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'artworkId': artworkId,
      if (artwork != null) 'artwork': artwork?.toJson(),
      'artworkMasterId': artworkMasterId,
      'version': version,
      'salesOrderItemId': salesOrderItemId,
      if (salesOrderItem != null) 'salesOrderItem': salesOrderItem?.toJson(),
      'createdAt': createdAt.toJson(),
      if (createdById != null) 'createdById': createdById,
      if (lastModifiedAt != null) 'lastModifiedAt': lastModifiedAt?.toJson(),
      if (lastModifiedById != null) 'lastModifiedById': lastModifiedById,
      if (deletedAt != null) 'deletedAt': deletedAt?.toJson(),
      if (deletedById != null) 'deletedById': deletedById,
      if (editingById != null) 'editingById': editingById,
      if (editingSince != null) 'editingSince': editingSince?.toJson(),
      'isDraft': isDraft,
      if (editingSession != null) 'editingSession': editingSession,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SoiEinzelformaufbauDTOImpl extends SoiEinzelformaufbauDTO {
  _SoiEinzelformaufbauDTOImpl({
    int? id,
    required int artworkId,
    _i2.ArtworkDTO? artwork,
    required int artworkMasterId,
    required int version,
    required int salesOrderItemId,
    _i3.SalesOrderItemDTO? salesOrderItem,
    required DateTime createdAt,
    int? createdById,
    DateTime? lastModifiedAt,
    int? lastModifiedById,
    DateTime? deletedAt,
    int? deletedById,
    int? editingById,
    DateTime? editingSince,
    required bool isDraft,
    String? editingSession,
  }) : super._(
          id: id,
          artworkId: artworkId,
          artwork: artwork,
          artworkMasterId: artworkMasterId,
          version: version,
          salesOrderItemId: salesOrderItemId,
          salesOrderItem: salesOrderItem,
          createdAt: createdAt,
          createdById: createdById,
          lastModifiedAt: lastModifiedAt,
          lastModifiedById: lastModifiedById,
          deletedAt: deletedAt,
          deletedById: deletedById,
          editingById: editingById,
          editingSince: editingSince,
          isDraft: isDraft,
          editingSession: editingSession,
        );

  /// Returns a shallow copy of this [SoiEinzelformaufbauDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SoiEinzelformaufbauDTO copyWith({
    Object? id = _Undefined,
    int? artworkId,
    Object? artwork = _Undefined,
    int? artworkMasterId,
    int? version,
    int? salesOrderItemId,
    Object? salesOrderItem = _Undefined,
    DateTime? createdAt,
    Object? createdById = _Undefined,
    Object? lastModifiedAt = _Undefined,
    Object? lastModifiedById = _Undefined,
    Object? deletedAt = _Undefined,
    Object? deletedById = _Undefined,
    Object? editingById = _Undefined,
    Object? editingSince = _Undefined,
    bool? isDraft,
    Object? editingSession = _Undefined,
  }) {
    return SoiEinzelformaufbauDTO(
      id: id is int? ? id : this.id,
      artworkId: artworkId ?? this.artworkId,
      artwork: artwork is _i2.ArtworkDTO? ? artwork : this.artwork?.copyWith(),
      artworkMasterId: artworkMasterId ?? this.artworkMasterId,
      version: version ?? this.version,
      salesOrderItemId: salesOrderItemId ?? this.salesOrderItemId,
      salesOrderItem: salesOrderItem is _i3.SalesOrderItemDTO?
          ? salesOrderItem
          : this.salesOrderItem?.copyWith(),
      createdAt: createdAt ?? this.createdAt,
      createdById: createdById is int? ? createdById : this.createdById,
      lastModifiedAt:
          lastModifiedAt is DateTime? ? lastModifiedAt : this.lastModifiedAt,
      lastModifiedById:
          lastModifiedById is int? ? lastModifiedById : this.lastModifiedById,
      deletedAt: deletedAt is DateTime? ? deletedAt : this.deletedAt,
      deletedById: deletedById is int? ? deletedById : this.deletedById,
      editingById: editingById is int? ? editingById : this.editingById,
      editingSince:
          editingSince is DateTime? ? editingSince : this.editingSince,
      isDraft: isDraft ?? this.isDraft,
      editingSession:
          editingSession is String? ? editingSession : this.editingSession,
    );
  }
}
