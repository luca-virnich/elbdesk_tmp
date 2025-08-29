import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'template_code.freezed.dart';
part 'template_code.g.dart';

/// Represents a template code
@freezed
class TemplateCode with _$TemplateCode {
  const factory TemplateCode({
    /// Size
    double? codeSize,

    /// Error correction level (fehlerKorrektur)
    double? errorCorrection,

    /// Output resolution in DPI (ausgabeAufloesung)
    double? outputResolution,

    /// Bar width reduction (strichbreitenReduzierung)
    double? barWidthReduction,

    /// Device compensation (geraeteKompensation)
    double? deviceCompensation,

    /// Narrow bar width (schmalerStrich)
    double? narrowBarWidth,

    /// Cell size (zellengroesse)
    double? cellSize,

    /// Magnification factor (vergroesserung)
    double? magnification,

    /// Aspect ratio (verhaeltnis)
    double? aspectRatio,
  }) = _TemplateCode;

  const TemplateCode._();

  factory TemplateCode.fromJson(Map<String, Object?> json) =>
      _$TemplateCodeFromJson(json);

  // Initial
  factory TemplateCode.initial() {
    return const TemplateCode(
      codeSize: 0,
      errorCorrection: 0,
      outputResolution: 0,
      barWidthReduction: 0,
      deviceCompensation: 0,
      narrowBarWidth: 0,
      cellSize: 0,
      magnification: 0,
      aspectRatio: 0,
    );
  }

  /// Creates a TemplateCode from a DTO
  factory TemplateCode.fromDTO(TemplateCodeDTO dto) {
    return TemplateCode(
      codeSize: dto.codeSize,
      errorCorrection: dto.errorCorrection,
      outputResolution: dto.outputResolution,
      barWidthReduction: dto.barWidthReduction,
      deviceCompensation: dto.deviceCompensation,
      narrowBarWidth: dto.narrowBarWidth,
      cellSize: dto.cellSize,
      magnification: dto.magnification,
      aspectRatio: dto.aspectRatio,
    );
  }

  /// Converts the TemplateCode to a DTO
  TemplateCodeDTO toDTO() {
    return TemplateCodeDTO(
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
  }
}
