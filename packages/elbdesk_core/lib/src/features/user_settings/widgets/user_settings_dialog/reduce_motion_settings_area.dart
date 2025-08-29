part of 'user_settings_dialog.dart';

class _ReduceMotionSettingsArea extends HookConsumerWidget {
  const _ReduceMotionSettingsArea();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final reduceMotion = ref.watch(reduceMotionStateProvider);

    return AppWindowTile(
      isTextField: false,
      title: l10n.user_settings_reduce_motion,
      subTitle: l10n.user_settings_reduce_motion_subtitle,
      content: (width) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppCheckbox(
            value: reduceMotion,
            onChanged: (value) {
              ref
                  .read(userSettingsStateProvider.notifier)
                  .updateReduceMotion(value);
            },
          ),
        ],
      ),
    );
  }
}
