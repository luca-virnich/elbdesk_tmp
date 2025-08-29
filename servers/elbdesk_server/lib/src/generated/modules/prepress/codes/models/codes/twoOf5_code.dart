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

abstract class TwoOf5CodeDTO
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  TwoOf5CodeDTO._({
    this.barWidthReduction,
    this.deviceCompensation,
    this.narrowBarWidth,
    this.aspectRatio,
  });

  factory TwoOf5CodeDTO({
    double? barWidthReduction,
    double? deviceCompensation,
    double? narrowBarWidth,
    double? aspectRatio,
  }) = _TwoOf5CodeDTOImpl;

  factory TwoOf5CodeDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return TwoOf5CodeDTO(
      barWidthReduction:
          (jsonSerialization['barWidthReduction'] as num?)?.toDouble(),
      deviceCompensation:
          (jsonSerialization['deviceCompensation'] as num?)?.toDouble(),
      narrowBarWidth: (jsonSerialization['narrowBarWidth'] as num?)?.toDouble(),
      aspectRatio: (jsonSerialization['aspectRatio'] as num?)?.toDouble(),
    );
  }

  double? barWidthReduction;

  double? deviceCompensation;

  double? narrowBarWidth;

  double? aspectRatio;

  /// Returns a shallow copy of this [TwoOf5CodeDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TwoOf5CodeDTO copyWith({
    double? barWidthReduction,
    double? deviceCompensation,
    double? narrowBarWidth,
    double? aspectRatio,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (barWidthReduction != null) 'barWidthReduction': barWidthReduction,
      if (deviceCompensation != null) 'deviceCompensation': deviceCompensation,
      if (narrowBarWidth != null) 'narrowBarWidth': narrowBarWidth,
      if (aspectRatio != null) 'aspectRatio': aspectRatio,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (barWidthReduction != null) 'barWidthReduction': barWidthReduction,
      if (deviceCompensation != null) 'deviceCompensation': deviceCompensation,
      if (narrowBarWidth != null) 'narrowBarWidth': narrowBarWidth,
      if (aspectRatio != null) 'aspectRatio': aspectRatio,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TwoOf5CodeDTOImpl extends TwoOf5CodeDTO {
  _TwoOf5CodeDTOImpl({
    double? barWidthReduction,
    double? deviceCompensation,
    double? narrowBarWidth,
    double? aspectRatio,
  }) : super._(
          barWidthReduction: barWidthReduction,
          deviceCompensation: deviceCompensation,
          narrowBarWidth: narrowBarWidth,
          aspectRatio: aspectRatio,
        );

  /// Returns a shallow copy of this [TwoOf5CodeDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TwoOf5CodeDTO copyWith({
    Object? barWidthReduction = _Undefined,
    Object? deviceCompensation = _Undefined,
    Object? narrowBarWidth = _Undefined,
    Object? aspectRatio = _Undefined,
  }) {
    return TwoOf5CodeDTO(
      barWidthReduction: barWidthReduction is double?
          ? barWidthReduction
          : this.barWidthReduction,
      deviceCompensation: deviceCompensation is double?
          ? deviceCompensation
          : this.deviceCompensation,
      narrowBarWidth:
          narrowBarWidth is double? ? narrowBarWidth : this.narrowBarWidth,
      aspectRatio: aspectRatio is double? ? aspectRatio : this.aspectRatio,
    );
  }
}
