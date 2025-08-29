import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:elbdesk_ui/src/features/app_table/cell_fields/app_table_cell_formatted_text.dart';
import 'package:elbdesk_ui/src/features/app_table/cell_fields/app_table_cell_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// A button widget that displays text within a table cell with customizable
/// alignment and color.
///
/// The [AppTableCellTextButton] widget is used to display a button within a
/// table cell. It allows for customizable alignment of the text, applies
/// padding to the right side of the text, and changes the cursor to a pointer
/// when hovered.
///
/// {@tool snippet}
/// This example shows how to use [AppTableCellTextButton] to display a button
/// in a table cell:
///
/// ```dart
/// AppTableCellButton(
///   'Click Me',
///   alignment: Alignment.center,
///   onPressed: () {
///     print('Button pressed');
///   },
///   textColor: Colors.blue,
/// )
/// ```
/// {@end-tool}
///
/// See also:
///
///  * [Align], which is used to align the child widget.
///  * [Padding], which is used to apply padding to the child widget.
///  * [AppText], which is used to display the text.
///  * [GestureDetector], which is used to detect gestures on the button.
class AppTableCellTextButton extends HookWidget {
  /// Creates an [AppTableCellTextButton].
  ///
  /// The [text] parameter must not be null.
  const AppTableCellTextButton(
    this.text, {
    this.alignment = Alignment.centerLeft,
    super.key,
    this.onPressed,
    this.textColor,
    this.bold = false,
    this.tooltip,
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

  @override
  Widget build(BuildContext context) {
    final isHovered = useState<bool>(false);
    final color = textColor ?? context.appTheme.generalColors.primary;
    return MouseRegion(
      cursor: (onPressed == null || readOnly)
          ? MouseCursor.defer
          : SystemMouseCursors.click,
      onEnter: (_) => isHovered.value = true,
      onExit: (_) => isHovered.value = false,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: readOnly ? null : onPressed,
        child: AppTableCellWrapper(
          tooltip: tooltip,
          alignment: alignment,
          child: AppTableCellFormattedText(
            text,
            bold: bold,
            italic: italic,
            color: onPressed == null
                ? null
                : readOnly
                    ? color.withAppOpacity(0.4)
                    : isHovered.value
                        ? color.withAppOpacity(0.8)
                        : color,
          ),
        ),
      ),
    );
  }
}
