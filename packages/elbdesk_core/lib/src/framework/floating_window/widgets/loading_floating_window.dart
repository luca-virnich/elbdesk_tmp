import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:elbdesk_window_manager/elbdesk_window_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoadingFloatingWindow extends HookConsumerWidget {
  const LoadingFloatingWindow({
    required this.windowId,
    required this.titleIconData,
    this.showTitleBar = true,
    super.key,
  });
  final String windowId;
  final IconData? titleIconData;
  final bool showTitleBar;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ref.read(windowManagerProvider).updateWindowTitleData(
                windowId,
                const FloatingWindowTitlebarData(
                  icon: null,
                  baseTitle: 'Loading...',
                ),
              );
        });
        return null;
      },
      [windowId],
    );
    return Column(
      children: [
        FloatingWindowTitleBar(
          windowId: windowId,
          onClose: () => ref.read(windowManagerProvider).removeWindow(windowId),
          title: const Text('Loading...'),
          icon: AppIcons.error_outline,
        ),
        const Expanded(
          child: Center(
            child: AppLoadingIndicator(),
          ),
        ),
      ],
    );
  }
}
