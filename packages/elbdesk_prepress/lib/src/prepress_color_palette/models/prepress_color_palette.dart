import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:elbdesk_prepress/src/artwork_color/models/artwork_color.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'prepress_color_palette.freezed.dart';
part 'prepress_color_palette.g.dart';

/// Color Book
///
/// The Color Book model is our client model for the ColorBookDTO
///
@freezed
class PrepressColorPalette with _$PrepressColorPalette, HasMetaData {
  /// Color Book constructor
  const factory PrepressColorPalette({
    required String paletteName,
    required String description,
    required List<ArtworkColor>? colors,
    required DataMeta meta,
    required Customer? customer,
  }) = _PrepressColorPalette;

  const PrepressColorPalette._();

  factory PrepressColorPalette.fromJson(Map<String, Object?> json) =>
      _$PrepressColorPaletteFromJson(json);

  /// Color Book from DTO
  factory PrepressColorPalette.fromDTO(
    PrepressColorPaletteDTO dto, {
    bool includeColors = true,
  }) {
    final dataMeta = DataMeta.fromDTO(dto);

    return PrepressColorPalette(
      paletteName: dto.paletteName,
      description: dto.description,
      customer: dto.customer != null ? Customer.fromDTO(dto.customer!) : null,
      colors:
          includeColors ? dto.colors?.map(ArtworkColor.fromDTO).toList() : null,
      meta: dataMeta,
    );
  }

  /// Color Book to DTO
  PrepressColorPaletteDTO toDTO({bool includeColors = true}) {
    return PrepressColorPaletteDTO(
      id: meta.id,
      paletteName: paletteName,
      description: description,
      colors:
          includeColors ? colors?.map((color) => color.toDTO()).toList() : null,
      createdAt: meta.createdAt!,
      isDraft: meta.isDraft,
      lastModifiedAt: meta.lastModifiedAt,
      customerId: customer?.meta.id,
    );
  }
}
