import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';

extension ElbExceptionExt on ElbException {
  void onFieldException({
    required BuildContext context,
    required VoidCallback fn,
    required GlobalKey<NavigatorState> navigatorKey,
    required bool showErrorOverlayOnGeneralError,
    required bool showErrorOverlayOnFieldError,
  }) {
    if (!context.mounted) {
      return;
    }
    final l10n = context.l10n;
    if (exceptionType == ElbExceptionType.validationFieldError) {
      fn();
      if (showErrorOverlayOnFieldError) {
        AppNotificationOverlay.error(
          context,
          l10n.gen_saving_error,
          navigatorKey: navigatorKey,
        );
      }
      return;
    }
    if (showErrorOverlayOnGeneralError) {
      AppNotificationOverlay.error(
        context,
        message,
        navigatorKey: navigatorKey,
      );
    }
  }
}
