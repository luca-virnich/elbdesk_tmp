import 'dart:io';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:flutter/foundation.dart';

/// The run mode of the app.
final appRunMode = RunMode.fromString(const String.fromEnvironment('RUN_MODE'));

final bool isTestEnv = appRunMode == RunMode.test;

final bool useMockData =
    !kIsWeb && (isTestEnv || kDebugMode) && (Platform.isMacOS);

/// The version of the app.
const appVersion = String.fromEnvironment(
  'APP_VERSION',
  // defaultValue: '0.0.0-${appRunMode.key}',
);
