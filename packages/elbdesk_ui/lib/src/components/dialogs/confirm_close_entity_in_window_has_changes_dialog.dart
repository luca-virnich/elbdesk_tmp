import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ConfirmCloseEntityInWindowHasChangesDialog extends HookWidget {
  const ConfirmCloseEntityInWindowHasChangesDialog({
    required this.floatingFocusNode,
    required this.inWindowFocusNode,
    super.key,
  });
  final FocusNode floatingFocusNode;
  final FocusNode inWindowFocusNode;

  @override
  Widget build(BuildContext context) {
    final cancelFocusNode = useFocusNode(debugLabel: 'cancelFocusNode');
    final closeFocusNode = useFocusNode(debugLabel: 'closeFocusNode');
    final l10n = context.l10n;

    useEffect(
      () {
        // we need the delay because otherwise the focus node is not focused
        // after language change
        Future.delayed(
          const Duration(milliseconds: 100),
          cancelFocusNode.requestFocus,
        );
        return null;
      },
      [l10n],
    );
    return ElbAlertDialog(
      hideCloseButton: true,
      titleText: l10n.gen_dialog_close_window,
      contentText: l10n.gen_dialog_close_window_unsaved_confirmation_text,
      actions: [
        AppButton.secondary(
          focusNode: cancelFocusNode,
          label: l10n.gen_cancel,
          onPressed: () => Navigator.of(context).pop(false),
        ),
        AppButton.danger(
          focusNode: closeFocusNode,
          label: l10n.gen_dialog_close_window,
          onPressed: () => Navigator.of(context).pop(true),
        ),
      ],
    );
  }
}
