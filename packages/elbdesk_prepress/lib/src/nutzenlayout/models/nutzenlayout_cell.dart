import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'nutzenlayout_cell.freezed.dart';
part 'nutzenlayout_cell.g.dart';

@freezed
class NutzenlayoutCell with _$NutzenlayoutCell {
  const factory NutzenlayoutCell({
    required double width,
    required double height,
    required NutzenlayoutLaufrichtung laufrichtung,
    required double gapHorizontal,
    required int? artworkId,
    required int? artworkMasterId,
  }) = _NutzenlayoutCell;

  factory NutzenlayoutCell.fromJson(Map<String, dynamic> json) =>
      _$NutzenlayoutCellFromJson(json);

  factory NutzenlayoutCell.fromDTO(NutzenlayoutCellDTO dto) {
    return NutzenlayoutCell(
      width: dto.width,
      height: dto.height,
      laufrichtung: dto.laufrichtung,
      gapHorizontal: dto.gapHorizontal,
      artworkId: dto.artworkId,
      artworkMasterId: dto.artworkMasterId,
    );
  }

  factory NutzenlayoutCell.forEinzelformaufbau({
    required double width,
    required double height,
    required NutzenlayoutLaufrichtung laufrichtung,
    required double gapHorizontal,
  }) {
    return NutzenlayoutCell(
      width: width,
      height: height,
      gapHorizontal: gapHorizontal,
      artworkId: null,
      artworkMasterId: null,
      laufrichtung: laufrichtung,
    );
  }

  factory NutzenlayoutCell.forSammelformaufbau({
    required double width,
    required double height,
    required NutzenlayoutLaufrichtung laufrichtung,
    required int artworkId,
    required int artworkMasterId,
    required double gapHorizontal,
  }) {
    return NutzenlayoutCell(
      width: width,
      height: height,
      gapHorizontal: gapHorizontal,
      artworkId: artworkId,
      artworkMasterId: artworkMasterId,
      laufrichtung: laufrichtung,
    );
  }

  const NutzenlayoutCell._();

  double get cellWidth =>
      laufrichtung == NutzenlayoutLaufrichtung.footForward ||
              laufrichtung == NutzenlayoutLaufrichtung.headForward
          ? width
          : height;

  double get cellHeight =>
      laufrichtung == NutzenlayoutLaufrichtung.footForward ||
              laufrichtung == NutzenlayoutLaufrichtung.headForward
          ? height
          : width;

  String shortDimensions(String locale) =>
      '${cellWidth.formatted(locale)}×${cellHeight.formatted(locale)}';

  NutzenlayoutCellDTO toDTO() {
    return NutzenlayoutCellDTO(
      width: width,
      height: height,
      laufrichtung: laufrichtung,
      gapHorizontal: gapHorizontal,
      artworkId: artworkId,
      artworkMasterId: artworkMasterId,
    );
  }

  double get widthWithGap => cellWidth + gapHorizontal;

  double positionXInMatrix({
    required double prevoiusColumnsWidth,
  }) {
    final left = prevoiusColumnsWidth + gapHorizontal;

    return left;
  }

  double positionYInMatrix({
    required double columnGapVertical,
    required int cellIndexInColumn,
    required double columnOffset,
  }) {
    final topGapV = columnOffset + (columnGapVertical / 2);
    final gapV = cellIndexInColumn == 0
        ? topGapV
        : topGapV + (columnGapVertical * cellIndexInColumn);
    final cellBody = cellHeight * cellIndexInColumn;
    return cellIndexInColumn == 0 ? gapV : gapV + cellBody;
  }
}
