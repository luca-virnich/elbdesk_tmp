import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_table_data.freezed.dart';

/// AppTableData model
@freezed
class AppTableData with _$AppTableData {
  /// AppTableData constructor
  const factory AppTableData({
    required Set<int> selectedRows,
    required int? hoveredRow,
    required bool disposeBlocker,
    required int? lastPressedRow,
  }) = _AppTableData;

  const AppTableData._();

  /// Initial AppTableData
  factory AppTableData.initial() {
    return const AppTableData(
      selectedRows: {},
      lastPressedRow: null,
      hoveredRow: null,
      disposeBlocker: true,
    );
  }
}
