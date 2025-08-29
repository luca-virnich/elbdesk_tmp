import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';
import 'package:project_core/src/app_user/app_scope_extension.dart';
import 'package:project_core/src/app_user/models/app_scope_permission.dart';
import 'package:project_core/src/service_user/_export_service_user.dart';
import 'package:project_core/src/service_user/models/service_user_token.dart';
import 'package:project_core/src/service_user/repositories/service_user_token_repository.dart';

part 'pages/service_user_card_information_page.dart';
part 'pages/service_user_permissions_page.dart';
part 'pages/service_user_tokens_page.dart';

/// User Card
///
/// This widget is used to display the user information.
/// E.g. used inside of the FloatingUserCard
class ServiceUserCard extends HookConsumerWidget {
  /// User Card
  ///

  const ServiceUserCard({
    required this.floatingWindowId,
    required this.floatingWindowType,
    this.serviceUserId,
    super.key,
  });

  /// The id of the floating window
  final String floatingWindowId;

  /// The id of the user to display/fetch, if null a new user is created
  final int? serviceUserId;

  final String floatingWindowType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfoValidationGroupId = useUuid();

    final permissionsValidationGroupId = useUuid();
    final tokensValidationGroupId = useUuid();
    final formKey = useFormKey();
    final l10n = context.l10n;

    final initialsErrorNotifier = useValueNotifier<String?>(null);
    final workEmailErrorNotifier = useValueNotifier<String?>(null);
    final fullNameErrorNotifier = useValueNotifier<String?>(null);

    Future<ServiceUser> onSavePressed(
      int entityId,
      String sessionId,
    ) async {
      final serviceUser =
          ref.read(serviceUserStateProvider(entityId, sessionId)).requireValue;
      final updatedServiceUser =
          await ref.read(serviceUserRepositoryProvider).update(
                entity: serviceUser,
                release: false,
                sessionId: sessionId,
              );

      if (serviceUser.meta.isDraft) {
        ref.read(recentWindowsProvider.notifier).insertEntityWindow(
              RecentWindow(
                type: FloatingWindowType.serviceUser.name,
                entityId: entityId,
                label: serviceUser.serviceName,
              ),
            );
      } else {
        ref.read(recentWindowsProvider.notifier).updateEntityWindow(
              RecentWindow(
                type: FloatingWindowType.serviceUser.name,
                entityId: entityId,
                label: serviceUser.serviceName,
              ),
            );
      }

      ref
        ..invalidate(fetchAllServiceUsersProvider)
        ..invalidate(findServiceUsersProvider);
      if (context.mounted) {
        ref
            .read(serviceUserStateProvider(entityId, sessionId).notifier)
            .updateMetaAfterSave();
      }

      return updatedServiceUser;
    }

    void onSaveError(
      ElbException? exception,
      GlobalKey<NavigatorState> navigatorKey,
    ) {
      if (exception == null) {
        initialsErrorNotifier.value = null;
        workEmailErrorNotifier.value = null;
        fullNameErrorNotifier.value = null;
        return;
      }

      exception.onFieldException(
        context: context,
        navigatorKey: navigatorKey,
        showErrorOverlayOnGeneralError: true,
        showErrorOverlayOnFieldError: true,
        fn: () {
          // final artifacts = exception.artifacts;
          // if (exception.message.contains('Initials')) {
          //   initialsErrorNotifier.value =
          //       l10n.validation_service_user_initials_already_exists(
          //           artifacts!.first);
          // } else if (exception.message.contains('Email')) {
          //   workEmailErrorNotifier.value = l10n
          //       .validation_service_user_email_already_exists(artifacts!.first);
          // } else if (exception.message.contains('Name')) {
          //   fullNameErrorNotifier.value =
          //       l10n.validation_service_user_name_already_exists(artifacts![2]);
          // }

          initialsErrorNotifier.value =
              'There was an validation error creating the service user'.hc;
        },
      );
    }

