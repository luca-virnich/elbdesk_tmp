import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'drucklayout_pre_selection.freezed.dart';
part 'drucklayout_pre_selection.g.dart';

@freezed
class DrucklayoutPreSelection with _$DrucklayoutPreSelection, HasMetaData {
  const factory DrucklayoutPreSelection({
    required String description,
    required DataMeta meta,
    required int? customerId,
    int? id,
  }) = _DrucklayoutPreSelection;

  const DrucklayoutPreSelection._();

  factory DrucklayoutPreSelection.fromJson(Map<String, Object?> json) =>
      _$DrucklayoutPreSelectionFromJson(json);

  /// Creates a [DrucklayoutPreSelection]
  /// from a [DrucklayoutPreSelectionDTO]
  factory DrucklayoutPreSelection.fromDTO(
    DrucklayoutPreSelectionDTO dto,
  ) {
    final dataMeta = DataMeta.fromDTO(dto);
    return DrucklayoutPreSelection(
      meta: dataMeta,
      id: dto.id,
      description: dto.description,
      customerId: dto.customerId,
    );
  }

  factory DrucklayoutPreSelection.initial() => DrucklayoutPreSelection(
        meta: DataMeta.initial(),
        customerId: null,
        description: '',
      );

  DrucklayoutPreSelectionDTO toDTO() => DrucklayoutPreSelectionDTO(
        description: description,
        id: id,
        createdAt: meta.createdAt!,
        isDraft: meta.isDraft,
        customerId: customerId,
      );
}
