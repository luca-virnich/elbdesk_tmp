import 'package:ahoi_file_storage/ahoi_file_storage.dart';
import 'package:elbdesk_server/src/business/extensions/serverpod_extension.dart';
import 'package:elbdesk_server/src/business/mailer/mailer.dart';
import 'package:elbdesk_server/src/future_calls/check_win_updates_future_call.dart';
import 'package:elbdesk_server/src/future_calls/clean_up_recent_windows_future_call.dart';
import 'package:elbdesk_server/src/future_calls/listen_entity_notes_future_call.dart';
import 'package:elbdesk_server/src/future_calls/setup_custom_entity_keys_future_call.dart';
import 'package:elbdesk_server/src/future_calls/setup_global_settings_future_call.dart';
import 'package:elbdesk_server/src/future_calls/super_admin_refresh_future_call.dart';
import 'package:elbdesk_server/src/generated/endpoints.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/web/routes/ae_data_entry_webhook_route.dart';
import 'package:elbdesk_server/src/web/routes/root.dart';
import 'package:elbdesk_server/src/web/routes/service_webhook_route.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;

// This is the starting point of your Serverpod server. In most cases, you will
// only need to make additions to this file if you add future calls,  are
// configuring Relic (Serverpod's web-server), or need custom setup work.

enum FutureCalls {
  setupCustomEntityKeys,
  superAdminPermissionsRefreshCall,
  setupGlobalSettings,
  checkWinUpdates,
  cleanUpRecentWindows,
  listenEntityNotes,
}

Future<void> run(List<String> args) async {
  // Initialize Serverpod and connect it with your generated code.
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
    authenticationHandler: auth.authenticationHandler,
  );

  pod
    ..addMailer(
      Mailer(
        host: pod.getPassword('mailerHost')!,
        projectId: pod.getPassword('mailerProjectId')!,
        apiToken: pod.getPassword('mailerApiToken')!,
      ),
    )
    ..addCloudStorage(
      AhoiFileStorage(
        serverpod: pod,
        storageId: 'private',
        public: false,
        region: 'eu-central-1',
        bucket: pod.commandLineArgs.runMode,
      ),
    );

  auth.AuthConfig.set(
    auth.AuthConfig(
      // onUserCreated: (session, userInfo) async {
      //   final userId = (await session.authenticated)?.userId;

      //   final user = initialUser(
      //     userId: userId,
      //     sessionId: null,
      //     userInfoId: userInfo.id!,
      //     userInfo: userInfo,
      //   );
      //   final newUser = UserDTO.db.insertRow(session, user);

      //   print(newUser);
      // },
      sendValidationEmail: (session, email, validationCode) async {
        final result = await pod.mailer.sendValidationEmail(
          email: email,
          validationCode: validationCode,
        );
        return result;
      },
      sendPasswordResetEmail: (session, userInfo, validationCode) async {
        if (userInfo.email != null) {
          final result = await pod.mailer.sendPasswordResetEmail(
            email: userInfo.email!,
            validationCode: validationCode,
          );
          return result;
        }

        return false;
      },
    ),
  );

  pod
    ..registerFutureCall(
      SuperAdminPermissionsRefreshCall(),
      FutureCalls.superAdminPermissionsRefreshCall.name,
    )
    ..registerFutureCall(
      SetupCustomEntityKeysFutureCall(),
      FutureCalls.setupCustomEntityKeys.name,
    )
    ..registerFutureCall(
      SetupGlobalSettingsFutureCall(),
      FutureCalls.setupGlobalSettings.name,
    )
    ..registerFutureCall(
      CheckWinUpdatesFutureCall(),
      FutureCalls.checkWinUpdates.name,
    )
    ..registerFutureCall(
      CleanUpRecentWindowsFutureCall(),
      FutureCalls.cleanUpRecentWindows.name,
    )
    ..registerFutureCall(
      ListenEntityNotesFutureCall(),
      FutureCalls.listenEntityNotes.name,
    );

  // If you are using any future calls, they need to be registered here.
  // pod.registerFutureCall(ExampleFutureCall(), 'exampleFutureCall');

  // Setup a default page at the web root.
  pod.webServer.addRoute(RouteRoot(), '/');
  pod.webServer.addRoute(RouteRoot(), '/index.html');
  // Setup a webhook route for the fantasy service
  pod.webServer.addRoute(ServiceWebhookRoute(), '/service');
  pod.webServer.addRoute(
    AeDataEntryWebhookRoute(),
    '/artwork-quarantine/update-with-xml',
  );
  // Serve all files in the /static directory.
  pod.webServer.addRoute(
    RouteStaticDirectory(serverDirectory: 'static', basePath: '/'),
    '/*',
  );

  // Start the server.
  await pod.start();

  await pod.futureCallWithDelay(
    FutureCalls.superAdminPermissionsRefreshCall.name,
    null,
    const Duration(milliseconds: 1),
  );

  await pod.futureCallWithDelay(
    FutureCalls.setupCustomEntityKeys.name,
    null,
    const Duration(milliseconds: 1),
  );

  await pod.futureCallWithDelay(
    FutureCalls.setupGlobalSettings.name,
    null,
    const Duration(milliseconds: 1),
  );

  await pod.futureCallWithDelay(
    FutureCalls.cleanUpRecentWindows.name,
    null,
    const Duration(milliseconds: 1),
    identifier: FutureCalls.cleanUpRecentWindows.name,
  );

  await pod.futureCallWithDelay(
    FutureCalls.checkWinUpdates.name,
    null,
    const Duration(seconds: 10),
    identifier: FutureCalls.checkWinUpdates.name,
  );

  await pod.futureCallWithDelay(
    FutureCalls.listenEntityNotes.name,
    null,
    const Duration(milliseconds: 1),
    identifier: FutureCalls.listenEntityNotes.name,
  );
}
