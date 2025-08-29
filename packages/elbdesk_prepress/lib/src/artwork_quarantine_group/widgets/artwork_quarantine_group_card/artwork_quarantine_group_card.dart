import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine_group/logic/artwork_quarantine_group_state.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine_group/widgets/artwork_quarantine_group_card/pages/artwork_quarantine_group_card_main_page/artwork_quarantine_group_general.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine_group/widgets/artwork_quarantine_group_card/pages/artwork_quarantine_group_card_main_page/attachments/multi_drop_area_and_attachments.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine_group/widgets/artwork_quarantine_group_card/ribbons/artwork_quarantine_group_cancel_ribbon.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine_group/widgets/artwork_quarantine_group_card/ribbons/artwork_quarantine_group_submit_ribbon.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
// ignore: no_flutter_material_import
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_core/project_core.dart';

part 'pages/artwork_quarantine_group_card_main_page/artwork_quarantine_group_card_main_page.dart';

/// Artwork Quarantine Group Card
///
/// This card is used to display and edit an artwork quarantine group
/// using the EntityCard pattern for proper state management
class ArtworkQuarantineGroupCard extends HookConsumerWidget {
  const ArtworkQuarantineGroupCard({
    required this.floatingWindowId,
    required this.artworkQuarantineGroupId,
    required this.initialCustomerId,
    required this.floatingWindowType,
    this.initialNoteId,
    this.initialNoteParentId,
    super.key,
  });

  final String floatingWindowId;
  final int? artworkQuarantineGroupId;
  final int? initialCustomerId;

  final int? initialNoteId;
  final int? initialNoteParentId;
  final String floatingWindowType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useFormKey();
    final ppL10n = context.prepressL10n;
    final floatingWindowFocus =
        ref.watch(windowFocusNodeProvider(floatingWindowId));

    /// Save function for quarantine group items
    Future<ArtworkQuarantineGroup> onSavePressed(
      int entityId,
      String sessionId,
      GlobalKey<NavigatorState> navigatorKey,
    ) async {
      // Fetch group from state
      final groupForSave = await ref.read(
        artworkQuarantineGroupStateProvider(entityId, sessionId).future,
      );

      // return groupForSave;

      // Save group
      final updatedGroup =
          await ref.read(artworkQuarantineGroupRepositoryProvider).update(
                entity: groupForSave,
                release: false,
                sessionId: sessionId,
              );

      // return updatedGroup;

      // Update current state with updatedGroup
      ref
          .read(
            artworkQuarantineGroupStateProvider(entityId, sessionId).notifier,
          )
          .updateFromGroup(updatedGroup);

      // Update recent windows
      ref.read(recentWindowsProvider.notifier).updateEntityWindow(
            RecentWindow(
              type: floatingWindowType,
              entityId: entityId,
              label: '${ppL10n.artwork_quarantine_group_singular} '
                  '${groupForSave.meta.id}',
              additionalData: ArtworkQuarantineGroupAdditionalData(
                customerId: groupForSave.customerId,
                artworkQuarantineGroupId: groupForSave.meta.id!,
                description: groupForSave.customer?.contact?.general.name ?? '',
              ).toJson(),
            ),
          );

      ref
          .read(
            artworkQuarantineGroupStateProvider(entityId, sessionId).notifier,
          )
          .updateMetaAfterSave();

      return updatedGroup;
    }

