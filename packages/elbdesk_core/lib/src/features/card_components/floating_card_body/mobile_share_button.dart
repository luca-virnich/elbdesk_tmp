part of 'floating_card_body.dart';

/// Mobile share button that matches desktop implementation
class _MobileShareButton extends HookConsumerWidget {
  const _MobileShareButton({
    required this.entityId,
    required this.floatingWindowType,
  });

  final int entityId;
  final String floatingWindowType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.appTheme;
    final l10n = context.l10n;
    final isLoading = useState<bool>(false);
    final generalColors = theme.generalColors;
    final appNavigationProperties = theme.navigationProperties;

    return Material(
      color: generalColors.transparent,
      borderRadius: BorderRadius.circular(
        appNavigationProperties.borderRadius,
      ),
      child: InkWell(
        splashColor: generalColors.transparent,
        splashFactory: NoSplash.splashFactory,
        highlightColor: appNavigationProperties.overlayColor,
        enableFeedback: false,
        overlayColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.hovered)) {
              return appNavigationProperties.overlayColor;
            }
            return null;
          },
        ),
        onTap: isLoading.value
            ? null
            : () async {
                isLoading.value = true;
                final (:data, :exception, :success) =
                    await AsyncHandler.handleAsyncOperation<String>(
                  context,
                  () => ref.read(deeplinkCoreRepositoryProvider).getDeepLinkUrl(
                        floatingWindowType,
                        entityId,
                      ),
                  successMessage: l10n.gen_copied_to_clipboard,
                );
                if (success) {
                  await Clipboard.setData(ClipboardData(text: data!));
                }
                if (context.mounted) {
                  isLoading.value = false;
                }
              },
        borderRadius: BorderRadius.circular(
          appNavigationProperties.borderRadius,
        ),
        child: Container(
          decoration: const BoxDecoration(),
          padding: const EdgeInsets.symmetric(
            vertical: AppSpace.s,
            horizontal: AppSpace.s,
          ),
          child: AppTooltip(
            preferBelow: false,
            message: l10n.gen_share,
            child: isLoading.value
                ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: appNavigationProperties.foregroundIconColor,
                    ),
                  )
                : ElbIcon(
                    Icons.share,
                    size: AppIconSize.xl,
                    color: appNavigationProperties.foregroundIconColor,
                  ),
          ),
        ),
      ),
    );
  }
}
