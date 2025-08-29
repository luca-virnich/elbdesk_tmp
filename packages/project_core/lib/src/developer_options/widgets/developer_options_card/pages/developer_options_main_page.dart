import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DeveloperOptionsMainPage extends HookConsumerWidget {
  const DeveloperOptionsMainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    return ScrollableCardItem.constrained(
      builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          mainAxisSize: MainAxisSize.min,
          children: [
            CardSectionTitle(
              title: l10n.developer_options,
            ),
            if (!kIsWeb && !kIsWasm) const _UpdaterView(),
            const SetupCRMButton(),
            const _SwitchThemeButton(),
            const _SwitchLocaleButton(),
            const _ClearSharedPrefsButton(),
            const _FlashTaskbarButton(),
            const _OverlayIconButton(),
          ],
        );
      },
    );
  }
}

class _FlashTaskbarButton extends HookConsumerWidget {
  const _FlashTaskbarButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    return AppButton.primary(
      tooltip: l10n.developer_flash_taskbar_icon_tooltip,
      label: l10n.developer_flash_taskbar_icon_label,
      onPressed: () {
        // WindowsTaskbar.resetFlashTaskbarAppIcon();
        Future.delayed(const Duration(seconds: 5), () {
          WindowsTaskbar.setFlashTaskbarAppIcon(
            mode: TaskbarFlashMode.all | TaskbarFlashMode.timernofg,
            // timeout: const Duration(milliseconds: 500),
          );
        });
      },
    );
  }
}

class _OverlayIconButton extends HookConsumerWidget {
  const _OverlayIconButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    return AppButton.primary(
      tooltip: l10n.developer_set_overlay_icon_tooltip,
      label: l10n.developer_set_overlay_icon_label,
      onPressed: () {
        WindowsTaskbar.setOverlayIcon(
          ThumbnailToolbarAssetIcon('assets/img/taskbar_badges/9p.ico'),
          tooltip: l10n.gen_stop,
        );
      },
    );
  }
}

class _ClearSharedPrefsButton extends StatelessWidget {
  const _ClearSharedPrefsButton();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AppButton.primary(
      label: l10n.developer_clear_shared_prefs_label,
      onPressed: SharedPrefs.clearAll,
    );
  }
}

class _SwitchLocaleButton extends HookConsumerWidget {
  const _SwitchLocaleButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final currentLanguage = ref.watch(currentLocaleProvider);

    final localeText = currentLanguage == const Locale('de')
        ? l10n.language_switch_to_en
        : l10n.language_switch_to_de;

    final onPressed = useCallback(
      () {
        ref
            .read(userSettingsStateProvider.notifier)
            .toggleLocaleBetweenDeAndEn();
      },
      [],
    );

    return AppButton.primary(
      iconData: AppIcons.language,
      label: localeText,
      onPressed: onPressed,
    );
  }
}

class _SwitchThemeButton extends HookConsumerWidget {
  const _SwitchThemeButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final currentTheme = ref.watch(userSettingsStateProvider).value?.appTheme;

    final themeText = currentTheme == AppTheme.dark
        ? l10n.theme_switch_to_light
        : l10n.theme_switch_to_dark;

    final onPressed = useCallback(
      () {
        ref.read(userSettingsStateProvider.notifier).toggleTheme();
      },
      [],
    );

    return AppButton.primary(
      iconData: AppIcons.brightness_4,
      label: themeText,
      onPressed: onPressed,
    );
  }
}

class _UpdaterView extends HookConsumerWidget {
  const _UpdaterView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final updateUrl = useState<Uri?>(null);
    final isCheckingForUpdates = useState<bool>(false);
    final downloadProgress = useState<double>(0);

    return Column(
      children: [
        const AppText(appVersion),
        if (downloadProgress.value > 0)
          LinearProgressIndicator(
            value: downloadProgress.value,
          ),
        // AppButton.primary(
        //   label: 'Check for updates',
        //   onPressed: () async {
        //     isCheckingForUpdates.value = true;
        //     try {
        //       final url = await Updater.checkForUpdates();
        //       updateUrl.value = url;
        //     } catch (e) {
        //       print('Error checking for updates: $e');
        //     } finally {
        //       isCheckingForUpdates.value = false;
        //     }
        //   },
        // ),
        AppButton.primary(
          label: updateUrl.value == null
              ? l10n.developer_check_for_updates_label
              : l10n.developer_update_app_label,
          isLoading: isCheckingForUpdates.value,
          onPressed: updateUrl.value == null
              ? () async {
                  isCheckingForUpdates.value = true;
                  try {
                    final url = await Updater.checkForUpdates();
                    updateUrl.value = url;
                  } catch (e) {
                    dlog('Error checking for updates: $e');
                  } finally {
                    isCheckingForUpdates.value = false;
                  }
                }
              : () async {
                  dlog('Update App button pressed');
                  isCheckingForUpdates.value = true;

                  try {
                    await Updater.update(
                      url: updateUrl.value!,
                      onReceiveProgress: (progress, total) {
                        downloadProgress.value = progress / total;
                      },
                    );
                  } catch (e) {
                    dlog('Error updating app: $e');
                  } finally {
                    isCheckingForUpdates.value = false;
                  }
                },
        ),
      ],
    );
  }
}
