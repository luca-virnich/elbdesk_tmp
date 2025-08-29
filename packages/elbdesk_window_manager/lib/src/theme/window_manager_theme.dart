import 'package:flutter/material.dart';
import 'extensions/window_manager_theme_extension.dart';

/// Convenience widget that provides WindowManagerThemeExtension access
/// This is now just a wrapper around Theme.of(context).extension<WindowManagerThemeExtension>()
class WindowManagerTheme extends StatelessWidget {
  const WindowManagerTheme({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    // Verify that the theme extension exists
    final theme = Theme.of(context).extension<WindowManagerThemeExtension>();
    if (theme == null) {
      throw FlutterError(
        'WindowManagerThemeExtension not found in Theme.\n'
        'Make sure to add WindowManagerThemeExtension to your theme extensions.',
      );
    }
    return child;
  }

  /// Get the WindowManagerThemeExtension from the current context
  static WindowManagerThemeExtension of(BuildContext context) {
    return WindowManagerThemeExtension.of(context);
  }

  /// Get the WindowManagerThemeExtension from the current context, or return null if not found
  static WindowManagerThemeExtension? maybeOf(BuildContext context) {
    return WindowManagerThemeExtension.maybeOf(context);
  }
}