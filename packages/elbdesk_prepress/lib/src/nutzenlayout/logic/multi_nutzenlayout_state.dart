import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_prepress/src/artwork/models/artwork.dart';
import 'package:elbdesk_prepress/src/nutzenlayout/models/nutzenlayout.dart';
import 'package:elbdesk_prepress/src/nutzenlayout/models/nutzenlayout_cell.dart';
import 'package:elbdesk_prepress/src/nutzenlayout/models/nutzenlayout_column.dart';
import 'package:elbdesk_prepress/src/nutzenlayout/models/nutzenlayout_metrics.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'multi_nutzenlayout_state.g.dart';

@riverpod
class MultiNutzenLayoutState extends _$MultiNutzenLayoutState {
  @override
  Nutzenlayout build(String sessionId) {
    return Nutzenlayout.empty();
  }

  void initialize({
    required NutzenlayoutMetrics metrics,
    required int customerId,
    required double artworkWidth,
    required double artworkHeight,
    required Artwork firstArtwork,
  }) {
    final laufrichtung = metrics.laufrichtung;

    final cells = List.generate(
      metrics.nutzenProReihe,
      (_) => NutzenlayoutCell.forSammelformaufbau(
        width: artworkWidth,
        height: artworkHeight,
        laufrichtung: laufrichtung,
        artworkId: firstArtwork.id!,
        artworkMasterId: firstArtwork.artworkMasterId!,
        gapHorizontal: metrics.gapH,
      ),
    );
    final columns = List.generate(
      metrics.reihenCount,
      (reihenIndex) {
        if (reihenIndex == 0) {
          final modifiedCells = cells
              .map(
                (cell) => cell.copyWith(gapHorizontal: 0),
              )
              .toList();
          return NutzenlayoutColumn.initial(modifiedCells);
        }
        return NutzenlayoutColumn.initial(cells);
      },
    );

    final nutzenLayout = Nutzenlayout.initial(
      drucklaenge: double.parse(metrics.drucklaenge.toStringAsFixed(4)),
      columns: columns,
      customerId: customerId,
      cellX: artworkWidth,
      cellY: artworkHeight,
      description: metrics.description,
      formType: NutzenlayoutFormType.sammelform,
      leadingUnitSystem: metrics.unitSystem,
    );

    state = nutzenLayout;
  }

  void updateDrucklaenge(double drucklaenge) {
    final parsed = double.parse(drucklaenge.toStringAsFixed(4));
    state = state.copyWith(drucklaenge: parsed);
  }

  void addColumn() {
    state = state.copyWith(
      columns: [...state.columns, state.columns.last],
    );
  }

  void rotateColumn(int index, NutzenlayoutLaufrichtung laufrichtung) {
    if (index < 0 || index >= state.columns.length) {
      return; // Guard against invalid indices
    }
    if (laufrichtung == NutzenlayoutLaufrichtung.mixed) {
      return;
    }

    final updatedColumns = List<NutzenlayoutColumn>.from(state.columns);
    // rotate each cell in the column
    final cells = List<NutzenlayoutCell>.from(updatedColumns[index].cells);
    final updatedCells = <NutzenlayoutCell>[];
    for (final cell in cells) {
      updatedCells.add(cell.copyWith(laufrichtung: laufrichtung));
    }
    updatedColumns[index] = updatedColumns[index].copyWith(cells: updatedCells);

    state = state.copyWith(columns: updatedColumns);
  }

