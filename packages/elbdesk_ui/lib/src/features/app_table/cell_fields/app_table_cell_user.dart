import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/src/features/app_table/cell_fields/app_table_cell_formatted_text.dart';
import 'package:elbdesk_ui/src/features/app_table/cell_fields/app_table_cell_wrapper.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppTableCellUser extends ConsumerWidget {
  /// Creates an [AppTableCellUser].
  ///
  /// The [text] parameter must not be null.
  const AppTableCellUser(
    this.userInfoId, {
    this.alignment = Alignment.centerLeft,
    this.leadingIconData,
    this.leadingIconColor,
    this.tooltip,
    this.bold = false,
    this.italic = false,
    super.key,
  });

  /// The text to display in the table cell.
  final int? userInfoId;

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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (userInfoId == null) return const SizedBox.shrink();

    final userFullName = userInfoId == 1
        ? 'System'
        : ref
            .watch(fetchLocalLightUserByUserInfoIdProvider(userInfoId!))
            .fullName;

    return AppTableCellWrapper(
      alignment: alignment,
      tooltip: tooltip,
      leadingIconData: leadingIconData,
      leadingIconColor: leadingIconColor,
      child: AppTableCellFormattedText(
        userFullName,
        bold: bold,
        italic: italic,
      ),
    );
  }
}
