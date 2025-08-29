import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'twoOf5_code.freezed.dart';
part 'twoOf5_code.g.dart';

/// Represents a 2OF5 code
@freezed
class TwoOf5Code with _$TwoOf5Code {
  const factory TwoOf5Code({
    /// Id of the artwork code

    /// Bar width reduction (strichbreitenReduzierung)
    double? barWidthReduction,

    /// Device compensation (geraeteKompensation)
    double? deviceCompensation,

    /// Narrow bar width (schmalerStrich)
    double? narrowBarWidth,

    /// Aspect ratio (verhaeltnis)
    double? aspectRatio,
  }) = _TwoOf5Code;

  // Initial
  factory TwoOf5Code.initial() {
    return const TwoOf5Code(
      barWidthReduction: 0,
      deviceCompensation: 0,
      narrowBarWidth: 0,
      aspectRatio: 0,
    );
  }

  const TwoOf5Code._();

  factory TwoOf5Code.fromJson(Map<String, Object?> json) =>
      _$TwoOf5CodeFromJson(json);

  /// Creates an OFCode from a DTO
  factory TwoOf5Code.fromDTO(TwoOf5CodeDTO dto) {
    return TwoOf5Code(
      barWidthReduction: dto.barWidthReduction,
      deviceCompensation: dto.deviceCompensation,
      narrowBarWidth: dto.narrowBarWidth,
      aspectRatio: dto.aspectRatio,
    );
  }

  /// Converts the OFCode to a DTO
  TwoOf5CodeDTO toDTO() {
    return TwoOf5CodeDTO(
      barWidthReduction: barWidthReduction,
      deviceCompensation: deviceCompensation,
      narrowBarWidth: narrowBarWidth,
      aspectRatio: aspectRatio,
    );
  }
}
