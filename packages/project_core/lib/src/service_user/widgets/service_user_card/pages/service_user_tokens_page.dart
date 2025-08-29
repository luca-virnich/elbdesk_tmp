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
class _ServiceUserTokensPage extends HookConsumerWidget {
  /// @nodoc
  const _ServiceUserTokensPage({
    required this.serviceUserId,
    required this.readOnly,
    required this.sessionId,
    required this.validationGroupId,
    required this.navigatorKey,
    required this.floatingWindowId,
  });

  final int serviceUserId;

  final bool readOnly;

  final String sessionId;
  final String validationGroupId;

  final GlobalKey<NavigatorState> navigatorKey;
  final String floatingWindowId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    final tokenDescriptionController = useTextEditingController();

    final tokens = useState<List<ServiceUserToken>>([]);

    return ScrollableCardItem.constrained(
      builder: (context, constraints) {
        return Column(
          children: [
            CardSectionTitle(
              title: l10n.admin_service_user_tokens_plural,
            ),
            AppTextField(
              label: l10n.admin_service_users_token_field_description,
              controller: tokenDescriptionController,
              onChanged: (value) {
                // Handle text changes
              },
            ),
            AppButton.primary(
              label: l10n.admin_service_user_tokens_create_token_button_label,
              onPressed: () async {
                final newToken = await ref
                    .read(serviceUserTokenRepositoryProvider)
                    .createAndReturnEntity(
                      sessionId: sessionId,
                      serviceUserId: serviceUserId,
                      tokenDescription: tokenDescriptionController.text,
                    );

                tokens.value =
                    await ref.read(serviceUserTokenRepositoryProvider).find(
                          serviceUserId: serviceUserId,
                        );
                if (!context.mounted) return;
                await showElbDialog<bool?>(
                  context: context,
                  navigatorKey: navigatorKey,
                  child: CreateTokenDialog(
                    navigatorKey: navigatorKey,
                    floatingWindowId: floatingWindowId,
                    serviceUserToken: newToken,
                  ),
                );
              },
            ),
            AppButton.primary(
              label: l10n.admin_service_user_tokens_refresh_tokens_button_label,
              onPressed: () async {
                tokens.value =
                    await ref.read(serviceUserTokenRepositoryProvider).find(
                          serviceUserId: serviceUserId,
                        );
              },
            ),
            if (tokens.value.isNotEmpty) ...[
              SeparatedColumn.builder(
                itemCount: tokens.value.length,
                separatorBuilder: (context, index) =>
                    const AppListViewSeperator.divider(
                  height: 4,
                ),
                itemBuilder: (context, index) {
                  return ElbListTile(
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    onPressed: null,
                    child: AppText(tokens.value[index].tokenDescription),
                  );
                },
              ),
            ],
          ],
        );
      },
    );
  }
}

/// Dialog that asks the user to confirm canceling the group
class CreateTokenDialog extends HookConsumerWidget {
  const CreateTokenDialog({
    required this.navigatorKey,
    required this.floatingWindowId,
    required this.serviceUserToken,
    super.key,
  });

  final GlobalKey<NavigatorState> navigatorKey;
  final String floatingWindowId;
  final ServiceUserToken serviceUserToken;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final isLoadingNotifier = useState<bool>(false);

    return ElbDialog(
      maxWidth: 600,
      isSelfScrollable: false,
      blockShortcuts: isLoadingNotifier.value,
      contentPadding: const EdgeInsets.all(UiConstants.defaultPadding),
      title: l10n.admin_service_users_create_token_dialog_title,
      floatingWindowId: floatingWindowId,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Confirmation message
          AppText(
            l10n.admin_service_users_create_token_confirmation_message,
            style: context.appTheme.textStyles.defaultText,
          ),
          const SizedBox(height: UiConstants.defaultPadding),

          NextCardFormField.text(
            label: l10n.admin_service_users_token_field_label,
            labelPosition: NextCardFormFieldLabelPosition.top,
            initialText:
                '${serviceUserToken.authKey!.id}:${serviceUserToken.authKey!.key}',
            readOnly: true,
            validationGroup: '',
            onChanged: (String value) {},
          ),

          AppText(serviceUserToken.tokenDescription),
          const SizedBox(height: UiConstants.defaultPadding),

          // Action buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppButton.danger(
                onPressed: isLoadingNotifier.value
                    ? null
                    : () => Navigator.of(context).pop(),
                label: l10n
                    .admin_service_users_create_token_confirmation_button_label,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
