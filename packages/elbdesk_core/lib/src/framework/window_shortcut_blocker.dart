import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WindowShortcutBlocker extends StatelessWidget {
  const WindowShortcutBlocker({
    required this.child,
    super.key,
    this.blockShortcuts = true,
  });
  final Widget child;
  final bool blockShortcuts;

  @override
  Widget build(BuildContext context) {
    if (!blockShortcuts) {
      return child;
    }
    return Shortcuts(
      shortcuts: {
        if (!kIsWeb) closeWindowShortcutMeta: const CloseWindowIntent(),
        closeWindowShortcutControl: const CloseWindowIntent(),
        closeWindowShortcutAlt: const CloseWindowIntent(),
        if (!kIsWeb)
          saveAndCloseWindowShortcutMeta: const SaveAndCloseWindowIntent(),
        saveAndCloseWindowShortcutControl: const SaveAndCloseWindowIntent(),
        if (!kIsWeb) saveWindowShortcutMeta: const SaveWindowIntent(),
        saveWindowShortcutControl: const SaveWindowIntent(),
      },
      child: Actions(
        actions: {
          CloseWindowIntent: CallbackAction<CloseWindowIntent>(
            onInvoke: (intent) async {
              return null;
            },
          ),
          SaveAndCloseWindowIntent: CallbackAction<SaveAndCloseWindowIntent>(
            onInvoke: (intent) async {
              return null;
            },
          ),
          SaveWindowIntent: CallbackAction<SaveWindowIntent>(
            onInvoke: (intent) async {
              return null;
            },
          ),
        },
        child: Focus(
          autofocus: true,
          canRequestFocus: true,
          child: child,
        ),
      ),
    );
  }
}
