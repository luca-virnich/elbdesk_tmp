import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

class ElbTableSwitchLayoutButton extends StatelessWidget {
  const ElbTableSwitchLayoutButton({
    required this.onPressed,
    required this.showList,
    super.key,
  });

  final VoidCallback onPressed;
  final bool showList;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AppButton.secondary(
      icon: showList
          ? const Icon(AppIcons.list)
          : const Icon(AppIcons.tiles_view),
      onPressed: onPressed,
      tooltip: showList ? l10n.gen_ui_list_view : l10n.gen_ui_table_view,
    );
  }
}
