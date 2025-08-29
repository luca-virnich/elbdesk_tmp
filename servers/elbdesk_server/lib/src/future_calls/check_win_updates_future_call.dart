import 'package:elbdesk_backend_core_server/src/modules/app_version/app_version_handler.dart';
import 'package:elbdesk_server/server.dart';
import 'package:serverpod/serverpod.dart';

class CheckWinUpdatesFutureCall extends FutureCall {
  @override
  Future<void> invoke(Session session, SerializableModel? object) async {
    await session.serverpod.cancelFutureCall(
      FutureCalls.checkWinUpdates.name,
    );

    final runMode = session.serverpod.runMode;
    if (runMode == 'development') {
      return;
    }

    await session.serverpod.futureCallWithDelay(
      FutureCalls.checkWinUpdates.name,
      null,
      const Duration(minutes: 1),
      identifier: FutureCalls.checkWinUpdates.name,
    );

    await AppVersionHandler.fetchLatestAppVersionManifest(runMode);

    return;
  }
}
