import 'package:elbdesk_app/features/app_navigation/widgets/branded_top_navigation_bar.dart';
import 'package:elbdesk_app/features/auth/screens/sign_up_admin_user.dart';
import 'package:elbdesk_app/widgets/dashboard_bottom_status_bar.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_core/project_core.dart';

part '../widgets/password_recover_dialog.dart';

/// Shows the Sign In Screen
class SignInScreen extends HookConsumerWidget {
  /// @nodoc
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController(text: '');
    final passwordController = useTextEditingController(text: '');
    final userFocusNode = useFocusNode();
    final passwordFocusNode = useFocusNode();
    final forgotPasswordFocusNode = useFocusNode();
    final obscurePassword = useState<bool>(true);
    final l10n = context.l10n;
    final isLoading = useState<bool>(false);

    useListenableSelector(emailController, () => emailController.text);
    useListenableSelector(passwordController, () => passwordController.text);

    final signIn = useCallback(
      () async {
        isLoading.value = true;

        final isValidEmail = emailController.text.trim().isValidEmail;
        if (!isValidEmail) {
          AppNotificationOverlay.error(context, l10n.auth_invalid_email);
          isLoading.value = false;
          return;
        }

        final hasError =
            await ref.read(authProvider).signInWithEmailAndPassword(
                  emailController.text.trim(),
                  passwordController.text.trim(),
                );

        if (hasError && context.mounted) {
          AppNotificationOverlay.error(context, l10n.auth_invalid_credentials);
          isLoading.value = false;
        }
      },
      [],
    );

    final hasUsers = ref.watch(hasAppUsersProvider);

    final defaultTextColor = context.appTheme.textStyles.defaultText.color;

    return AppScaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        bottom: false,
        child: hasUsers.when(
          skipLoadingOnRefresh: true,
          skipLoadingOnReload: true,
          loading: () => const Center(
            child: AppLoadingIndicator(),
          ),
          error: (error, stack) {
            return Center(
              child: AppText(error.toString()),
            );
          },
          data: (hasUsers) {
            if (!hasUsers) {
              return const SignUpAdminScreen();
            }
            return FocusTraversalGroup(
              policy: OrderedTraversalPolicy(),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isSmallScreen = constraints.maxWidth < 700;
                  return ListViewWithFooter(
                    isFooterFixed: true,
                    footer: const DashboardBottomStatusBar(),
                    children: [
                      if (!isSmallScreen)
                        const SizedBox(
                          height: 64,
                        ),
                      if (isSmallScreen)
                        const SizedBox(
                          height: 16,
                        ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isSmallScreen ? 16 : AppSpace.xxl,
                        ),
                        child: Align(
                          child: SizedBox(
                            width: 700,
                            // TODO(tk): What needs to be done here?
                            // ! FIXME
                            child: AppWindow.fixed(
                              showShadow: !isSmallScreen,
                              showBorder: !isSmallScreen,
                              child: SizedBox(
                                width: 400,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
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
                                    AppText(l10n.auth_email),
                                    FocusTraversalOrder(
                                      order: const NumericFocusOrder(0),
                                      child: NextTextField(
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        controller: emailController,
                                        focusNode: userFocusNode,
                                        onSubmitted: (p0) {
                                          passwordFocusNode.requestFocus();
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      height: AppSpace.xxs,
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: FocusTraversalOrder(
                                        order: const NumericFocusOrder(3),
                                        child: AppButton.blank(
                                          color: defaultTextColor,
                                          focusNode: forgotPasswordFocusNode,
                                          onPressed: () async {
                                            final updatedEmail =
                                                await showElbDialog<String?>(
                                              context: context,
                                              child: _PasswordRecoverDialog(
                                                initialEmail:
                                                    emailController.text.trim(),
                                              ),
                                            );

                                            if (updatedEmail != null) {
                                              emailController.text =
                                                  updatedEmail;
                                            }
                                          },
                                          label: l10n.auth_forgot_password,
                                        ),
                                      ),
                                    ),
                                    AppText(l10n.auth_password),
                                    FocusTraversalOrder(
                                      order: const NumericFocusOrder(1),
                                      child: NextTextField(
                                        textInputAction: TextInputAction.done,
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        obscureText: obscurePassword.value,
                                        controller: passwordController,
                                        focusNode: passwordFocusNode,
                                        suffix: AppTextFieldInsideSuffixButton(
                                          iconData: obscurePassword.value
                                              ? AppIcons.visibility
                                              : AppIcons.visibility_off,
                                          onPressed: () {
                                            obscurePassword.value =
                                                !obscurePassword.value;
                                          },
                                        ),
                                        onSubmitted: (p0) {
                                          if (emailController.text
                                                  .trim()
                                                  .isNotEmpty &&
                                              passwordController.text
                                                  .trim()
                                                  .isNotEmpty &&
                                              !isLoading.value) {
                                            signIn();
                                          }
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      height: AppSpace.xxl,
                                    ),
                                    FocusTraversalOrder(
                                      order: const NumericFocusOrder(2),
                                      child: Align(
                                        child: AppButton.primary(
                                          isLoading: isLoading.value,
                                          onPressed:
                                              emailController.text
                                                          .trim()
                                                          .isEmpty ||
                                                      passwordController.text
                                                          .trim()
                                                          .isEmpty ||
                                                      isLoading.value
                                                  ? null
                                                  : signIn,
                                          iconData: AppIcons.login_outlined,
                                          label: l10n.auth_sign_in,
                                        ),
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
                    ],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
