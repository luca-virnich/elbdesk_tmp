part of 'user_settings_dialog.dart';

class _DragWindowOutOfMainWindowSettingsArea extends HookConsumerWidget {
  const _DragWindowOutOfMainWindowSettingsArea();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final dragWindowOutOfMainWindow =
        ref.watch(dragWindowOutOfMainWindowStateProvider);

    return AppWindowTile(
      isTextField: false,
      title: l10n.user_settings_drag_window_title,
      subTitle: l10n.user_settings_drag_window_subtitle,
      content: (width) => Row(
        children: [
          AppCheckbox(
            value: dragWindowOutOfMainWindow,
            onChanged: (value) {
              ref
                  .read(userSettingsStateProvider.notifier)
                  .updateDragWindowOutOfMainWindow(value);
            },
          ),
          Expanded(
            child: Center(
              child: Stack(
                clipBehavior: Clip.hardEdge,
                children: [
                  const AppDashboardMockUp.currentTheme(),
                  AnimatedPositioned(
                    duration: AnimationConstants.defaultDuration,
                    curve: AnimationConstants.defaultCurve,
                    left: !dragWindowOutOfMainWindow ? 0 : -15,
                    bottom: !dragWindowOutOfMainWindow ? 0 : -23,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: context.appTheme.shadows.windowShadow,
                      ),
                      child: const AppCardMockUp.currentTheme(
                        bodyRows: 3,
                        height: 75,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
