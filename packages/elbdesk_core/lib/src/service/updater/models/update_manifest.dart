import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_manifest.freezed.dart';
part 'update_manifest.g.dart';

@freezed
class UpdateManifest with _$UpdateManifest {
  const factory UpdateManifest({
    required String version,
    required String url,
    required String releaseDate,
    required String runMode,
    required String commit,
    required String windowsVersion,
  }) = _UpdateManifest;

  factory UpdateManifest.fromJson(Map<String, dynamic> json) =>
      _$UpdateManifestFromJson(json);
}
