import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

class MigrationActionTile extends StatelessWidget {
  const MigrationActionTile({
    required this.title,
    required this.description,
    required this.icon,
    required this.isEnabled,
    required this.isLoading,
    required this.onTap,
    super.key,
  });

  final String title;
  final String description;
  final IconData icon;
  final bool isEnabled;
  final bool isLoading;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final generalColors = context.appTheme.generalColors;
    final borderRadiuses = context.appTheme.borderRadiuses;

    return InkWell(
      onTap: isEnabled ? onTap : null,
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: generalColors.primarySurface,
          borderRadius: BorderRadius.circular(borderRadiuses.m),
          border: Border.all(
            color: generalColors.primarySurfaceBorder,
          ),
        ),
        padding: const EdgeInsets.all(AppSpace.m),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElbIcon(
              icon,
              size: AppIconSize.xl,
              color: isEnabled
                  ? generalColors.primary
                  : generalColors.onBackground.withAppOpacity(0.2),
            ),
            const SizedBox(height: AppSpace.m),
            AppText(
              title,
              style: context.appTheme.textStyles.h3,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpace.s),
            AppText(
              description,
              style: context.appTheme.textStyles.defaultText,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
