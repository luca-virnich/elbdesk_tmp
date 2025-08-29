import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'drucklayout_selection.freezed.dart';
part 'drucklayout_selection.g.dart';

@freezed
class DrucklayoutSelection with _$DrucklayoutSelection, HasMetaData {
  const factory DrucklayoutSelection({
    required String description,
    required DataMeta meta,
    int? drucklayoutPreSelectionId,
    int? id,
  }) = _DrucklayoutSelection;

  const DrucklayoutSelection._();

  factory DrucklayoutSelection.fromJson(Map<String, Object?> json) =>
      _$DrucklayoutSelectionFromJson(json);

  /// Creates a [DrucklayoutSelection] from a [DrucklayoutSelectionDTO]
  factory DrucklayoutSelection.fromDTO(DrucklayoutSelectionDTO dto) {
    final dataMeta = DataMeta.fromDTO(dto);
    return DrucklayoutSelection(
      meta: dataMeta,
      id: dto.id,
      description: dto.description,
      drucklayoutPreSelectionId: dto.drucklayoutPreSelectionId,
    );
  }

  factory DrucklayoutSelection.initial() => DrucklayoutSelection(
        meta: DataMeta.initial(),
        description: '',
      );

  DrucklayoutSelectionDTO toDTO() => DrucklayoutSelectionDTO(
        description: description,
        drucklayoutPreSelectionId: drucklayoutPreSelectionId!,
        id: id,
        createdAt: meta.createdAt!,
        isDraft: meta.isDraft,
      );
}
