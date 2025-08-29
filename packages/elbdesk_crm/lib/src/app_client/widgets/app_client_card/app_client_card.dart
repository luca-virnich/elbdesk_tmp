import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_crm/src/app_client/logic/app_client_provider.dart';
import 'package:elbdesk_crm/src/app_client/logic/app_client_state.dart';
import 'package:elbdesk_crm/src/app_client/models/app_client.dart';
import 'package:elbdesk_crm/src/app_client/widgets/app_client_card/pages/app_client_main_page.dart';
import 'package:elbdesk_crm/src/contact/widgets/contact_card/in_window_contact_selection.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
// ignore: no_flutter_material_import
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

/// App-Clients are differnent companies/standorte inside a company
class AppClientCard extends HookConsumerWidget {
  /// @nodoc
  const AppClientCard({
    required this.floatingWindowId,
    required this.appClientId,
    required this.floatingWindowType,
    super.key,
  });
  final String floatingWindowId;
  final String floatingWindowType;
  final int? appClientId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final generalValidationGroupId = useUuid();

    final formKey = useFormKey();
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;

    Future<AppClient> onSavePressed(
      int entityId,
      String sessionId,
    ) async {
      final appClient =
          ref.read(appClientStateProvider(entityId, sessionId)).requireValue;
      if (appClient.contact == null) {
        throw ElbException(
          message: l10n.gen_please_choose_entity(crmL10n.contact_singular),
          exceptionType: ElbExceptionType.validationFormError,
        );
      }
      final updatedAppClient =
          await ref.read(appClientRepositoryProvider).update(
                entity: appClient,
                sessionId: sessionId,
                release: false,
              );

      ref
          .read(appClientStateProvider(entityId, sessionId).notifier)
          .updateMetaAfterSave();
      ref.invalidate(findAppClientsProvider);
      return updatedAppClient;
    }

    return EntityCard<AppClient>(
      floatingWindowType: FloatingWindowType.appClient.name,
      formKey: formKey,
      onSave: (entityId, sessionId, navigatorKey) =>
          onSavePressed(entityId, sessionId),
      ribbonsBuilder: (
        entityId,
        sessionId,
        navigatorKey,
        savedOrInitialEntity,
      ) =>
          [
        ChangeContactRibbon(
          entityId: entityId,
          sessionId: sessionId,
          navigatorKey: navigatorKey,
          floatingWindowId: floatingWindowId,
        ),
      ],
      showTitleBar: true,

      invalidateEntityState: (entityId, sessionId) async {
        ref.invalidate(
          appClientStateProvider(entityId, sessionId),
        );
      },
      stateRefetchWithoutLock: (entityId, sessionId) async {
        await ref
            .read(appClientStateProvider(entityId, sessionId).notifier)
            .refetchWithoutLock();
      },
      streamDataProvider: ({
        required sessionId,
        required dataId,
      }) =>
          watchAppClientProvider(
        sessionId: sessionId,
        appClientId: dataId,
      ),

      tableType: TableType.appClient.name,
      stateSaveUnlockRefetch: (editingSessionId, dataId, navigatorKey) async {
        await ref
            .read(appClientStateProvider(dataId, editingSessionId).notifier)
            .saveAndUnlockAndRefetch();
      },
      entityId: appClientId,
      stateRefetchWithLock: (entityId, sessionId) => ref
          .read(appClientStateProvider(entityId, sessionId).notifier)
          .refetchWithLock(),
      floatingWindowId: floatingWindowId,
      stateProvider: appClientStateProvider.call,
      // we don't need this here
      createEntity: (sessionId) async {
        return ref.read(appClientRepositoryProvider).create(
              sessionId: sessionId,
            );
      },
      getTitle: (entity) => entity.description,
      tableIcon: (entityId, sessionId) => AppIcons.appClient,
      tablePrefix: (entityId, sessionId) => crmL10n.app_client_singular,
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
        final stateNotifier =
            ref.watch(appClientStateProvider(entityId, sessionId).notifier);
        return FloatingCardBody(
          floatingWindowType: FloatingWindowType.appClient.name,
          isFirstRun: isFirstRender.value,
          floatingWindowId: floatingWindowId,
          navigatorKey: navigatorKey,
          formKey: formKey,
          initialNavigationIndexNotifier: selectedNavIndexRef,
          footer: EntityCardFooter<AppClient>(
            savedOrInitialEntity: savedOrInitialEntity,
            onSavePressed: () => onSavePressed(entityId, sessionId),
            floatingWindowId: floatingWindowId,
            formKey: formKey,
            readOnly: readOnly,
            navigatorKey: navigatorKey,
            isSavingNotifier: isSaving,
            onSaveError: null,
            stateProvider: appClientStateProvider(entityId, sessionId),
            meta: meta,
          ),
          navigationGroups: [
            CardNavigationGroup(
              items: [
                CardNavigationItem(
                  icon: AppIcons.contact,
                  label: crmL10n.contact_singular,
                  showErrorBadge: ref.watch(
                    validationGroupProvider(generalValidationGroupId).select(
                      (value) => value.isNotEmpty,
                    ),
                  ),
                ),
              ],
            ),
          ],
          children: [
            CardBodyItem(
              child: AppClientMainPage(
                validationGroup: generalValidationGroupId,
                entityId: entityId,
                sessionId: sessionId,
                readOnly: readOnly,
                stateNotifier: stateNotifier,
                initialEntity: initialEntity,
                navigatorKey: navigatorKey,
                floatingWindowId: floatingWindowId,
              ),
            ),
          ],
        );
      },
    );
  }
}

class ChangeContactRibbon extends ConsumerWidget {
  const ChangeContactRibbon({
    required this.entityId,
    required this.sessionId,
    required this.navigatorKey,
    required this.floatingWindowId,
    super.key,
  });

  final int entityId;
  final String sessionId;
  final GlobalKey<NavigatorState> navigatorKey;
  final String floatingWindowId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final floatingWindowFocus =
        ref.watch(windowFocusNodeProvider(floatingWindowId));
    final crmL10n = context.crmL10n;
    final l10n = context.l10n;
    return Ribbon(
      floatingWindowId: floatingWindowId,
      floatingWindowType: FloatingWindowType.appClient.name,
      onPressed: () async {
        await showElbDialog<void>(
          context: context,
          child: InWindowContactSelection.company(
            floatingWindowId: floatingWindowId,
            floatingWindowFocus: floatingWindowFocus,
            navigatorKey: navigatorKey,
            isLoading: false,
            titleText: l10n.gen_choose_entity(crmL10n.contact_singular),
            onSelect: (contact) async {
              ref
                  .read(
                    appClientStateProvider(entityId, sessionId).notifier,
                  )
                  .updateContact(contact);
              navigatorKey.currentState?.pop();
            },
          ),
        );
      },
      label: l10n.gen_change_entity(crmL10n.contact_singular),
      icon: AppIcons.contact,
    );
  }
}
