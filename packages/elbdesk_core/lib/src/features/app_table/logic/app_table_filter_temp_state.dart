import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_table_filter_temp_state.g.dart';

/// Holds the temporary filter state for a table.
@riverpod
class AppTableFilterTempState extends _$AppTableFilterTempState {
  @override
  Filter build(String tableType, String tableId) {
    final filter = ref.read(appTableFilterStateProvider(tableType, tableId));

    return filter ??
        Filter(
          filterGroups: [],
        );
  }

  /// Initialize an empty filter
  void initEmptyFilter(
    String fieldKey,
    FilterType type,
    FilterFieldType fieldType,
  ) {
    final f = Filter(
      filterGroups: [
        FilterGroup(
          nextOperator: FilterOperator.and,
          filters: [
            FilterField(
              uuid: const Uuid().v4(),
              fieldKey: fieldKey,
              value: '',
              type: type,
              fieldType: fieldType,
              filterOperator: FilterOperator.and,
            ),
          ],
        ),
      ],
    );
    state = f;
  }

  /// Clear the filter
  void clearFilter() {
    state = Filter(
      filterGroups: [],
    );
  }

  /// Add a filter group
  void addFilterField(
    int groupIndex,
    String fieldKey,
    FilterType type,
    FilterFieldType fieldType,
  ) {
    final filterField = FilterField(
      uuid: const Uuid().v4(),
      fieldKey: fieldKey,
      value: '',
      type: type,
      fieldType: fieldType,
      filterOperator: FilterOperator.and,
    );
    final currentFilter = state;

    final group = currentFilter.filterGroups[groupIndex];
    final filters = [...group.filters, filterField];

    state = currentFilter.copyWith(
      filterGroups: [
        ...currentFilter.filterGroups.sublist(0, groupIndex),
        group.copyWith(filters: filters),
        ...currentFilter.filterGroups.sublist(groupIndex + 1),
      ],
    );
  }

  /// Remove a filter
  void removeFilter(int groupIndex, int filterIndex) {
    if (groupIndex == 0 && state.filterGroups[groupIndex].filters.length == 1) {
      return;
    }
    final currentFilter = state;

    final group = currentFilter.filterGroups[groupIndex];
    final filters = [...group.filters]..removeAt(filterIndex);

    state = currentFilter.copyWith(
      filterGroups: [
        ...currentFilter.filterGroups.sublist(0, groupIndex),
        group.copyWith(filters: filters),
        ...currentFilter.filterGroups.sublist(groupIndex + 1),
      ],
    );
  }

  /// Remove all filters
  void removeAllFilters() {
    state = Filter(filterGroups: []);
  }

  /// update filter field operator
  ///
  /// AND, OR etc
  void updateFilterFieldOperator(
    int groupIndex,
    int filterIndex,
    FilterOperator operator,
  ) {
    final currentFilter = state;

    final group = currentFilter.filterGroups[groupIndex];
    final filters = [...group.filters];
    filters[filterIndex] =
        filters[filterIndex].copyWith(filterOperator: operator);

    state = currentFilter.copyWith(
      filterGroups: [
        ...currentFilter.filterGroups.sublist(0, groupIndex),
        group.copyWith(filters: filters),
        ...currentFilter.filterGroups.sublist(groupIndex + 1),
      ],
    );
  }

  /// Update FielterField field key
  ///
  ///
  void updateFilterFieldFieldKey(
    int groupIndex,
    int filterIndex,
    String fieldKey,
    FilterFieldType fieldType,
    FilterType type,
  ) {
    final currentFilter = state;

    final group = currentFilter.filterGroups[groupIndex];
    final filters = [...group.filters];
    filters[filterIndex] = filters[filterIndex].copyWith(
      fieldKey: fieldKey,
      fieldType: fieldType,
      value: '',
      type: type,
    );

    state = currentFilter.copyWith(
      filterGroups: [
        ...currentFilter.filterGroups.sublist(0, groupIndex),
        group.copyWith(filters: filters),
        ...currentFilter.filterGroups.sublist(groupIndex + 1),
      ],
    );
  }

  /// Update filter field type
  ///
  /// equal (=), not equal (!=) etc
  void updateFilterFieldType(
    int groupIndex,
    int filterIndex,
    FilterType type,
  ) {
    final currentFilter = state;

    final group = currentFilter.filterGroups[groupIndex];
    final filters = [...group.filters];
    filters[filterIndex] = filters[filterIndex].copyWith(
      type: type,
    );

    state = currentFilter.copyWith(
      filterGroups: [
        ...currentFilter.filterGroups.sublist(0, groupIndex),
        group.copyWith(filters: filters),
        ...currentFilter.filterGroups.sublist(groupIndex + 1),
      ],
    );
  }

  /// Update filter field type capitalization
  ///
  /// This method updates the current setting of the capitalization
  /// Meaning if the filter is "iLike" it is set to "like"
  void toggleFilterFieldTypeCapitalization(
    int groupIndex,
    int filterIndex,
    FilterType type,
  ) {
    var newType = type;

    switch (newType) {
      case FilterType.iLike:
        newType = FilterType.like;
      case FilterType.like:
        newType = FilterType.iLike;
      case FilterType.notILike:
        newType = FilterType.notLike;
      case FilterType.notLike:
        newType = FilterType.notILike;
      // ignore: no_default_cases
      default:
        return;
    }

    updateFilterFieldType(
      groupIndex,
      filterIndex,
      newType,
    );
  }

  /// Update filter field value
  ///
  /// Actual entered value ("App Ahoi" etc)
  void updateFilterFieldValue(
    int groupIndex,
    int filterIndex,
    String value,
  ) {
    final currentFilter = state;

    final group = currentFilter.filterGroups[groupIndex];
    final filters = [...group.filters];
    filters[filterIndex] = filters[filterIndex].copyWith(value: value);

    state = currentFilter.copyWith(
      filterGroups: [
        ...currentFilter.filterGroups.sublist(0, groupIndex),
        group.copyWith(filters: filters),
        ...currentFilter.filterGroups.sublist(groupIndex + 1),
      ],
    );
  }
}
