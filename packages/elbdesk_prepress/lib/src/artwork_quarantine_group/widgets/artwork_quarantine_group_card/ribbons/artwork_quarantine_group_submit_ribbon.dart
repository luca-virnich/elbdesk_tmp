import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/ae_pilot/services/ae_upload_controller.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine_group/logic/artwork_quarantine_group_state.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_core/project_core.dart';

class ArtworkQuarantineGroupSubmitRibbon extends HookConsumerWidget {
  const ArtworkQuarantineGroupSubmitRibbon({
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    required this.navigatorKey,
    required this.groupId,
    required this.sessionId,
    required this.savedOrInitialEntity,
    required this.onSaveGroup,
    super.key,
  });

  final String floatingWindowId;
  final FocusNode floatingWindowFocus;
  final GlobalKey<NavigatorState> navigatorKey;
  final int groupId;
  final String sessionId;
  final ObjectRef<ArtworkQuarantineGroup?> savedOrInitialEntity;

  final Future<ArtworkQuarantineGroup?> Function(
    int entityId,
    String sessionId,
    GlobalKey<NavigatorState> navigatorKey,
  ) onSaveGroup;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ppL10n = context.prepressL10n;

    final group = ref.watch(
      artworkQuarantineGroupStateProvider(groupId, sessionId).select(
        (state) => state.requireValue,
      ),
    );

    final isCanceled = group.status == ArtworkQuarantineGroupStatus.canceled;
    final areWeEditing = group.meta.editingSessionId == sessionId;
    final isReadOnly = !areWeEditing || isCanceled;

    // The group can only be submitted if it has open quarantines
    final hasOpenQuarantines = group.artworkQuarantines?.any(
          (q) => q.general.status == ArtworkQuarantineGroupStatus.open,
        ) ??
        false;

    return Ribbon(
      floatingWindowId: floatingWindowId,
      floatingWindowType: FloatingWindowType.artworkQuarantineGroup.name,
      label: ppL10n.artwork_quarantine_group_send_to_ae,
      onPressed: isReadOnly || !hasOpenQuarantines
          ? null
          : () async {
              await AsyncHandler.handleAsyncOperation(
                successNavigatorKey: navigatorKey,
                errorNavigatorKey: navigatorKey,
                showErrorNotification: true,
                context,
                () async {
                  final result = await showElbDialog<bool?>(
                    context: context,
                    navigatorKey: navigatorKey,
                    child: _SubmitGroupConfirmationDialog(
                      groupId: groupId,
                      floatingWindowFocus: floatingWindowFocus,
                      navigatorKey: navigatorKey,
                      floatingWindowId: floatingWindowId,
                      sessionId: sessionId,
                    ),
                  );

                  if (result ?? false) {
                    final groupForSave = await ref.read(
                      artworkQuarantineGroupStateProvider(
                        groupId,
                        sessionId,
                      ).future,
                    );

                    final groupNotifier = ref.read(
                      artworkQuarantineGroupStateProvider(
                        groupId,
                        sessionId,
                      ).notifier,
                    );

                    final userName =
                        ref.read(authUserStateProvider)?.fullName ?? '';

                    final controller =
                        await ref.read(aeUploadControllerProvider.future);

                    // Send group to AE
                    final sentQuarantines =
                        await controller.sendArtworkQuarantineGroupToAE(
                      groupForSave,
                      userName,
                    );

                    if (sentQuarantines == null || sentQuarantines.isEmpty) {
                      throw ElbException(
                        exceptionType: ElbExceptionType.conflict,
                        message: 'Keine Artworks an AE gesendet'.hc,
                      );
                    }

                    // Update state and save group if quarantines were sent
                    if (sentQuarantines.isNotEmpty) {
                      // Update state
                      groupNotifier.updateAfterAeUpload(sentQuarantines);

                      // Save group
                      final group =
                          await onSaveGroup(groupId, sessionId, navigatorKey);

                      if (group != null) {
                        savedOrInitialEntity.value = group;
                      }
                    }
                  }
                },
              );
            },
      icon: AppIcons.artworkQuarantineGroup,
    );
  }
}

/// Dialog that asks the user to confirm submitting the group
class _SubmitGroupConfirmationDialog extends StatelessWidget {
  const _SubmitGroupConfirmationDialog({
    required this.groupId,
    required this.floatingWindowFocus,
    required this.navigatorKey,
    required this.floatingWindowId,
    required this.sessionId,
  });

  final int groupId;
  final FocusNode floatingWindowFocus;
  final GlobalKey<NavigatorState> navigatorKey;
  final String floatingWindowId;
  final String sessionId;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;

    return ElbDialog(
      maxWidth: 600,
      blockShortcuts: false,
      title: ppL10n.artwork_quarantine_group_submit_confirmation_title,
      contentPadding: const EdgeInsets.all(UiConstants.defaultPadding),
      floatingWindowId: floatingWindowId,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Confirmation message
          AppText(
            ppL10n.artwork_quarantine_group_submit_confirmation_message,
            style: context.appTheme.textStyles.defaultText,
          ),
          const SizedBox(height: UiConstants.defaultPadding),
          // Action buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppButton.secondary(
                onPressed: () => Navigator.of(context).pop(false),
                label: l10n.gen_cancel,
              ),
              const SizedBox(width: UiConstants.defaultPadding),
              AppButton.primary(
                onPressed: () => Navigator.of(context).pop(true),
                label: l10n.gen_apply,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
