import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

class AddEntityInDialogButton<T> extends StatelessWidget {
  const AddEntityInDialogButton({
    required this.entityCard,
    required this.navigatorKey,
    required this.tooltip,
    this.usePrimaryButton = true,
    this.title,
    this.onSave,
    super.key,
  });
  final Widget entityCard;
  final GlobalKey<NavigatorState> navigatorKey;
  final String tooltip;
  final String? title;
  final bool usePrimaryButton;
  final void Function(T)? onSave;
  @override
  Widget build(BuildContext context) {
    return usePrimaryButton
        ? AppButton.primary(
            onPressed: () async {
              final result = await showElbDialog<T>(
                context: context,
                navigatorKey: navigatorKey,
                child: entityCard,
              );
              if (result != null) {
                onSave?.call(result);
              }
            },
            tooltip: tooltip,
            iconData: AppIcons.add,
          )
        : AppButton.secondary(
            onPressed: () async {
              final result = await showElbDialog<T>(
                context: context,
                navigatorKey: navigatorKey,
                child: entityCard,
              );
              if (result != null) {
                onSave?.call(result);
              }
            },
            tooltip: tooltip,
            iconData: AppIcons.add,
          );
  }
}
