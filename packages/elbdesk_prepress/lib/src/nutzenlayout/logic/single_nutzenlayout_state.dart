import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_prepress/src/nutzenlayout/models/nutzenlayout.dart';
import 'package:elbdesk_prepress/src/nutzenlayout/models/nutzenlayout_cell.dart';
import 'package:elbdesk_prepress/src/nutzenlayout/models/nutzenlayout_column.dart';
import 'package:elbdesk_prepress/src/nutzenlayout/models/nutzenlayout_metrics.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'single_nutzenlayout_state.g.dart';

@riverpod
class SingleNutzenLayoutState extends _$SingleNutzenLayoutState {
  @override
  Nutzenlayout build(String sessionId) {
    return Nutzenlayout.empty();
  }

  void initialize({
    required NutzenlayoutMetrics metrics,
    required int customerId,
    required double artworkWidth,
    required double artworkHeight,
  }) {
    final laufrichtung = metrics.laufrichtung;
    final height = laufrichtung == NutzenlayoutLaufrichtung.footForward ||
            laufrichtung == NutzenlayoutLaufrichtung.headForward
        ? artworkHeight
        : artworkWidth;
    final width = laufrichtung == NutzenlayoutLaufrichtung.footForward ||
            laufrichtung == NutzenlayoutLaufrichtung.headForward
        ? artworkWidth
        : artworkHeight;
    final cells = List.generate(
      metrics.nutzenProReihe,
      (_) => NutzenlayoutCell.forEinzelformaufbau(
        width: width,
        height: height,
        laufrichtung: laufrichtung,
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
      leadingUnitSystem: metrics.unitSystem,
      customerId: customerId,
      cellX: artworkWidth,
      cellY: artworkHeight,
      description: metrics.description,
      formType: NutzenlayoutFormType.einzelform,
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

  void updateLeadingUnitSystem(NutzenlayoutUnitSystem unitSystem) {
    state = state.copyWith(leadingUnitSystem: unitSystem);
  }

  void rotateColumn(int index, NutzenlayoutLaufrichtung laufrichtung) {
    if (index < 0 || index >= state.columns.length) {
      return; // Guard against invalid indices
    }
    if (laufrichtung == NutzenlayoutLaufrichtung.mixed) {
      return;
    }

    final updatedColumns = List<NutzenlayoutColumn>.from(state.columns);
    // rotate each cell in the reihe
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
      offset: editValues.offset,
    );

    // update cell amount
    final currentCells = List<NutzenlayoutCell>.from(columnToUpdate.cells);
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
    // update gapH if it is not null

    if (editValues.gapH != null) {
      for (final cell in currentCells) {
        final nutzenlayoutCell = cell.copyWith(gapHorizontal: editValues.gapH!);
        currentCells[currentCells.indexOf(cell)] = nutzenlayoutCell;
      }
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
      width: cells[cellIndex].height,
      height: cells[cellIndex].width,
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
}
