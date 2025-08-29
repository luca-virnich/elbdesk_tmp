import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
// ignore: no_flutter_material_import
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

part 'pages/drucklayout_card_main_page.dart';

/// Drucklayout Card
///
/// This is the card that displays the Drucklayout entity
///
/// Usually displayed in the corresponding FloatingWindow
class DrucklayoutCard extends HookConsumerWidget {
  /// DrucklayoutCard constructor
  const DrucklayoutCard({
    required this.floatingWindowId,
    required this.entityId,
    required this.floatingWindowFocus,
    required this.floatingWindowType,
    required this.preSelectionId,
    required this.selectionId,
    this.customerId,
    this.salesOrderId,
    this.navigatorKey,
    this.initialNoteId,
    this.initialNoteParentId,
    super.key,
  });
  final String floatingWindowId;
  final int? entityId;
  final int? customerId;
  final int? salesOrderId;
  final int preSelectionId;
  final int selectionId;
  final String floatingWindowType;

  final GlobalKey<NavigatorState>? navigatorKey;

  final FocusNode floatingWindowFocus;

  final int? initialNoteId;
  final int? initialNoteParentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useFormKey();

    final crmL10n = context.crmL10n;
    final ppL10n = context.prepressL10n;

    /// On save pressed
    ///
    /// This method is triggered through the Footer of the card or the
    /// save intent (cmd + s)
    Future<Drucklayout> onSavePressed(
      int entityId,
      String sessionId,
      GlobalKey<NavigatorState> navigatorKey,
    ) async {
      // Fetch current state
      final data =
          ref.read(drucklayoutStateProvider(entityId, sessionId)).requireValue;

      // Update database
      final updatedDrucklayout =
          await ref.read(drucklayoutRepositoryProvider).update(
                entity: data,
                release: false,
                sessionId: sessionId,
              );

      // Update the meta data after save
      // (Necessary for proper state management)
      ref
          .read(drucklayoutStateProvider(entityId, sessionId).notifier)
          .updateMetaAfterSave();

      // Set Recent window
      ref.read(recentWindowsProvider.notifier).updateEntityWindow(
            RecentWindow(
              type: floatingWindowType,
              entityId: entityId,
              label: '${ppL10n.drucklayout_singular} '
                  '${updatedDrucklayout.meta.id}',
              additionalData: DrucklayoutAdditionalData(
                title: data.title,
                description: data.description,
                customerId: customerId,
                salesOrderId: salesOrderId,
                preSelectionId: preSelectionId,
                selectionId: selectionId,
              ).toJson(),
            ),
          );

      return updatedDrucklayout;
    }

    return EntityCard<Drucklayout>(
      floatingWindowType: floatingWindowType,
      floatingWindowFocus: floatingWindowFocus,
      formKey: formKey,
      onSave: onSavePressed,
      showTitleBar: true,
      invalidateEntityState: (entityId, sessionId) async {
        ref.invalidate(
          drucklayoutStateProvider(entityId, sessionId),
        );
      },
      stateRefetchWithoutLock: (entityId, sessionId) async {
        await ref
            .read(drucklayoutStateProvider(entityId, sessionId).notifier)
            .refetchWithoutLock();
      },
      streamDataProvider: ({
        required sessionId,
        required dataId,
      }) =>
          watchDrucklayoutProvider(
        sessionId: sessionId,
        entityId: dataId,
      ),
      tableType: TableType.drucklayout.name,
      stateSaveUnlockRefetch: (editingSessionId, dataId, navigatorKey) async {
        await ref
            .read(
              drucklayoutStateProvider(dataId, editingSessionId).notifier,
            )
            .saveAndUnlockAndRefetch();
      },
      entityId: entityId,
      stateRefetchWithLock: (entityId, sessionId) => ref
          .read(drucklayoutStateProvider(entityId, sessionId).notifier)
          .refetchWithLock(),
      floatingWindowId: floatingWindowId,
      stateProvider: drucklayoutStateProvider.call,
      createEntity: (sessionId) =>
          ref.read(drucklayoutRepositoryProvider).create(
                sessionId: sessionId,
                release: false,
                salesOrderId: salesOrderId,
                customerId: customerId,
                preSelectionId: preSelectionId,
                selectionId: selectionId,
              ),
      getTitle: (entity) => '${ppL10n.drucklayout_singular}: ${entity.title}',
      tableIcon: (entityId, sessionId) => AppIcons.drucklayout,
      tablePrefix: (entityId, sessionId) => '',
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
          drucklayoutStateProvider(entityId, sessionId).notifier,
        );

        useEffect(
          () {
            if (!isFirstRender.value) return;
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              ref.read(recentWindowsProvider.notifier).insertEntityWindow(
                    RecentWindow(
                      type: floatingWindowType,
                      entityId: entityId,
                      label: ppL10n.drucklayout_singular,
                      additionalData: DrucklayoutAdditionalData(
                        title: initialEntity.title,
                        description: initialEntity.description,
                        customerId: customerId,
                        salesOrderId: salesOrderId,
                        preSelectionId: preSelectionId,
                        selectionId: selectionId,
                      ).toJson(),
                    ),
                  );
            });
            return null;
          },
          [],
        );

        return FloatingCardBody(
          noteEntityId: entityId,
          initialNoteId: initialNoteId,
          initialNoteParentId: initialNoteParentId,
          isFirstRun: isFirstRender.value,
          noteTableType: TableType.drucklayout.name,
          floatingWindowId: floatingWindowId,
          navigatorKey: navigatorKey,
          showShareButton: true,
          formKey: formKey,
          floatingWindowType: FloatingWindowType.drucklayout.name,
          initialNavigationIndexNotifier: selectedNavIndexRef,
          footer: EntityCardFooter<Drucklayout>(
            stateProvider: drucklayoutStateProvider.call(entityId, sessionId),
            floatingWindowId: floatingWindowId,
            onSaveError: null,
            savedOrInitialEntity: savedOrInitialEntity,
            isSavingNotifier: isSaving,
            onSavePressed: () =>
                onSavePressed(entityId, sessionId, navigatorKey),
            readOnly: readOnly,
            navigatorKey: navigatorKey,
            meta: meta,
            formKey: formKey,
          ),
          navigationGroups: [
            CardNavigationGroup(
              items: [
                CardNavigationItem(
                  icon: AppIcons.home,
                  label: crmL10n.general,
                  showErrorBadge: false,
                ),
              ],
            ),
          ],
          children: [
            CardBodyItem(
              child: _DrucklayoutCardMainPage(
                entityId: entityId,
                customerId: customerId!,
                floatingWindowFocus: floatingWindowFocus,
                stateNotifier: stateNotifier,
                initialEntity: initialEntity,
                readOnly: readOnly,
                sessionId: sessionId,
                floatingWindowId: floatingWindowId,
                navigatorKey: navigatorKey,
              ),
            ),
          ],
        );
      },
    );
  }
}
