import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';

class RecentWindowHandler {
  const RecentWindowHandler._();

  static Future<void> cleanUpRecentWindows(Session session) async {
    final recentWindows = await RecentWindowDTO.db.find(
      session,
      where: (t) =>
          t.timestamp < DateTime.now().subtract(const Duration(days: 30)),
    );

    await RecentWindowDTO.db.delete(session, recentWindows);
  }
}
