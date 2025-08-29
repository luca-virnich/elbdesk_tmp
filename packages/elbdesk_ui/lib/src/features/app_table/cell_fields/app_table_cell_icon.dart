import 'package:elbdesk_ui/src/features/app_table/cell_fields/app_table_cell_wrapper.dart';
import 'package:elbdesk_ui/src/ui/base/icons/elb_icon.dart';
import 'package:flutter/material.dart';

/// A widget that displays an icon within a table cell with customizable
/// alignment.
///
/// The [AppTableCellIcon] widget is used to display an icon within a table
/// cell.
/// It allows for customizable alignment of the icon and applies padding to the
// ignore: comment_references
/// right side of the icon.
///
/// {@tool snippet}
/// This example shows how to use [AppTableCellIcon] to display text in a table
/// cell:
///
/// ```dart
/// AppTableCellIcon(
///   Icons.check,
///   alignment: Alignment.center,
/// )
/// ```
/// {@end-tool}
///
/// See also:
///
///  * [Align], which is used to align the child widget.
///  * [Padding], which is used to apply padding to the child widget.
///  * [ElbIcon], which is used to display the icon.
class AppTableCellIcon extends StatelessWidget {
  /// Creates an [AppTableCellIcon].
  ///
  /// The [iconData] parameter must not be null.
  const AppTableCellIcon(
    this.iconData, {
    this.color,
    this.alignment = Alignment.centerLeft,
    this.tooltip,
    super.key,
  });

  /// The text to display in the table cell.
  final IconData iconData;

  /// The Color of the icon
  final Color? color;

  /// The alignment of the text within the widget.
  final Alignment alignment;

  /// Tooltip to display when hovering over the text
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    return AppTableCellWrapper(
      alignment: alignment,
      tooltip: tooltip,
      leadingIconData: iconData,
      leadingIconColor: color,
      child: const SizedBox.shrink(),
    );
  }
}
