import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';

extension AppVersionManifestFromJson on AppVersionManifest {
  static AppVersionManifest fromJson(Map<String, dynamic> json) {
    return AppVersionManifest(
      version: json['version'] as String,
      url: json['url'] as String,
      releaseDate: json['releaseDate'] as String,
      runMode: json['runMode'] as String,
      commit: json['commit'] as String,
      windowsVersion: json['windowsVersion'] as String,
      patch: json['patch'] as int,
      minor: json['minor'] as int,
      major: json['major'] as int,
    );
  }
}
