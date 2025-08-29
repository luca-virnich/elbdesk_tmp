part of 'user_settings_dialog.dart';

class _ThemeModeSettingsArea extends HookConsumerWidget {
  const _ThemeModeSettingsArea();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final appTheme = ref.watch(
      userSettingsStateProvider.select((settings) => settings.value?.appTheme),
    );

    final controller = useScrollController();

    // mark supported themes as true here to show them in the settings
    // if set to false, the user can't select them.
    // the themes are sorted by the order of the AppTheme enum
    final availableThemes = AppTheme.values.where((theme) {
      return switch (theme) {
        AppTheme.system => true,
        AppTheme.dark => true,
        AppTheme.light => true,
        AppTheme.windows11 => false,
        AppTheme.dracula => false,
      };
    }).toList();

    return AppWindowTile(
      isTextField: false,
      title: l10n.user_settings_theme_mode,
      subTitle: l10n.user_settings_theme_mode_subtitle,
      content: (width) {
        return AppScrollbar(
          controller: controller,
          child: SizedBox(
            height: 180,
            child: Padding(
              padding: const EdgeInsets.only(bottom: AppSpace.m),
              child: ListView.builder(
                controller: controller,
                shrinkWrap: true,
                itemExtent: 160,
                scrollDirection: Axis.horizontal,
                physics: const ClampingScrollPhysics(),
                itemCount: availableThemes.length,
                itemBuilder: (context, index) {
                  final currentTheme = availableThemes[index];
                  return Padding(
                    padding: const EdgeInsets.all(AppSpace.s),
                    child: _ThemeModeTile(
                      label: currentTheme.displayName,
                      isSelected: appTheme == currentTheme,
                      onTap: () {
                        if (appTheme == currentTheme) return;
                        ref
                            .read(userSettingsStateProvider.notifier)
                            .updateTheme(currentTheme);
                      },
                      child: AppCardMockUp.specificTheme(
                        borderRadiuses: switch (currentTheme) {
                          AppTheme.light => appLightTheme,
                          AppTheme.dark => appDarkTheme,
                          AppTheme.windows11 => appWindows11DarkTheme,
                          AppTheme.dracula => appDraculaTheme,
                          AppTheme.system => getAppSystemTheme(context),
                        }
                            .extension<AppThemeExtension>()!
                            .borderRadiuses,
                        generalColors: switch (currentTheme) {
                          AppTheme.light => appLightTheme,
                          AppTheme.dark => appDarkTheme,
                          AppTheme.windows11 => appWindows11DarkTheme,
                          AppTheme.dracula => appDraculaTheme,
                          AppTheme.system => getAppSystemTheme(context),
                        }
                            .extension<AppThemeExtension>()!
                            .generalColors,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ThemeModeTile extends HookConsumerWidget {
  const _ThemeModeTile({
    required this.label,
    required this.isSelected,
    required this.child,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final AppCardMockUp child;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final generalColors = context.appTheme.generalColors;
    final borderRadiuses = context.appTheme.borderRadiuses;

    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: generalColors.primarySurface,
          borderRadius: BorderRadius.circular(borderRadiuses.m),
          border: Border.all(
            width: isSelected ? 2 : 1,
            color: isSelected
                ? generalColors.primary
                : generalColors.primarySurfaceBorder,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(
                AppSpace.s,
              ),
              child: child,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpace.m,
                vertical: AppSpace.xs,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppText(
                    autoSize: false,
                    label,
                    style: context.appTheme.textStyles.buttonStyle,
                  ),
                  Container(
                    width: UiConstants.defaultPadding,
                    height: UiConstants.defaultPadding,
                    decoration: BoxDecoration(
                      color: isSelected ? generalColors.primary : null,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected
                            ? generalColors.onPrimary
                            : generalColors.onBackground.withAppOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: isSelected
                        ? ElbIcon(
                            Icons.check,
                            size: AppIconSize.s,
                            color: generalColors.onPrimary,
                          )
                        : null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
