import 'package:elbdesk_core/src/features/app_table/models/app_table_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_table_state.g.dart';

/// AppTableState
///
/// Holds the state for a table
@riverpod
class AppTableState extends _$AppTableState {
  @override
  AppTableData build(String tableId) {
    return AppTableData.initial();
  }

  /// Unchecks all rows of the table
  void uncheckAll() {
    state = state.copyWith(selectedRows: {});
  }

  /// Checks all rows of the table
  void checkAll(int tableLength) {
    state =
        state.copyWith(selectedRows: {for (var i = 0; i < tableLength; i++) i});
  }

  /// Adds a hovered row
  void addHoveredRow(int row) {
    state = state.copyWith(hoveredRow: row);
  }

  /// Removes a hovered row
  void removeHoveredRow(int row) {
    state = state.copyWith(hoveredRow: null);
  }

  /// Toggles a row selection
  void toggleRow(int index) {
    final current = {...state.selectedRows};
    if (current.contains(index)) {
      current.remove(index);
    } else {
      current.add(index);
    }
    state = state.copyWith(selectedRows: current);
  }
}
