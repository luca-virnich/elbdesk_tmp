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
import '../../../../../modules/sales/sales_order/models/sales_order.dart'
    as _i2;
import '../../../../../modules/prepress/nutzenlayout/models/tables/nutzenlayout_dto.dart'
    as _i3;
import '../../../../../modules/prepress/nutzenlayout/models/tables/sales_order_single_nutzenlayout_artwork_jt.dart'
    as _i4;
import '../../../../../modules/prepress/drucklayout/models/drucklayout_single_nutzenlayout_jt.dart'
    as _i5;

abstract class SalesOrderSingleNutzenlayoutDTO
    implements _i1.SerializableModel {
  SalesOrderSingleNutzenlayoutDTO._({
    this.id,
    required this.salesOrderId,
    this.salesOrder,
    required this.nutzenlayoutId,
    this.nutzenlayout,
    this.artworks,
    this.drucklayouts,
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

  factory SalesOrderSingleNutzenlayoutDTO({
    int? id,
    required int salesOrderId,
    _i2.SalesOrderDTO? salesOrder,
    required int nutzenlayoutId,
    _i3.NutzenlayoutDTO? nutzenlayout,
    List<_i4.SalesOrderSingleNutzenlayoutArtworkJT>? artworks,
    List<_i5.DrucklayoutSingleNutzenlayoutJT>? drucklayouts,
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
  }) = _SalesOrderSingleNutzenlayoutDTOImpl;

  factory SalesOrderSingleNutzenlayoutDTO.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return SalesOrderSingleNutzenlayoutDTO(
      id: jsonSerialization['id'] as int?,
      salesOrderId: jsonSerialization['salesOrderId'] as int,
      salesOrder: jsonSerialization['salesOrder'] == null
          ? null
          : _i2.SalesOrderDTO.fromJson(
              (jsonSerialization['salesOrder'] as Map<String, dynamic>)),
      nutzenlayoutId: jsonSerialization['nutzenlayoutId'] as int,
      nutzenlayout: jsonSerialization['nutzenlayout'] == null
          ? null
          : _i3.NutzenlayoutDTO.fromJson(
              (jsonSerialization['nutzenlayout'] as Map<String, dynamic>)),
      artworks: (jsonSerialization['artworks'] as List?)
          ?.map((e) => _i4.SalesOrderSingleNutzenlayoutArtworkJT.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      drucklayouts: (jsonSerialization['drucklayouts'] as List?)
          ?.map((e) => _i5.DrucklayoutSingleNutzenlayoutJT.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
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

  int salesOrderId;

  _i2.SalesOrderDTO? salesOrder;

  int nutzenlayoutId;

  _i3.NutzenlayoutDTO? nutzenlayout;

  List<_i4.SalesOrderSingleNutzenlayoutArtworkJT>? artworks;

  List<_i5.DrucklayoutSingleNutzenlayoutJT>? drucklayouts;

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

  /// Returns a shallow copy of this [SalesOrderSingleNutzenlayoutDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SalesOrderSingleNutzenlayoutDTO copyWith({
    int? id,
    int? salesOrderId,
    _i2.SalesOrderDTO? salesOrder,
    int? nutzenlayoutId,
    _i3.NutzenlayoutDTO? nutzenlayout,
    List<_i4.SalesOrderSingleNutzenlayoutArtworkJT>? artworks,
    List<_i5.DrucklayoutSingleNutzenlayoutJT>? drucklayouts,
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
      'salesOrderId': salesOrderId,
      if (salesOrder != null) 'salesOrder': salesOrder?.toJson(),
      'nutzenlayoutId': nutzenlayoutId,
      if (nutzenlayout != null) 'nutzenlayout': nutzenlayout?.toJson(),
      if (artworks != null)
        'artworks': artworks?.toJson(valueToJson: (v) => v.toJson()),
      if (drucklayouts != null)
        'drucklayouts': drucklayouts?.toJson(valueToJson: (v) => v.toJson()),
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

class _SalesOrderSingleNutzenlayoutDTOImpl
    extends SalesOrderSingleNutzenlayoutDTO {
  _SalesOrderSingleNutzenlayoutDTOImpl({
    int? id,
    required int salesOrderId,
    _i2.SalesOrderDTO? salesOrder,
    required int nutzenlayoutId,
    _i3.NutzenlayoutDTO? nutzenlayout,
    List<_i4.SalesOrderSingleNutzenlayoutArtworkJT>? artworks,
    List<_i5.DrucklayoutSingleNutzenlayoutJT>? drucklayouts,
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
          salesOrderId: salesOrderId,
          salesOrder: salesOrder,
          nutzenlayoutId: nutzenlayoutId,
          nutzenlayout: nutzenlayout,
          artworks: artworks,
          drucklayouts: drucklayouts,
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

  /// Returns a shallow copy of this [SalesOrderSingleNutzenlayoutDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SalesOrderSingleNutzenlayoutDTO copyWith({
    Object? id = _Undefined,
    int? salesOrderId,
    Object? salesOrder = _Undefined,
    int? nutzenlayoutId,
    Object? nutzenlayout = _Undefined,
    Object? artworks = _Undefined,
    Object? drucklayouts = _Undefined,
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
    return SalesOrderSingleNutzenlayoutDTO(
      id: id is int? ? id : this.id,
      salesOrderId: salesOrderId ?? this.salesOrderId,
      salesOrder: salesOrder is _i2.SalesOrderDTO?
          ? salesOrder
          : this.salesOrder?.copyWith(),
      nutzenlayoutId: nutzenlayoutId ?? this.nutzenlayoutId,
      nutzenlayout: nutzenlayout is _i3.NutzenlayoutDTO?
          ? nutzenlayout
          : this.nutzenlayout?.copyWith(),
      artworks: artworks is List<_i4.SalesOrderSingleNutzenlayoutArtworkJT>?
          ? artworks
          : this.artworks?.map((e0) => e0.copyWith()).toList(),
      drucklayouts: drucklayouts is List<_i5.DrucklayoutSingleNutzenlayoutJT>?
          ? drucklayouts
          : this.drucklayouts?.map((e0) => e0.copyWith()).toList(),
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
