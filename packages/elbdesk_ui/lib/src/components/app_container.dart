import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({
    required this.child,
    super.key,
    this.isActive = true,
    this.isHovered = false,
    this.padding,
    this.backgroundColor,
    this.showBorder = true,
  });

  final Widget child;
  final bool isActive;
  final bool isHovered;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    final generalColors = context.appTheme.generalColors;
    final borderRadiuses = context.appTheme.borderRadiuses;

    return Container(
      decoration: BoxDecoration(
        border: showBorder
            ? Border.all(
                color: !isActive
                    ? generalColors.primarySurfaceBorder
                    : isHovered
                        ? generalColors.primary
                        : generalColors.primarySurfaceBorder,
                width: 1,
              )
            : null,
        borderRadius: BorderRadius.circular(borderRadiuses.m),
        color: !isActive
            ? null
            : isHovered
                ?
                // This leads to the color not being transparent but still
                // "lighting up" the container on being hovered
                Color.lerp(
                    backgroundColor ?? generalColors.primarySurface,
                    generalColors.primary,
                    0.1,
                  )
                : backgroundColor ?? generalColors.primarySurface,
      ),
      padding: padding,
      child: child,
    );
  }
}
