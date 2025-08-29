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
import '../../../../modules/prepress/artwork/models/artwork.dart' as _i2;

abstract class ArtworkSalesOrderUpdate
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  ArtworkSalesOrderUpdate._({
    required this.artwork,
    required this.prevSalesOrderId,
    required this.nextSalesOrderId,
  });

  factory ArtworkSalesOrderUpdate({
    required _i2.ArtworkDTO artwork,
    required int prevSalesOrderId,
    required int nextSalesOrderId,
  }) = _ArtworkSalesOrderUpdateImpl;

  factory ArtworkSalesOrderUpdate.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return ArtworkSalesOrderUpdate(
      artwork: _i2.ArtworkDTO.fromJson(
          (jsonSerialization['artwork'] as Map<String, dynamic>)),
      prevSalesOrderId: jsonSerialization['prevSalesOrderId'] as int,
      nextSalesOrderId: jsonSerialization['nextSalesOrderId'] as int,
    );
  }

  _i2.ArtworkDTO artwork;

  int prevSalesOrderId;

  int nextSalesOrderId;

  /// Returns a shallow copy of this [ArtworkSalesOrderUpdate]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ArtworkSalesOrderUpdate copyWith({
    _i2.ArtworkDTO? artwork,
    int? prevSalesOrderId,
    int? nextSalesOrderId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'artwork': artwork.toJson(),
      'prevSalesOrderId': prevSalesOrderId,
      'nextSalesOrderId': nextSalesOrderId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'artwork': artwork.toJsonForProtocol(),
      'prevSalesOrderId': prevSalesOrderId,
      'nextSalesOrderId': nextSalesOrderId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _ArtworkSalesOrderUpdateImpl extends ArtworkSalesOrderUpdate {
  _ArtworkSalesOrderUpdateImpl({
    required _i2.ArtworkDTO artwork,
    required int prevSalesOrderId,
    required int nextSalesOrderId,
  }) : super._(
          artwork: artwork,
          prevSalesOrderId: prevSalesOrderId,
          nextSalesOrderId: nextSalesOrderId,
        );

  /// Returns a shallow copy of this [ArtworkSalesOrderUpdate]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ArtworkSalesOrderUpdate copyWith({
    _i2.ArtworkDTO? artwork,
    int? prevSalesOrderId,
    int? nextSalesOrderId,
  }) {
    return ArtworkSalesOrderUpdate(
      artwork: artwork ?? this.artwork.copyWith(),
      prevSalesOrderId: prevSalesOrderId ?? this.prevSalesOrderId,
      nextSalesOrderId: nextSalesOrderId ?? this.nextSalesOrderId,
    );
  }
}
