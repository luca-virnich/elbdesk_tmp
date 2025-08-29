import 'package:flutter/material.dart';
import '../../../theme/window_manager_theme.dart';

/// Icon button with hover effect for the taskbar
class HoverIconButton extends StatelessWidget {
  const HoverIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.tooltip,
    this.iconColor,
    this.hoverBackgroundColor,
    this.borderRadius,
    this.padding = const EdgeInsets.all(8.0),
  });

  final Widget icon;
  final VoidCallback? onPressed;
  final String? tooltip;
  final Color? iconColor;
  final Color? hoverBackgroundColor;
  final double? borderRadius;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final taskbarTheme = WindowManagerTheme.of(context).taskbar;
    final effectiveHoverColor =
        hoverBackgroundColor ??
        taskbarTheme.iconButtonHoverBackgroundColor;
    final effectiveBorderRadius = borderRadius ?? taskbarTheme.iconButtonBorderRadius;

    return IconButton(
      icon: icon,
      onPressed: onPressed,
      tooltip: tooltip,
      visualDensity: VisualDensity.compact,
      padding: padding,
      style:
          IconButton.styleFrom(
            foregroundColor: iconColor,
            backgroundColor: Colors.transparent,
            disabledForegroundColor: iconColor,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(effectiveBorderRadius),
            ),
          ).copyWith(
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.hovered)) {
                return effectiveHoverColor;
              }
              return Colors.transparent;
            }),
          ),
    );
  }
}
