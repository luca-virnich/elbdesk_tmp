import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'artwork_template_pre_selection.freezed.dart';
part 'artwork_template_pre_selection.g.dart';

@freezed
class ArtworkTemplatePreSelection
    with _$ArtworkTemplatePreSelection, HasMetaData {
  const factory ArtworkTemplatePreSelection({
    required String description,
    required DataMeta meta,
    required int? customerId,
    int? id,
  }) = _ArtworkTemplatePreSelection;

  const ArtworkTemplatePreSelection._();

  factory ArtworkTemplatePreSelection.fromJson(Map<String, Object?> json) =>
      _$ArtworkTemplatePreSelectionFromJson(json);

  /// Creates a [ArtworkTemplatePreSelection]
  /// from a [ArtworkTemplatePreSelectionDTO]
  factory ArtworkTemplatePreSelection.fromDTO(
    ArtworkTemplatePreSelectionDTO dto,
  ) {
    final dataMeta = DataMeta.fromDTO(dto);
    return ArtworkTemplatePreSelection(
      meta: dataMeta,
      id: dto.id,
      description: dto.description,
      customerId: dto.customerId,
    );
  }

  factory ArtworkTemplatePreSelection.initial() => ArtworkTemplatePreSelection(
        meta: DataMeta.initial(),
        customerId: null,
        description: '',
      );

  ArtworkTemplatePreSelectionDTO toDTO() => ArtworkTemplatePreSelectionDTO(
        description: description,
        id: id,
        createdAt: meta.createdAt!,
        isDraft: meta.isDraft,
        customerId: customerId,
      );
}
