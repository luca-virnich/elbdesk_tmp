import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';

class AsyncHandler {
  const AsyncHandler._();

  static Future<({bool success, ElbException? exception, T? data})>
      handleAsyncOperation<T>(
    BuildContext context,
    Future<T?> Function() operation, {
    GlobalKey<NavigatorState>? errorNavigatorKey,
    GlobalKey<NavigatorState>? successNavigatorKey,
    bool showErrorNotification = true,
    String? successMessage,
  }) async {
    final l10n = context.l10n;
    try {
      final data = await operation();

      if (context.mounted && successMessage != null) {
        AppNotificationOverlay.success(
          context,
          successMessage,
          navigatorKey: successNavigatorKey ?? errorNavigatorKey,
        );
      }
      return (success: true, exception: null, data: data);
    } on ElbException catch (e) {
      dlog(e);
      if (context.mounted && showErrorNotification) {
        final message = e.message;
        AppNotificationOverlay.error(
          context,
          message,
          navigatorKey: errorNavigatorKey,
        );
      }
      return (success: false, exception: e, data: null);
    } catch (e) {
      dlog(e);
      if (context.mounted && showErrorNotification) {
        AppNotificationOverlay.error(
          context,
          '${l10n.exception_server_error}: $e',
          navigatorKey: errorNavigatorKey,
        );
      }
      return (
        success: false,
        exception: ElbException(
          exceptionType: ElbExceptionType.unknown,
          message: e.toString(),
        ),
        data: null
      );
    }
  }
}
