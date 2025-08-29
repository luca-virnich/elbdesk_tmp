import 'package:elbdesk_app/features/app_navigation/widgets/branded_top_navigation_bar.dart';
import 'package:elbdesk_app/widgets/dashboard_bottom_status_bar.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_core/project_core.dart';

/// Shows the Sign Up Screen for Admin
class SignUpAdminScreen extends HookConsumerWidget {
  /// @nodoc
  const SignUpAdminScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController(text: '');
    final fullNameController = useTextEditingController(text: '');
    final emailFocusNode = useFocusNode();
    final fullNameFocusNode = useFocusNode();

    final l10n = context.l10n;
    final isLoading = useState<bool>(false);

    useListenableSelector(emailController, () => emailController.text);
    useListenableSelector(fullNameController, () => fullNameController.text);

    final signUp = useCallback(
      () async {
        isLoading.value = true;

        final isValidEmail = emailController.text.trim().isValidEmail;
        if (!isValidEmail) {
          AppNotificationOverlay.error(context, l10n.auth_invalid_email);
          isLoading.value = false;
          return;
        }

        // Get user from state
        await ref.read(appUserRepositoryProvider).createInitialAdminAppUser(
              email: emailController.text.trim(),
              fullName: fullNameController.text.trim(),
            );

        if (context.mounted) {
          ref.invalidate(hasAppUsersProvider);
          AppNotificationOverlay.success(
            context,
            l10n.auth_user_created_sucessfully,
          );
        }
      },
      [],
    );

    return AppScaffold(
      resizeToAvoidBottomInset: false,
      body: FocusTraversalGroup(
        policy: OrderedTraversalPolicy(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 64,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpace.xxl),
              child: Align(
                child: SizedBox(
                  width: 700,
                  // TODO(tk): What needs to be done here?
                  // ! FIXME
                  child: AppWindow.fixed(
                    child: SizedBox(
                      width: 400,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: AppSpace.l,
                          ),
                          const BrandingLogo(
                            height: 80,
                          ),
                          const SizedBox(
                            height: AppSpace.xxl,
                          ),
                          FocusTraversalOrder(
                            order: const NumericFocusOrder(0),
                            child: AppRawTextField(
                              labelText: l10n.auth_email,
                              controller: emailController,
                              focusNode: emailFocusNode,
                              onSubmitted: (p0) {
                                fullNameFocusNode.requestFocus();
                              },
                            ),
                          ),
                          const SizedBox(
                            height: AppSpace.l,
                          ),
                          FocusTraversalOrder(
                            order: const NumericFocusOrder(1),
                            child: AppRawTextField(
                              labelText: l10n.auth_sign_up_full_name,
                              controller: fullNameController,
                              focusNode: fullNameFocusNode,
                              onSubmitted: (p0) {
                                if (emailController.text.trim().isNotEmpty &&
                                    fullNameController.text.trim().isNotEmpty &&
                                    !isLoading.value) {
                                  signUp();
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            height: AppSpace.xxl,
                          ),
                          FocusTraversalOrder(
                            order: const NumericFocusOrder(2),
                            child: AppButton.primary(
                              isLoading: isLoading.value,
                              onPressed: emailController.text.trim().isEmpty ||
                                      fullNameController.text.trim().isEmpty ||
                                      isLoading.value
                                  ? null
                                  : signUp,
                              iconData: AppIcons.supervisor_account_rounded,
                              label: l10n.auth_sign_up,
                            ),
                          ),
                          const SizedBox(
                            height: AppSpace.l,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            const DashboardBottomStatusBar(),
          ],
        ),
      ),
    );
  }
}
