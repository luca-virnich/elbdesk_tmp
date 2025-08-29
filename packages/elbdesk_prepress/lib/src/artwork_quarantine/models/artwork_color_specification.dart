import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_prepress/src/artwork_color/models/artwork_color.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'artwork_color_specification.freezed.dart';
part 'artwork_color_specification.g.dart';

/// Represents a color specification from the XML data
///
/// This is used if a color was parsed from an XML but is not present in the
/// database.
@freezed
class ArtworkColorSpecification with _$ArtworkColorSpecification {
  const factory ArtworkColorSpecification({
    String? name,
    String? type,
    String? book,
    String? egname,
    double? frequency,
    double? angle,
    String? dotshape,
    double? r,
    double? g,
    double? b,
    String? attribute,
    String? printingmethod,
    ArtworkColor? databaseColor,
  }) = _ArtworkColorSpecification;

  factory ArtworkColorSpecification.fromJson(Map<String, dynamic> json) =>
      _$ArtworkColorSpecificationFromJson(json);

  factory ArtworkColorSpecification.fromDTO(ColorSpecificationDTO dto) {
    return ArtworkColorSpecification(
      name: dto.name,
      type: dto.type,
      book: dto.book,
      egname: dto.egname,
      frequency: dto.frequency,
      angle: dto.angle,
      dotshape: dto.dotshape,
      r: dto.r,
      g: dto.g,
      b: dto.b,
      attribute: dto.attribute,
      printingmethod: dto.printingmethod,
      databaseColor: dto.databaseColorId != null
          ? ArtworkColor.fromDTO(dto.databaseColor!)
          : null,
    );
  }

  /// Constructor
  const ArtworkColorSpecification._();

  ColorSpecificationDTO toDTO() {
    return ColorSpecificationDTO(
      name: name,
      type: type,
      book: book,
      egname: egname,
      frequency: frequency,
      angle: angle,
      dotshape: dotshape,
      r: r,
      g: g,
      b: b,
      attribute: attribute,
      printingmethod: printingmethod,
      databaseColor: databaseColor?.toDTO(),
    );
  }
}

/// Represents layer information from the XML data
@freezed
class LayerInfo with _$LayerInfo {
  const factory LayerInfo({
    required String name,
    required bool printable,
    required bool locked,
  }) = _LayerInfo;

  factory LayerInfo.fromJson(Map<String, dynamic> json) =>
      _$LayerInfoFromJson(json);

  factory LayerInfo.fromDTO(LayerInfoDTO dto) {
    return LayerInfo(
      name: dto.name,
      printable: dto.printable,
      locked: dto.locked,
    );
  }

  /// Constructor
  const LayerInfo._();

  LayerInfoDTO toDTO() {
    return LayerInfoDTO(
      name: name,
      printable: printable,
      locked: locked,
    );
  }
}

/// Represents font information from the XML data
@freezed
class FontInfo with _$FontInfo {
  const factory FontInfo({
    required String name,
    required String type,
    required String location,
    required bool protection,
    String? fontFile,
  }) = _FontInfo;

  factory FontInfo.fromJson(Map<String, dynamic> json) =>
      _$FontInfoFromJson(json);

  factory FontInfo.fromDTO(FontInfoDTO dto) {
    return FontInfo(
      name: dto.name,
      type: dto.type,
      location: dto.location,
      fontFile: dto.fontFile,
      protection: dto.protection,
    );
  }

  /// Constructor
  const FontInfo._();

  FontInfoDTO toDTO() {
    return FontInfoDTO(
      name: name,
      type: type,
      location: location,
      fontFile: fontFile,
      protection: protection,
    );
  }
}
