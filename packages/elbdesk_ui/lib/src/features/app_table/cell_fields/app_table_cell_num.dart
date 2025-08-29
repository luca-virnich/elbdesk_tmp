import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/src/features/app_table/cell_fields/app_table_cell_formatted_text.dart';
import 'package:elbdesk_ui/src/features/app_table/cell_fields/app_table_cell_wrapper.dart';
import 'package:flutter/material.dart';

class AppTableCellNum extends StatelessWidget {
  const AppTableCellNum(
    this.value, {
    this.alignment = Alignment.centerLeft,
    this.leadingIconData,
    this.leadingIconColor,
    this.tooltip,
    this.bold = false,
    this.italic = false,
    this.showZeroWhenNull = false,
    super.key,
  });

  /// The text to display in the table cell.
  final num? value;

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
  final bool showZeroWhenNull;

  @override
  Widget build(BuildContext context) {
    final localeName = context.l10n.localeName;
    return AppTableCellWrapper(
      alignment: alignment,
      tooltip: tooltip,
      leadingIconData: leadingIconData,
      leadingIconColor: leadingIconColor,
      child: AppTableCellFormattedText(
        value?.formatted(localeName) ?? (showZeroWhenNull ? '0' : ''),
        bold: bold,
        italic: italic,
      ),
    );
  }
}
