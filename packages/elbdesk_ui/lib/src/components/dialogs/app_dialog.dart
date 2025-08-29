import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AppDialog {
  /// @nodoc
  const AppDialog._();

  static void closeDialog(
    GlobalKey<NavigatorState> navigatorKey,
  ) {
    final dialogContext = navigatorKey.currentContext;
    if (dialogContext != null && Navigator.canPop(dialogContext)) {
      Navigator.of(dialogContext).pop();
    }
  }
}

class CloseFloatingWindowDialog extends HookWidget {
  const CloseFloatingWindowDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return ElbAlertDialog(
      hideCloseButton: true,
      titleText: l10n.gen_close_window,
      titleIcon: AppIcons.error_outline,
      contentText: l10n.gen_dialog_close_window_unsaved_confirmation_text,
      actions: [
        AppButton.secondary(
          //focusNode: cancelFocusNode,
          label: l10n.gen_cancel,
          onPressed: () => Navigator.of(context).pop(false),
        ),
        AppButton.danger(
          label: l10n.gen_close_window,
          onPressed: () => Navigator.of(context).pop(true),
        ),
      ],
    );
  }
}

class CloseFloatingWindowDialogIntent extends Intent {
  const CloseFloatingWindowDialogIntent();
}
