import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'card_ribbons.g.dart';

@Riverpod(keepAlive: true)
class UserRibbonConfig extends _$UserRibbonConfig {
  @override
  Map<String, RibbonConfig> build() {
    return {};
  }

  void update(Map<String, RibbonConfig> value) {
    state = value;
  }

  void updateHideRibbons(String floatingWindowType, bool hide) {
    final current = state[floatingWindowType] ?? RibbonConfig.initial();
    state = {...state, floatingWindowType: current.copyWith(hideRibbons: hide)};
  }

  void updateUseSmallRibbons(String floatingWindowType, bool useSmall) {
    final current = state[floatingWindowType] ?? RibbonConfig.initial();
    state = {
      ...state,
      floatingWindowType: current.copyWith(useSmallRibbons: useSmall),
    };
  }
}

@riverpod
class WindowRibbonConfig extends _$WindowRibbonConfig {
  @override
  RibbonConfig build(String floatingWindowId, String floatingWindowType) {
    // WE ARE WANT TO USE READ HERE!
    // This preserves the state for the unique window
    final windowConfig = ref.read(
      userRibbonConfigProvider.select((value) => value[floatingWindowType]),
    );

    if (windowConfig == null) {
      return RibbonConfig.initial();
    }

    return windowConfig;
  }

  void toggleHideRibbons() {
    final current = state.hideRibbons;
    state = state.copyWith(hideRibbons: !current);
    ref.read(userRibbonConfigProvider.notifier).updateHideRibbons(
          floatingWindowType,
          !current,
        );
  }

  void toggleUseSmallRibbons() {
    final current = state.useSmallRibbons;
    state = state.copyWith(useSmallRibbons: !current);
    ref.read(userRibbonConfigProvider.notifier).updateUseSmallRibbons(
          floatingWindowType,
          !current,
        );
  }
}

class CardRibbons extends HookConsumerWidget {
  const CardRibbons({
    required this.ribbons,
    required this.ignoreEntityEditStatusRibbon,
    required this.floatingWindowId,
    required this.floatingWindowType,
    this.entityEditStatusRibbon,
    super.key,
  });

  final List<Widget> ribbons;
  final Widget? entityEditStatusRibbon;
  final bool ignoreEntityEditStatusRibbon;
  final String floatingWindowId;
  final String floatingWindowType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ribbonConfig = ref.watch(
      windowRibbonConfigProvider(
        floatingWindowId,
        floatingWindowType,
      ),
    );

    return AnimatedSwitcher(
      transitionBuilder: (Widget child, Animation<double> animation) {
        return SizeTransition(
          sizeFactor: animation,
          axisAlignment: -1,
          child: child,
        );
      },
      duration: AnimationConstants.defaultDuration,
      child: !ribbonConfig.hideRibbons &&
              (ribbons.isNotEmpty || !ignoreEntityEditStatusRibbon)
          ? RibbonArea(
              floatingWindowId: floatingWindowId,
              floatingWindowType: floatingWindowType,
              ribbons: ribbons,
              entityEditStatusRibbon: entityEditStatusRibbon,
            )
          : const SizedBox.shrink(),
    );
  }
}

class RibbonArea extends ConsumerWidget {
  const RibbonArea({
    required this.ribbons,
    required this.floatingWindowId,
    required this.floatingWindowType,
    this.entityEditStatusRibbon,
    super.key,
  });
  final List<Widget> ribbons;
  final Widget? entityEditStatusRibbon;
  final String floatingWindowId;
  final String floatingWindowType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showSmallRibbons = ref.watch(
      windowRibbonConfigProvider(floatingWindowId, floatingWindowType)
          .select((value) => value.useSmallRibbons),
    );
    return Column(
      children: [
        SizedBox(
          height: showSmallRibbons ? 4 : 6,
        ),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: showSmallRibbons ? 40 : 70,
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(
                    horizontal: showSmallRibbons ? 8 : 4,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: ribbons.length,
                  itemBuilder: (context, index) => ribbons[index],
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 10,
                  ),
                ),
              ),
            ),
            if (entityEditStatusRibbon != null) ...[
              Padding(
                padding: const EdgeInsets.only(left: 4, right: 0),
                child: SizedBox(
                  child: entityEditStatusRibbon,
                ),
              ),
            ],
            Padding(
              padding: const EdgeInsets.only(
                left: 4,
                right: 4,
              ),
              child: ChangeRibbonsSizeRibbon(
                floatingWindowId: floatingWindowId,
                floatingWindowType: floatingWindowType,
              ),
            ),
          ],
        ),
        SizedBox(
          height: showSmallRibbons ? 4 : 6,
        ),
        const AppDivider(),
      ],
    );
  }
}

