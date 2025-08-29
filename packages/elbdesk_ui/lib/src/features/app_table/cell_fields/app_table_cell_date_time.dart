import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/src/features/app_table/cell_fields/app_table_cell_formatted_text.dart';
import 'package:elbdesk_ui/src/features/app_table/cell_fields/app_table_cell_wrapper.dart';
import 'package:flutter/material.dart';

class AppTableCellDateTime extends StatelessWidget {
  const AppTableCellDateTime(
    this.dateTime, {
    this.alignment = Alignment.centerLeft,
    this.tooltip,
    this.bold = false,
    this.italic = false,
    super.key,
  });

  /// The text to display in the table cell.
  final DateTime? dateTime;

  /// The alignment of the text within the widget.
  final Alignment alignment;

  /// Tooltip to display when hovering over the text
  final String? tooltip;

  /// Whether the text should be bold
  final bool bold;

  /// Whether the text should be italic
  final bool italic;

  @override
  Widget build(BuildContext context) {
    final localeName = context.l10n.localeName;
    if (dateTime == null) return const SizedBox.shrink();
    return AppTableCellWrapper(
      alignment: alignment,
      tooltip: tooltip,
      child: AppTableCellFormattedText(
        dateTime!.toTimestamp(localeName),
        bold: bold,
        italic: italic,
      ),
    );
  }
}
