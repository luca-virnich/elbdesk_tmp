import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

// TODO(all): rename/refactor
class DefaultDashboardChildBox extends StatelessWidget {
  const DefaultDashboardChildBox({
    required this.child,
    this.ignoreOuterPadding = false,
    super.key,
  });
  final Widget child;
  final bool ignoreOuterPadding;

  @override
  Widget build(BuildContext context) {
    final generalColors = context.appTheme.generalColors;
    final shadows = context.appTheme.shadows;
    final borderRadiuses = context.appTheme.borderRadiuses;

    return ColoredBox(
      color: generalColors.primarySurface,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 8,
          bottom: 8,
          top: 8,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: generalColors.background,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(borderRadiuses.m),
              bottomLeft: Radius.circular(borderRadiuses.m),
            ),
            boxShadow: shadows.dashboardBoxShadow,
          ),
          child: ignoreOuterPadding
              ? child
              : Padding(
                  padding: const EdgeInsets.only(
                    left: UiConstants.defaultPadding,
                    top: UiConstants.defaultPadding,
                    bottom: UiConstants.defaultPadding,
                    right: AppSpace.s,
                  ),
                  child: child,
                ),
        ),
      ),
    );
  }
}
