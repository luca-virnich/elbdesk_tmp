part of '../screens/sign_in_screen.dart';

enum _Page {
  enterMail,
  enterCodeAndPassword,
}

class _PasswordRecoverDialog extends HookWidget {
  const _PasswordRecoverDialog({
    required this.initialEmail,
  });
  final String initialEmail;

  @override
  Widget build(BuildContext context) {
    final page = useState<_Page>(_Page.enterMail);
    final email = useState<String>(initialEmail);
    final l10n = context.l10n;

    return ElbAlertDialog(
      titleText: 'Reset Password'.hc,
      titleIcon: AppIcons.lock,
      maxWidth: 400,
      onCancel: () => Navigator.of(context).pop(),
      // actions: const [],
      child: switch (page.value) {
        _Page.enterMail => _PasswordRecoverEnterMailView(
            initialEmail: initialEmail,
            onRecoveryMailSent: (enteredEmail) {
              page.value = _Page.enterCodeAndPassword;
              email.value = enteredEmail;
            },
          ),
        _Page.enterCodeAndPassword => _PasswordRecoverEnterCodeAndPasswordView(
            recoveryMail: email.value,
          ),
      },
    );
  }
}

class _PasswordRecoverEnterMailView extends HookConsumerWidget {
  const _PasswordRecoverEnterMailView({
    required this.initialEmail,
    required this.onRecoveryMailSent,
  });
  final String initialEmail;
  final void Function(String) onRecoveryMailSent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final controller = useTextEditingController(text: initialEmail);
    final focus = useFocusNode();

    final isValidEmail =
        useListenableSelector(controller, () => controller.text.isValidEmail);

    final sendRecoveryMail = useCallback(
      () {
        final email = controller.text;
        AppNotificationOverlay.success(context, l10n.auth_check_inbox);
        ref.read(authProvider).sendPasswordResetMail(email);
        onRecoveryMailSent(email);
      },
      [],
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          l10n.auth_reset_password_hint,
        ),
        const SizedBox(
          height: AppSpace.xl,
        ),
        AppText(l10n.auth_email),
        NextTextField(
          keyboardType: TextInputType.emailAddress,
          autofocus: true,
          controller: controller,
          focusNode: focus,
          onSubmitted: (p0) {
            if (isValidEmail) {
              sendRecoveryMail();
            }
          },
        ),
        const SizedBox(
          height: AppSpace.xxl,
        ),
        Align(
          child: AppButton.primary(
            onPressed: isValidEmail ? sendRecoveryMail : null,
            iconData: AppIcons.send,
            label: l10n.auth_send_reset_mail,
          ),
        ),
      ],
    );
  }
}

class _PasswordRecoverEnterCodeAndPasswordView extends HookConsumerWidget {
  const _PasswordRecoverEnterCodeAndPasswordView({
    required this.recoveryMail,
  });
  final String recoveryMail;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final validationCodeController = useTextEditingController();
    final passwordController = useTextEditingController();
    final validationCodeFocus = useFocusNode();
    final passwordFocus = useFocusNode();
    final obscurePassword = useState<bool>(true);

    // TODO(luca): optimize this
    final navigatorKey = AppNavigatorKeys.appRootNavigatorKey;
    final errorMsg = useValueNotifier<String?>(null);
    final isValidCode = useListenableSelector(
      validationCodeController,
      () => validationCodeController.text.trim().isNotEmpty,
    );

    final isValidPassword = useListenableSelector(
      passwordController,
      () =>
          passwordController.text.trim().isNotEmpty &&
          passwordController.text.trim().length >= 8,
    );

    final validateAndLogin = useCallback(
      () async {
        if (!isValidPassword || !isValidCode) {
          return;
        }
        final (:success, :exception, :data) =
            await AsyncHandler.handleAsyncOperation<bool>(
          context,
          () => ref.read(authProvider).validateAndResetPassword(
                recoveryMail,
                validationCodeController.text,
                passwordController.text,
                l10n,
              ),
          successMessage: l10n.gen_saving_success,
          successNavigatorKey: navigatorKey,
          errorNavigatorKey: navigatorKey,
        );

        if (exception != null) {
          errorMsg.value = exception.message;
        }

        if (success) {
          Navigator.of(context).pop(recoveryMail);
        }
      },
      [isValidPassword, isValidCode],
    );

    useEffect(
      () {
        validationCodeFocus.requestFocus();
        return null;
      },
      [],
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        AppText(
          l10n.auth_sent_reset_code_hint,
        ),
        const SizedBox(
          height: AppSpace.xl,
        ),
        AppText(l10n.auth_validation_code),
        NextTextFormField(
          validator: (value) {
            if (value?.trim().isNotEmpty == false) {
              return l10n.validation_required;
            }
            return null;
          },
          customErrorMessageNotifier: errorMsg,
          controller: validationCodeController,
          focusNode: validationCodeFocus,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (p0) {
            if (isValidCode) {
              FocusScope.of(context).nextFocus();
            }
          },
        ),
        const SizedBox(
          height: AppSpace.xl,
        ),
        AppText(l10n.auth_new_password),
        NextTextField(
          obscureText: obscurePassword.value,
          controller: passwordController,
          focusNode: passwordFocus,
          textInputAction: TextInputAction.done,
          onSubmitted: isValidCode && isValidPassword
              ? (p0) {
                  validateAndLogin();
                }
              : null,
          suffix: AppTextFieldInsideSuffixButton(
            iconData: obscurePassword.value
                ? AppIcons.visibility
                : AppIcons.visibility_off,
            onPressed: () {
              obscurePassword.value = !obscurePassword.value;
            },
          ),
        ),
        const SizedBox(
          height: AppSpace.xxl,
        ),
        Align(
          child: AppButton.primary(
            onPressed: isValidCode && isValidPassword ? validateAndLogin : null,
            iconData: AppIcons.login,
            label: l10n.auth_reset_password_and_sign_in,
          ),
        ),
      ],
    );
  }
}
