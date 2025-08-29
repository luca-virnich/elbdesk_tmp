import 'package:elbdesk_platform_info/elbdesk_platform_info.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:elbdesk_window_manager/elbdesk_window_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppBottomSheet extends HookWidget {
  const AppBottomSheet({
    required this.child,
    required this.title,
    required this.icon,
    required this.onCancel,
    required this.forceMaxHeight,
    super.key,
  });

  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
    required String title,
    required IconData icon,
    bool forceMaxHeight = false,
    VoidCallback? onCancel,
  }) async {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      useRootNavigator: ElbDeskPlatformInfo.isMobileDevice,
      constraints: const BoxConstraints(
        maxWidth: double.infinity,
      ),
      builder: (context) => AppBottomSheet(
        forceMaxHeight: forceMaxHeight,
        title: title,
        icon: icon,
        onCancel: onCancel,
        child: child,
      ),
    );
  }

  final Widget child;
  final String title;
  final IconData? icon;
  final VoidCallback? onCancel;
  final bool forceMaxHeight;

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final bgColor = theme.generalColors.background;
    final borderRadius = theme.borderRadiuses.m;

    return Consumer(
      builder: (context, ref, _) {
        final safeAreaPadding = ref.watch(safeAreaPaddingProvider);
        final keyboardHeight = ref
            .watch(keyboardHeightProvider(ElbDeskPlatformInfo.isMobileDevice));
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: safeAreaPadding.top),
            Flexible(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final maxHeight = constraints.maxHeight * 0.90;
                  return Container(
                    width: double.infinity,
                    constraints: BoxConstraints(
                      maxHeight: maxHeight,
                      minHeight: forceMaxHeight ? maxHeight : 0,
                    ),
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(borderRadius),
                        topRight: Radius.circular(borderRadius),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppWindowTitlebar(
                          titleText: title,
                          titleIconData: icon,
                          onClose: onCancel ??
                              // () => Navigator.of(context, rootNavigator: true).pop(),
                              () => Navigator.of(context).pop(),
                        ),
                        Flexible(
                          child: child,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: keyboardHeight),
            SizedBox(height: safeAreaPadding.bottom),
          ],
        );
      },
    );
    return AppWindow.fixed(
      showShadow: false,
      showBorder: true,
      contentPadding: EdgeInsets.zero,
      titlebar: AppWindowTitlebar(
        titleText: title,
        titleIconData: icon,
        onClose: onCancel ?? () => Navigator.of(context).pop(),
      ),
      width: double.infinity,
      height: null,
      child: child,
    );
  }
}
