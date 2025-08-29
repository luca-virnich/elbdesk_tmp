import 'package:elbdesk_core/src/features/app_table/logic/app_table_state.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
// ignore: no_flutter_material_import
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// AppDataTableRowCheckbox
///
/// A checkbox that can be used in the first column of a data table row
class AppDataTableRowCheckbox extends ConsumerWidget {
  /// Constructor
  const AppDataTableRowCheckbox({
    required this.providerId,
    required this.index,
    super.key,
  });

  /// @nodoc
  final String providerId;

  /// @nodoc
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected = ref.watch(
      appTableStateProvider(providerId)
          .select((value) => value.selectedRows.contains(index)),
    );
    final tableProperties = context.appTheme.tableProperties;

    return Container(
      color: isSelected ? tableProperties.selectedColor : null,
      child: Checkbox(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        side: WidgetStateBorderSide.resolveWith(
          (states) => BorderSide(color: tableProperties.borderColor),
        ),
        visualDensity: VisualDensity.compact,
        value: isSelected,
        activeColor: tableProperties.activeColor,
        checkColor: tableProperties.checkedBoxIconColor,
        onChanged: (v) {
          ref.read(appTableStateProvider(providerId).notifier).toggleRow(index);
        },
      ),
    );
  }
}
