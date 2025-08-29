import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/nutzenlayout/models/nutzenlayout_cell.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'nutzenlayout_column.freezed.dart';
part 'nutzenlayout_column.g.dart';

@freezed
class NutzenlayoutColumn with _$NutzenlayoutColumn {
  const factory NutzenlayoutColumn({
    required double offset,
    required List<NutzenlayoutCell> cells,
  }) = _NutzenlayoutColumn;

  factory NutzenlayoutColumn.initial(
    List<NutzenlayoutCell> cells,
  ) {
    return NutzenlayoutColumn(
      offset: 0,
      cells: cells,
    );
  }

  const NutzenlayoutColumn._();

  factory NutzenlayoutColumn.fromJson(Map<String, dynamic> json) =>
      _$NutzenlayoutColumnFromJson(json);

  factory NutzenlayoutColumn.fromDTO(NutzenlayoutColumnDTO dto) {
    return NutzenlayoutColumn(
      offset: dto.offset,
      cells: dto.cells.map(NutzenlayoutCell.fromDTO).toList(),
    );
  }

  NutzenlayoutLaufrichtung get laufrichtung {
    final laufrichtungenFromCells =
        cells.map((cell) => cell.laufrichtung).toList();
    // if all rotations are 0, return 'Fuß voraus'
    if (laufrichtungenFromCells.every(
      (laufrichtung) => laufrichtung == NutzenlayoutLaufrichtung.footForward,
    )) {
      return NutzenlayoutLaufrichtung.footForward;
    }
    // if all rotations are 180, return 'Kopf voraus'
    if (laufrichtungenFromCells.every(
      (laufrichtung) => laufrichtung == NutzenlayoutLaufrichtung.headForward,
    )) {
      return NutzenlayoutLaufrichtung.headForward;
    }
    // if all rotations are 90, return 'Wortenede Voraus'
    if (laufrichtungenFromCells.every(
      (laufrichtung) =>
          laufrichtung == NutzenlayoutLaufrichtung.wordStartForward,
    )) {
      return NutzenlayoutLaufrichtung.wordStartForward;
    }
    // if all rotations are 270, return 'Wortanfang Voraus'
    if (laufrichtungenFromCells.every(
      (laufrichtung) => laufrichtung == NutzenlayoutLaufrichtung.wordEndForward,
    )) {
      return NutzenlayoutLaufrichtung.wordEndForward;
    }
    // if there is a mix of rotations, return 'Mixed'
    return NutzenlayoutLaufrichtung.mixed;
  }

  NutzenlayoutColumnDTO toDTO(double drucklaenge) {
    return NutzenlayoutColumnDTO(
      gapVertical: gapVertical(drucklaenge),
      offset: offset,
      cells: cells.map((cell) => cell.toDTO()).toList(),
    );
  }

  double gapVertical(double drucklaenge) {
    if (cells.isEmpty) return 0;
    final totalCellHeight =
        cells.fold<double>(0, (sum, cell) => sum + cell.cellHeight);
    return (drucklaenge - totalCellHeight) / cells.length;
  }

  double get width {
    if (cells.isEmpty) return 0;
    return cells
        .map((cell) => cell.widthWithGap)
        .reduce((max, width) => width > max ? width : max);
  }

  String gapHReadable(ElbCoreLocalizations l10n) {
    if (cells.isEmpty) return '0 mm';
    final gaps = cells.map((cell) => cell.gapHorizontal).toList();
    // check if all gaps are the same
    if (gaps.every((gap) => gap == gaps.first)) {
      return '${gaps.first.formatted(l10n.localeName)} mm';
    }
    return 'Mixed'.fixed;
  }

  double? get gapH {
    if (cells.isEmpty) return null;
    final gaps = cells.map((cell) => cell.gapHorizontal).toList();
    // check if all gaps are the same
    if (gaps.every((gap) => gap == gaps.first)) {
      return gaps.first;
    }
    return null;
  }
}
