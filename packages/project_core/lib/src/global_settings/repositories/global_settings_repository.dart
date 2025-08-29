import 'package:elbdesk_backend_core_client/elbdesk_backend_core_client.dart';
import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_core/src/global_settings/models/global_settings.dart';

/// Repository for managing global settings
class GlobalSettingsRepository {
  /// Global Settings Repository constructor
  GlobalSettingsRepository({
    required this.ref,
    required this.endpoint,
  });

  final Ref ref;

  /// Global Settings Endpoint
  final EndpointGlobalSettings endpoint;

  /// Fetches the first global settings object
  Future<GlobalSettings> fetchSettings() async {
    final dto = await endpoint.fetchSettings();
    final settings = dto != null ? GlobalSettings.fromDTO(dto) : null;
    if (settings == null) {
      throw ElbException(
        exceptionType: ElbExceptionType.notFound,
        message: 'Global settings not found',
      );
    }
    return settings;
  }

  /// Fetches global settings by ID
  Future<GlobalSettings?> fetchById(int id) async {
    final dto = await endpoint.fetchById(id);
    return dto != null ? GlobalSettings.fromDTO(dto) : null;
  }

  /// Fetch and lock global settings for editing
  Future<GlobalSettings?> fetchAndLock(int entityId, String sessionId) async {
    final dto = await endpoint.fetchAndLock(
      id: entityId,
      editingSessionId: sessionId,
    );
    return dto != null ? GlobalSettings.fromDTO(dto) : null;
  }

  /// Release lock on global settings
  Future<void> release(int entityId, String sessionId) async {
    await endpoint.release(
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  /// Updates the global settings
  Future<GlobalSettings> update({
    required GlobalSettings entity,
    required bool release,
    required String sessionId,
  }) async {
    final updatedDto = await endpoint.update(
      settings: entity.toDTO(),
      sessionId: sessionId,
      release: release,
    );
    return GlobalSettings.fromDTO(updatedDto);
  }
}
