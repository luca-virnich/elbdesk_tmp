// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GlobalSettingsImpl _$$GlobalSettingsImplFromJson(Map<String, dynamic> json) =>
    _$GlobalSettingsImpl(
      data: GlobalSettingsData.fromJson(json['data'] as Map<String, dynamic>),
      meta: DataMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GlobalSettingsImplToJson(
        _$GlobalSettingsImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'meta': instance.meta,
    };

_$GlobalSettingsDataImpl _$$GlobalSettingsDataImplFromJson(
        Map<String, dynamic> json) =>
    _$GlobalSettingsDataImpl(
      aeEndpointPath: json['aeEndpointPath'] as String,
      pdfViewerUrl: json['pdfViewerUrl'] as String?,
      dataImportFolderPath: json['dataImportFolderPath'] as String,
      artworkFolderPath: json['artworkFolderPath'] as String,
    );

Map<String, dynamic> _$$GlobalSettingsDataImplToJson(
        _$GlobalSettingsDataImpl instance) =>
    <String, dynamic>{
      'aeEndpointPath': instance.aeEndpointPath,
      'pdfViewerUrl': instance.pdfViewerUrl,
      'dataImportFolderPath': instance.dataImportFolderPath,
      'artworkFolderPath': instance.artworkFolderPath,
    };
