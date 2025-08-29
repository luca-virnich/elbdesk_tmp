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
import '../../../../modules/prepress/nutzenlayout/models/nutzenlayout_laufrichtung.dart'
    as _i2;

abstract class NutzenlayoutCellDTO
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  NutzenlayoutCellDTO._({
    required this.width,
    required this.height,
    this.artworkId,
    this.artworkMasterId,
    required this.laufrichtung,
    required this.gapHorizontal,
  });

  factory NutzenlayoutCellDTO({
    required double width,
    required double height,
    int? artworkId,
    int? artworkMasterId,
    required _i2.NutzenlayoutLaufrichtung laufrichtung,
    required double gapHorizontal,
  }) = _NutzenlayoutCellDTOImpl;

  factory NutzenlayoutCellDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return NutzenlayoutCellDTO(
      width: (jsonSerialization['width'] as num).toDouble(),
      height: (jsonSerialization['height'] as num).toDouble(),
      artworkId: jsonSerialization['artworkId'] as int?,
      artworkMasterId: jsonSerialization['artworkMasterId'] as int?,
      laufrichtung: _i2.NutzenlayoutLaufrichtung.fromJson(
          (jsonSerialization['laufrichtung'] as String)),
      gapHorizontal: (jsonSerialization['gapHorizontal'] as num).toDouble(),
    );
  }

  double width;

  double height;

  int? artworkId;

  int? artworkMasterId;

  _i2.NutzenlayoutLaufrichtung laufrichtung;

  double gapHorizontal;

  /// Returns a shallow copy of this [NutzenlayoutCellDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  NutzenlayoutCellDTO copyWith({
    double? width,
    double? height,
    int? artworkId,
    int? artworkMasterId,
    _i2.NutzenlayoutLaufrichtung? laufrichtung,
    double? gapHorizontal,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'width': width,
      'height': height,
      if (artworkId != null) 'artworkId': artworkId,
      if (artworkMasterId != null) 'artworkMasterId': artworkMasterId,
      'laufrichtung': laufrichtung.toJson(),
      'gapHorizontal': gapHorizontal,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'width': width,
      'height': height,
      if (artworkId != null) 'artworkId': artworkId,
      if (artworkMasterId != null) 'artworkMasterId': artworkMasterId,
      'laufrichtung': laufrichtung.toJson(),
      'gapHorizontal': gapHorizontal,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _NutzenlayoutCellDTOImpl extends NutzenlayoutCellDTO {
  _NutzenlayoutCellDTOImpl({
    required double width,
    required double height,
    int? artworkId,
    int? artworkMasterId,
    required _i2.NutzenlayoutLaufrichtung laufrichtung,
    required double gapHorizontal,
  }) : super._(
          width: width,
          height: height,
          artworkId: artworkId,
          artworkMasterId: artworkMasterId,
          laufrichtung: laufrichtung,
          gapHorizontal: gapHorizontal,
        );

  /// Returns a shallow copy of this [NutzenlayoutCellDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  NutzenlayoutCellDTO copyWith({
    double? width,
    double? height,
    Object? artworkId = _Undefined,
    Object? artworkMasterId = _Undefined,
    _i2.NutzenlayoutLaufrichtung? laufrichtung,
    double? gapHorizontal,
  }) {
    return NutzenlayoutCellDTO(
      width: width ?? this.width,
      height: height ?? this.height,
      artworkId: artworkId is int? ? artworkId : this.artworkId,
      artworkMasterId:
          artworkMasterId is int? ? artworkMasterId : this.artworkMasterId,
      laufrichtung: laufrichtung ?? this.laufrichtung,
      gapHorizontal: gapHorizontal ?? this.gapHorizontal,
    );
  }
}
