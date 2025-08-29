// ignore_for_file: deprecated_consistency

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/src/components/dialogs/on_close_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class _CloseDialog extends StatefulWidget {
  const _CloseDialog();

  @override
  State<_CloseDialog> createState() => _CloseDialogState();
}

class _CloseDialogState extends State<_CloseDialog> {
  @override
  Widget build(BuildContext context) {
    return const OnCloseDialog();
  }
}

class NextCloseOverlayListener extends StatelessWidget {
  const NextCloseOverlayListener({
    required this.child,
    required this.onClose,
    this.navigatorKey,
    this.hasSubmitDialog = true,
    super.key,
  });
  final Widget child;
  final VoidCallback onClose;
  final GlobalKey<NavigatorState>? navigatorKey;
  final bool hasSubmitDialog;

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: {
        closeWindowShortcutControl: const CloseWindowIntent(),
        if (!kIsWeb) closeWindowShortcutMeta: const CloseWindowIntent(),
        closeWindowShortcutAlt: const CloseWindowIntent(),
      },
      child: Actions(
        actions: {
          CloseWindowIntent: CallbackAction<CloseWindowIntent>(
            onInvoke: (intent) {
              onClose();
              return null;
            },
          ),
        },
        child: FocusScope(
          autofocus: true,
          child: Focus(
            autofocus: true,
            child: child,
          ),
        ),
      ),
    );
  }
}
