import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:elbdesk_ui/src/features/app_table/cell_fields/app_table_cell_wrapper.dart';
import 'package:flutter/material.dart';

class AppTableCellLightUser extends StatelessWidget {
  ///

  const AppTableCellLightUser(
    this.user, {
    this.alignment = Alignment.centerLeft,
    super.key,
  });

  /// The text to display in the table cell.
  final LightUser? user;

  /// The alignment of the text within the widget.
  final Alignment alignment;

  /// Tooltip to display when hovering over the text

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return const SizedBox.shrink();
    }
    return AppTableCellWrapper(
      alignment: alignment,
      tooltip: user!.fullName,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // LightUserAvatar(
          //   user: user!,
          //   size: 24,
          //   isActive: false,
          //   isInRow: true,
          //   cardBackgroundColor: context.appTheme.generalColors.background,
          // ),
          // const SizedBox(width: UiConstants.elementMargin),
          Expanded(
            child: AppText(
              user!.fullName,
              maxLines: 1,
              autoSize: false,
            ),
          ),
        ],
      ),
    );
  }
}
