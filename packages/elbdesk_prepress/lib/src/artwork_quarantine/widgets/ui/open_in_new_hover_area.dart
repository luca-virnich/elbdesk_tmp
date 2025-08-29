import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

class OpenInNewHoverArea extends StatelessWidget {
  const OpenInNewHoverArea({
    required this.isActive,
    required this.child,
    super.key,
  });

  final bool isActive;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    return AnimatedContainer(
      duration: AnimationConstants.defaultDuration,
      curve: Curves.easeOutCubic,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.appTheme.borderRadiuses.s),
        border: Border.all(
          color: isActive
              ? theme.generalColors.primary
              : theme.generalColors.onBackground.withAppOpacity(0.3),
          width: isActive ? 1.5 : 1,
        ),
        boxShadow: [
          if (isActive)
            BoxShadow(
              color: theme.generalColors.primary.withAppOpacity(0.15),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(context.appTheme.borderRadiuses.s),
        child: Stack(
          children: [
            Center(
              child: child,
            ),
            AnimatedOpacity(
              duration: AnimationConstants.defaultDuration,
              opacity: isActive ? 1.0 : 0.0,
              child: Container(
                decoration: BoxDecoration(
                  color: theme.generalColors.primary.withAppOpacity(0.1),
                ),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: theme.generalColors.primary.withAppOpacity(0.9),
                      borderRadius: BorderRadius.circular(
                        context.appTheme.borderRadiuses.s,
                      ),
                    ),
                    child: const ElbIcon(
                      AppIcons.open_in_new,
                      size: AppIconSize.m,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
