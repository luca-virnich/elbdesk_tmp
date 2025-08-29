import 'dart:io';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:flutter/foundation.dart';

/// Mock data for GlobalSettings
///
/// Contains default values and mock configurations for development and testing
class GlobalSettingsMock {
  /// Mock default data import folder path
  ///
  /// Returns dynamic Downloads path for macOS debug mode, otherwise returns
  /// default endpoint
  static String get defaultDataImportFolderPath {
    if (kIsWeb) {
      return '';
    }

    if (useMockData) {
      // Get user's home directory and construct Downloads path
      final homeDir = Platform.environment['HOME'];
      if (homeDir != null) {
        return '$homeDir/Downloads/COE_Mock';
      }
    }

    return '';
  }

  /// Mock default artwork folder path
  ///
  /// Returns dynamic Downloads path for macOS debug mode, otherwise returns
  /// default endpoint
  static String get defaultArtworkFolderPath {
    if (kIsWeb) {
      return '';
    }

    if (useMockData) {
      // Get user's home directory and construct Downloads path
      final homeDir = Platform.environment['HOME'];
      if (homeDir != null) {
        return '$homeDir/Downloads/COE_Mock';
      }
    }

    return '';
  }
}
