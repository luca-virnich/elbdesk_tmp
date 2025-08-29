import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

final Client serverpodClient = Client(
  appRunMode.apiUrl,
  authenticationKeyManager: FlutterAuthenticationKeyManager(
    runMode: appRunMode.key,
  ),
)..connectivityMonitor = FlutterConnectivityMonitor();
