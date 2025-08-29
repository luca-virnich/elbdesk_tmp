import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:elbdesk_window_manager/elbdesk_window_manager.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EntityFloatingTitleBar<T extends HasMetaData> extends HookConsumerWidget {
  const EntityFloatingTitleBar({
    required this.windowId,
    required this.editSessionId,
    required this.onClose,
    required this.onUpdate,
    required this.sessionId,
    required this.ignoreEntityEditStatusRibbon,
    required this.showRibbonHandler,
    required this.stateProvider,
    required this.streamDataProvider,
    required this.entityId,
    required this.floatingWindowType,
    required this.floatingWindowId,
    this.floatingWindowFocus,
    super.key,
  });

  final String windowId;
  final String? editSessionId;
  final String sessionId;
  final FocusNode? floatingWindowFocus;
  final void Function()? onClose;
  final Future<void> Function() onUpdate;

  final bool ignoreEntityEditStatusRibbon;
  final bool showRibbonHandler;
  final ProviderListenable<AsyncValue<T>> Function(int, String) stateProvider;
  final ProviderListenable<AsyncValue<T>> Function({
    required String sessionId,
    required int dataId,
  }) streamDataProvider;
  final int entityId;
  final String floatingWindowType;
  final String floatingWindowId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasUpdates = ref.watch(dataHasUpdatesProvider(sessionId));
    final ribbonConfig = ref.watch(
      windowRibbonConfigProvider(
        floatingWindowId,
        floatingWindowType,
      ),
    );

    return FloatingWindowTitleBar(
      windowId: windowId,
      onClose: onClose,
      floatingWindowFocus: floatingWindowFocus,
      actions: [
        if (hasUpdates)
          UpdateAvailableButton(
            onPressed: () async {
              try {
                await onUpdate();
                ref
                    .read(dataHasUpdatesProvider(sessionId).notifier)
                    .resetHasUpdates();
                ref.read(windowManagerProvider).stopHighlight(windowId);
              } catch (e) {
                if (context.mounted) {
                  AppNotificationOverlay.error(
                    context,
                    e.toString(),
                  );
                }
              }
            },
          ),
        if (showRibbonHandler)
          AppIconButton.rotating(
            onPressed: () {
              ref
                  .read(
                    windowRibbonConfigProvider(
                      floatingWindowId,
                      floatingWindowType,
                    ).notifier,
                  )
                  .toggleHideRibbons();
            },
            iconData: AppIcons.expand_more,
            turns: !ribbonConfig.hideRibbons ? 0.5 : 0,
          ),
      ],
    );
  }
}
