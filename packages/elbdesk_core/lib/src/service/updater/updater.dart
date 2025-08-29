import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_core/src/service/updater/models/update_manifest.dart';
import 'package:flutter/foundation.dart';

class Updater {
  static Future<Uri?> checkForUpdates() async {
    final manifest = await UpdateDownloader.fetchLatestManifest();
    if (manifest.version != appVersion) {
      return Uri.parse(manifest.url);
    }
    return null;
  }

  static Future<void> update({
    required Uri url,
    void Function(int, int)? onReceiveProgress,
  }) async {
    final fileName = url.pathSegments.last;
    final tempDir = Directory.systemTemp.createTempSync();
    final tempFile = File('${tempDir.path}\\$fileName');

    // TODO: Maybe reimplement this method with persistant directories
    // instead of unique ones
    // Check if file already exists
    // if (await tempFile.exists()) {
    //   print('Update file already exists at: ${tempFile.path}');
    //   await Installer.install(msixPath: tempFile.path);
    //   return;
    // }

    final bytes = await UpdateDownloader.download(
      url: url,
      onReceiveProgress: onReceiveProgress,
    );

    await tempFile.writeAsBytes(bytes);
    await Installer.install(msixPath: tempFile.path);
  }
}

class Installer {
  static Future<void> install({
    required String msixPath,
  }) async {
    try {
      final process = await Process.start(
        'explorer.exe',
        [msixPath],
        mode: ProcessStartMode.normal,
      );

      // Capture and print stdout
      process.stdout.transform(utf8.decoder).listen((data) {
        debugPrint('stdout: $data');
      });

      // Capture and print stderr
      process.stderr.transform(utf8.decoder).listen((data) {
        debugPrint('stderr: $data');
      });

      // Wait for process to complete
      final exitCode = await process.exitCode;
      debugPrint('Process exited with code: $exitCode');
    } catch (e) {
      debugPrint('Error updating app: $e');
      rethrow;
    }
  }
}

class UpdateDownloader {
  static Future<UpdateManifest> fetchLatestManifest({
    Dio? client,
  }) async {
    client = client ?? Dio();
    final basicAuth =
        'Basic ${base64Encode(utf8.encode('appahoiadmin:TheOneAndOnlyAppAhoi'))}';

    final url =
        'https://packages.coe.elbdesk.cloud/windows/${appRunMode.key}/latest.json';
    try {
      final response = await client.getUri<Map<String, dynamic>>(
        Uri.parse(url),
        options: Options(
          headers: {
            'Authorization': basicAuth,
          },
        ),
      );
      // response: "version": "0.0.4-test",
      final v = response.data?['version'];
      final installedVersion = appVersion.split('-').first;
      // compare to insallted version from pubspec.yaml
      // will return 0.0.4

      if (response.statusCode != 200) {
        throw Exception(
          'Failed to fetch latest manifest with status code: ${response.statusCode} - ${response.statusMessage}',
        );
      }
      if (response.data == null) {
        throw Exception(
          'Failed to fetch latest manifest with status code: ${response.statusCode} - ${response.statusMessage}',
        );
      }
      return UpdateManifest.fromJson(response.data!);
    } catch (e) {
      rethrow;
    } finally {
      client.close();
    }
  }

  static Future<Uint8List> download({
    required Uri url,
    void Function(int, int)? onReceiveProgress,
    Dio? client,
  }) async {
    client = client ?? Dio();

    // Add basic auth credentials
    final basicAuth =
        'Basic ${base64Encode(utf8.encode('appahoiadmin:TheOneAndOnlyAppAhoi'))}';

    try {
      final response = await client.getUri<Uint8List>(
        url,
        options: Options(
          responseType: ResponseType.bytes,
          headers: {
            'Authorization': basicAuth,
          },
        ),
        onReceiveProgress: onReceiveProgress,
      );

      if (response.statusCode == 200) {
        if (response.data == null) {
          throw Exception(
            'Failed to download file with status code: ${response.statusCode} - ${response.statusMessage}',
          );
        }
        return response.data!;
      }
      throw Exception(
        'Failed to download file with status code: ${response.statusCode} - ${response.statusMessage} - ${response.data}',
      );
    } catch (e) {
      rethrow;
    } finally {
      client.close();
    }
  }
}
