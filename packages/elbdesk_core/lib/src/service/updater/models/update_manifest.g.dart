// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_manifest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateManifestImpl _$$UpdateManifestImplFromJson(Map<String, dynamic> json) =>
    _$UpdateManifestImpl(
      version: json['version'] as String,
      url: json['url'] as String,
      releaseDate: json['releaseDate'] as String,
      runMode: json['runMode'] as String,
      commit: json['commit'] as String,
      windowsVersion: json['windowsVersion'] as String,
    );

Map<String, dynamic> _$$UpdateManifestImplToJson(
        _$UpdateManifestImpl instance) =>
    <String, dynamic>{
      'version': instance.version,
      'url': instance.url,
      'releaseDate': instance.releaseDate,
      'runMode': instance.runMode,
      'commit': instance.commit,
      'windowsVersion': instance.windowsVersion,
    };
