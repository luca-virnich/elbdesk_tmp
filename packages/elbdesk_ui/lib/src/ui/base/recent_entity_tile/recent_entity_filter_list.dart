import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

class RecentEntityFilterList<L> extends StatelessWidget {
  const RecentEntityFilterList({
    required this.items,
    required this.selectedItems,
    required this.customL10n,
    super.key,
  });
  final List<RecentEntityFilterItem<L>> items;
  final Map<String, bool> selectedItems;
  final L customL10n;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final itemFloatingWindowType = items[index].floatingWindowType;
        final isSelected = selectedItems[itemFloatingWindowType] ?? true;
        return RecentEntityFilterListTile<L>(
          item: items[index],
          isSelected: isSelected,
          customL10n: customL10n,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 8),
    );
  }
}

class RecentEntityFilterListTile<L> extends StatelessWidget {
  const RecentEntityFilterListTile({
    required this.item,
    required this.isSelected,
    required this.customL10n,
    super.key,
  });
  final RecentEntityFilterItem<L> item;
  final bool isSelected;
  final L customL10n;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: isSelected, onChanged: (value) {}),
        AppText(item.getLabel(customL10n)),
      ],
    );
  }
}
