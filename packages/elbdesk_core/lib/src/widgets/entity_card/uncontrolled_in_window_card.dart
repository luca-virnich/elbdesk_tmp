import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UncontrolledInWindowCard extends HookConsumerWidget {
  /// @nodoc
  const UncontrolledInWindowCard({
    required this.child,
    required this.floatingWindowId,
    required this.parentNavigatorKey,
    required this.floatingWindowFocus,
    this.blockShortcuts = false,
    this.contentPadding,
    this.onCancel,
    this.footer,
    this.onSaveAndCloseShortcut,
    super.key,
  });

  final String floatingWindowId;

  final GlobalKey<NavigatorState> parentNavigatorKey;

  final Widget child;

  final FocusNode floatingWindowFocus;

  final bool blockShortcuts;
  final EdgeInsets? contentPadding;
  final VoidCallback? onCancel;
  final Widget? footer;
  final VoidCallback? onSaveAndCloseShortcut;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final windowFocus = useFocusNode(debugLabel: 'uncontrolled Window Focus');

    useEffect(
      () {
        void unfocusParentRequestChildFocus() {
          if (floatingWindowFocus.hasFocus) {
            floatingWindowFocus.unfocus();
            windowFocus.requestFocus();
          }
        }

        floatingWindowFocus.addListener(unfocusParentRequestChildFocus);
        return () =>
            floatingWindowFocus.removeListener(unfocusParentRequestChildFocus);
      },
      [floatingWindowFocus],
    );

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
              if (blockShortcuts) {
                return null;
              }

              if (onCancel == null) {
                Navigator.of(context).pop();
              } else {
                onCancel?.call();
              }
              return null;
            },
          ),
          SaveAndCloseWindowIntent: CallbackAction<SaveAndCloseWindowIntent>(
            onInvoke: (intent) async {
              if (blockShortcuts) {
                return null;
              }
              if (onSaveAndCloseShortcut != null) {
                onSaveAndCloseShortcut!.call();
                return;
              }
              Navigator.of(context).pop();
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
          skipTraversal: true,
          focusNode: windowFocus,
          child: ColoredBox(
            color: context.appTheme.generalColors.background,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: FocusScope(
                    child: Padding(
                      padding: contentPadding ??
                          const EdgeInsets.all(
                            UiConstants.defaultPadding,
                          ),
                      child: child,
                    ),
                  ),
                ),
                if (footer != null) ...[
                  const SizedBox(height: UiConstants.defaultPadding),
                  const AppDivider(),
                  footer!,
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
