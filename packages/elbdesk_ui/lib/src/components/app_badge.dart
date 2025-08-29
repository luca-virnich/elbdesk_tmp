import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

/// Creates an [AppBadge] wrapper around a widget based on the [Badge] widget.
///
/// {@tool snippet}
/// This example shows how to use [AppBadge] in a Flutter application:
///
/// ```dart
/// AppBadge(
///   visible: true,
///   child: Icon(Icons.filter_list),
/// )
/// ```
/// {@end-tool}
class AppBadge extends StatelessWidget {
  /// Creates an [AppBadge] wrapper around a widget.
  const AppBadge({
    required this.color,
    super.key,
    this.child,
    this.visible = false,
    this.isDisabled = false,
  });

  /// The color of the AppBadge.
  final Color color;

  /// The child of the AppBadge.
  final Widget? child;

  /// Whether the AppBadge is visible.
  final bool visible;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    final disabledColor =
        context.appTheme.buttonStyles.secondary.foregroundColorDisabled;
    return Badge(
      isLabelVisible: visible,
      backgroundColor: isDisabled ? disabledColor : color,
      child: child ?? const SizedBox.shrink(),
    );
  }
}
