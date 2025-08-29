import 'package:elbdesk_core/elbdesk_core.dart' hide FloatingWindowTitlebarData;
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:elbdesk_window_manager/elbdesk_window_manager.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ErrorFloatingWindow extends HookConsumerWidget {
  /// @nodoc
  const ErrorFloatingWindow({
    required this.windowId,
    required this.errorMessage,
    required this.onRetry,
    super.key,
    this.showTitleBar = true,
  });
  final String windowId;
  final Future<void> Function() onRetry;
  final String errorMessage;
  final bool showTitleBar;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final appStyles = context.appTheme.textStyles;
    final isRetrying = useState<bool>(false);

    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ref.read(windowManagerProvider).updateWindowTitleData(
                windowId,
                const FloatingWindowTitlebarData(
                  icon: AppIcons.error_outline,
                  baseTitle: 'Error',
                ),
              );
        });
        return null;
      },
      [windowId],
    );

    return Column(
      children: [
        if (showTitleBar)
          FloatingWindowTitleBar(
            windowId: windowId,
            onClose: () =>
                ref.read(windowManagerProvider).removeWindow(windowId),
            title: const Text('Error'),
            icon: AppIcons.error_outline,
          ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: UiConstants.defaultPadding,
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,

              children: [
                const SizedBox(height: 16),
                AppText(
                  l10n.exception_unexpected_retry,
                  style: appStyles.h1,
                ),
                const SizedBox(height: 4),
                AppText(
                  errorMessage,
                ),
                const SizedBox(height: 18),
                AppButton.secondary(
                  label: l10n.gen_retry,
                  isLoading: isRetrying.value,
                  onPressed: isRetrying.value
                      ? null
                      : () async {
                          isRetrying.value = true;

                          await onRetry();
                          if (context.mounted) {
                            isRetrying.value = false;
                          }
                        },
                  iconData: AppIcons.refresh,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
