import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';

class UserSettingsHandler {
  const UserSettingsHandler._();

  static Future<String?> fetchLocaleStringByUserId(
    Session session,
    int userId,
  ) async {
    final language = await UserSettingsDTO.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId),
    );
    return language?.appLocale.name;
  }
}
