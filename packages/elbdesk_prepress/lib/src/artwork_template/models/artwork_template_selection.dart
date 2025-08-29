import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'artwork_template_selection.freezed.dart';
part 'artwork_template_selection.g.dart';

@freezed
class ArtworkTemplateSelection with _$ArtworkTemplateSelection, HasMetaData {
  const factory ArtworkTemplateSelection({
    required String description,
    required DataMeta meta,
    int? artworkTemplatePreSelectionId,
    int? id,
  }) = _ArtworkTemplateSelection;

  const ArtworkTemplateSelection._();

  factory ArtworkTemplateSelection.fromJson(Map<String, Object?> json) =>
      _$ArtworkTemplateSelectionFromJson(json);

  /// Creates a [ArtworkTemplateSelection] from a [ArtworkTemplateSelectionDTO]
  factory ArtworkTemplateSelection.fromDTO(ArtworkTemplateSelectionDTO dto) {
    final dataMeta = DataMeta.fromDTO(dto);
    return ArtworkTemplateSelection(
      meta: dataMeta,
      id: dto.id,
      description: dto.description,
      artworkTemplatePreSelectionId: dto.artworkTemplatePreSelectionId,
    );
  }

  factory ArtworkTemplateSelection.initial() => ArtworkTemplateSelection(
        meta: DataMeta.initial(),
        description: '',
      );

  ArtworkTemplateSelectionDTO toDTO() => ArtworkTemplateSelectionDTO(
        description: description,
        artworkTemplatePreSelectionId: artworkTemplatePreSelectionId!,
        id: id,
        createdAt: meta.createdAt!,
        isDraft: meta.isDraft,
      );
}
