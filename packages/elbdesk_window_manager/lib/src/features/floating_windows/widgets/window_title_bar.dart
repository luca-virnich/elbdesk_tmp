import 'package:elbdesk_window_manager/src/features/floating_windows/widgets/title_bar/macos_title_bar/macos_title_bar.dart';
import 'package:elbdesk_window_manager/src/features/floating_windows/widgets/title_bar/windows_title_bar/windows_title_bar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../theme/window_manager_theme.dart';

/// The style of the floating window title bar
enum WindowTitleBarStyle {
  /// Windows-style title bar with controls on the right
  windows,

  /// macOS-style title bar with controls on the left and centered title
  macOS,
}

class WindowTitleBar extends ConsumerWidget {
  const WindowTitleBar({
    super.key,
    this.title,
    this.icon,
    this.actions = const [],

    this.onClose,

    this.showClose = true,

    this.style = WindowTitleBarStyle.windows,
    this.floatingWindowFocus,
  });

  /// Additional action widgets (before the window controls)
  final List<Widget> actions;
  final String? title;
  final IconData? icon;

  /// Whether to center the title

  /// Custom close callback (if not provided, uses default window close)
  final VoidCallback? onClose;

  /// Whether to show minimize button

  /// Whether to show maximize button

  /// Whether to show close button
  final bool showClose;

  /// Custom border radius for the title bar

  /// The style of the title bar (Windows or macOS)
  final WindowTitleBarStyle style;

  final FocusNode? floatingWindowFocus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get window state from the global list

    // Check if we're on mobile
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    // Get theme
    final windowManagerTheme = WindowManagerTheme.of(context);
    final windowTheme = windowManagerTheme.window;
    final titleBarTheme = windowManagerTheme.windowTitleBar;

    // Determine colors and height
    final bgColor = titleBarTheme.backgroundColor;
    final fgColor = titleBarTheme.textColor;
    final effectiveHeight = titleBarTheme.height;

    return RepaintBoundary(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(windowTheme.borderRadius),
          topRight: Radius.circular(windowTheme.borderRadius),
        ),
        child: Container(
          height: effectiveHeight,
          color: bgColor,
          child: style == WindowTitleBarStyle.macOS
              ? MacOSTitleBar(
                  fgColor: fgColor,
                  isMobile: isMobile,
                  height: effectiveHeight,

                  actions: actions,
                  title: Text(title ?? ''),
                  icon: icon,
                  showMinimize: false,
                  showMaximize: false,
                  showClose: showClose,

                  onClose: onClose,
                )
              : WindowsTitleBar(
                  fgColor: fgColor,
                  isMobile: isMobile,
                  height: effectiveHeight,

                  actions: actions,
                  title: Text(title ?? ''),
                  icon: icon,
                  showMinimize: false,
                  showMaximize: false,
                  showClose: showClose,

                  onClose: onClose,
                ),
        ),
      ),
    );
  }
}
