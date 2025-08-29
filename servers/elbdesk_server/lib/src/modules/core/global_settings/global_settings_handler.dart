import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/generic_crud.dart';
import 'package:elbdesk_server/src/modules/core/global_settings/endpoints/global_settings_endpoint.dart';
import 'package:elbdesk_server/src/modules/core/global_settings/global_settings_utils.dart';
import 'package:serverpod/serverpod.dart';

/// Handler class for GlobalSettings business logic
class GlobalSettingsHandler {
  const GlobalSettingsHandler._();

  /// Fetches GlobalSettings by ID with relations
  static Future<GlobalSettingsDTO?> _fetchById(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return GlobalSettingsDTO.db.findById(
      session,
      id,
      transaction: transaction,
    );
  }

  static Future<GlobalSettingsDTO?> _fetchWithoutRelations(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return GlobalSettingsDTO.db.findById(session, id, transaction: transaction);
  }

  /// Updates GlobalSettings row
  static Future<GlobalSettingsDTO> updateRow(
    Session session,
    GlobalSettingsDTO entity,
    Transaction transaction,
  ) async {
    return GlobalSettingsDTO.db.updateRow(
      session,
      entity,
      transaction: transaction,
    );
  }

  /// Fetches GlobalSettings by ID without relations
  static Future<GlobalSettingsDTO?> fetchByIdWithoutRelations(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return GlobalSettingsDTO.db.findById(session, id, transaction: transaction);
  }

  /// Deletes draft GlobalSettings
  static Future<GlobalSettingsDTO?> deleteDraft(
    Session session,
    GlobalSettingsDTO entity,
    Transaction transaction,
  ) async {
    return GlobalSettingsDTO.db.deleteRow(
      session,
      entity,
      transaction: transaction,
    );
  }

  /// Updates GlobalSettings with validation and broadcasting
  static Future<GlobalSettingsDTO> update(
    Session session, {
    required GlobalSettingsDTO settings,
    required String sessionId,
    required bool release,
  }) async {
    return GenericCrud.update(
      session,
      fetchById: _fetchById,
      sessionId: sessionId,
      newEntity: settings,
      updateEntity: updateRow,
      tableType: GlobalSettingsUtils.tableType,
      streamController: globalSettingsStreamController,
      release: release,
      logFields: GlobalSettingsUtils.getLogFields(),
    );
  }

  /// Fetches and locks GlobalSettings for editing
  static Future<GlobalSettingsDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String sessionId,
  }) async {
    return GenericCrud.fetchAndLockEntity<GlobalSettingsDTO>(
      session,
      id: id,
      tableType: GlobalSettingsUtils.tableType,
      editingSessionId: sessionId,
      fetchById: _fetchById,
      tableName: GlobalSettingsDTOTable().tableName,
      streamController: globalSettingsStreamController,
    );
  }

  /// Releases lock on GlobalSettings
  static Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    await GenericCrud.releaseEntity<GlobalSettingsDTO>(
      session,
      entityId: entityId,
      sessionId: sessionId,
      fetchById: _fetchById,
      updateEntity: updateRow,
      tableType: GlobalSettingsUtils.tableType,
      streamController: globalSettingsStreamController,
      deleteDraft: deleteDraft,
    );
  }
}
