import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_table_filter_state.g.dart';

/// Holds the filter state for a table.
@riverpod
class AppTableFilterState extends _$AppTableFilterState {
  @override
  Filter? build(String tableType, String sessionId) {
    ref.cacheFor(
      const Duration(seconds: 5),
    );
    return null;
  }

  /// Update the filter
  void updateFilter(Filter? filter) {
    state = filter;
  }

  /// Add filterGroup to the existing filter
  void addFilterGroup(FilterGroup filterGroup) {
    final currentFilterGroups = state?.filterGroups ?? [];
    final newFilterGroups = [...currentFilterGroups, filterGroup];
    state = Filter(filterGroups: newFilterGroups);
  }

  /// Remove filterGroup from the existing filter
  void removeFilterGroup(FilterGroup filterGroup) {
    final currentFilterGroups = state?.filterGroups ?? [];
    // The filter in the filterGroup has a uuid which can be compared
    final newFilterGroups = currentFilterGroups
        .where(
          (group) => group.filters
              .any((filter) => filter.uuid != filterGroup.filters.first.uuid),
        )
        .toList();
    state = Filter(filterGroups: newFilterGroups);
  }

  /// Update FielterField field key
  ///
  ///
  void updateQuickSearchFilter(
    FilterField filterField,
  ) {
    final currentFilter = state;

    // If there's no current filter, create a new one with the provided field
    if (currentFilter == null) {
      state = Filter(
        filterGroups: [
          FilterGroup(
            nextOperator: FilterOperator.and,
            filters: [filterField],
          ),
        ],
      );
      return;
    }

    // Get current filter groups
    final filterGroups = currentFilter.filterGroups;

    // If there are no filter groups, create one with the new field
    if (filterGroups.isEmpty) {
      state = Filter(
        filterGroups: [
          FilterGroup(
            nextOperator: FilterOperator.and,
            filters: [filterField],
          ),
        ],
      );
      return;
    }

    // Replace first filter in first group
    final firstGroup = filterGroups.first;
    final updatedGroup = FilterGroup(
      nextOperator: firstGroup.nextOperator,
      filters: [
        filterField,
        ...firstGroup.filters.skip(1),
      ],
    );

    // Update state with modified first group and remaining groups
    state = Filter(
      filterGroups: [
        updatedGroup,
        ...filterGroups.skip(1),
      ],
    );
  }

  /// Clear the filter
  void clearFilter() {
    state = null;
  }
}

@riverpod
class HiddenAppTableFilterGroupState extends _$HiddenAppTableFilterGroupState {
  @override
  FilterGroup? build(String tableType, String sessionId) {
    ref.cacheFor(
      const Duration(seconds: 5),
    );
    return null;
  }

  /// Update the filter
  void updateFilter(FilterGroup? filterGroup) {
    state = filterGroup;
  }

  /// Add filterField to the existing filter
  void addFilterField(FilterField filterField) {
    final currentFilterGroup =
        state ?? FilterGroup(nextOperator: FilterOperator.and, filters: []);
    final currentFilterFields = currentFilterGroup.filters;
    final newFilterGroup = FilterGroup(
      nextOperator: currentFilterGroup.nextOperator,
      filters: [...currentFilterFields, filterField],
    );
    state = newFilterGroup;
  }

  /// Remove filterField from the existing filter
  void removeFilterField(FilterField filterField) {
    final currentFilterGroup =
        state ?? FilterGroup(nextOperator: FilterOperator.and, filters: []);
    final currentFilterFields = currentFilterGroup.filters;
    final newFilterGroup = FilterGroup(
      nextOperator: currentFilterGroup.nextOperator,
      filters: currentFilterFields
          .where((field) => field.uuid != filterField.uuid)
          .toList(),
    );
    state = newFilterGroup;
  }
}
