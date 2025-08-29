import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/generic_crud.dart';
import 'package:elbdesk_server/src/modules/prepress/color/endpoints/artwork_color_endpoint.dart';
import 'package:elbdesk_server/src/modules/prepress/color/endpoints/artwork_color_utils.dart';
import 'package:serverpod/serverpod.dart';

class ArtworkColorHandler {
  const ArtworkColorHandler._();

  static Future<ArtworkColorDTO?> _fetchWithoutRelations(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return ArtworkColorDTO.db.findById(session, id, transaction: transaction);
  }

  static Future<ArtworkColorDTO?> _fetchById(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return ArtworkColorDTO.db.findById(
      session,
      id,
      include: ArtworkColorUtils.includeAll,
      transaction: transaction,
    );
  }

  static Future<ArtworkColorDTO> _updateRow(
    Session session,
    ArtworkColorDTO entity,
    Transaction transaction,
  ) async {
    return ArtworkColorDTO.db
        .updateRow(session, entity, transaction: transaction);
  }

  static Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    await GenericCrud.releaseEntity<ArtworkColorDTO>(
      session,
      entityId: entityId,
      sessionId: sessionId,
      fetchById: _fetchById,
      updateEntity: _updateRow,
      tableType: ArtworkColorUtils.tableType,
      streamController: colorStreamController,
      deleteDraft: null,
    );
  }

  static Future<ArtworkColorDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return GenericCrud.fetchAndLockEntity<ArtworkColorDTO>(
      session,
      id: id,
      tableType: ArtworkColorUtils.tableType,
      editingSessionId: editingSessionId,
      fetchById: _fetchById,
      tableName: ArtworkColorDTOTable().tableName,
      streamController: colorStreamController,
    );
  }

  static Future<bool> delete(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    return GenericCrud.markEntityAsDeleted<ArtworkColorDTO>(
      session,
      id: entityId,
      sessionId: sessionId,
      fetchWithoutRelations: _fetchWithoutRelations,
      updateRow: _updateRow,
      tableType: ArtworkColorUtils.tableType,
      streamController: colorStreamController,
    );
  }

  static Future<ArtworkColorDTO> update(
    Session session, {
    required ArtworkColorDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    return GenericCrud.update(
      session,
      fetchById: _fetchById,
      sessionId: sessionId,
      newEntity: entity,
      updateEntity: _updateRow,
      tableType: ArtworkColorUtils.tableType,
      streamController: colorStreamController,
      release: release,
      logFields: ArtworkColorUtils.getLogFields(),
    );
  }
}
