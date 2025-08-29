import 'dart:async';
import 'dart:io';

import 'package:elbdesk_app/app/app_updater/startup_updater.dart';
import 'package:elbdesk_app/init/main_app.dart';
import 'package:elbdesk_app/main.dart';
import 'package:elbdesk_app/window_registration.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_window_manager/elbdesk_window_manager.dart'
    hide windowManager;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_single_instance/flutter_single_instance.dart' as si;
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:project_core/project_core.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

enum _MainWindowType {
  main,
  updater,
}

Future<void> initApp() async {
  usePathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await _intializeServerpod();
  ElbDeskCore.initialize(
    client: serverpodClient,
    fieldSuggestionFunction: ({
      required String tableType,
      required String fieldKey,
      required String searchTerm,
    }) async {
      return serverpodClient.fieldSuggestion.find(
        tableType: tableType,
        fieldKey: fieldKey,
        searchTerm: searchTerm,
      );
    },
  );
  await _initializeErrorHandling();

  final isAppAlreadyRunning = await _isAppAlreadyRunning();

  if (isAppAlreadyRunning) {
    // kill if already running
    exit(0);
  }

  if (kIsWeb || kIsWasm || kDebugMode) {
    await _launchMainApp();
    return;
  }

  final hasUpdate = await _updateAvailable();

  if (hasUpdate) {
    try {
      await _launchUpdater();
    } catch (e) {
      await _launchMainApp();
    }
  } else {
    await _launchMainApp();
  }
}

Future<void> _launchMainApp() async {
  await SharedPrefs.init();
  await initializeElbDeskWindowManager(
    windowRegistrations: windowRegistry,
    sharedPreferences: SharedPrefs.instance,
  );
  if (!kIsWeb && !kIsWasm) {
    await _configureDesktopWindow(_MainWindowType.main);
  }
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

Future<void> _launchUpdater() async {
  if (!kIsWeb && !kIsWasm) {
    await _configureDesktopWindow(_MainWindowType.updater);
  }

  try {
    final version = await serverpodClient.modules.core.appVersion
        .fetchLatestAppVersionManifest();

    runApp(
      ProviderScope(
        child: StartupUpdater(
          url: Uri.parse(version.url),
        ),
      ),
    );
  } catch (e) {
    rethrow;
  }
}

Future<void> _intializeServerpod() async {
  sessionManager = SessionManager(caller: serverpodClient.modules.auth);
  await sessionManager.initialize();
}

Future<void> _initializeErrorHandling() async {
  final flutterLogRepo =
      FlutterLogRepository(endpoint: serverpodClient.modules.core.flutterLog);

  FlutterError.onError = (details) async {
    // Print the error to the console like normal behavior
    FlutterError.presentError(details);
    if (kDebugMode) return;

    try {
      // Collect information if available
      String? information;
      if (details.informationCollector != null) {
        information = details.informationCollector!()
            .map((node) => node.toString())
            .join('\n');
      }

      final log = FlutterLog(
        id: null, // Will be set by server
        time: DateTime.now(),
        // FlutterErrorDetails properties
        context: details.context?.toString(),
        exception: details.exception.toString(),
        flutterLibrary: details.library,
        stack: details.stack?.toString(),
        silent: details.silent,
        information: information,

        // Additional context
        platform: Platform.operatingSystem,
        appVersion: appVersion,
        buildNumber: null,
        userId: sessionManager.signedInUser?.id,
        deviceId: null,
      );

      unawaited(flutterLogRepo.create(log));
    } catch (e) {
      debugPrint('Failed to log flutter error: $e');
    }
  };
}

Future<void> _configureDesktopWindow(_MainWindowType mainWindowType) async {
  if (kIsWeb || kIsWasm) {
    return;
  }
  if (Platform.isAndroid || Platform.isIOS) {
    return;
  }
  await windowManager.ensureInitialized();

  if (mainWindowType == _MainWindowType.updater) {
    final windowOptions = WindowOptions(
      title: _getWindowTitle(),
      fullScreen: false,
      minimumSize: const Size(400, 400),
      size: const Size(400, 400),
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      center: true,
      titleBarStyle: TitleBarStyle.hidden,
      windowButtonVisibility: false,
      alwaysOnTop: true,
    );

    await windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.setClosable(false);

      await windowManager.show();
      await windowManager.focus();
    });
  }

  if (mainWindowType == _MainWindowType.main) {
    final appWindowSize = SharedPrefs.getAppWindowSize();
    final appWindowPosition = SharedPrefs.getAppWindowPosition();

    // we have to ensure that we can change the minimum size afterwards,
    // so we have to clamp the width and height to a minimum of 1366 and 768
    // const minimumSize = Size(1366, 768);
    const minimumSize = Size(300, 300);
    final width =
        appWindowSize?.width.clamp(minimumSize.width, double.infinity) ?? 1920;
    final height =
        appWindowSize?.height.clamp(minimumSize.height, double.infinity) ??
            1080;

    final windowOptions = WindowOptions(
      title: _getWindowTitle(),
      fullScreen: false,
      minimumSize: minimumSize,
      size: Size(width, height),
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.hidden,
      windowButtonVisibility: false,
    );

    await windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager
          .setPosition(appWindowPosition ?? const Offset(10, 10));

      await windowManager.setClosable(true);

      await windowManager.show();
      await windowManager.focus();
    });
  }
}

String _getWindowTitle() => switch (appRunMode) {
      RunMode.prod => elbdeskProjectName.fixed,
      _ => '${elbdeskProjectName.fixed} (${appRunMode.readable})',
    };

Future<bool> _isAppAlreadyRunning() async {
  if (kIsWeb || kIsWasm) return false;

  if (Platform.isAndroid || Platform.isIOS) return false;

  await si.windowManager.ensureInitialized();
  final isFirstInstance = await si.FlutterSingleInstance().isFirstInstance();

  if (!isFirstInstance) {
    debugPrint('App is already running');
    final err = await si.FlutterSingleInstance().focus();
    if (err != null) {
      debugPrint('Error focusing running instance: $err');
    }
    return true;
  }

  return false;
}

Future<bool> _updateAvailable() async {
  try {
    final latestVersion = await serverpodClient.modules.core.appVersion
        .fetchLatestAppVersionManifest();
    return appVersion != latestVersion.version;
  } catch (e) {
    return false;
  }
}
