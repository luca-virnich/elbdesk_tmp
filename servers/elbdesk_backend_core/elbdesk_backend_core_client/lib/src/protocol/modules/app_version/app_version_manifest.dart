/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class AppVersionManifest implements _i1.SerializableModel {
  AppVersionManifest._({
    required this.version,
    required this.url,
    required this.releaseDate,
    required this.runMode,
    required this.commit,
    required this.windowsVersion,
    required this.patch,
    required this.minor,
    required this.major,
  });

  factory AppVersionManifest({
    required String version,
    required String url,
    required String releaseDate,
    required String runMode,
    required String commit,
    required String windowsVersion,
    required int patch,
    required int minor,
    required int major,
  }) = _AppVersionManifestImpl;

  factory AppVersionManifest.fromJson(Map<String, dynamic> jsonSerialization) {
    return AppVersionManifest(
      version: jsonSerialization['version'] as String,
      url: jsonSerialization['url'] as String,
      releaseDate: jsonSerialization['releaseDate'] as String,
      runMode: jsonSerialization['runMode'] as String,
      commit: jsonSerialization['commit'] as String,
      windowsVersion: jsonSerialization['windowsVersion'] as String,
      patch: jsonSerialization['patch'] as int,
      minor: jsonSerialization['minor'] as int,
      major: jsonSerialization['major'] as int,
    );
  }

  String version;

  String url;

  String releaseDate;

  String runMode;

  String commit;

  String windowsVersion;

  int patch;

  int minor;

  int major;

  /// Returns a shallow copy of this [AppVersionManifest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AppVersionManifest copyWith({
    String? version,
    String? url,
    String? releaseDate,
    String? runMode,
    String? commit,
    String? windowsVersion,
    int? patch,
    int? minor,
    int? major,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'version': version,
      'url': url,
      'releaseDate': releaseDate,
      'runMode': runMode,
      'commit': commit,
      'windowsVersion': windowsVersion,
      'patch': patch,
      'minor': minor,
      'major': major,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _AppVersionManifestImpl extends AppVersionManifest {
  _AppVersionManifestImpl({
    required String version,
    required String url,
    required String releaseDate,
    required String runMode,
    required String commit,
    required String windowsVersion,
    required int patch,
    required int minor,
    required int major,
  }) : super._(
          version: version,
          url: url,
          releaseDate: releaseDate,
          runMode: runMode,
          commit: commit,
          windowsVersion: windowsVersion,
          patch: patch,
          minor: minor,
          major: major,
        );

  /// Returns a shallow copy of this [AppVersionManifest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AppVersionManifest copyWith({
    String? version,
    String? url,
    String? releaseDate,
    String? runMode,
    String? commit,
    String? windowsVersion,
    int? patch,
    int? minor,
    int? major,
  }) {
    return AppVersionManifest(
      version: version ?? this.version,
      url: url ?? this.url,
      releaseDate: releaseDate ?? this.releaseDate,
      runMode: runMode ?? this.runMode,
      commit: commit ?? this.commit,
      windowsVersion: windowsVersion ?? this.windowsVersion,
      patch: patch ?? this.patch,
      minor: minor ?? this.minor,
      major: major ?? this.major,
    );
  }
}
