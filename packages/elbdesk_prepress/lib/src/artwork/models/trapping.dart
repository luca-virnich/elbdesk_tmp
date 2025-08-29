import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'trapping.freezed.dart';
part 'trapping.g.dart';

@freezed
class Trapping with _$Trapping {
  factory Trapping({
    required double trappNormal,
    required double trappBlack,
    required double trappBilder,

    /// En: Special colors
    required double trappSonderfarben,

    /// En: Pullback or shrinkage
    required double trappRueckzug,
  }) = _Trapping;

  const Trapping._();

  factory Trapping.fromJson(Map<String, Object?> json) =>
      _$TrappingFromJson(json);

  factory Trapping.fromDTO(TrappingDTO dto) {
    return Trapping(
      trappNormal: dto.trappNormal,
      trappBlack: dto.trappBlack,
      trappBilder: dto.trappBilder,
      trappSonderfarben: dto.trappSonderfarben,
      trappRueckzug: dto.trappRueckzug,
    );
  }

  TrappingDTO toDTO() {
    return TrappingDTO(
      trappNormal: trappNormal,
      trappBlack: trappBlack,
      trappBilder: trappBilder,
      trappSonderfarben: trappSonderfarben,
      trappRueckzug: trappRueckzug,
    );
  }
}
