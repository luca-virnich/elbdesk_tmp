import 'package:elbdesk_ui/src/components/inputs/app_checkbox.dart';
import 'package:flutter/material.dart';

class AppTableCellInputBool extends StatelessWidget {
  const AppTableCellInputBool({
    required this.onChanged,
    required this.readOnly,
    required super.key,
    required this.value,
    this.alignment = Alignment.center,
    this.tooltip,
  });

  /// The text to display in the table cell.
  final bool value;

  /// The alignment of the text within the widget.
  final Alignment alignment;

  /// Tooltip to display when hovering over the text
  final String? tooltip;
  final ValueChanged<bool> onChanged;
  final bool readOnly;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: AppCheckbox(
        value: value,
        onChanged: onChanged,
        readOnly: readOnly,
      ),
    );
  }
}