class Ribbon extends ConsumerWidget {
  const Ribbon({
    required this.onPressed,
    required this.label,
    required this.floatingWindowId,
    required this.floatingWindowType,
    this.icon,
    this.iconColor,
    this.child,
    this.badge,
    super.key,
  }) : assert(
          (icon != null && child == null) || (icon == null && child != null),
          'Either icon or child must be provided, but not both and not neither',
        );
  final VoidCallback? onPressed;
  final String label;

  final IconData? icon;
  final Color? iconColor;
  final Widget? child;
  final IconData? badge;
  final String floatingWindowId;
  final String floatingWindowType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = context.appTheme;
    final primaryColor = appTheme.generalColors.primary;
    final disabledColor = appTheme.statusColors.disabled;
    final navigationProperties = appTheme.navigationProperties;
    final showSmallRibbons = ref.watch(
      windowRibbonConfigProvider(floatingWindowId, floatingWindowType)
          .select((value) => value.useSmallRibbons),
    );

    final smallRibbonIconColor = navigationProperties.foregroundIconColor;

    if (showSmallRibbons) {
      return AppTooltip(
        message: label,
        child: ColoredBox(
          color: Colors.transparent,
          child: ElbInkWell(
            onTap: onPressed,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: ElbIcon(
                    icon!,
                    size: showSmallRibbons ? AppIconSize.xl : AppIconSize.xxl,
                    color: iconColor ??
                        (onPressed == null
                            ? disabledColor
                            : smallRibbonIconColor),
                  ),
                ),
                if (badge != null) ...[
                  Positioned(
                    top: 2,
                    left: 2,
                    child: ElbIcon(
                      badge!,
                      size: AppIconSize.m,
                      color: primaryColor,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      );
    }

    return AppTooltip(
      message: label,
      child: ElbInkWell(
        onTap: onPressed,
        child: SizedBox(
          width: 80,
          height: 70,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              child ??
                  ElbIcon(
                    icon!,
                    size: AppIconSize.xxl,
                    color: iconColor ??
                        (onPressed == null ? disabledColor : primaryColor),
                  ),
              Expanded(
                child: Center(
                  child: AppText(
                    label,
                    autoSize: false,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    minFontSize: 12,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RibbonSectionDivider extends ConsumerWidget {
  const RibbonSectionDivider({
    required this.floatingWindowId,
    required this.floatingWindowType,
    super.key,
  });
  final String floatingWindowId;
  final String floatingWindowType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dividerColor = context.appTheme.generalColors.divider;
    final showSmallRibbons = ref.watch(
      windowRibbonConfigProvider(floatingWindowId, floatingWindowType)
          .select((value) => value.useSmallRibbons),
    );
    return Container(
      height: showSmallRibbons ? 25 : 55,
      color: dividerColor,
      width: 1,
    );
  }
}

class ChangeRibbonsSizeRibbon extends ConsumerWidget {
  const ChangeRibbonsSizeRibbon({
    required this.floatingWindowId,
    required this.floatingWindowType,
    super.key,
  });
  final String floatingWindowId;
  final String floatingWindowType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSmall = ref.watch(
      windowRibbonConfigProvider(floatingWindowId, floatingWindowType)
          .select((value) => value.useSmallRibbons),
    );
    return Ribbon(
      floatingWindowId: floatingWindowId,
      floatingWindowType: floatingWindowType,
      label: isSmall ? 'Vergrößern'.hc : 'Verkleinern'.hc,
      onPressed: () {
        ref
            .read(
              windowRibbonConfigProvider(floatingWindowId, floatingWindowType)
                  .notifier,
            )
            .toggleUseSmallRibbons();
      },
      icon: !isSmall ? Icons.unfold_less : Icons.unfold_more,
    );
  }
}
