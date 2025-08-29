import 'package:elbdesk_backend_core_server/src/modules/recent_windows/recent_window_handler.dart';
import 'package:elbdesk_server/server.dart';
import 'package:serverpod/serverpod.dart';

class CleanUpRecentWindowsFutureCall extends FutureCall {
  @override
  Future<void> invoke(Session session, SerializableModel? object) async {
    await session.serverpod.cancelFutureCall(
      FutureCalls.cleanUpRecentWindows.name,
    );

    final now = DateTime.now();
    final nextNight1Am = DateTime(now.year, now.month, now.day, 1, 0, 0)
        .add(const Duration(days: 1));

    await session.serverpod.futureCallAtTime(
      FutureCalls.cleanUpRecentWindows.name,
      null,
      nextNight1Am,
      identifier: FutureCalls.cleanUpRecentWindows.name,
    );

    await RecentWindowHandler.cleanUpRecentWindows(session);

    return;
  }
}
