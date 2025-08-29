import 'dart:async';

import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_backend_core_server/src/modules/app_version/app_version_handler.dart';
import 'package:serverpod/serverpod.dart';

final appVersionStreamController =
    StreamController<AppVersionManifest>.broadcast();

class AppVersionEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Stream<AppVersionManifest> watchAppVersionUpdates(
    Session session,
  ) async* {
    yield* appVersionStreamController.stream;
  }

  Future<AppVersionManifest> fetchLatestAppVersionManifest(
    Session session,
  ) async {
    final runMode = session.serverpod.runMode;

    final manifest =
        await AppVersionHandler.fetchLatestAppVersionManifest(runMode);

    return manifest;
  }

  Future<String> requestCredentials(Session session) async {
    return 'appahoiadmin:TheOneAndOnlyAppAhoi';
  }
}
