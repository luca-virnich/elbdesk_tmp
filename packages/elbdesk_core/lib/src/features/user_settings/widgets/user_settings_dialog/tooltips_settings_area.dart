part of 'user_settings_dialog.dart';

class _TooltipsSettingsArea extends HookConsumerWidget {
  const _TooltipsSettingsArea();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final showTooltips = ref.watch(tooltipStateProvider);

    return AppWindowTile(
      isTextField: false,
      title: l10n.user_settings_tooltips,
      subTitle: l10n.user_settings_tooltips_subtitle,
      content: (width) => Row(
        children: [
          AppCheckbox(
            value: showTooltips,
            onChanged: (value) {
              ref
                  .read(userSettingsStateProvider.notifier)
                  .toggleTooltipFeature();
            },
          ),
          _TooltipExampleButton(
            showTooltips: showTooltips,
          ),
        ],
      ),
    );
  }
}

class _TooltipExampleButton extends HookWidget {
  const _TooltipExampleButton({
    required this.showTooltips,
  });

  final bool showTooltips;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final generalColors = context.appTheme.generalColors;
    final borderRadiuses = context.appTheme.borderRadiuses;
    final tooltipTextStyle = context.appTheme.textStyles.tooltipStyle;
    final isHovered = useState<bool>(false);
    final tooltipOpacity = useState<double>(1);

    useEffect(
      () {
        if (isHovered.value) {
          tooltipOpacity.value = 0.2;
          Future.delayed(AnimationConstants.defaultDuration, () {
            tooltipOpacity.value = 1.0;
          });
        }
        return null;
      },
      [isHovered.value],
    );

    return Expanded(
      child: Center(
        child: Column(
          children: [
            AnimatedOpacity(
              duration: AnimationConstants.defaultDuration,
              opacity: showTooltips ? tooltipOpacity.value : 0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpace.s,
                  vertical: AppSpace.xs,
                ),
                decoration: BoxDecoration(
                  color: generalColors.tooltipBackground,
                  borderRadius:
                      BorderRadius.all(Radius.circular(borderRadiuses.s)),
                  border: Border.all(
                    color: generalColors.onBackground.withAppOpacity(0.2),
                  ),
                ),
                child: AppText(
                  l10n.user_settings_tooltips_tooltip_label,
                  color: tooltipTextStyle.color,
                  fontSize: tooltipTextStyle.fontSize,
                ),
              ),
            ),
            const SizedBox(height: AppSpace.s),
            MouseRegion(
              onEnter: (_) => isHovered.value = true,
              onExit: (_) => isHovered.value = false,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: AbsorbPointer(
                  child: AppButton.secondary(
                    label: l10n.user_settings_tooltips_button_label,
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSpace.xxl),
          ],
        ),
      ),
    );
  }
}