  void updateColumn(int index, NutzenlayoutEditValues editValues) {
    if (index < 0 || index >= state.columns.length) {
      return; // Guard against invalid indices
    }

    final updatedColumns = List<NutzenlayoutColumn>.from(state.columns);
    var columnToUpdate = updatedColumns[index].copyWith(
      // gapHorizontal: editValues.gapH,
      offset: editValues.offset,
    );

    // update cell amount
    final currentCells = List<NutzenlayoutCell>.from(columnToUpdate.cells);
    // update each cell
    for (final (index, cell) in currentCells.indexed) {
      final newCell = cell.copyWith(
        artworkId: editValues.artwork?.id,
        artworkMasterId: editValues.artwork?.artworkMasterId,
        width: editValues.artwork?.width ?? cell.width,
        height: editValues.artwork?.height ?? cell.height,
        gapHorizontal: editValues.gapH ?? cell.gapHorizontal,
      );
      currentCells[index] = newCell;
    }

    if (editValues.cells > currentCells.length) {
      // add new cells
      final lastCell = currentCells.last;

      currentCells.addAll(
        List.generate(
          editValues.cells - currentCells.length,
          (_) => lastCell,
        ),
      );
    } else {
      // remove cells
      currentCells.removeRange(editValues.cells, currentCells.length);
    }
    columnToUpdate = columnToUpdate.copyWith(cells: currentCells);
    updatedColumns[index] = columnToUpdate;

    state = state.copyWith(columns: updatedColumns);
    rotateColumn(index, editValues.laufrichtung);
  }

  void rotateCell(int columnIndex, int cellIndex) {
    if (columnIndex < 0 ||
        columnIndex >= state.columns.length ||
        cellIndex < 0 ||
        cellIndex >= state.columns[columnIndex].cells.length) {
      return; // Guard against invalid indices
    }

    final updatedColumns = List<NutzenlayoutColumn>.from(state.columns);
    final cells =
        List<NutzenlayoutCell>.from(updatedColumns[columnIndex].cells);

    // Only rotate the specific cell
    final currentAngle = cells[cellIndex].laufrichtung;
    final newAngle = currentAngle == NutzenlayoutLaufrichtung.footForward
        ? NutzenlayoutLaufrichtung.headForward
        : NutzenlayoutLaufrichtung.footForward;

    cells[cellIndex] = cells[cellIndex].copyWith(
      laufrichtung: newAngle,
    );

    updatedColumns[columnIndex] =
        updatedColumns[columnIndex].copyWith(cells: cells);
    state = state.copyWith(columns: updatedColumns);
  }

  void deleteColumn(int index) {
    if (index < 0 || index >= state.columns.length) {
      return; // Guard against invalid indices
    }

    final updatedColumns = List<NutzenlayoutColumn>.from(state.columns)
      ..removeAt(index);
    state = state.copyWith(columns: updatedColumns);
  }

  void updateDescription(String description) {
    state = state.copyWith(description: description);
  }

  void updateCell(
    int columnIndex,
    int cellIndex,
    Artwork artwork,
    NutzenlayoutLaufrichtung laufrichtung,
    double gapHorizontal,
  ) {
    final updatedColumns = List<NutzenlayoutColumn>.from(state.columns);
    final cells =
        List<NutzenlayoutCell>.from(updatedColumns[columnIndex].cells);

    cells[cellIndex] = cells[cellIndex].copyWith(
      artworkId: artwork.id,
      artworkMasterId: artwork.artworkMasterId,
      laufrichtung: laufrichtung,
      width: artwork.width,
      height: artwork.height,
      gapHorizontal: gapHorizontal,
    );
    updatedColumns[columnIndex] =
        updatedColumns[columnIndex].copyWith(cells: cells);
    state = state.copyWith(columns: updatedColumns);
  }

  void initalizeExistingNutzenlayout(Nutzenlayout nutzenlayout) {
    state = nutzenlayout.copyWith(
      columns: [
        for (final column in nutzenlayout.columns)
          column.copyWith(
            cells: [
              for (final cell in column.cells)
                cell.copyWith(
                  artworkId: null,
                  artworkMasterId: null,
                ),
            ],
          ),
      ],
    );
  }
}

@riverpod
class SelectedExistingMultiNutzenlayoutState
    extends _$SelectedExistingMultiNutzenlayoutState {
  @override
  Nutzenlayout? build(String sessionId) {
    return null;
  }

  void updateSelectedNutzenlayout(Nutzenlayout nutzenlayout) {
    state = nutzenlayout;
  }

  void clearSelectedNutzenlayout() {
    state = null;
  }
}
