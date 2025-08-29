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
import '../../../../../modules/prepress/nutzenlayout/models/tables/sales_order_multi_nutzenlayout_dto.dart'
    as _i2;
import '../../../../../modules/prepress/artwork/models/artwork.dart' as _i3;

abstract class SalesOrderMultiNutzenlayoutArtworkJT
    implements _i1.SerializableModel {
  SalesOrderMultiNutzenlayoutArtworkJT._({
    this.id,
    required this.salesOrderMultiNutzenlayoutId,
    this.salesOrderMultiNutzenlayout,
    required this.artworkId,
    this.artwork,
  });

  factory SalesOrderMultiNutzenlayoutArtworkJT({
    int? id,
    required int salesOrderMultiNutzenlayoutId,
    _i2.SalesOrderMultiNutzenlayoutDTO? salesOrderMultiNutzenlayout,
    required int artworkId,
    _i3.ArtworkDTO? artwork,
  }) = _SalesOrderMultiNutzenlayoutArtworkJTImpl;

  factory SalesOrderMultiNutzenlayoutArtworkJT.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return SalesOrderMultiNutzenlayoutArtworkJT(
      id: jsonSerialization['id'] as int?,
      salesOrderMultiNutzenlayoutId:
          jsonSerialization['salesOrderMultiNutzenlayoutId'] as int,
      salesOrderMultiNutzenlayout:
          jsonSerialization['salesOrderMultiNutzenlayout'] == null
              ? null
              : _i2.SalesOrderMultiNutzenlayoutDTO.fromJson(
                  (jsonSerialization['salesOrderMultiNutzenlayout']
                      as Map<String, dynamic>)),
      artworkId: jsonSerialization['artworkId'] as int,
      artwork: jsonSerialization['artwork'] == null
          ? null
          : _i3.ArtworkDTO.fromJson(
              (jsonSerialization['artwork'] as Map<String, dynamic>)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int salesOrderMultiNutzenlayoutId;

  _i2.SalesOrderMultiNutzenlayoutDTO? salesOrderMultiNutzenlayout;

  int artworkId;

  _i3.ArtworkDTO? artwork;

  /// Returns a shallow copy of this [SalesOrderMultiNutzenlayoutArtworkJT]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SalesOrderMultiNutzenlayoutArtworkJT copyWith({
    int? id,
    int? salesOrderMultiNutzenlayoutId,
    _i2.SalesOrderMultiNutzenlayoutDTO? salesOrderMultiNutzenlayout,
    int? artworkId,
    _i3.ArtworkDTO? artwork,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'salesOrderMultiNutzenlayoutId': salesOrderMultiNutzenlayoutId,
      if (salesOrderMultiNutzenlayout != null)
        'salesOrderMultiNutzenlayout': salesOrderMultiNutzenlayout?.toJson(),
      'artworkId': artworkId,
      if (artwork != null) 'artwork': artwork?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SalesOrderMultiNutzenlayoutArtworkJTImpl
    extends SalesOrderMultiNutzenlayoutArtworkJT {
  _SalesOrderMultiNutzenlayoutArtworkJTImpl({
    int? id,
    required int salesOrderMultiNutzenlayoutId,
    _i2.SalesOrderMultiNutzenlayoutDTO? salesOrderMultiNutzenlayout,
    required int artworkId,
    _i3.ArtworkDTO? artwork,
  }) : super._(
          id: id,
          salesOrderMultiNutzenlayoutId: salesOrderMultiNutzenlayoutId,
          salesOrderMultiNutzenlayout: salesOrderMultiNutzenlayout,
          artworkId: artworkId,
          artwork: artwork,
        );

  /// Returns a shallow copy of this [SalesOrderMultiNutzenlayoutArtworkJT]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SalesOrderMultiNutzenlayoutArtworkJT copyWith({
    Object? id = _Undefined,
    int? salesOrderMultiNutzenlayoutId,
    Object? salesOrderMultiNutzenlayout = _Undefined,
    int? artworkId,
    Object? artwork = _Undefined,
  }) {
    return SalesOrderMultiNutzenlayoutArtworkJT(
      id: id is int? ? id : this.id,
      salesOrderMultiNutzenlayoutId:
          salesOrderMultiNutzenlayoutId ?? this.salesOrderMultiNutzenlayoutId,
      salesOrderMultiNutzenlayout:
          salesOrderMultiNutzenlayout is _i2.SalesOrderMultiNutzenlayoutDTO?
              ? salesOrderMultiNutzenlayout
              : this.salesOrderMultiNutzenlayout?.copyWith(),
      artworkId: artworkId ?? this.artworkId,
      artwork: artwork is _i3.ArtworkDTO? ? artwork : this.artwork?.copyWith(),
    );
  }
}
