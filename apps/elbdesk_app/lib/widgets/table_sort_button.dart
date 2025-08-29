import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Table Sort Button
///
/// A button that sorts a table by a field
class TableSortButton extends ConsumerWidget {
  /// Constructor
  const TableSortButton({
    required this.fieldKey,
    required this.tableId,
    super.key,
  });

  /// Field key
  final String fieldKey;

  /// Table id
  final String tableId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sort = ref.watch(appTableSortStateProvider(tableId));
    final iconButtonProperties = context.appTheme.iconButtonProperties;
    // TODO(tk): Rotate icon?
    return AppIconButton.primary(
      color: sort?.fieldKey == fieldKey
          ? iconButtonProperties.foregroundColorActive
          : iconButtonProperties.foregroundColorInactive,
      icon: (sort?.fieldKey == fieldKey && (sort?.orderDescending ?? false))
          ? const Icon(AppIcons.expand_less)
          : const Icon(AppIcons.expand_more),
      onPressed: () {
        ref
            .read(appTableSortStateProvider(tableId).notifier)
            .updateSortByFieldKey(fieldKey);
      },
    );
  }
}
