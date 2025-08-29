import 'package:collection/collection.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FilterValueDropdownItem<T extends Enum> {
  const FilterValueDropdownItem({
    required this.label,
    required this.value,
  });
  final String label;
  final T value;
}

class FilterValueDropdownField<T extends Enum> extends HookConsumerWidget {
  const FilterValueDropdownField.quickSearch({
    required this.tableType,
    required this.sessionId,
    required this.width,
    required this.controller,
    required this.items,
    super.key,
  })  : groupIndex = null,
        filterIndex = null;

  const FilterValueDropdownField.filter({
    required this.controller,
    required this.sessionId,
    required int this.groupIndex,
    required int this.filterIndex,
    required this.tableType,
    required this.width,
    required this.items,
    super.key,
  });

  final double width;

  final String sessionId;
  final String tableType;

  final int? groupIndex;
  final int? filterIndex;

  final TextEditingController controller;
  final List<FilterValueDropdownItem<T>> items;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initialItem = useMemoized(
      () {
        final text = controller.text;
        if (text.isEmpty) {
          return '';
        }

        final asItem = items.firstWhereOrNull(
          (item) => item.value.name == text,
        );

        return asItem?.label;
      },
      [],
    );
    return NextDropdownMenu<T>(
      width: width,
      controller: controller,
      readOnly: false,
      isMandatory: true,
      onSelected: (value) {
        if (value == null) {
          return;
        }
        // Find the item by its enum value to get the label
        final item = items.firstWhereOrNull((i) => i.value == value);
        if (item != null) {
          controller.text = item.label;
        }
        ref
            .read(
              appTableFilterTempStateProvider(tableType, sessionId).notifier,
            )
            .updateFilterFieldValue(
              groupIndex!,
              filterIndex!,
              value.name,
            );
      },
      initialValue: initialItem,
      dropdownMenuEntries: items
          .map(
            (item) => NextDropdownMenuEntry(
              label: item.label,
              value: item.value,
            ),
          )
          .toList(),
    );
  }
}
