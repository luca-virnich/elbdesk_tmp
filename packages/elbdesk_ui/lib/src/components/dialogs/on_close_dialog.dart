import 'package:elbdesk_core/l10n/l10n_extension.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class OnCloseDialog extends HookWidget {
  /// Creates an [OnCloseDialog].
  ///
  /// The constructor does not take any parameters.
  const OnCloseDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final cancelFocusNode = useFocusNode();
    useEffect(
      () {
        cancelFocusNode.requestFocus();
        return null;
      },
      [],
    );
    return ElbAlertDialog(
      titleText: l10n.gen_attention,
      contentText: l10n.gen_close_window_without_saving,
      actions: [
        AppButton.secondary(
          focusNode: cancelFocusNode,
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          label: l10n.gen_cancel,
        ),
        AppButton.danger(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          label: l10n.gen_close_window,
        ),
      ],
    );
  }
}
