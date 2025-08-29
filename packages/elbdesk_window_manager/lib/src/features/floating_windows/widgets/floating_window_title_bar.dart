import 'package:elbdesk_window_manager/src/features/floating_windows/providers/state/floating_window_is_maximized_state.dart';
import 'package:elbdesk_window_manager/src/features/floating_windows/widgets/title_bar/macos_title_bar/macos_title_bar.dart';
import 'package:elbdesk_window_manager/src/features/floating_windows/widgets/title_bar/windows_title_bar/windows_title_bar.dart';
import 'package:elbdesk_window_manager/src/features/floating_windows/widgets/window_title_bar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../theme/window_manager_theme.dart';

/// The style of the floating window title bar

/// A title bar widget that can be placed inside floating window content
///
/// This widget provides a standard title bar with window controls that can be
/// placed directly inside your content widget.
///
/// Example usage:
/// ```dart
/// Column(
///   children: [
///     if (widget.floatingWindowId != null)
///       FloatingWindowTitleBar(
///         windowId: widget.floatingWindowId!,
///         title: Text('My Window'),
///         icon: Icons.person,
///       ),
///     // ... rest of your content
///   ],
/// )
/// ```
class FloatingWindowTitleBar extends ConsumerWidget {
  const FloatingWindowTitleBar({
    super.key,
    required this.windowId,
    this.title,
    this.icon,
    this.backgroundColor,
    this.foregroundColor,
    this.height,
    this.leading,
    this.actions = const [],
    this.centerTitle = false,
    required this.onClose,
    this.showMinimize = true,
    this.showMaximize = true,
    this.showClose = true,
    this.borderRadius,
    this.onMinimize,
    this.onMaximize,
    this.style = WindowTitleBarStyle.windows,
    this.floatingWindowFocus,
  });

  /// The window ID for this title bar
  final String windowId;

  /// The title widget (usually Text, but can be any widget)
  final Widget? title;

  /// Optional icon to show before the title
  final IconData? icon;

  /// Background color of the title bar
  final Color? backgroundColor;

  /// Foreground color for text and icons
  final Color? foregroundColor;

  /// Height of the title bar (if not provided, uses theme default)
  final double? height;

  /// Widget to show on the left side (before icon/title)
  final Widget? leading;

  /// Additional action widgets (before the window controls)
  final List<Widget> actions;

  /// Whether to center the title
  final bool centerTitle;

  /// Custom close callback (if not provided, uses default window close)
  final VoidCallback? onClose;

  /// Whether to show minimize button
  final bool showMinimize;

  /// Whether to show maximize button
  final bool showMaximize;

  /// Whether to show close button
  final bool showClose;

  /// Custom border radius for the title bar
  final BorderRadius? borderRadius;

  /// Custom minimize callback (if not provided, uses default window minimize)
  final VoidCallback? onMinimize;

  /// Custom maximize callback (if not provided, uses default window maximize)
  final VoidCallback? onMaximize;

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
    final bgColor = backgroundColor ?? titleBarTheme.backgroundColor;
    final fgColor = foregroundColor ?? titleBarTheme.textColor;
    final effectiveHeight = height ?? titleBarTheme.height;

    final isMaximized = ref.watch(
      floatingWindowIsMaximizedStateProvider(windowId),
    );

    return RepaintBoundary(
      child: ClipRRect(
        borderRadius:
            borderRadius ??
            (isMaximized || isMobile
                ? BorderRadius.zero
                : BorderRadius.only(
                    topLeft: Radius.circular(windowTheme.borderRadius),
                    topRight: Radius.circular(windowTheme.borderRadius),
                  )),
        child: Container(
          height: effectiveHeight,
          color: bgColor,
          child: style == WindowTitleBarStyle.macOS
              ? MacOSTitleBar(
                  windowId: windowId,
                  fgColor: fgColor,
                  isMobile: isMobile,
                  height: effectiveHeight,
                  leading: leading,
                  actions: actions,
                  title: title,
                  icon: icon,
                  showMinimize: showMinimize,
                  showMaximize: showMaximize,
                  showClose: showClose,

                  onClose: onClose,
                )
              : WindowsTitleBar(
                  windowId: windowId,

                  fgColor: fgColor,
                  isMobile: isMobile,
                  height: effectiveHeight,
                  leading: leading,
                  actions: actions,
                  title: title,
                  icon: icon,
                  showMinimize: showMinimize,
                  showMaximize: showMaximize,
                  showClose: showClose,

                  onClose: onClose,
                ),
        ),
      ),
    );
  }
}
