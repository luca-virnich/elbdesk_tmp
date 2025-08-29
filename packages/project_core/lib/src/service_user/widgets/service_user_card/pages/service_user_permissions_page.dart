part of '../service_user_card.dart';

/// App User Permissions View
///
/// A widget that displays and manages the permissions of an app user.
///
/// This widget is designed to show and edit the scope-based permissions
/// that control what actions a user can perform in different areas of the app.
/// It displays permissions as a list of scopes with configurable read/write/delete
/// access levels. It is intended to be used within the context of an app user's
/// profile or details view.
///
class _ServiceUserPermissionsPage extends HookConsumerWidget {
  /// @nodoc
  const _ServiceUserPermissionsPage({
    required this.serviceUserId,
    required this.readOnly,
    required this.sessionId,
    required this.validationGroupId,
  });

  final int serviceUserId;

  final bool readOnly;

  final String sessionId;
  final String validationGroupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    final initialState = useMemoized(
      () => ref
          .read(serviceUserStateProvider(serviceUserId, sessionId))
          .requireValue,
      [serviceUserId, sessionId],
    );

    // Define the admin scopes we want to show
    final adminScopes = [
      AppScope.admin,
      AppScope.crmAdmin,
      AppScope.mopAdmin,
      AppScope.serviceUser,
    ];

    return ScrollableCardItem.constrained(
      builder: (context, constraints) {
        return Column(
          children: [
            CardSectionTitle(
              title: l10n.app_scope_account_permissions,
            ),
            SeparatedColumn.builder(
              itemCount: adminScopes.length,
              separatorBuilder: (context, index) =>
                  const AppListViewSeperator.divider(
                height: 4,
              ),
              itemBuilder: (context, index) {
                final scope = adminScopes[index];

                final initialScopePermissions = initialState.userInfo.scopeNames
                    .where((e) => e.split('.').first == scope.name)
                    .toList();

                // Protects from editing admin scope permissions
                // of the first admin user
                final isInitialAdmin = initialState.userInfo.id == 1;

                // Only lock the main admin permissions for the initial admin
                final isReadOnly =
                    readOnly || (isInitialAdmin && scope == AppScope.admin);

                return _PermissionTile(
                  focusOrderId: index.toDouble(),
                  scope: scope,
                  initialScopePermissions: initialScopePermissions,
                  validationGroupId: validationGroupId,
                  serviceUserId: serviceUserId,
                  sessionId: sessionId,
                  readOnly: isReadOnly,
                );
              },
            ),
            // SeparatedColumn.builder(
            //   itemCount: AppScope.values.length,
            //   separatorBuilder: (context, index) =>
            //       const AppListViewSeperator.divider(
            //     height: 4,
            //   ),
            //   itemBuilder: (context, index) {
            //     final scope = AppScope.values[index];

            //     final initialScopePermissions = initialState.userInfo.scopeNames
            //         .where((e) => e.split('.').first == scope.name)
            //         .toList();

            //     // Protects from editing admin scope permissions
            //     // of the first admin user
            //     final isInitialAdmin = initialState.userInfo.id == 1;

            //     return _PermissionTile(
            //       focusOrderId: index.toDouble(),
            //       scope: scope,
            //       initialScopePermissions: initialScopePermissions,
            //       validationGroupId: validationGroupId,
            //       serviceUserId: serviceUserId,
            //       sessionId: sessionId,
            //       readOnly: readOnly || isInitialAdmin,
            //     );
            //   },
            // ),
          ],
        );
      },
    );
  }
}

class _PermissionTile extends HookConsumerWidget {
  const _PermissionTile({
    required this.scope,
    required this.initialScopePermissions,
    required this.validationGroupId,
    required this.serviceUserId,
    required this.sessionId,
    required this.readOnly,
    this.focusOrderId,
  });

  final AppScope scope;
  final List<String> initialScopePermissions;
  final String validationGroupId;
  final int serviceUserId;
  final String sessionId;
  final bool readOnly;
  final double? focusOrderId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    final initialOption = useMemoized(
      () {
        if (initialScopePermissions.toSet().containsAll(scope.rwd)) {
          return l10n.app_scope_permission_rwd;
        }
        if (initialScopePermissions.toSet().containsAll(scope.rw)) {
          return l10n.app_scope_permission_rw;
        }
        if (initialScopePermissions.toSet().contains(scope.read)) {
          return l10n.app_scope_permission_read;
        }
        return l10n.app_scope_permission_none;
      },
      [initialScopePermissions, scope],
    );

    return ElbListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 12),
      onPressed: null,
      child: Flexible(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppText(
                    AppScopeWrapper(scope).readable(l10n),
                    style: context.appTheme.textStyles.h3,
                  ),
                  AppText(
                    AppScopeWrapper(scope).description(l10n),
                    style: context.appTheme.textStyles.defaultTextLight,
                  ),
                ],
              ),
            ),
            const SizedBox(width: UiConstants.twoColumnWrapHorizontalSpacing),
            SizedBox(
              width: 230,
              child: NextDropdownMenu<AppScopePermission>(
                isMandatory: true,
                focusOrderId: focusOrderId,
                readOnly: readOnly,
                initialValue: initialOption,
                validationGroup: validationGroupId,
                onSelected: (scopePermission) {
                  if (scopePermission != null) {
                    ref
                        .read(
                          serviceUserStateProvider(serviceUserId, sessionId)
                              .notifier,
                        )
                        .updateScopePermissions(
                          scope: scope,
                          scopePermission: scopePermission,
                        );
                  }
                },
                dropdownMenuEntries: AppScopePermission.values
                    .map(
                      (e) => NextDropdownMenuEntry<AppScopePermission>(
                        value: e,
                        label: e.readable(l10n),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
