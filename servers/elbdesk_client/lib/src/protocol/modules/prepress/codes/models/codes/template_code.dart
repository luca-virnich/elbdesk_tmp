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

abstract class TemplateCodeDTO implements _i1.SerializableModel {
  TemplateCodeDTO._({
    this.codeSize,
    this.errorCorrection,
    this.outputResolution,
    this.barWidthReduction,
    this.deviceCompensation,
    this.narrowBarWidth,
    this.cellSize,
    this.magnification,
    this.aspectRatio,
  });

  factory TemplateCodeDTO({
    double? codeSize,
    double? errorCorrection,
    double? outputResolution,
    double? barWidthReduction,
    double? deviceCompensation,
    double? narrowBarWidth,
    double? cellSize,
    double? magnification,
    double? aspectRatio,
  }) = _TemplateCodeDTOImpl;

  factory TemplateCodeDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return TemplateCodeDTO(
      codeSize: (jsonSerialization['codeSize'] as num?)?.toDouble(),
      errorCorrection:
          (jsonSerialization['errorCorrection'] as num?)?.toDouble(),
      outputResolution:
          (jsonSerialization['outputResolution'] as num?)?.toDouble(),
      barWidthReduction:
          (jsonSerialization['barWidthReduction'] as num?)?.toDouble(),
      deviceCompensation:
          (jsonSerialization['deviceCompensation'] as num?)?.toDouble(),
      narrowBarWidth: (jsonSerialization['narrowBarWidth'] as num?)?.toDouble(),
      cellSize: (jsonSerialization['cellSize'] as num?)?.toDouble(),
      magnification: (jsonSerialization['magnification'] as num?)?.toDouble(),
      aspectRatio: (jsonSerialization['aspectRatio'] as num?)?.toDouble(),
    );
  }

  double? codeSize;

  double? errorCorrection;

  double? outputResolution;

  double? barWidthReduction;

  double? deviceCompensation;

  double? narrowBarWidth;

  double? cellSize;

  double? magnification;

  double? aspectRatio;

  /// Returns a shallow copy of this [TemplateCodeDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TemplateCodeDTO copyWith({
    double? codeSize,
    double? errorCorrection,
    double? outputResolution,
    double? barWidthReduction,
    double? deviceCompensation,
    double? narrowBarWidth,
    double? cellSize,
    double? magnification,
    double? aspectRatio,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (codeSize != null) 'codeSize': codeSize,
      if (errorCorrection != null) 'errorCorrection': errorCorrection,
      if (outputResolution != null) 'outputResolution': outputResolution,
      if (barWidthReduction != null) 'barWidthReduction': barWidthReduction,
      if (deviceCompensation != null) 'deviceCompensation': deviceCompensation,
      if (narrowBarWidth != null) 'narrowBarWidth': narrowBarWidth,
      if (cellSize != null) 'cellSize': cellSize,
      if (magnification != null) 'magnification': magnification,
      if (aspectRatio != null) 'aspectRatio': aspectRatio,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TemplateCodeDTOImpl extends TemplateCodeDTO {
  _TemplateCodeDTOImpl({
    double? codeSize,
    double? errorCorrection,
    double? outputResolution,
    double? barWidthReduction,
    double? deviceCompensation,
    double? narrowBarWidth,
    double? cellSize,
    double? magnification,
    double? aspectRatio,
  }) : super._(
          codeSize: codeSize,
          errorCorrection: errorCorrection,
          outputResolution: outputResolution,
          barWidthReduction: barWidthReduction,
          deviceCompensation: deviceCompensation,
          narrowBarWidth: narrowBarWidth,
          cellSize: cellSize,
          magnification: magnification,
          aspectRatio: aspectRatio,
        );

  /// Returns a shallow copy of this [TemplateCodeDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TemplateCodeDTO copyWith({
    Object? codeSize = _Undefined,
    Object? errorCorrection = _Undefined,
    Object? outputResolution = _Undefined,
    Object? barWidthReduction = _Undefined,
    Object? deviceCompensation = _Undefined,
    Object? narrowBarWidth = _Undefined,
    Object? cellSize = _Undefined,
    Object? magnification = _Undefined,
    Object? aspectRatio = _Undefined,
  }) {
    return TemplateCodeDTO(
      codeSize: codeSize is double? ? codeSize : this.codeSize,
      errorCorrection:
          errorCorrection is double? ? errorCorrection : this.errorCorrection,
      outputResolution: outputResolution is double?
          ? outputResolution
          : this.outputResolution,
      barWidthReduction: barWidthReduction is double?
          ? barWidthReduction
          : this.barWidthReduction,
      deviceCompensation: deviceCompensation is double?
          ? deviceCompensation
          : this.deviceCompensation,
      narrowBarWidth:
          narrowBarWidth is double? ? narrowBarWidth : this.narrowBarWidth,
      cellSize: cellSize is double? ? cellSize : this.cellSize,
      magnification:
          magnification is double? ? magnification : this.magnification,
      aspectRatio: aspectRatio is double? ? aspectRatio : this.aspectRatio,
    );
  }
}
