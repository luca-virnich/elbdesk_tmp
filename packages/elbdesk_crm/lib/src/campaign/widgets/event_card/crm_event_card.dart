import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_crm/src/campaign/config/crm_event_fields.dart';
import 'package:elbdesk_crm/src/campaign/logic/crm_event_state.dart';
import 'package:elbdesk_crm/src/campaign/widgets/event_card/main_page/crm_event_main_page.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

/// Card for displaying and editing a CRM event
class CrmEventCard extends HookConsumerWidget {
  /// Default constructor
  const CrmEventCard({
    required this.floatingWindowId,
    required this.eventId,
    required this.floatingWindowFocus,
    required this.floatingWindowType,
    super.key,
  });

  /// The ID of the floating window
  final String floatingWindowId;

  /// The type of the floating window
  final String floatingWindowType;

  /// The ID of the event to display/edit
  final int? eventId;

  /// Focus node for the floating window
  final FocusNode floatingWindowFocus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final formKey = useFormKey();
    final descriptionErrorNotifier = useValueNotifier<String?>(null);

    /// Save the event and return the updated entity
    Future<CrmEvent> onSavePressed(int entityId, String sessionId) async {
      final entity =
          ref.read(crmEventStateProvider(entityId, sessionId)).requireValue;

      CrmEvent updatedEvent;

      if (entityId == 0) {
        updatedEvent =
            await ref.read(crmEventRepositoryProvider).createAndReturnEntity(
                  entity: entity,
                  release: true,
                  sessionId: sessionId,
                );
      } else {
        updatedEvent = await ref.read(crmEventRepositoryProvider).update(
              entity: entity,
              release: false,
              sessionId: sessionId,
            );
        ref
            .read(crmEventStateProvider(entityId, sessionId).notifier)
            .updateMetaAfterSave();
      }

      // Update window title to match event name
      ref.read(recentWindowsProvider.notifier).updateEntityWindow(
            RecentWindow(
              type: floatingWindowType,
              entityId: entityId,
              label: entity.name,
            ),
          );

      return updatedEvent;
    }

    final crmL10n = context.crmL10n;

    return EntityCard<CrmEvent>(
      floatingWindowType: FloatingWindowType.crmEvent.name,
      tablePrefix: (entityId, sessionId) => crmL10n.event_singular,
      floatingWindowFocus: floatingWindowFocus,
      formKey: formKey,
      onSave: (entityId, sessionId, navigatorKey) =>
          onSavePressed(entityId, sessionId),
      invalidateEntityState: (entityId, sessionId) async {
        ref.invalidate(crmEventStateProvider(entityId, sessionId));
      },
      stateRefetchWithoutLock: (entityId, sessionId) async {
        await ref
            .read(crmEventStateProvider(entityId, sessionId).notifier)
            .refetchWithoutLock();
      },
      streamDataProvider: ({
        required sessionId,
        required dataId,
      }) =>
          watchCrmEventProvider(
        sessionId: sessionId,
        entityId: dataId,
      ),
      tableType: TableType.crmEvent.name,
      stateSaveUnlockRefetch: (editingSessionId, dataId, navigatorKey) async {
        await ref
            .read(crmEventStateProvider(dataId, editingSessionId).notifier)
            .saveAndUnlockAndRefetch();
      },
      entityId: eventId,
      stateRefetchWithLock: (entityId, sessionId) => ref
          .read(crmEventStateProvider(entityId, sessionId).notifier)
          .refetchWithLock(),
      floatingWindowId: floatingWindowId,
      stateProvider: crmEventStateProvider.call,
      createEntity: (sessionId) =>
          ref.read(crmEventRepositoryProvider).create(sessionId: sessionId),
      getTitle: (entity) => entity.name,
      tableIcon: (_, __) => AppIcons.crm_event,
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
          crmEventStateProvider(entityId, sessionId).notifier,
        );

        useEffect(
          () {
            if (eventId == null || !isFirstRender.value) return;
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              ref.read(recentWindowsProvider.notifier).insertEntityWindow(
                    RecentWindow(
                      type: floatingWindowType,
                      entityId: entityId,
                      label: initialEntity.name,
                    ),
                  );
            });
            return null;
          },
          [],
        );

        return FloatingCardBody(
          floatingWindowType: FloatingWindowType.crmEvent.name,
          showShareButton: !meta.isDraft,
          isFirstRun: isFirstRender.value,
          showNotes: !meta.isDraft,
          navigatorKey: navigatorKey,
          noteEntityId: entityId,
          noteTableType: TableType.crmEvent.name,
          floatingWindowId: floatingWindowId,
          formKey: formKey,
          initialNavigationIndexNotifier: selectedNavIndexRef,
          footer: EntityCardFooter<CrmEvent>(
            savedOrInitialEntity: savedOrInitialEntity,
            onSavePressed: () => onSavePressed(entityId, sessionId),
            onSaveError: null,
            isSavingNotifier: isSaving,
            floatingWindowId: floatingWindowId,
            formKey: formKey,
            readOnly: readOnly,
            navigatorKey: navigatorKey,
            meta: meta,
            stateProvider: crmEventStateProvider.call(entityId, sessionId),
          ),
          navigationGroups: [
            CardNavigationGroup(
              items: [
                CardNavigationItem(
                  icon: AppIcons.crm_event,
                  label: crmL10n.event_singular,
                ),
              ],
            ),
            CardNavigationGroup(
              items: [
                CardNavigationItems.changelog(context.l10n),
              ],
            ),
          ],
          children: [
            CardBodyItem(
              child: CrmEventMainPage(
                sessionId: sessionId,
                stateNotifier: stateNotifier,
                readOnly: readOnly,
                descriptionErrorNotifier: descriptionErrorNotifier,
                initialEntity: initialEntity,
                navigatorKey: navigatorKey,
                floatingWindowId: floatingWindowId,
                floatingWindowFocus: floatingWindowFocus,
              ),
            ),
            CardBodyItem(
              keepAlive: false,
              child: EntityLogTable(
                fieldTitle: (log) => CrmEventFields.fromFieldKey(log.field)
                    .readable(l10n, crmL10n),
                entityId: entityId,
                tableType: TableType.crmEvent,
                navigatorKey: navigatorKey,
              ),
            ),
          ],
          // childrenBuilder: (context, constraints) {
          //   final height = constraints.maxHeight;
          //   print('height childrenBuilder: $height');
          //   return [

          //   ];
          // },
        );
      },
    );
  }
}
