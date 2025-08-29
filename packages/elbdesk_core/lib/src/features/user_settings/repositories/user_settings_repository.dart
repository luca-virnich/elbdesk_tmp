import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_settings_repository.g.dart';

/// Fetch User Settings Provider
@riverpod
Future<UserSettings> fetchUserSettings(
  Ref ref,
) async {
  final repo = ref.watch(userSettingsRepositoryProvider);

  return repo.fetchUserSettings();
}

/// Update User Settings Provider
@riverpod
UserSettingsRepository userSettingsRepository(Ref ref) {
  final endpoint = EndpointUserSettings(ElbDeskCore.client);
  return UserSettingsRepository(
    endpoint: endpoint,
  );
}

/// User Settings Repository
class UserSettingsRepository {
  /// User Settings Repository constructor
  UserSettingsRepository({required this.endpoint});

  /// User Settings Endpoint
  final EndpointUserSettings endpoint;

  /// Fetch User Settings
  ///
  /// Fetches user settings from server, returns initial settings if none exist
  Future<UserSettings> fetchUserSettings() async {
    final dto = await endpoint.fetchUserSettings();
    return UserSettings.fromDTO(dto);
  }

  /// Update User Settings
  ///
  /// Persists user settings to server
  Future<void> updateUserSettings(UserSettings userSettings) async {
    try {
      await endpoint.upsertUserSettings(userSettings.toDTO());
    } catch (e) {
      debugPrint('Error updating user settings: $e');
    }
  }

  /// Save Collapsible to Server
  Future<void> saveCollapsibleToServer(
    String collapsibleIdentifier,
    bool isCollapsed,
  ) async {
    await endpoint.updateCollapsibleIdentifierSqlSafe(
      collapsibleIdentifier,
      isCollapsed,
    );
  }

  /// Reset Collapsible to Server
  Future<void> resetCollapsibleIdentifier() async {
    await endpoint.resetCollapsibleIdentifier();
  }

  /// Save Recent Window Filter Values to Server
  Future<void> saveRecentWindowFilterValues(
    String floatingWindowType,
    bool isVisible,
  ) async {
    await endpoint.updateRecentWindowFilterValues(
      floatingWindowType,
      isVisible,
    );
  }

  /// Save Ribbon Config to Server
  Future<void> saveRibbonConfigToServer(
    Map<String, RibbonConfig> ribbonConfig,
  ) async {
    final ribbonConfigDTO = ribbonConfig.map(
      (key, value) => MapEntry(
        key,
        value.toDTO(),
      ),
    );
    await endpoint.saveRibbonConfigToServer(ribbonConfigDTO);
  }
}
