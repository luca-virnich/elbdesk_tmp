import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';

class UpdateAvailableButton extends StatelessWidget {
  const UpdateAvailableButton({
    required this.onPressed,
    super.key,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = context.appTheme.generalColors;
    final l10n = context.l10n;

    return AppShimmer.fromColors(
      baseColor: colors.onBackground,
      highlightColor: colors.primarySurface,
      child: AppButton.blank(
        onPressed: onPressed,
        iconPosition: AppButtonIconPosition.rightInside,
        iconData: AppIcons.refresh,
        label: l10n.gen_update_available,
      ),
    );
  }
}
