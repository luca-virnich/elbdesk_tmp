import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_table_sort_and_filter_provider.g.dart';

/// Table Sort and Filter Provider
///
/// This provider is used to fetch the sort and filter state for a table.
///
/// The sessionId is needed to differentiate between different tables. One
/// table could have filters enabled and another one not. The sessionId is used
/// to be able to fetch both lists with the same provider.
@riverpod
(Sort?, Filter?) tableSortAndFilter(
  Ref ref,
  String sessionId,
  String tableType,
) {
  final sort = ref.watch(appTableSortStateProvider(sessionId));
  final filter = ref.watch(appTableFilterStateProvider(tableType, sessionId));
  final hiddenFilterGroup = ref.watch(
    hiddenAppTableFilterGroupStateProvider(tableType, sessionId),
  );
  Filter? finalFilter;
  if (filter != null && hiddenFilterGroup != null) {
    finalFilter = Filter(
      filterGroups: [
        hiddenFilterGroup,
        ...filter.filterGroups,
      ],
    );
  } else if (filter == null && hiddenFilterGroup != null) {
    finalFilter = Filter(filterGroups: [hiddenFilterGroup]);
  } else if (filter != null) {
    finalFilter = filter;
  }
  return (sort, finalFilter);
}
