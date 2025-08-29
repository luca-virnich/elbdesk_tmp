part of 'user_settings_dialog.dart';

class _ToggleCollapseCardSectionsSettingsArea extends HookConsumerWidget {
  const _ToggleCollapseCardSectionsSettingsArea();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    final enableCollapseCardSections =
        ref.watch(defaultCollapseCardSectionsStateProvider);

    return AppWindowTile(
      isTextField: false,
      title: l10n.user_settings_collapse_sections_title,
      subTitle: l10n.user_settings_collapse_sections_subtitle,
      content: (width) => Row(
        children: [
          Column(
            children: [
              AppCheckbox(
                value: enableCollapseCardSections,
                onChanged: (value) {
                  ref
                      .read(userSettingsStateProvider.notifier)
                      .toggleCollapseCardSections();
                },
              ),
              const SizedBox(height: AppSpace.xl),
              AppIconButton.secondary(
                iconData: AppIcons.reset,
                onPressed: () async {
                  await showElbDialog<void>(
                    context: context,
                    // navigatorKey: AppNavigatorKeys.appRootNavigatorKey,
                    child: ElbAlertDialog(
                      maxWidth: 500,
                      titleIcon: AppIcons.reset,
                      titleText: l10n.gen_reset,
                      contentText:
                          l10n.user_settings_collapse_sections_reset_confirm,
                      actions: [
                        AppButton.secondary(
                          label: l10n.gen_cancel,
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        AppButton.danger(
                          label: l10n.gen_reset,
                          onPressed: () async {
                            ref
                                .read(userSettingsStateProvider.notifier)
                                .resetCollapseCardSections();
                            if (context.mounted) {
                              AppNotificationOverlay.success(
                                context,
                                l10n.user_settings_collapse_sections_reset_sucess,
                              );
                            }
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: AppCardMockUp.withCollapsibleSection(
                isCollapsed: enableCollapseCardSections,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
