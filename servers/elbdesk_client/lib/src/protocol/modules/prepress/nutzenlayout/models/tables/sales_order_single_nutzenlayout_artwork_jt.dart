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
import '../../../../../modules/prepress/nutzenlayout/models/tables/sales_order_single_nutzenlayout_dto.dart'
    as _i2;
import '../../../../../modules/prepress/artwork/models/artwork.dart' as _i3;

abstract class SalesOrderSingleNutzenlayoutArtworkJT
    implements _i1.SerializableModel {
  SalesOrderSingleNutzenlayoutArtworkJT._({
    this.id,
    required this.salesOrderSingleNutzenlayoutId,
    this.salesOrderSingleNutzenlayout,
    required this.artworkId,
    this.artwork,
  });

  factory SalesOrderSingleNutzenlayoutArtworkJT({
    int? id,
    required int salesOrderSingleNutzenlayoutId,
    _i2.SalesOrderSingleNutzenlayoutDTO? salesOrderSingleNutzenlayout,
    required int artworkId,
    _i3.ArtworkDTO? artwork,
  }) = _SalesOrderSingleNutzenlayoutArtworkJTImpl;

  factory SalesOrderSingleNutzenlayoutArtworkJT.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return SalesOrderSingleNutzenlayoutArtworkJT(
      id: jsonSerialization['id'] as int?,
      salesOrderSingleNutzenlayoutId:
          jsonSerialization['salesOrderSingleNutzenlayoutId'] as int,
      salesOrderSingleNutzenlayout:
          jsonSerialization['salesOrderSingleNutzenlayout'] == null
              ? null
              : _i2.SalesOrderSingleNutzenlayoutDTO.fromJson(
                  (jsonSerialization['salesOrderSingleNutzenlayout']
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

  int salesOrderSingleNutzenlayoutId;

  _i2.SalesOrderSingleNutzenlayoutDTO? salesOrderSingleNutzenlayout;

  int artworkId;

  _i3.ArtworkDTO? artwork;

  /// Returns a shallow copy of this [SalesOrderSingleNutzenlayoutArtworkJT]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SalesOrderSingleNutzenlayoutArtworkJT copyWith({
    int? id,
    int? salesOrderSingleNutzenlayoutId,
    _i2.SalesOrderSingleNutzenlayoutDTO? salesOrderSingleNutzenlayout,
    int? artworkId,
    _i3.ArtworkDTO? artwork,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'salesOrderSingleNutzenlayoutId': salesOrderSingleNutzenlayoutId,
      if (salesOrderSingleNutzenlayout != null)
        'salesOrderSingleNutzenlayout': salesOrderSingleNutzenlayout?.toJson(),
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

class _SalesOrderSingleNutzenlayoutArtworkJTImpl
    extends SalesOrderSingleNutzenlayoutArtworkJT {
  _SalesOrderSingleNutzenlayoutArtworkJTImpl({
    int? id,
    required int salesOrderSingleNutzenlayoutId,
    _i2.SalesOrderSingleNutzenlayoutDTO? salesOrderSingleNutzenlayout,
    required int artworkId,
    _i3.ArtworkDTO? artwork,
  }) : super._(
          id: id,
          salesOrderSingleNutzenlayoutId: salesOrderSingleNutzenlayoutId,
          salesOrderSingleNutzenlayout: salesOrderSingleNutzenlayout,
          artworkId: artworkId,
          artwork: artwork,
        );

  /// Returns a shallow copy of this [SalesOrderSingleNutzenlayoutArtworkJT]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SalesOrderSingleNutzenlayoutArtworkJT copyWith({
    Object? id = _Undefined,
    int? salesOrderSingleNutzenlayoutId,
    Object? salesOrderSingleNutzenlayout = _Undefined,
    int? artworkId,
    Object? artwork = _Undefined,
  }) {
    return SalesOrderSingleNutzenlayoutArtworkJT(
      id: id is int? ? id : this.id,
      salesOrderSingleNutzenlayoutId:
          salesOrderSingleNutzenlayoutId ?? this.salesOrderSingleNutzenlayoutId,
      salesOrderSingleNutzenlayout:
          salesOrderSingleNutzenlayout is _i2.SalesOrderSingleNutzenlayoutDTO?
              ? salesOrderSingleNutzenlayout
              : this.salesOrderSingleNutzenlayout?.copyWith(),
      artworkId: artworkId ?? this.artworkId,
      artwork: artwork is _i3.ArtworkDTO? ? artwork : this.artwork?.copyWith(),
    );
  }
}
