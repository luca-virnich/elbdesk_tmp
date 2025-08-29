import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

class ElbInkWell extends StatelessWidget {
  const ElbInkWell({
    required this.onTap,
    required this.child,
    this.onDoubleTap,
    this.onSecondaryTap,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.hoverColor,
    super.key,
  });

  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;
  final VoidCallback? onSecondaryTap;
  final Widget child;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? hoverColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final effectiveBorderRadius = borderRadius ?? theme.borderRadiuses.s;
    final effectiveHoverColor = hoverColor ??
        theme.buttonStyles.primary.overlayColor.withAppOpacity(0.1);
    final transparent = theme.generalColors.transparent;
    final effectiveBackgroundColor = backgroundColor ?? transparent;
    return Material(
      color: effectiveBackgroundColor,
      borderRadius: BorderRadius.circular(effectiveBorderRadius),
      child: InkWell(
        onDoubleTap: onDoubleTap,
        onSecondaryTap: onSecondaryTap,
        borderRadius: BorderRadius.circular(effectiveBorderRadius),
        onTap: onTap,
        overlayColor: WidgetStateProperty.resolveWith<Color?>(
          (states) {
            final showHover = states.contains(WidgetState.hovered) ||
                states.contains(WidgetState.focused) ||
                states.contains(WidgetState.selected);
            if (states.contains(WidgetState.pressed)) {
              return effectiveHoverColor.withAppOpacity(0.2);
            }
            if (showHover) {
              return effectiveHoverColor;
            }
            return null;
          },
        ),
        splashColor: transparent,
        splashFactory: NoSplash.splashFactory,
        enableFeedback: true,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(effectiveBorderRadius),
            border: Border.all(color: borderColor ?? transparent),
          ),
          child: child,
        ),
      ),
    );
  }
}
