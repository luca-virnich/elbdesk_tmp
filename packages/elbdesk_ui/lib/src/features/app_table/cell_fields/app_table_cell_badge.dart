import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:elbdesk_ui/src/features/app_table/cell_fields/app_table_cell_formatted_text.dart';
import 'package:elbdesk_ui/src/features/app_table/cell_fields/app_table_cell_wrapper.dart';
import 'package:flutter/material.dart';

class AppTableCellBadge extends StatelessWidget {
  const AppTableCellBadge({
    required this.backgroundColor,
    required this.text,
    this.alignment = Alignment.centerLeft,
    this.tooltip,
    super.key,
  });

  /// The text to display in the table cell.
  final Color backgroundColor;

  final String text;

  /// The alignment of the text within the widget.
  final Alignment alignment;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    final borderRadiuses = context.appTheme.borderRadiuses;
    final generalColors = context.appTheme.generalColors;

    final foregroundColor = backgroundColor.computeLuminance() < 0.5
        ? generalColors.computeLuminanceLightColor
        : generalColors.computeLuminanceDarkColor;

    return AppTableCellWrapper(
      alignment: alignment,
      tooltip: tooltip,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadiuses.s),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
          child: AppTableCellFormattedText(
            text,
            bold: false,
            italic: false,
            color: foregroundColor,
          ),
        ),
      ),
    );
  }
}
