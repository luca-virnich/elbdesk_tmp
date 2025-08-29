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

abstract class TrappingDTO
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  TrappingDTO._({
    required this.trappNormal,
    required this.trappBlack,
    required this.trappBilder,
    required this.trappSonderfarben,
    required this.trappRueckzug,
  });

  factory TrappingDTO({
    required double trappNormal,
    required double trappBlack,
    required double trappBilder,
    required double trappSonderfarben,
    required double trappRueckzug,
  }) = _TrappingDTOImpl;

  factory TrappingDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return TrappingDTO(
      trappNormal: (jsonSerialization['trappNormal'] as num).toDouble(),
      trappBlack: (jsonSerialization['trappBlack'] as num).toDouble(),
      trappBilder: (jsonSerialization['trappBilder'] as num).toDouble(),
      trappSonderfarben:
          (jsonSerialization['trappSonderfarben'] as num).toDouble(),
      trappRueckzug: (jsonSerialization['trappRueckzug'] as num).toDouble(),
    );
  }

  double trappNormal;

  double trappBlack;

  double trappBilder;

  double trappSonderfarben;

  double trappRueckzug;

  /// Returns a shallow copy of this [TrappingDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TrappingDTO copyWith({
    double? trappNormal,
    double? trappBlack,
    double? trappBilder,
    double? trappSonderfarben,
    double? trappRueckzug,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'trappNormal': trappNormal,
      'trappBlack': trappBlack,
      'trappBilder': trappBilder,
      'trappSonderfarben': trappSonderfarben,
      'trappRueckzug': trappRueckzug,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'trappNormal': trappNormal,
      'trappBlack': trappBlack,
      'trappBilder': trappBilder,
      'trappSonderfarben': trappSonderfarben,
      'trappRueckzug': trappRueckzug,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _TrappingDTOImpl extends TrappingDTO {
  _TrappingDTOImpl({
    required double trappNormal,
    required double trappBlack,
    required double trappBilder,
    required double trappSonderfarben,
    required double trappRueckzug,
  }) : super._(
          trappNormal: trappNormal,
          trappBlack: trappBlack,
          trappBilder: trappBilder,
          trappSonderfarben: trappSonderfarben,
          trappRueckzug: trappRueckzug,
        );

  /// Returns a shallow copy of this [TrappingDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TrappingDTO copyWith({
    double? trappNormal,
    double? trappBlack,
    double? trappBilder,
    double? trappSonderfarben,
    double? trappRueckzug,
  }) {
    return TrappingDTO(
      trappNormal: trappNormal ?? this.trappNormal,
      trappBlack: trappBlack ?? this.trappBlack,
      trappBilder: trappBilder ?? this.trappBilder,
      trappSonderfarben: trappSonderfarben ?? this.trappSonderfarben,
      trappRueckzug: trappRueckzug ?? this.trappRueckzug,
    );
  }
}