    return EntityCard<ArtworkQuarantineGroup>(
      floatingWindowType: floatingWindowType,
      formKey: formKey,
      onSave: onSavePressed,
      showRibbonsOnFirstOpening: true,
      ribbonsBuilder: (
        entityId,
        sessionId,
        navigatorKey,
        savedOrInitialEntity,
      ) =>
          [
        ArtworkQuarantineGroupSubmitRibbon(
          floatingWindowId: floatingWindowId,
          floatingWindowFocus: floatingWindowFocus,
          navigatorKey: navigatorKey,
          groupId: entityId,
          sessionId: sessionId,
          savedOrInitialEntity: savedOrInitialEntity,
          onSaveGroup: onSavePressed,
        ),
        ArtworkQuarantineGroupCancelRibbon(
          floatingWindowId: floatingWindowId,
          floatingWindowFocus: floatingWindowFocus,
          navigatorKey: navigatorKey,
          groupId: entityId,
          sessionId: sessionId,
          onSaveGroup: onSavePressed,
          savedOrInitialEntity: savedOrInitialEntity,
        ),
      ],
      showTitleBar: true,
      invalidateEntityState: (entityId, sessionId) async {
        ref.invalidate(
          artworkQuarantineGroupStateProvider(entityId, sessionId),
        );
      },
      stateRefetchWithoutLock: (entityId, sessionId) async {
        await ref
            .read(
              artworkQuarantineGroupStateProvider(entityId, sessionId).notifier,
            )
            .refetchWithoutLock();
      },
      streamDataProvider: ({
        required sessionId,
        required dataId,
      }) =>
          watchArtworkQuarantineGroupProvider(
        sessionId: sessionId,
        id: dataId,
      ),
      tableType: TableType.artworkQuarantineGroup.name,
      stateSaveUnlockRefetch: (editingSessionId, dataId, navigatorKey) async {
        await ref
            .read(
              artworkQuarantineGroupStateProvider(dataId, editingSessionId)
                  .notifier,
            )
            .saveAndUnlockAndRefetch();
      },
      entityId: artworkQuarantineGroupId,
      stateRefetchWithLock: (entityId, sessionId) => ref
          .read(
            artworkQuarantineGroupStateProvider(entityId, sessionId).notifier,
          )
          .refetchWithLock(),
      floatingWindowId: floatingWindowId,
      stateProvider: artworkQuarantineGroupStateProvider.call,
      createEntity: (sessionId) =>
          ref.read(artworkQuarantineGroupRepositoryProvider).create(
                sessionId: sessionId,
                customerId: initialCustomerId,
              ),
      getTitle: (entity) =>
          '${entity.meta.id} - ${entity.customer?.contact?.general.name}',
      tableIcon: (entityId, sessionId) => AppIcons.artworkQuarantineGroup,
      tablePrefix: (entityId, sessionId) =>
          ppL10n.artwork_quarantine_group_singular,
      childBuilder: (
        context,
        entityId,
        sessionId,
        selectedNavIndexRef,
        navigatorKey,
        readOnly,
        meta,
        initialEntity,
        isSaving,
        savedOrInitialEntity,
        isFirstRender,
      ) {
        final stateNotifier = ref.watch(
          artworkQuarantineGroupStateProvider(entityId, sessionId).notifier,
        );

        final groupState = ref
            .watch(
              artworkQuarantineGroupStateProvider(entityId, sessionId),
            )
            .requireValue;

        final isCanceled =
            groupState.status == ArtworkQuarantineGroupStatus.canceled;

        useEffect(
          () {
            if (artworkQuarantineGroupId == null || !isFirstRender.value) {
              return;
            }
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              ref.read(recentWindowsProvider.notifier).insertEntityWindow(
                    RecentWindow(
                      type: floatingWindowType,
                      entityId: entityId,
                      label: '${ppL10n.artwork_quarantine_group_singular} '
                          '${initialEntity.meta.id}',
                      additionalData: ArtworkQuarantineGroupAdditionalData(
                        customerId: initialCustomerId,
                        artworkQuarantineGroupId: initialEntity.meta.id!,
                        description:
                            groupState.customer?.contact?.general.name ?? '',
                      ).toJson(),
                    ),
                  );
            });
            return null;
          },
          [],
        );

        return FloatingCardBody(
          floatingWindowType: FloatingWindowType.artworkQuarantineGroup.name,
          isFirstRun: isFirstRender.value,
          navigatorKey: navigatorKey,
          showShareButton: true,
          floatingWindowId: floatingWindowId,
          initialNoteId: initialNoteId,
          initialNoteParentId: initialNoteParentId,
          noteEntityId: initialEntity.meta.id,
          noteTableType: TableType.artworkQuarantineGroup.name,
          formKey: formKey,
          initialNavigationIndexNotifier: selectedNavIndexRef,
          footer: EntityCardFooter<ArtworkQuarantineGroup>(
            stateProvider:
                artworkQuarantineGroupStateProvider.call(entityId, sessionId),
            savedOrInitialEntity: savedOrInitialEntity,
            onSaveError: null,
            onSavePressed: () =>
                onSavePressed(entityId, sessionId, navigatorKey),
            isSavingNotifier: isSaving,
            floatingWindowId: floatingWindowId,
            formKey: formKey,
            readOnly: readOnly || isCanceled,
            navigatorKey: navigatorKey,
            meta: meta,
          ),
          navigationGroups: [
            // Group Details
            CardNavigationGroup(
              items: [
                // General
                CardNavigationItem(
                  label: ppL10n.artwork_quarantine_group_singular,
                  icon: AppIcons.data_import,
                ),
              ],
            ),
          ],
          children: [
            // Main Page
            CardBodyItem(
              child: _ArtworkQuarantineGroupCardMainPage(
                stateNotifier: stateNotifier,
                initialEntity: initialEntity,
                readOnly: readOnly || isCanceled,
                floatingWindowId: floatingWindowId,
                navigatorKey: navigatorKey,
                sessionId: sessionId,
                floatingWindowFocus: floatingWindowFocus,
                customerId: initialEntity.customerId,
                entityId: entityId,
              ),
            ),
          ],
        );
      },
    );
  }
}
