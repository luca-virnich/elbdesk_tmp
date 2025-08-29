import 'dart:io';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/ae_pilot/services/ae_upload_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

/// Mock data and utilities for AE Upload functionality
///
/// Contains mock responses and file handling for development and testing
class AEUploadMock {
  /// Saves a zip file to the Downloads directory in debug mode
  ///
  /// Only works on macOS in debug mode, otherwise does nothing
  static Future<void> saveZipToDownloads({
    required List<int> zipBytes,
    required String fileName,
  }) async {
    if (useMockData) {
      try {
        final downloadFolder = await getDownloadsDirectory();
        final zipPath = path.join(downloadFolder!.path, fileName);
        final file = File(zipPath);

        await file.writeAsBytes(zipBytes);
      } catch (e) {
        debugPrint('Failed to save zip to path: $e');
      }
    }
  }

  /// Returns a mock response for testing purposes
  ///
  /// Should only be used in debug mode
  static Future<AEUploadResponse> getMockResponse() async {
    // * Local mock response
    await Future<void>.delayed(const Duration(seconds: 1));

    // Get download folder from user:
    final downloadFolder = await getDownloadsDirectory();

    const testDataPath = 'Coe_Testdaten';

    final thumbnailPath =
        path.join(downloadFolder!.path, testDataPath, 'coe-logo_1024.png');
    final xmlPath =
        path.join(downloadFolder.path, testDataPath, 'E5057753-003_ML_ap+.xml');

    return AEUploadResponse(
      thumbnailPath: thumbnailPath,
      xmlPath: xmlPath,
    );

    // * Server mock response
    // await Future.delayed(const Duration(seconds: 1));
    // return AEUploadResponse(
    //   thumbnailPath:
    //       '//coefs.office.coe-bremen.de/daten/temptasks/mock-id/dateneingang.jpg',
    //   xmlPath:
    //       '//coefs.office.coe-bremen.de/daten/temptasks/mock-id/dateneingang.xml',
    // );
  }
}

// Instructions:

// content-type: multipart/form-data 
// key: file
// value: PDF
// {"pathes":{"thumbnail":"//coefs.office.coe-bremen.de/daten/temptasks/0f0525c8-932b-452a-a14f-a74cfe263df6/dateneingang.jpg",
// "xmpinfo":"//coefs.office.coe-bremen.de/daten/temptasks/0f0525c8-932b-452a-a14f-a74cfe263df6/dateneingang.xml"}}