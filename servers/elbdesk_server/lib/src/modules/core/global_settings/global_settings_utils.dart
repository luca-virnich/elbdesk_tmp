import 'dart:convert';

import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/entity_log/entity_log_endpoint.dart';

/// Utility class for GlobalSettings operations
class GlobalSettingsUtils {
  const GlobalSettingsUtils._();

  /// Table type for GlobalSettings
  static const tableType = TableType.globalSettings;

  /// Include pattern for GlobalSettings relations
  static GlobalSettingsDTOInclude get includeAll => GlobalSettingsDTO.include();

  /// Get log fields for tracking changes
  static List<LogField<GlobalSettingsDTO>> getLogFields() {
    return GlobalSettingsField.values
        .map((field) {
          switch (field) {
            case GlobalSettingsField.id:
              return LogField<GlobalSettingsDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.id?.toString() ?? '',
              );
            case GlobalSettingsField.outputPath:
              return LogField<GlobalSettingsDTO>(
                fieldName: field.name,
                getValue: (entity) {
                  try {
                    final data = jsonDecode(entity.globalSettingsJson)
                        as Map<String, dynamic>;
                    return data['dataImportOutputPath'] as String? ?? '';
                  } catch (e) {
                    return '';
                  }
                },
              );
            case GlobalSettingsField.aeEndpointPath:
              return LogField<GlobalSettingsDTO>(
                fieldName: field.name,
                getValue: (entity) {
                  try {
                    final data = jsonDecode(entity.globalSettingsJson)
                        as Map<String, dynamic>;
                    return data['aeEndpointPath'] as String? ?? '';
                  } catch (e) {
                    return '';
                  }
                },
              );
            // Skip metadata fields as they are typically not logged
            case GlobalSettingsField.createdAt:
            case GlobalSettingsField.createdBy:
            case GlobalSettingsField.lastModifiedAt:
            case GlobalSettingsField.lastModifiedBy:
            case GlobalSettingsField.deletedAt:
            case GlobalSettingsField.isDraft:
              return null;
          }
        })
        .whereType<LogField<GlobalSettingsDTO>>()
        .toList();
  }
}
