import 'dart:ui';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<T?> showElbDialog<T>({
  required BuildContext context,
  required Widget child,
  GlobalKey<NavigatorState>? navigatorKey,
  bool useRootNavigator = false,
  bool isDismissible = false,
}) async {
  final navigator = navigatorKey?.currentState ??
      Navigator.of(context, rootNavigator: useRootNavigator);
  return navigator.push<T?>(
    DialogRoute<T>(
      barrierColor: context.appTheme.generalColors.barrierColor,
      barrierDismissible: isDismissible,
      context: context,
      builder: (BuildContext context) {
        return child;
      },
    ),
  );
}

enum ElbDialogMode {
  // switchting between normal and bottomSheet
  responsive,
  // normal dialog
  normal,
  // bottom sheet
  bottomSheet,
}

class ElbDialog extends HookConsumerWidget {
  const ElbDialog({
    required this.child,
    required this.floatingWindowId,
    this.maxWidth = 800,
    this.onSaveShortcut,
    this.maxHeight,
    this.title,
    this.blockShortcuts = false,
    this.icon,
    this.onCancel,
    this.onSaveAndCloseShortcut,
    this.footer,
    this.isLoading = false,
    this.minWidth,
    this.blockCloseShortcut = false,
    this.isSelfScrollable = false,
    this.contentPadding,
    this.dialogMode = ElbDialogMode.responsive,
    this.hideTitlebar = false,
    this.actions,
    this.hideCloseButton = false,
    this.blurBackground = false,
    this.insetPadding,
    super.key,
  });
  final Widget child;
  final double? maxWidth;
  final double? maxHeight;
  final String? title;
  final IconData? icon;
  // Also triggered on close shortcut
  final VoidCallback? onCancel;
  final bool blockShortcuts;
  final VoidCallback? onSaveAndCloseShortcut;
  final VoidCallback? onSaveShortcut;

  final bool blockCloseShortcut;
  final String? floatingWindowId;
  final Widget? footer;
  final bool isLoading;
  final bool isSelfScrollable;
  final double? minWidth;
  final EdgeInsets? contentPadding;

  final ElbDialogMode dialogMode;
  final bool hideTitlebar;
  final List<Widget>? actions;
  final bool hideCloseButton;
  final bool blurBackground;
  final EdgeInsets? insetPadding;

  EdgeInsets effContentPadding() {
    if ((actions != null && actions!.isNotEmpty) || footer != null) {
      return contentPadding?.copyWith(bottom: 0) ??
          const EdgeInsets.all(
            UiConstants.defaultPadding,
          );
    }
    return contentPadding ?? const EdgeInsets.all(UiConstants.defaultPadding);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inWindowFocus = useFocusNode();
    final floatingWindowFocus = floatingWindowId != null
        ? ref.watch(windowFocusNodeProvider(floatingWindowId!))
        : null;
    final generalColors = context.appTheme.generalColors;

    useEffect(
      () {
        void unfocusParentRequestChildFocus() {
          if (floatingWindowFocus == null) return;
          if (floatingWindowFocus.hasFocus) {
            floatingWindowFocus.unfocus();
            inWindowFocus.requestFocus();
          }
        }

        floatingWindowFocus?.addListener(unfocusParentRequestChildFocus);
        return () =>
            floatingWindowFocus?.removeListener(unfocusParentRequestChildFocus);
      },
      [floatingWindowFocus],
    );

    final blockShortcuts = isLoading || this.blockShortcuts;
    final dialog = LayoutBuilder(
      builder: (context, constraints) {
        final effectiveMinWidth = minWidth ?? 0;
        final effectiveMaxWidth = (maxWidth ?? double.infinity)
            .clamp(effectiveMinWidth, double.infinity);

        final isWide = ((constraints.maxWidth >
                    UiConstants.responsiveDialogBreakpointWidth) &&
                dialogMode == ElbDialogMode.responsive) ||
            dialogMode == ElbDialogMode.normal;

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
            LogicalKeySet(LogicalKeyboardKey.escape): const CloseWindowIntent(),
          },
          child: Actions(
            actions: {
              CloseWindowIntent: CallbackAction<CloseWindowIntent>(
                onInvoke: (intent) async {
                  if (blockShortcuts || blockCloseShortcut) {
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
              SaveAndCloseWindowIntent:
                  CallbackAction<SaveAndCloseWindowIntent>(
                onInvoke: (intent) async {
                  if (blockShortcuts) {
                    return null;
                  }
                  if (onSaveAndCloseShortcut != null) {
                    onSaveAndCloseShortcut!.call();
                    return;
                  }

                  return null;
                },
              ),
              SaveWindowIntent: CallbackAction<SaveWindowIntent>(
                onInvoke: (intent) async {
                  if (blockShortcuts) {
                    return null;
                  }
                  if (onSaveShortcut != null) {
                    onSaveShortcut!.call();
                    return;
                  }
                  return null;
                },
              ),
            },
            child: Focus(
              autofocus: true,
              skipTraversal: true,
              focusNode: inWindowFocus,
              child: Dialog(
                backgroundColor: Colors.transparent,
                alignment:
                    isWide ? Alignment.topCenter : Alignment.bottomCenter,
                insetPadding: isWide
                    ? insetPadding ??
                        const EdgeInsets.only(
                          top: 64,
                          bottom: 32,
                          left: 16,
                          right: 16,
                        )
                    : EdgeInsets.zero,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: effectiveMinWidth,
                    maxWidth: effectiveMaxWidth,
                    maxHeight: maxHeight ??
                        (isWide
                            ? (constraints.maxHeight - 64)
                                .clamp(0, double.infinity)
                            : (constraints.maxHeight - 32)
                                .clamp(0, double.infinity)),
                  ),
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: generalColors.background,
                      borderRadius: BorderRadius.circular(
                        context.appTheme.borderRadiuses.m,
                      ),
                      border: Border.all(
                        color: generalColors.primarySurfaceBorder,
                        strokeAlign: BorderSide.strokeAlignOutside,
                      ),
                    ),
                    child: FocusScope(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          if (!hideTitlebar)
                            AppWindowTitlebar(
                              skipCloseButtonFocus: true,
                              titleText: title,
                              titleIconData: icon,
                              hideCloseButton: hideCloseButton,
                              onClose: isLoading
                                  ? null
                                  : onCancel ??
                                      () => Navigator.of(context).pop(),
                            ),
                          if (!isSelfScrollable)
                            Flexible(
                              child: Padding(
                                padding: effContentPadding(),
                                child: child,
                              ),
                            ),
                          if (isSelfScrollable)
                            Flexible(
                              child: Padding(
                                padding: effContentPadding().copyWith(right: 0),
                                child: SingleChildScrollView(
                                  padding: const EdgeInsets.only(
                                    right: UiConstants.defaultPadding,
                                  ),
                                  child: child,
                                ),
                              ),
                            ),
                          if (footer != null) ...[
                            const SizedBox(
                              height: UiConstants.defaultPadding,
                            ),
                            const AppDivider(),
                            footer!,
                          ],
                          if (actions != null && actions!.isNotEmpty) ...[
                            Padding(
                              padding: const EdgeInsets.only(
                                top: UiConstants.elementMargin,
                                left: UiConstants.defaultPadding,
                                right: UiConstants.defaultPadding,
                                bottom: UiConstants.defaultPadding,
                              ),
                              child: AppWrap(
                                crossAxisAlignment: WrapCrossAlignment.end,
                                alignment: WrapAlignment.end,
                                children: actions!,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
    if (blurBackground) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
        child: dialog,
      );
    }
    return dialog;
  }
}
