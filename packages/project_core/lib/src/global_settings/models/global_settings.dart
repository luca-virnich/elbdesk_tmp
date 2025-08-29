import 'dart:convert';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_core/src/global_settings/models/global_settings_mock.dart';

part 'global_settings.freezed.dart';
part 'global_settings.g.dart';

/// Global Settings
///
/// Represents global settings for the application - Set by admin
@freezed
class GlobalSettings with _$GlobalSettings, HasMetaData {
  const factory GlobalSettings({
    required GlobalSettingsData data,
    required DataMeta meta,
  }) = _GlobalSettings;

  factory GlobalSettings.fromJson(Map<String, dynamic> json) =>
      _$GlobalSettingsFromJson(json);

  factory GlobalSettings.initial() {
    return GlobalSettings(
      data: GlobalSettingsData.initial(),
      meta: DataMeta.initial(),
    );
  }

  const GlobalSettings._();

  factory GlobalSettings.fromDTO(GlobalSettingsDTO dto) {
    return GlobalSettings(
      data: GlobalSettingsData.fromJson(
        jsonDecode(dto.globalSettingsJson) as Map<String, dynamic>,
      ),
      meta: DataMeta.fromDTO(dto),
    );
  }

  GlobalSettingsDTO toDTO() {
    return GlobalSettingsDTO(
      id: meta.id,
      globalSettingsJson: jsonEncode(data.toJson()),
      createdAt: meta.createdAt!,
      createdById: meta.createdById,
      lastModifiedAt: meta.lastModifiedAt,
      lastModifiedById: meta.lastModifiedById,
      deletedAt: meta.deletedAt,
      deletedById: meta.deletedById,
      editingById: meta.editingById,
      editingSince: meta.editingSince,
      isDraft: meta.isDraft,
      editingSession: meta.editingSessionId,
    );
  }
}

@freezed
class GlobalSettingsData with _$GlobalSettingsData {
  const factory GlobalSettingsData({
    required String aeEndpointPath,
    required String? pdfViewerUrl,
    required String dataImportFolderPath,
    required String artworkFolderPath,
  }) = _GlobalSettingsData;

  const GlobalSettingsData._();

  factory GlobalSettingsData.fromJson(Map<String, dynamic> json) =>
      _$GlobalSettingsDataFromJson(json);

  factory GlobalSettingsData.initial() {
    return GlobalSettingsData(
      aeEndpointPath: '',
      pdfViewerUrl: '',
      dataImportFolderPath: GlobalSettingsMock.defaultDataImportFolderPath,
      artworkFolderPath: GlobalSettingsMock.defaultArtworkFolderPath,
    );
  }
}
