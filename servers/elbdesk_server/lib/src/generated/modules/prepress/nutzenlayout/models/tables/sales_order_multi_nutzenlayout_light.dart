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
import '../../../../../modules/prepress/nutzenlayout/models/tables/nutzenlayout_dto.dart'
    as _i2;

abstract class SalesOrderMultiNutzenlayoutLightDTO
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  SalesOrderMultiNutzenlayoutLightDTO._({
    required this.nutzenlayout,
    required this.artworks,
    required this.salesOrderId,
    required this.salesOrderMultiNutzenlayoutId,
  });

  factory SalesOrderMultiNutzenlayoutLightDTO({
    required _i2.NutzenlayoutDTO nutzenlayout,
    required List<int> artworks,
    required int salesOrderId,
    required int salesOrderMultiNutzenlayoutId,
  }) = _SalesOrderMultiNutzenlayoutLightDTOImpl;

  factory SalesOrderMultiNutzenlayoutLightDTO.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return SalesOrderMultiNutzenlayoutLightDTO(
      nutzenlayout: _i2.NutzenlayoutDTO.fromJson(
          (jsonSerialization['nutzenlayout'] as Map<String, dynamic>)),
      artworks:
          (jsonSerialization['artworks'] as List).map((e) => e as int).toList(),
      salesOrderId: jsonSerialization['salesOrderId'] as int,
      salesOrderMultiNutzenlayoutId:
          jsonSerialization['salesOrderMultiNutzenlayoutId'] as int,
    );
  }

  _i2.NutzenlayoutDTO nutzenlayout;

  List<int> artworks;

  int salesOrderId;

  int salesOrderMultiNutzenlayoutId;

  /// Returns a shallow copy of this [SalesOrderMultiNutzenlayoutLightDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SalesOrderMultiNutzenlayoutLightDTO copyWith({
    _i2.NutzenlayoutDTO? nutzenlayout,
    List<int>? artworks,
    int? salesOrderId,
    int? salesOrderMultiNutzenlayoutId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'nutzenlayout': nutzenlayout.toJson(),
      'artworks': artworks.toJson(),
      'salesOrderId': salesOrderId,
      'salesOrderMultiNutzenlayoutId': salesOrderMultiNutzenlayoutId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'nutzenlayout': nutzenlayout.toJsonForProtocol(),
      'artworks': artworks.toJson(),
      'salesOrderId': salesOrderId,
      'salesOrderMultiNutzenlayoutId': salesOrderMultiNutzenlayoutId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _SalesOrderMultiNutzenlayoutLightDTOImpl
    extends SalesOrderMultiNutzenlayoutLightDTO {
  _SalesOrderMultiNutzenlayoutLightDTOImpl({
    required _i2.NutzenlayoutDTO nutzenlayout,
    required List<int> artworks,
    required int salesOrderId,
    required int salesOrderMultiNutzenlayoutId,
  }) : super._(
          nutzenlayout: nutzenlayout,
          artworks: artworks,
          salesOrderId: salesOrderId,
          salesOrderMultiNutzenlayoutId: salesOrderMultiNutzenlayoutId,
        );

  /// Returns a shallow copy of this [SalesOrderMultiNutzenlayoutLightDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SalesOrderMultiNutzenlayoutLightDTO copyWith({
    _i2.NutzenlayoutDTO? nutzenlayout,
    List<int>? artworks,
    int? salesOrderId,
    int? salesOrderMultiNutzenlayoutId,
  }) {
    return SalesOrderMultiNutzenlayoutLightDTO(
      nutzenlayout: nutzenlayout ?? this.nutzenlayout.copyWith(),
      artworks: artworks ?? this.artworks.map((e0) => e0).toList(),
      salesOrderId: salesOrderId ?? this.salesOrderId,
      salesOrderMultiNutzenlayoutId:
          salesOrderMultiNutzenlayoutId ?? this.salesOrderMultiNutzenlayoutId,
    );
  }
}
