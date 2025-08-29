import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:elbdesk_ui/src/features/app_table/cell_fields/app_table_cell_formatted_text.dart';
import 'package:elbdesk_ui/src/features/app_table/cell_fields/app_table_cell_wrapper.dart';
import 'package:flutter/material.dart';

/// A widget that displays text within a table cell with customizable alignment.
///
/// The [AppTableCellText] widget is used to display text within a table cell.
/// It allows for customizable alignment of the text and applies padding to the
// ignore: comment_references
/// right side of the text.
///
/// {@tool snippet}
/// This example shows how to use [AppTableCellText] to display text in a table
/// cell:
///
/// ```dart
/// AppTableCellText(
///   'Sample Text',
///   alignment: Alignment.center,
/// )
/// ```
/// {@end-tool}
///
/// See also:
///
///  * [Align], which is used to align the child widget.
///  * [Padding], which is used to apply padding to the child widget.
///  * [AppText], which is used to display the text.
class AppTableCellText extends StatelessWidget {
  /// Creates an [AppTableCellText].
  ///
  /// The [text] parameter must not be null.
  const AppTableCellText(
    this.text, {
    this.alignment = Alignment.centerLeft,
    this.leadingIconData,
    this.leadingIconColor,
    this.tooltip,
    this.bold = false,
    this.italic = false,
    this.highlight = false,
    super.key,
  });

  /// The text to display in the table cell.
  final String? text;

  /// The alignment of the text within the widget.
  final Alignment alignment;

  /// The text to display in the table cell.
  final IconData? leadingIconData;

  /// The Color of the icon
  final Color? leadingIconColor;

  /// Tooltip to display when hovering over the text
  final String? tooltip;

  /// Whether the text should be bold
  final bool bold;

  /// Whether the text should be italic
  final bool italic;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    if (text == null) return const SizedBox.shrink();
    final primaryColor = context.appTheme.generalColors.primary;
    return AppTableCellWrapper(
      alignment: alignment,
      tooltip: tooltip ?? text,
      leadingIconData: leadingIconData,
      leadingIconColor: leadingIconColor,
      child: AppTableCellFormattedText(
        text!,
        bold: bold,
        italic: italic,
        color: highlight ? primaryColor : null,
      ),
    );
  }
}
