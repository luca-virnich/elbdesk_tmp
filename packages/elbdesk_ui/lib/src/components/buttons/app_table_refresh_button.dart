import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/src/components/buttons/app_button.dart';
import 'package:elbdesk_ui/src/core/constants/app_icons.dart';
import 'package:flutter/material.dart';

class AppTableRefreshButton extends StatelessWidget {
  const AppTableRefreshButton({
    required this.onPressed,
    super.key,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AppButton.secondary(
      onPressed: onPressed,
      tooltip: l10n.gen_refresh,
      iconData: AppIcons.refresh,
    );
  }
}
