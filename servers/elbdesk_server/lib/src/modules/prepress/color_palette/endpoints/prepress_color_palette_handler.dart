import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/entity_log/entity_log_endpoint.dart';
import 'package:elbdesk_server/src/modules/core/generic_crud.dart';
import 'package:elbdesk_server/src/modules/prepress/color_palette/endpoints/prepress_color_palette_endpoint.dart';
import 'package:elbdesk_server/src/modules/prepress/color_palette/endpoints/prepress_color_palette_utils.dart';
import 'package:serverpod/serverpod.dart';

class PrepressColorPaletteHandler {
  const PrepressColorPaletteHandler._();

  static Future<PrepressColorPaletteDTO?> fetchWithoutRelations(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return PrepressColorPaletteDTO.db
        .findById(session, id, transaction: transaction);
  }

  static Future<PrepressColorPaletteDTO> updateRow(
    Session session,
    PrepressColorPaletteDTO entity,
    Transaction transaction,
  ) async {
    return PrepressColorPaletteDTO.db.updateRow(
      session,
      entity,
      transaction: transaction,
    );
  }

  static Future<PrepressColorPaletteDTO?> _fetchById(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return PrepressColorPaletteDTO.db.findById(
      session,
      id,
      include: PrepressColorPaletteUtils.includeAll,
      transaction: transaction,
    );
  }

  static Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    await GenericCrud.releaseEntity<PrepressColorPaletteDTO>(
      session,
      entityId: entityId,
      sessionId: sessionId,
      fetchById: _fetchById,
      updateEntity: PrepressColorPaletteHandler.updateRow,
      tableType: PrepressColorPaletteUtils.tableType,
      streamController: prepressColorPaletteStreamController,
      deleteDraft: null,
    );
  }

  static Future<PrepressColorPaletteDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    final entity =
        await GenericCrud.fetchAndLockEntity<PrepressColorPaletteDTO>(
      session,
      id: id,
      tableType: PrepressColorPaletteUtils.tableType,
      editingSessionId: editingSessionId,
      fetchById: _fetchById,
      tableName: PrepressColorPaletteDTOTable().tableName,
      streamController: prepressColorPaletteStreamController,
    );
    if (entity != null) {
      prepressColorPaletteStreamController.add(entity);
    }
    return entity;
  }

  static Future<PrepressColorPaletteDTO> create(
    Session session, {
    required String sessionId,
    required int? customerId,
  }) async {
    final (:userId,) =
        await CoreUtils.getCurrentTimeAndUser(session) as ({int userId});
    final initialEntity = PrepressColorPaletteUtils.initialDTO(
      userId: userId,
      sessionId: sessionId,
      customerId: customerId,
    );
    final created = await GenericCrud.create(
      session,
      PrepressColorPaletteDTO.db.insertRow(session, initialEntity),
    );
    prepressColorPaletteStreamController.add(created);
    return created;
  }

  static Future<PrepressColorPaletteDTO> update(
    Session session, {
    required PrepressColorPaletteDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    final updatedEntity = await GenericCrud.update(
      session,
      fetchById: _fetchById,
      sessionId: sessionId,
      newEntity: entity,
      updateEntity: PrepressColorPaletteHandler.updateRow,
      tableType: PrepressColorPaletteUtils.tableType,
      streamController: prepressColorPaletteStreamController,
      release: release,
      logFields: _getLogFields(),
    );
    prepressColorPaletteStreamController.add(updatedEntity);
    return updatedEntity;
  }

  static Future<bool> colorBookExists(
    Session session, {
    required String paletteName,
  }) async {
    final colorBooks = await PrepressColorPaletteDTO.db.find(
      session,
      where: (t) =>
          t.isDraft.equals(false) &
          t.deletedAt.equals(null) &
          t.paletteName.equals(paletteName),
    );
    return colorBooks.isNotEmpty;
  }

  static Future<bool> delete(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    final result =
        await GenericCrud.markEntityAsDeleted<PrepressColorPaletteDTO>(
      session,
      id: entityId,
      sessionId: sessionId,
      fetchWithoutRelations: PrepressColorPaletteHandler.fetchWithoutRelations,
      updateRow: PrepressColorPaletteHandler.updateRow,
      tableType: PrepressColorPaletteUtils.tableType,
      streamController: prepressColorPaletteStreamController,
    );
    // Fetch the entity after marking as deleted to notify stream listeners
    final deletedEntity = await session.db
        .transaction<PrepressColorPaletteDTO?>((transaction) async {
      return PrepressColorPaletteDTO.db.findById(
        session,
        entityId,
        transaction: transaction,
        include: PrepressColorPaletteUtils.includeAll,
      );
    });
    if (deletedEntity != null) {
      prepressColorPaletteStreamController.add(deletedEntity);
    }
    return result;
  }

  static List<LogField<PrepressColorPaletteDTO>> _getLogFields() {
    return PrepressColorPaletteField.values
        .map((field) {
          switch (field) {
            case PrepressColorPaletteField.id:
              return LogField<PrepressColorPaletteDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.id?.toString() ?? '',
              );
            case PrepressColorPaletteField.paletteName:
              return LogField<PrepressColorPaletteDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.paletteName,
              );
            case PrepressColorPaletteField.description:
              return LogField<PrepressColorPaletteDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.description,
              );
            // Skip metadata fields
            case PrepressColorPaletteField.createdAt:
            case PrepressColorPaletteField.createdBy:
            case PrepressColorPaletteField.lastModifiedAt:
            case PrepressColorPaletteField.customer:
            case PrepressColorPaletteField.customerId:
            case PrepressColorPaletteField.lastModifiedBy:
            case PrepressColorPaletteField.deletedAt:
            case PrepressColorPaletteField.isDraft:
              return null;
          }
        })
        .whereType<LogField<PrepressColorPaletteDTO>>()
        .toList();
  }
}
