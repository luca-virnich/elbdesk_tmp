import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:elbdesk_ui/src/features/app_table/cell_fields/app_table_cell_wrapper.dart';
import 'package:flutter/material.dart';

class AppTableCellOpenInNew extends StatelessWidget {
  /// Creates an [AppTableCellTextButton].
  ///
  /// The [text] parameter must not be null.
  const AppTableCellOpenInNew(
    this.text, {
    this.alignment = Alignment.centerLeft,
    super.key,
    this.onPressed,
    this.textColor,
    this.bold = false,
    this.tooltip,
    this.onShiftPressed,
    this.italic = false,
    this.readOnly = false,
  });

  /// The text to display in the table cell button.
  final String text;

  /// The callback that is called when the button is tapped.
  final VoidCallback? onPressed;

  /// The alignment of the text within the widget.
  final Alignment alignment;

  /// The color of the text.
  final Color? textColor;
  final bool bold;
  final bool italic;
  final String? tooltip;
  final bool readOnly;
  final VoidCallback? onShiftPressed;

  @override
  Widget build(BuildContext context) {
    return onPressed != null
        ? AppTableCellWrapper(
            tooltip: tooltip,
            alignment: alignment,
            child: AppOpenInNewTextButton(
              label: text,
              onPressed: onPressed,
              onShiftPressed: onShiftPressed,
              highlightColorOnlyOnHover: true,
              iconPosition: AppOpenInNewTextButtonStyleIconPosition.left,
            ),
          )
        : const SizedBox.shrink();
  }
}
