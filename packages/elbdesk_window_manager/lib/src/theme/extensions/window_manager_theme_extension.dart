import 'package:flutter/material.dart';
import '../mobile_bottom_bar_theme_data.dart';
import '../side_navigation_theme_data.dart';
import '../status_bar_theme_data.dart';
import '../taskbar_theme_data.dart';
import '../window_management_theme_data.dart';
import '../window_overview_theme_data.dart';
import '../window_theme_data.dart';
import '../window_title_bar_theme_data.dart';

/// ThemeExtension for WindowManager package
/// This allows the window manager theme to be integrated with Flutter's theme system
class WindowManagerThemeExtension extends ThemeExtension<WindowManagerThemeExtension> {
  const WindowManagerThemeExtension({
    required this.globalBackgroundColor,
    required this.navigationBackgroundColor,
    required this.contentBackgroundColor,
    required this.taskbar,
    required this.sideNavigation,
    required this.mobileBottomBar,
    required this.window,
    required this.windowTitleBar,
    required this.windowManagement,
    required this.windowOverview,
    required this.statusBar,
  });

  /// Global background color used for the main scaffold
  final Color globalBackgroundColor;

  /// Navigation chrome background color (side nav, taskbars, top header)
  final Color navigationBackgroundColor;

  /// Background color for the main content area
  final Color contentBackgroundColor;

  /// Desktop taskbar theming (bottom bar on desktop)
  final TaskbarThemeData taskbar;

  /// Side navigation panel theming
  final SideNavigationThemeData sideNavigation;

  /// Mobile bottom navigation bar theming
  final MobileBottomBarThemeData mobileBottomBar;

  /// Window appearance theming (background, borders, shadows)
  final WindowThemeData window;

  /// Window title bar theming (height, colors, control buttons)
  final WindowTitleBarThemeData windowTitleBar;

  /// Window management features theming (snap layouts, previews)
  final WindowManagementThemeData windowManagement;

  /// Window overview/expose theming
  final WindowOverviewThemeData windowOverview;

  /// Status bar theming (height and background color)
  final StatusBarThemeData statusBar;

  @override
  WindowManagerThemeExtension copyWith({
    Color? globalBackgroundColor,
    Color? navigationBackgroundColor,
    Color? contentBackgroundColor,
    TaskbarThemeData? taskbar,
    SideNavigationThemeData? sideNavigation,
    MobileBottomBarThemeData? mobileBottomBar,
    WindowThemeData? window,
    WindowTitleBarThemeData? windowTitleBar,
    WindowManagementThemeData? windowManagement,
    WindowOverviewThemeData? windowOverview,
    StatusBarThemeData? statusBar,
  }) {
    return WindowManagerThemeExtension(
      globalBackgroundColor: globalBackgroundColor ?? this.globalBackgroundColor,
      navigationBackgroundColor: navigationBackgroundColor ?? this.navigationBackgroundColor,
      contentBackgroundColor: contentBackgroundColor ?? this.contentBackgroundColor,
      taskbar: taskbar ?? this.taskbar,
      sideNavigation: sideNavigation ?? this.sideNavigation,
      mobileBottomBar: mobileBottomBar ?? this.mobileBottomBar,
      window: window ?? this.window,
      windowTitleBar: windowTitleBar ?? this.windowTitleBar,
      windowManagement: windowManagement ?? this.windowManagement,
      windowOverview: windowOverview ?? this.windowOverview,
      statusBar: statusBar ?? this.statusBar,
    );
  }

  @override
  WindowManagerThemeExtension lerp(ThemeExtension<WindowManagerThemeExtension>? other, double t) {
    if (other is! WindowManagerThemeExtension) {
      return this;
    }

    return WindowManagerThemeExtension(
      globalBackgroundColor: Color.lerp(globalBackgroundColor, other.globalBackgroundColor, t)!,
      navigationBackgroundColor: Color.lerp(navigationBackgroundColor, other.navigationBackgroundColor, t)!,
      contentBackgroundColor: Color.lerp(contentBackgroundColor, other.contentBackgroundColor, t)!,
      taskbar: TaskbarThemeData.lerp(taskbar, other.taskbar, t)!,
      sideNavigation: SideNavigationThemeData.lerp(sideNavigation, other.sideNavigation, t)!,
      mobileBottomBar: MobileBottomBarThemeData.lerp(mobileBottomBar, other.mobileBottomBar, t)!,
      window: WindowThemeData.lerp(window, other.window, t)!,
      windowTitleBar: WindowTitleBarThemeData.lerp(windowTitleBar, other.windowTitleBar, t)!,
      windowManagement: WindowManagementThemeData.lerp(windowManagement, other.windowManagement, t)!,
      windowOverview: WindowOverviewThemeData.lerp(windowOverview, other.windowOverview, t)!,
      statusBar: StatusBarThemeData.lerp(statusBar, other.statusBar, t)!,
    );
  }

  /// Get the WindowManagerThemeExtension from the current theme
  static WindowManagerThemeExtension of(BuildContext context) {
    final theme = Theme.of(context).extension<WindowManagerThemeExtension>();
    if (theme == null) {
      throw FlutterError(
        'WindowManagerThemeExtension.of() called with a context that does not contain a WindowManagerThemeExtension.\n'
        'Make sure to add WindowManagerThemeExtension to your theme extensions.',
      );
    }
    return theme;
  }

  /// Get the WindowManagerThemeExtension from the current theme, or return null if not found
  static WindowManagerThemeExtension? maybeOf(BuildContext context) {
    return Theme.of(context).extension<WindowManagerThemeExtension>();
  }
}