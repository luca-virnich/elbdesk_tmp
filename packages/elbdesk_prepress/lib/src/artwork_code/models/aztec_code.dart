import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'aztec_code.freezed.dart';
part 'aztec_code.g.dart';

/// Represents an Aztec code
@freezed
class AztecCode with _$AztecCode {
  const factory AztecCode({
    /// Symbol size (symbolGroesse)
    double? symbolSize,

    /// Error correction level (fehlerKorrektur)
    double? errorCorrection,

    /// Device compensation (geraeteKompensation)
    double? deviceCompensation,

    /// Cell size (zellengroesse)
    double? cellSize,
  }) = _AztecCode;

  const AztecCode._();

  factory AztecCode.fromJson(Map<String, Object?> json) =>
      _$AztecCodeFromJson(json);

  // Initial
  factory AztecCode.initial() {
    return const AztecCode(
      symbolSize: 0,
      errorCorrection: 0,
      deviceCompensation: 0,
      cellSize: 0,
    );
  }

  /// Creates an AztecCode from a DTO
  factory AztecCode.fromDTO(AztecCodeDTO dto) {
    return AztecCode(
      symbolSize: dto.symbolSize,
      errorCorrection: dto.errorCorrection,
      deviceCompensation: dto.deviceCompensation,
      cellSize: dto.cellSize,
    );
  }

  /// Converts the AztecCode to a DTO
  AztecCodeDTO toDTO() {
    return AztecCodeDTO(
      symbolSize: symbolSize,
      errorCorrection: errorCorrection,
      deviceCompensation: deviceCompensation,
      cellSize: cellSize,
    );
  }
}
