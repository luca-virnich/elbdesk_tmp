import 'dart:async';

import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/global_settings/global_settings_handler.dart';
import 'package:elbdesk_server/src/modules/core/global_settings/global_settings_utils.dart';
import 'package:serverpod/serverpod.dart';

/// Broadcasts global settings changes to all connected clients
final globalSettingsStreamController =
    StreamController<GlobalSettingsDTO>.broadcast();

/// Endpoint for managing application-wide global settings
class GlobalSettingsEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  // @override
  // Set<Scope> get requiredScopes => AppScope.admin.rwd;

  /// Stream to watch for global settings changes
  Stream<GlobalSettingsDTO> watchEntity(
    Session session, {
    required String sessionId,
    required int entityId,
    required bool releaseOnClose,
  }) async* {
    if (releaseOnClose) {
      session.addWillCloseListener(
        (session) {
          release(session, entityId: entityId, sessionId: sessionId);
        },
      );
    }

    yield* globalSettingsStreamController.stream
        .where((event) => event.id == entityId)
        .map((event) => event);
  }

  Stream<GlobalSettingsDTO> watch(
    Session session,
  ) async* {
    yield* globalSettingsStreamController.stream;
  }

  /// Fetches the first global settings directly from the database
  Future<GlobalSettingsDTO?> fetchSettings(Session session) async {
    return GlobalSettingsDTO.db.findFirstRow(session);
  }

  /// Fetch by id
  Future<GlobalSettingsDTO?> fetchById(
    Session session,
    int id,
  ) async {
    return GlobalSettingsDTO.db.findById(
      session,
      id,
    );
  }

  /// Fetch and lock global settings for editing
  Future<GlobalSettingsDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return GlobalSettingsHandler.fetchAndLock(
      session,
      id: id,
      sessionId: editingSessionId,
    );
  }

  /// Release lock on global settings
  Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    await GlobalSettingsHandler.release(
      session,
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  /// Updates the global settings and notifies all clients
  Future<GlobalSettingsDTO> update(
    Session session, {
    required GlobalSettingsDTO settings,
    required String sessionId,
    required bool release,
  }) async {
    return GlobalSettingsHandler.update(
      session,
      settings: settings,
      sessionId: sessionId,
      release: release,
    );
  }

  /// Find all entity locks for global settings
  Future<List<EntityLockDTO>> findEntityLocks(Session session) async {
    final entities = await GlobalSettingsDTO.db.find(
      session,
      where: (t) =>
          t.editingSession.notEquals(null as String?) &
          t.editingSession.notEquals(''),
    );

    return entities
        .map(
          (e) => EntityLockDTO(
            tableType: GlobalSettingsUtils.tableType.name,
            entityId: e.id!,
            editingSessionId: e.editingSession!,
            lockedAt: e.editingSince!,
            userId: e.editingById,
          ),
        )
        .toList();
  }
}
