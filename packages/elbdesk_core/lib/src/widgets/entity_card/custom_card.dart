import 'package:elbdesk_core/elbdesk_core.dart' hide FloatingWindowTitlebarData;
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:elbdesk_window_manager/elbdesk_window_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomCard extends HookConsumerWidget {
  const CustomCard({
    required this.baseTitle,
    required this.childBuilder,
    required this.iconData,
    required this.floatingWindowId,
    required this.floatingWindowType,
    this.floatingWindowFocus,
    this.onClose,
    super.key,
    this.showToolbar = true,
    this.showFooter = true,
    this.showBottomStatusBar = true,
    this.parentNavigatorKey,
    this.showTitlebar = true,
    this.ribbons,
  });

  // final String Function(T entity) getTitle;

  /// This Function is called when the user is in edit mode and releases
  /// the entity for another user

  final bool showToolbar;

  final bool showFooter;
  final bool showTitlebar;

  final bool showBottomStatusBar;

  final GlobalKey<NavigatorState>? parentNavigatorKey;
  final List<Widget>? ribbons;

  final String? floatingWindowId;
  final String baseTitle;
  final IconData iconData;
  final Widget Function(
    BuildContext context,
    ObjectRef<int> selectedNavigationIndexRef,
    GlobalKey<NavigatorState> navigatorKey,
  ) childBuilder;
  final FocusNode? floatingWindowFocus;
  final Future<bool> Function(GlobalKey<NavigatorState> navigatorKey)? onClose;
  final String floatingWindowType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigatorKey = useNavigatorKey();
    final floatingWindowFocus = this.floatingWindowFocus ??
        (floatingWindowId != null
            ? ref.watch(windowFocusNodeProvider(floatingWindowId!))
            : null);

    final selectedNavigationIndexRef = useRef<int>(0);

    final l10n = context.l10n;
    final backgroundColor = context.appTheme.generalColors.background;

    useEffect(
      () {
        final titleData = FloatingWindowTitlebarData(
          icon: iconData,
          baseTitle: baseTitle,
        );
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          ref
              .read(windowManagerProvider)
              .updateWindowTitleData(floatingWindowId!, titleData);
        });
        return null;
      },
      [l10n],
    );

    final viewContent = Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(
          child: Column(
            children: [
              CardRibbons(
                floatingWindowType: floatingWindowType,
                floatingWindowId: floatingWindowId!,
                ribbons: ribbons ?? const [],
                ignoreEntityEditStatusRibbon: true,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: childBuilder(
                        context,
                        selectedNavigationIndexRef,
                        parentNavigatorKey ?? navigatorKey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );

    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        if (!kIsWeb) closeWindowShortcutMeta: const CloseWindowIntent(),
        closeWindowShortcutControl: const CloseWindowIntent(),
        closeWindowShortcutAlt: const CloseWindowIntent(),
      },
      child: Actions(
        actions: <Type, Action<Intent>>{
          CloseWindowIntent: CallbackAction<CloseWindowIntent>(
            onInvoke: (intent) async {
              if (floatingWindowId == null) {
                return;
              }
              final isInFront = ref.read(windowManagerProvider).isInFront(
                    floatingWindowId!,
                  );

              if (!isInFront) {
                return;
              }

              if (onClose != null) {
                final canClose = await onClose!(navigatorKey);
                if (canClose) {
                  ref
                      .read(windowManagerProvider)
                      .removeWindow(floatingWindowId!);
                }
              } else {
                ref.read(windowManagerProvider).removeWindow(floatingWindowId!);
              }
              return null;
            },
          ),
        },
        child: Focus(
          autofocus: true,
          skipTraversal: true,
          focusNode: floatingWindowFocus,
          child: ColoredBox(
            color: backgroundColor,
            child: Column(
              children: [
                if (floatingWindowId != null && showTitlebar)
                  FloatingWindowTitleBar(
                    windowId: floatingWindowId!,
                    onClose: () async {
                      if (onClose != null) {
                        final canClose = await onClose!(navigatorKey);
                        if (canClose) {
                          ref
                              .read(windowManagerProvider)
                              .removeWindow(floatingWindowId!);
                        }
                      } else {
                        ref
                            .read(windowManagerProvider)
                            .removeWindow(floatingWindowId!);
                      }
                    },
                  ),
                Expanded(
                  child: Navigator(
                    key: parentNavigatorKey ?? navigatorKey,
                    onGenerateRoute: (settings) {
                      return PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return viewContent;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
