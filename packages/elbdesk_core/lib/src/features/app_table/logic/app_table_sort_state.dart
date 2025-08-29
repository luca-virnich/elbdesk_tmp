import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_table_sort_state.g.dart';

/// Holds the sort state for a table.
@riverpod
class AppTableSortState extends _$AppTableSortState {
  @override
  Sort? build(String sessionId) {
    ref.cacheFor(
      const Duration(seconds: 5),
    );
    // return Sort(
    //   fieldKey: 'id',
    //   orderDescending: false,
    // );
    return null;
  }

  /// Update sort
  void updateSort(Sort sort) {
    // if fieldKey is the same, toggle orderDescending
    if (state?.fieldKey == sort.fieldKey) {
      state = state?.copyWith(orderDescending: !state!.orderDescending);
      return;
    }
    state = sort;
  }

  /// Update sort by field key
  void updateSortByFieldKey(String fieldKey) {
    // if fieldKey is the same, toggle orderDescending
    if (state?.fieldKey == fieldKey) {
      state = state?.copyWith(orderDescending: !state!.orderDescending);
      return;
    }
    state = Sort(fieldKey: fieldKey, orderDescending: false);
  }
}
