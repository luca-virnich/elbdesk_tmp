import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_backend_core_server/src/modules/user_settings/user_settings_handler.dart';
import 'package:elbdesk_shared/elbdesk_shared.dart';
import 'package:serverpod/serverpod.dart';

class ElbExceptionThrower {
  const ElbExceptionThrower._();

  static Future<ElbException> validationError(
    Session session, {
    required ElbExceptionType exceptionType,
    required ElbValidationError message,
    String? field,
    String? databaseExceptionMessage,
    List<String>? artifacts,
  }) async {
    final userId = await CoreUtils.getCurrentUserId(session);
    final language = await UserSettingsHandler.fetchLocaleStringByUserId(
      session,
      userId,
    );
    final exceptionMessage = message.translate(language ?? '');
    throw ElbException(
      exceptionType: exceptionType,
      message: exceptionMessage,
      field: field,
      databaseExceptionMessage: databaseExceptionMessage,
      artifacts: artifacts,
    );
  }
}
