import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';
import 'package:project_core/src/app_user/app_scope_extension.dart';
import 'package:project_core/src/app_user/config/app_user_fields.dart';
import 'package:project_core/src/app_user/logic/app_user_state.dart';
import 'package:project_core/src/app_user/models/app_scope_permission.dart';
import 'package:project_core/src/app_user/models/app_user.dart';

part 'pages/app_user_card_information_page.dart';
part 'pages/app_user_permissions_page.dart';

/// User Card
///
/// This widget is used to display the user information.
/// E.g. used inside of the FloatingUserCard
class AppUserCard extends HookConsumerWidget {
  /// User Card
  ///

  const AppUserCard({
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    required this.floatingWindowType,
    this.appUserId,
    super.key,
  });

  /// The id of the floating window
  final String floatingWindowId;

  /// The id of the user to display/fetch, if null a new user is created
  final int? appUserId;

  final FocusNode floatingWindowFocus;
  final String floatingWindowType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfoValidationGroupId = useUuid();
    final crmL10n = context.crmL10n;

    final permissionsValidationGroupId = useUuid();
    final formKey = useFormKey();
    final l10n = context.l10n;

    final initialsErrorNotifier = useValueNotifier<String?>(null);
    final workEmailErrorNotifier = useValueNotifier<String?>(null);
    final fullNameErrorNotifier = useValueNotifier<String?>(null);

    Future<AppUser> onSavePressed(
      int entityId,
      String sessionId,
    ) async {
      final appUser =
          ref.read(appUserStateProvider(entityId, sessionId)).requireValue;
      final updatedAppUser = await ref.read(appUserRepositoryProvider).update(
            entity: appUser,
            release: false,
            sessionId: sessionId,
          );

      if (appUser.meta.isDraft) {
        ref.read(recentWindowsProvider.notifier).insertEntityWindow(
              RecentWindow(
                type: floatingWindowType,
                entityId: entityId,
                label: appUser.general.fullName,
              ),
            );
      } else {
        ref.read(recentWindowsProvider.notifier).updateEntityWindow(
              RecentWindow(
                type: floatingWindowType,
                entityId: entityId,
                label: appUser.general.fullName,
              ),
            );
      }

      ref
        ..invalidate(fetchAllAppUsersProvider)
        ..invalidate(findAppUsersProvider);
      if (context.mounted) {
        ref
            .read(appUserStateProvider(entityId, sessionId).notifier)
            .updateMetaAfterSave();
      }

      return updatedAppUser;
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
          final field = Parser.enumFromString(
            AppUserField.values,
            exception.field,
          );

          if (field == null) return;
          if (field == AppUserField.initials) {
            initialsErrorNotifier.value = exception.message;
          } else if (field == AppUserField.email) {
            workEmailErrorNotifier.value = exception.message;
          } else if (field == AppUserField.fullName) {
            fullNameErrorNotifier.value = exception.message;
          }
        },
      );
    }

    return EntityCard<AppUser>(
      floatingWindowType: floatingWindowType,
      floatingWindowFocus: floatingWindowFocus,
      formKey: formKey,
      onSave: (entityId, sessionId, navigatorKey) =>
          onSavePressed(entityId, sessionId),
      onSaveError: onSaveError,
      invalidateEntityState: (entityId, sessionId) async {
        ref.invalidate(appUserStateProvider(entityId, sessionId));
      },
      stateRefetchWithoutLock: (entityId, sessionId) async {
        await ref
            .read(appUserStateProvider(entityId, sessionId).notifier)
            .refetchWithoutLock();
      },
      streamDataProvider: ({
        required sessionId,
        required dataId,
      }) =>
          watchAppUserProvider(
        sessionId: sessionId,
        appUserId: dataId,
      ),
      tableType: TableType.appUser.name,
      stateSaveUnlockRefetch: (editingSessionId, dataId, navigatorKey) async {
        await ref
            .read(appUserStateProvider(dataId, editingSessionId).notifier)
            .saveAndUnlockAndRefetch();
      },
      entityId: appUserId,
      stateRefetchWithLock: (entityId, sessionId) => ref
          .read(appUserStateProvider(entityId, sessionId).notifier)
          .refetchWithLock(),
      floatingWindowId: floatingWindowId,
      stateProvider: appUserStateProvider.call,
      createEntity: (sessionId) => ref.read(appUserRepositoryProvider).create(
            sessionId: sessionId,
          ),
      getTitle: (entity) => entity.general.fullName,
      tableIcon: (entityId, sessionId) => AppIcons.appUser,
      tablePrefix: (entityId, sessionId) => l10n.admin_app_users_singular,
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
          appUserStateProvider(entityId, sessionId).notifier,
        );
        useEffect(
          () {
            if (appUserId == null || !isFirstRender.value) return;
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              ref.read(recentWindowsProvider.notifier).insertEntityWindow(
                    RecentWindow(
                      type: floatingWindowType,
                      entityId: entityId,
                      label: initialEntity.general.fullName,
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
          floatingWindowType: FloatingWindowType.appUser.name,
          initialNavigationIndexNotifier: selectedNavIndexRef,
          footer: EntityCardFooter<AppUser>(
            savedOrInitialEntity: savedOrInitialEntity,
            floatingWindowId: floatingWindowId,
            onSaveError: onSaveError,
            formKey: formKey,
            readOnly: readOnly,
            navigatorKey: navigatorKey,
            meta: meta,
            isSavingNotifier: isSaving,
            onSavePressed: () => onSavePressed(entityId, sessionId),
            stateProvider: appUserStateProvider.call(entityId, sessionId),
          ),
          navigationGroups: [
            CardNavigationGroup(
              items: [
                CardNavigationItem(
                  icon: AppIcons.person,
                  label: l10n.app_user,
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
              child: _AppUserCardInformationPage(
                appUserId: entityId,
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
              child: _AppUserPermissionsPage(
                appUserId: entityId,
                readOnly: readOnly,
                sessionId: sessionId,
                validationGroupId: permissionsValidationGroupId,
              ),
            ),
            CardBodyItem(
              keepAlive: false,
              child: EntityLogTable(
                fieldTitle: (log) => AppUserFields.fromFieldKey(log.field)
                    .readable(l10n, crmL10n),
                entityId: entityId,
                tableType: TableType.appUser,
                navigatorKey: navigatorKey,
              ),
            ),
          ],
        );
      },
    );
  }
}
