import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/generic_crud.dart';
import 'package:elbdesk_server/src/modules/crm/app_client/endpoints/app_client_endpoint.dart';
import 'package:serverpod/serverpod.dart';

class AppClientHandler {
  const AppClientHandler._();

  static const _tableType = TableType.appClient;

  static Future<AppClientDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return GenericCrud.fetchAndLockEntity<AppClientDTO>(
      session,
      id: id,
      editingSessionId: editingSessionId,
      fetchById: _fetchById,
      tableType: _tableType,
      tableName: AppClientDTOTable().tableName,
      streamController: appClientStreamController,
    );
  }

  static Future<AppClientDTO?> _fetchWithoutRelations(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return AppClientDTO.db.findById(
      session,
      id,
      transaction: transaction,
    );
  }

  static Future<AppClientDTO> update(
    Session session, {
    required AppClientDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    return GenericCrud.update(
      session,
      fetchById: _fetchById,
      sessionId: sessionId,
      newEntity: entity,
      updateEntity: _updateRow,
      tableType: _tableType,
      streamController: appClientStreamController,
      release: release,
      logFields: [
        // AppClientField.description,
        // AppClientField.contact,
        // AppClientField.automationEngine,
        // AppClientField.employees,
      ],
    );
  }

  static Future<AppClientDTO?> _fetchById(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return AppClientDTO.db.findById(
      session,
      id,
      include: AppClientDTO.include(
        contact: ContactDTO.include(),
        // employees: AppUserDTO.includeList(),
      ),
      transaction: transaction,
    );
  }

  static Future<AppClientDTO> _deleteDraft(
    Session session,
    AppClientDTO appClient,
    Transaction transaction,
  ) async {
    return AppClientDTO.db
        .deleteRow(session, appClient, transaction: transaction);
  }

  static Future<AppClientDTO> _updateRow(
    Session session,
    AppClientDTO appClient,
    Transaction transaction,
  ) async {
    return AppClientDTO.db.updateRow(
      session,
      appClient,
      transaction: transaction,
    );
  }

  static Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    await GenericCrud.releaseEntity<AppClientDTO>(
      session,
      entityId: entityId,
      sessionId: sessionId,
      fetchById: _fetchById,
      updateEntity: _updateRow,
      tableType: _tableType,
      streamController: appClientStreamController,
      deleteDraft: _deleteDraft,
    );
  }
}
