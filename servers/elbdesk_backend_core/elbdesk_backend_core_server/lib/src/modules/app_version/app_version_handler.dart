import 'dart:convert';

import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_backend_core_server/src/modules/app_version/app_version_endpoint.dart';
import 'package:http/http.dart' as http;

class AppVersionHandler {
  const AppVersionHandler._();

  static Future<AppVersionManifest> fetchLatestAppVersionManifest(
    String runMode,
  ) async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://packages.coe.elbdesk.cloud/windows/$runMode/latest.json',
        ),
        headers: {
          'Authorization':
              'Basic ${base64Encode(utf8.encode('appahoiadmin:TheOneAndOnlyAppAhoi'))}',
        },
      );

      final body = response.body;
      final manifest =
          AppVersionManifest.fromJson(jsonDecode(body) as Map<String, dynamic>);
      appVersionStreamController.add(manifest);
      return manifest;
    } catch (e) {
      // log this!
      throw ElbException(
        exceptionType: ElbExceptionType.unknown,
        message: 'Failed to fetch latest app version manifest',
      );
    }
  }
}
