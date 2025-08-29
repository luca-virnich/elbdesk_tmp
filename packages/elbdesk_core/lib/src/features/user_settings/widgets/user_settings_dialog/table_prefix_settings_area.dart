part of 'user_settings_dialog.dart';

class _TablePrefixSettingsArea extends HookConsumerWidget {
  const _TablePrefixSettingsArea({
    required this.userName,
  });

  final String userName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    final enableTablePrefix = ref.watch(tablePrefixStateProvider);

    return AppWindowTile(
      isTextField: false,
      title: l10n.user_settings_window_description,
      subTitle: l10n.user_settings_window_description_subtitle,
      content: (width) => Row(
        children: [
          AppCheckbox(
            value: enableTablePrefix,
            onChanged: (value) {
              ref
                  .read(userSettingsStateProvider.notifier)
                  .toggleTablePrefixFeature();
            },
          ),
          _TitleBarPreview(
            enableTablePrefix: enableTablePrefix,
            userName: userName,
          ),
        ],
      ),
    );
  }
}

class _TitleBarPreview extends ConsumerWidget {
  const _TitleBarPreview({
    required this.enableTablePrefix,
    required this.userName,
  });

  final bool enableTablePrefix;
  final String userName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final generalColors = context.appTheme.generalColors;
    final borderRadiuses = context.appTheme.borderRadiuses;

    final l10n = context.l10n;
    final tablePrefix = l10n.user_settings_table_prefix_table_name;

    final prefixText = '$tablePrefix:  ';
    final textStyle = context.appTheme.textStyles.h3;

    return Expanded(
      child: Center(
        child: Container(
          height: UiConstants.windowTitleBarHeight,
          decoration: BoxDecoration(
            color: generalColors.primarySurface,
            border: Border.all(
              color: generalColors.onBackground.withAppOpacity(0.2),
              width: 1,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(borderRadiuses.m),
              topRight: Radius.circular(borderRadiuses.m),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(width: AppSpace.s),
              const ElbIcon(
                AppIcons.person,
                size: AppIconSize.xl,
              ),
              const SizedBox(width: AppSpace.s),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedContainer(
                    duration: AnimationConstants.longDuration,
                    curve: AnimationConstants.defaultCurve,
                    width: enableTablePrefix
                        ? prefixText.calculateWidth(textStyle: textStyle)
                        : 0,
                    child: ClipRect(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: AppText(
                          prefixText,
                          style: textStyle,
                          maxLines: 1,
                          autoSize: false,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ),
                  ),
                  AppText(
                    userName,
                    style: textStyle,
                    maxLines: 1,
                  ),
                ],
              ),
              const SizedBox(width: AppSpace.xxxl),
            ],
          ),
        ),
      ),
    );
  }
}
