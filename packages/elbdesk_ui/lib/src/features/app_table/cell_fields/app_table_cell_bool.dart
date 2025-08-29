import 'package:elbdesk_ui/src/components/inputs/app_checkbox.dart';
import 'package:elbdesk_ui/src/features/app_table/cell_fields/app_table_cell_wrapper.dart';
import 'package:flutter/material.dart';

class AppTableCellBool extends StatelessWidget {
  const AppTableCellBool(
    this.value, {
    this.alignment = Alignment.centerLeft,
    this.tooltip,
    super.key,
  });

  /// The text to display in the table cell.
  final bool value;

  /// The alignment of the text within the widget.
  final Alignment alignment;

  /// Tooltip to display when hovering over the text
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    return AppTableCellWrapper(
      tooltip: tooltip,
      alignment: alignment,
      child: IgnorePointer(
        child: AppCheckbox(
          value: value,
          onChanged: null,
          readOnly: true,
        ),
      ),
    );
  }
}
