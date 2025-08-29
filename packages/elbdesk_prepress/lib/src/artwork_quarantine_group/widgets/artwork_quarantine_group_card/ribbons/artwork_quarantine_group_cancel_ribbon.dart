import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine_group/logic/artwork_quarantine_group_state.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_core/project_core.dart';

class ArtworkQuarantineGroupCancelRibbon extends ConsumerWidget {
  const ArtworkQuarantineGroupCancelRibbon({
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    required this.navigatorKey,
    required this.groupId,
    required this.sessionId,
    required this.onSaveGroup,
    required this.savedOrInitialEntity,
    super.key,
  });

  final String floatingWindowId;
  final FocusNode floatingWindowFocus;
  final GlobalKey<NavigatorState> navigatorKey;
  final int groupId;
  final String sessionId;

  final Future<ArtworkQuarantineGroup?> Function(
    int entityId,
    String sessionId,
    GlobalKey<NavigatorState> navigatorKey,
  ) onSaveGroup;
  final ObjectRef<ArtworkQuarantineGroup?> savedOrInitialEntity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;
    final group = ref.watch(
      artworkQuarantineGroupStateProvider(groupId, sessionId).select(
        (state) => state.requireValue,
      ),
    );
    final isCanceled = group.status == ArtworkQuarantineGroupStatus.canceled;
    final areWeEditing = group.meta.editingSessionId == sessionId;
    final isReadOnly = !areWeEditing || isCanceled;

    return Ribbon(
      floatingWindowId: floatingWindowId,
      floatingWindowType: FloatingWindowType.artworkQuarantineGroup.name,
      label: ppL10n.artwork_quarantine_group_singular + l10n.gen_cancel,
      onPressed: isReadOnly
          ? null
          : () async {
              await showElbDialog<bool?>(
                context: context,
                navigatorKey: navigatorKey,
                child: _CancelGroupConfirmationDialog(
                  groupId: groupId,
                  floatingWindowFocus: floatingWindowFocus,
                  navigatorKey: navigatorKey,
                  floatingWindowId: floatingWindowId,
                  sessionId: sessionId,
                  onSaveGroup: onSaveGroup,
                  savedOrInitialEntity: savedOrInitialEntity,
                ),
              );
            },
      icon: AppIcons.cancel_outlined,
    );
  }
}

/// Dialog that asks the user to confirm canceling the group
class _CancelGroupConfirmationDialog extends HookConsumerWidget {
  const _CancelGroupConfirmationDialog({
    required this.groupId,
    required this.floatingWindowFocus,
    required this.navigatorKey,
    required this.floatingWindowId,
    required this.sessionId,
    required this.onSaveGroup,
    required this.savedOrInitialEntity,
  });

  final int groupId;
  final FocusNode floatingWindowFocus;
  final GlobalKey<NavigatorState> navigatorKey;
  final String floatingWindowId;
  final String sessionId;
  final Future<ArtworkQuarantineGroup?> Function(
    int entityId,
    String sessionId,
    GlobalKey<NavigatorState> navigatorKey,
  ) onSaveGroup;
  final ObjectRef<ArtworkQuarantineGroup?> savedOrInitialEntity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;
    final isLoadingNotifier = useState<bool>(false);

    final stateNotifier = ref.watch(
      artworkQuarantineGroupStateProvider(groupId, sessionId).notifier,
    );

    return ElbDialog(
      maxWidth: 600,
      isLoading: isLoadingNotifier.value,
      contentPadding: const EdgeInsets.all(UiConstants.defaultPadding),
      title: ppL10n.artwork_quarantine_group_cancel_confirmation_title,
      floatingWindowId: floatingWindowId,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Confirmation message
          AppText(
            ppL10n.artwork_quarantine_group_cancel_confirmation_message,
            style: context.appTheme.textStyles.defaultText,
          ),
          const SizedBox(height: UiConstants.defaultPadding),
          // Action buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppButton.secondary(
                onPressed: isLoadingNotifier.value
                    ? null
                    : () => Navigator.of(context).pop(),
                label: l10n.gen_cancel,
              ),
              const SizedBox(width: UiConstants.defaultPadding),
              AppButton.danger(
                onPressed: isLoadingNotifier.value
                    ? null
                    : () async {
                        isLoadingNotifier.value = true;
                        try {
                          // Set group status to canceled
                          stateNotifier.updateStatus(
                            ArtworkQuarantineGroupStatus.canceled,
                          );
                          // Save group
                          final group = await onSaveGroup(
                            groupId,
                            sessionId,
                            navigatorKey,
                          );

                          if (group != null) {
                            savedOrInitialEntity.value = group;
                          }
                          if (context.mounted) Navigator.of(context).pop(true);
                        } catch (e) {
                          if (context.mounted) Navigator.of(context).pop(false);
                        } finally {
                          isLoadingNotifier.value = false;
                        }
                      },
                label: 'Dateneingang abbrechen'.hc,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