    return EntityCard<ServiceUser>(
      floatingWindowType: floatingWindowType,
      formKey: formKey,
      onSave: (entityId, sessionId, navigatorKey) =>
          onSavePressed(entityId, sessionId),
      onSaveError: onSaveError,
      ribbonsBuilder: null,
      invalidateEntityState: (entityId, sessionId) async {
        ref.invalidate(serviceUserStateProvider(entityId, sessionId));
      },
      stateRefetchWithoutLock: (entityId, sessionId) async {
        await ref
            .read(serviceUserStateProvider(entityId, sessionId).notifier)
            .refetchWithoutLock();
      },
      streamDataProvider: ({
        required sessionId,
        required dataId,
      }) =>
          watchServiceUserProvider(
        sessionId: sessionId,
        serviceUserId: dataId,
      ),
      tableType: TableType.serviceUser.name,
      stateSaveUnlockRefetch: (editingSessionId, dataId, navigatorKey) async {
        await ref
            .read(serviceUserStateProvider(dataId, editingSessionId).notifier)
            .saveAndUnlockAndRefetch();
      },
      entityId: serviceUserId,
      stateRefetchWithLock: (entityId, sessionId) => ref
          .read(serviceUserStateProvider(entityId, sessionId).notifier)
          .refetchWithLock(),
      floatingWindowId: floatingWindowId,
      stateProvider: serviceUserStateProvider.call,
      createEntity: (sessionId) =>
          ref.read(serviceUserRepositoryProvider).create(
                sessionId: sessionId,
              ),
      getTitle: (entity) => entity.serviceName,
      tableIcon: (entityId, sessionId) => AppIcons.serviceUser,
      tablePrefix: (entityId, sessionId) => l10n.admin_service_users_singular,
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
          serviceUserStateProvider(entityId, sessionId).notifier,
        );
        useEffect(
          () {
            if (serviceUserId == null || !isFirstRender.value) return;
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              ref.read(recentWindowsProvider.notifier).insertEntityWindow(
                    RecentWindow(
                      type: FloatingWindowType.serviceUser.name,
                      entityId: entityId,
                      label: initialEntity.serviceName,
                    ),
                  );
            });
            return null;
          },
          [],
        );

        return FloatingCardBody(
          isFirstRun: isFirstRender.value,
          floatingWindowId: floatingWindowId,
          navigatorKey: navigatorKey,
          formKey: formKey,
          floatingWindowType: FloatingWindowType.serviceUser.name,
          initialNavigationIndexNotifier: selectedNavIndexRef,
          footer: EntityCardFooter<ServiceUser>(
            savedOrInitialEntity: savedOrInitialEntity,
            floatingWindowId: floatingWindowId,
            onSaveError: onSaveError,
            formKey: formKey,
            readOnly: readOnly,
            navigatorKey: navigatorKey,
            meta: meta,
            isSavingNotifier: isSaving,
            onSavePressed: () => onSavePressed(entityId, sessionId),
            stateProvider: serviceUserStateProvider.call(entityId, sessionId),
          ),
          navigationGroups: [
            CardNavigationGroup(
              items: [
                CardNavigationItem(
                  icon: AppIcons.person,
                  label: l10n.admin_service_users_singular,
                  showErrorBadge: ref.watch(
                    validationGroupProvider(userInfoValidationGroupId).select(
                      (value) => value.isNotEmpty,
                    ),
                  ),
                ),
                CardNavigationItem(
                  icon: AppIcons.access,
                  label: l10n.app_scope_permissions,
                  showErrorBadge: ref.watch(
                    validationGroupProvider(permissionsValidationGroupId)
                        .select(
                      (value) => value.isNotEmpty,
                    ),
                  ),
                ),
                CardNavigationItem(
                  icon: AppIcons.token,
                  label: l10n.admin_service_user_tokens_plural,
                  showErrorBadge: ref.watch(
                    validationGroupProvider(tokensValidationGroupId).select(
                      (value) => value.isNotEmpty,
                    ),
                  ),
                ),
              ],
            ),
            CardNavigationGroup(
              items: [
                CardNavigationItems.changelog(l10n),
              ],
            ),
          ],
          children: [
            CardBodyItem(
              child: _ServiceUserCardInformationPage(
                serviceUserId: entityId,
                sessionId: sessionId,
                stateNotifier: stateNotifier,
                initialEntity: initialEntity,
                fullNameErrorNotifier: fullNameErrorNotifier,
                initialsErrorNotifier: initialsErrorNotifier,
                workEmailErrorNotifier: workEmailErrorNotifier,
                readOnly: readOnly,
                validationGroupId: userInfoValidationGroupId,
              ),
            ),
            CardBodyItem(
              child: _ServiceUserPermissionsPage(
                serviceUserId: entityId,
                readOnly: readOnly,
                sessionId: sessionId,
                validationGroupId: permissionsValidationGroupId,
              ),
            ),
            CardBodyItem(
              child: _ServiceUserTokensPage(
                serviceUserId: entityId,
                readOnly: readOnly,
                sessionId: sessionId,
                validationGroupId: tokensValidationGroupId,
                navigatorKey: navigatorKey,
                floatingWindowId: floatingWindowId,
              ),
            ),
            CardBodyItem(
              keepAlive: false,
              child: EntityLogTable(
                fieldTitle: (log) => ServiceUserFields.fromFieldKey(
                  log.field,
                ).readable(l10n, l10n),
                entityId: entityId,
                tableType: TableType.serviceUser,
                navigatorKey: navigatorKey,
              ),
            ),
          ],
        );
      },
    );
  }
}
