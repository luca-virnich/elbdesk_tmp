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

abstract class AztecCodeDTO implements _i1.SerializableModel {
  AztecCodeDTO._({
    this.symbolSize,
    this.errorCorrection,
    this.deviceCompensation,
    this.cellSize,
  });

  factory AztecCodeDTO({
    double? symbolSize,
    double? errorCorrection,
    double? deviceCompensation,
    double? cellSize,
  }) = _AztecCodeDTOImpl;

  factory AztecCodeDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return AztecCodeDTO(
      symbolSize: (jsonSerialization['symbolSize'] as num?)?.toDouble(),
      errorCorrection:
          (jsonSerialization['errorCorrection'] as num?)?.toDouble(),
      deviceCompensation:
          (jsonSerialization['deviceCompensation'] as num?)?.toDouble(),
      cellSize: (jsonSerialization['cellSize'] as num?)?.toDouble(),
    );
  }

  double? symbolSize;

  double? errorCorrection;

  double? deviceCompensation;

  double? cellSize;

  /// Returns a shallow copy of this [AztecCodeDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AztecCodeDTO copyWith({
    double? symbolSize,
    double? errorCorrection,
    double? deviceCompensation,
    double? cellSize,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (symbolSize != null) 'symbolSize': symbolSize,
      if (errorCorrection != null) 'errorCorrection': errorCorrection,
      if (deviceCompensation != null) 'deviceCompensation': deviceCompensation,
      if (cellSize != null) 'cellSize': cellSize,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AztecCodeDTOImpl extends AztecCodeDTO {
  _AztecCodeDTOImpl({
    double? symbolSize,
    double? errorCorrection,
    double? deviceCompensation,
    double? cellSize,
  }) : super._(
          symbolSize: symbolSize,
          errorCorrection: errorCorrection,
          deviceCompensation: deviceCompensation,
          cellSize: cellSize,
        );

  /// Returns a shallow copy of this [AztecCodeDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AztecCodeDTO copyWith({
    Object? symbolSize = _Undefined,
    Object? errorCorrection = _Undefined,
    Object? deviceCompensation = _Undefined,
    Object? cellSize = _Undefined,
  }) {
    return AztecCodeDTO(
      symbolSize: symbolSize is double? ? symbolSize : this.symbolSize,
      errorCorrection:
          errorCorrection is double? ? errorCorrection : this.errorCorrection,
      deviceCompensation: deviceCompensation is double?
          ? deviceCompensation
          : this.deviceCompensation,
      cellSize: cellSize is double? ? cellSize : this.cellSize,
    );
  }
}
