import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppOpenInNewIconButton extends ConsumerWidget {
  const AppOpenInNewIconButton({
    required this.onPressed,
    this.tooltip,
    this.onLongPressed,
    super.key,
  });

  final void Function()? onPressed;
  final String? tooltip;
  final void Function()? onLongPressed;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppIconButton.secondary(
      onLongPressed: onLongPressed,
      iconData: AppIcons.open_in_new,
      tooltip: tooltip ?? context.l10n.gen_open_in_new_window,
      onPressed: onPressed,
      skipTraversal: true,
    );
  }
}
