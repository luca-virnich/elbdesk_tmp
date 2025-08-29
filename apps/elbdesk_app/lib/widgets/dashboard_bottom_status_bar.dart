import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:project_core/project_core.dart';

/// Dashboard Bottom Status Bar
///
/// The bottom status bar of the app
/// Contains the app version, theme switch and locale switch
class DashboardBottomStatusBar extends StatelessWidget {
  /// Constructor
  const DashboardBottomStatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.paddingOf(context).bottom;
    final isMobile = MediaQuery.sizeOf(context).width < 500;

    return ColoredBox(
      color: context.appTheme.generalColors.primary,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: UiConstants.dashoardStatusBarHeight,
            child: Row(
              children: [
                // if (kDebugMode) ...[
                const SizedBox(width: UiConstants.defaultPadding),
                const DeveloperOptionsButton(),
                const SizedBox(width: UiConstants.defaultPadding),

                const Spacer(),
                // const _AppVersion(),
                const SizedBox(
                  width: UiConstants.defaultPadding,
                ),
                if (!isMobile) const _ServerTime(),
                const SizedBox(
                  width: UiConstants.defaultPadding,
                ),
                const _RunMode(),
              ],
            ),
          ),
          SizedBox(
            height: bottomPadding,
          ),
        ],
      ),
    );
  }
}

class _ServerTime extends ConsumerWidget {
  const _ServerTime();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serverTime = ref.watch(watchTimeProvider).value;
    if (serverTime == null) return const SizedBox();
    final l10n = context.l10n;
    final localeName = l10n.localeName;
    // final currentDeviceTime = ref.watch(currentDeviceTimeProvider);
    final day = DateFormat.EEEE(localeName).format(serverTime);
    final date = DateFormat.yMd(localeName).format(serverTime);
    final time = DateFormat.Hm(localeName).format(serverTime);

    return AppText(
      '$day, $date - $time',
      color: Colors.white,
    );
  }
}

class _AppVersion extends ConsumerWidget {
  const _AppVersion();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppText(
          l10n.dashboard_bottom_status_bar_coe,
          color: context.appTheme.generalColors.onPrimary,
        ),
        const SizedBox(
          width: UiConstants.elementMargin,
        ),
        AppText(
          appVersion,
          color: context.appTheme.generalColors.onPrimary,
        ),
      ],
    );
  }
}

class _RunMode extends StatelessWidget {
  const _RunMode();

  @override
  Widget build(BuildContext context) {
    final borderRadiuses = context.appTheme.borderRadiuses;
    return switch (appRunMode) {
      RunMode.prod => const SizedBox.shrink(),
      _ => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: appRunMode.backgroundColor,
                borderRadius: BorderRadius.circular(borderRadiuses.s),
                border: Border.all(
                  color: appRunMode.borderColor,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: UiConstants.elementMargin,
                ),
                child: AppText(
                  appRunMode.readable,
                  style: context.appTheme.textStyles.defaultText.copyWith(
                    // TODO: Remove this once we have a proper fix.
                    // There some bug that makes the dark text appear much
                    // thinner than the light text.
                    // This is a workaround to make the text bolder in staging
                    // RunMode where we have a black text. And no, it's not
                    // because we don't use the full Alpha channel,
                    // I've checked.
                    // This could also be just visual perception but it's a
                    // large one in that case.
                    fontWeight: appRunMode == RunMode.staging
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: appRunMode.foregroundColor,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: UiConstants.defaultPadding,
            ),
          ],
        )
    };
  }
}
