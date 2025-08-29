abstract class RecentEntityFilterItem<L> {
  RecentEntityFilterItem({
    required this.isTable,
    required this.floatingWindowType,
  });

  final bool isTable;
  final String floatingWindowType;

  /// Abstract method to get the localized label
  String getLabel(L customL10n);
}
