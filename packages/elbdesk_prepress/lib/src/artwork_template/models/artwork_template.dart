import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:elbdesk_prepress/src/artwork/models/artwork_layer.dart';
import 'package:elbdesk_prepress/src/artwork/models/trapping.dart';
import 'package:elbdesk_prepress/src/artwork_color/models/artwork_color.dart';
import 'package:elbdesk_prepress/src/artwork_template/models/artwork_template_pre_selection.dart';
import 'package:elbdesk_prepress/src/artwork_template/models/artwork_template_selection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'artwork_template.freezed.dart';
part 'artwork_template.g.dart';

@freezed
class ArtworkTemplate with _$ArtworkTemplate, HasMetaData {
  const factory ArtworkTemplate({
    required String description,
    required Customer? customer,
    required ArtworkTemplatePreSelection artworkTemplatePreSelection,
    required ArtworkTemplateSelection artworkTemplateSelection,
    required DataMeta meta,
    required Trapping trapping,
    required double anschnitt,
    required List<ArtworkColor> colors,
    required List<ArtworkLayer> layers,
  }) = _ArtworkTemplate;

  /// From DTO with nullable sales order
  factory ArtworkTemplate.fromDTO(ArtworkTemplateDTO dto) {
    final meta = DataMeta.fromDTO(dto);
    return ArtworkTemplate(
      layers: dto.layers.map(ArtworkLayer.fromDTO).toList(),
      description: dto.description,
      customer: dto.customer != null ? Customer.fromDTO(dto.customer!) : null,
      trapping: Trapping.fromDTO(dto.trapping),
      artworkTemplatePreSelection:
          ArtworkTemplatePreSelection.fromDTO(dto.artworkTemplatePreSelection!),
      artworkTemplateSelection:
          ArtworkTemplateSelection.fromDTO(dto.artworkTemplateSelection!),
      colors: dto.colors.map(ArtworkColor.fromDTO).toList(),
      meta: meta,
      anschnitt: dto.anschnitt,
    );
  }

  /// Constructor
  const ArtworkTemplate._();

  factory ArtworkTemplate.fromJson(Map<String, Object?> json) =>
      _$ArtworkTemplateFromJson(json);

  String? get customerName => customer?.contact?.general.name;

  ArtworkTemplateDTO toDTO() {
    return ArtworkTemplateDTO(
      id: meta.id,
      createdAt: meta.createdAt!,
      isDraft: meta.isDraft,
      lastModifiedAt: meta.lastModifiedAt,
      description: description,
      customerId: customer?.id,
      layers: layers.map((e) => e.toDTO()).toList(),
      artworkTemplatePreSelectionId: artworkTemplatePreSelection.id!,
      artworkTemplatePreSelection: artworkTemplatePreSelection.toDTO(),
      artworkTemplateSelectionId: artworkTemplateSelection.id!,
      artworkTemplateSelection: artworkTemplateSelection.toDTO(),
      trapping: trapping.toDTO(),
      anschnitt: anschnitt,
      colors: colors.map((e) => e.toDTO()).toList(),
    );
  }
}
