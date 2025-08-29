import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/artwork_code/_export_artwork_code.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'artwork_code.freezed.dart';
part 'artwork_code.g.dart';

/// Represents a code associated with an artwork
@freezed
class ArtworkCode with _$ArtworkCode {
  const factory ArtworkCode({
    required String value,
    required ArtworkCodeType artworkCodeType,
    required TwoOf5Code? code2of5,
    required AztecCode? codeAztec,
    required TemplateCode? codeTemplate,
    required String runtimeId,
    String? description,
  }) = _ArtworkCode;

  // Initial
  factory ArtworkCode.initial(ArtworkCodeType type) {
    return ArtworkCode(
      runtimeId: const Uuid().v4(),
      value: '',
      artworkCodeType: type,
      code2of5: null,
      codeAztec: null,
      codeTemplate: null,
    );
  }

  /// Private constructor for access to properties
  const ArtworkCode._();

  factory ArtworkCode.fromJson(Map<String, Object?> json) =>
      _$ArtworkCodeFromJson(json);

  /// Creates an ArtworkCode from a DTO
  factory ArtworkCode.fromDTO(ArtworkCodeDTO dto) {
    return ArtworkCode(
      runtimeId: const Uuid().v4(),
      value: dto.value,
      description: dto.description,
      artworkCodeType: ArtworkCodeType.fromJson(dto.artworkCodeType),
      code2of5: dto.code2of5 != null ? TwoOf5Code.fromDTO(dto.code2of5!) : null,
      codeAztec:
          dto.codeAztec != null ? AztecCode.fromDTO(dto.codeAztec!) : null,
      codeTemplate: dto.codeTemplate != null
          ? TemplateCode.fromDTO(dto.codeTemplate!)
          : null,
    );
  }

  /// Converts the ArtworkCode to a DTO
  ArtworkCodeDTO toDTO() {
    return ArtworkCodeDTO(
      value: value,
      description: description,
      artworkCodeType: artworkCodeType.name,
      code2of5: code2of5?.toDTO(),
      codeAztec: codeAztec?.toDTO(),
      codeTemplate: codeTemplate?.toDTO(),
    );
  }
}
