import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/generic_crud.dart';
import 'package:elbdesk_server/src/modules/crm/language_code/endpoints/language_code_endpoint.dart';
import 'package:elbdesk_server/src/modules/crm/language_code/language_code_utils.dart';
import 'package:serverpod/serverpod.dart';

class LanguageCodeHandler {
  const LanguageCodeHandler._();

  static Future<LanguageCodeDTO?> _fetchById(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return LanguageCodeDTO.db.findById(session, id, transaction: transaction);
  }

  static Future<LanguageCodeDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return GenericCrud.fetchAndLockEntity<LanguageCodeDTO>(
      session,
      id: id,
      tableType: LanguageCodeUtils.tableType,
      editingSessionId: editingSessionId,
      fetchById: _fetchById,
      tableName: LanguageCodeDTOTable().tableName,
      streamController: languageCodeStreamController,
    );
  }

  static Future<LanguageCodeDTO> create(
    Session session, {
    required LanguageCodeDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    final (:oldPrimary, :inserted) =
        await session.db.transaction((transaction) async {
      final tableName = LanguageCodeDTOTable().tableName;

      final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);

      LanguageCodeDTO? oldPrimary;

      if (entity.isPrimary) {
        final currentPrimary = await LanguageCodeDTO.db.findFirstRow(
          session,
          where: (t) => t.isPrimary.equals(true),
          transaction: transaction,
        );
        if (currentPrimary != null) {
          await session.db.unsafeQuery(
            'UPDATE $tableName SET "isPrimary" = FALSE WHERE id=${currentPrimary.id}',
            transaction: transaction,
          );
          oldPrimary = await LanguageCodeDTO.db.findById(
            session,
            currentPrimary.id!,
            transaction: transaction,
          );
        }
      }

      // updated meta
      entity = entity.copyWith(
        editingSession: sessionId,
        createdById: userId,
        createdAt: now,
      );

      final inserted = await GenericCrud.create(
        session,
        LanguageCodeDTO.db.insertRow(session, entity, transaction: transaction),
      );
      return (oldPrimary: oldPrimary, inserted: inserted);
    });
    languageCodeStreamController.add(inserted);
    if (oldPrimary != null) {
      languageCodeStreamController.add(oldPrimary);
    }
    return inserted;
  }

  static Future<LanguageCodeDTO> update(
    Session session, {
    required LanguageCodeDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    final (:oldPrimary, :updated) =
        await session.db.transaction((transaction) async {
      final tableName = LanguageCodeDTOTable().tableName;
      LanguageCodeDTO? oldPrimary;
      final currentPrimary = await LanguageCodeDTO.db.findFirstRow(
        session,
        where: (t) => t.isPrimary.equals(true),
        transaction: transaction,
      );

      if (currentPrimary != null && currentPrimary.id != entity.id) {
        await session.db.unsafeQuery(
          'UPDATE $tableName SET "isPrimary" = FALSE WHERE id=${currentPrimary.id}',
          transaction: transaction,
        );
        oldPrimary = await LanguageCodeDTO.db.findById(
          session,
          currentPrimary.id!,
          transaction: transaction,
        );
      }

      final updated = await GenericCrud.update(
        session,
        fetchById: _fetchById,
        sessionId: sessionId,
        newEntity: entity,
        updateEntity: _updateRow,
        tableType: LanguageCodeUtils.tableType,
        streamController: languageCodeStreamController,
        release: release,
        transaction: transaction,
      );
      return (oldPrimary: oldPrimary, updated: updated);
    });

    if (oldPrimary != null) {
      languageCodeStreamController.add(oldPrimary);
    }
    return updated;
  }

  static Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    await GenericCrud.releaseEntity<LanguageCodeDTO>(
      session,
      entityId: entityId,
      sessionId: sessionId,
      fetchById: _fetchById,
      updateEntity: _updateRow,
      tableType: LanguageCodeUtils.tableType,
      streamController: languageCodeStreamController,
      deleteDraft: _deleteDraft,
    );
  }

  static Future<LanguageCodeDTO> _updateRow(
    Session session,
    LanguageCodeDTO entity,
    Transaction transaction,
  ) async {
    return LanguageCodeDTO.db.updateRow(
      session,
      entity,
      transaction: transaction,
    );
  }

  static Future<LanguageCodeDTO?> _deleteDraft(
    Session session,
    LanguageCodeDTO entity,
    Transaction transaction,
  ) async {
    return LanguageCodeDTO.db.deleteRow(
      session,
      entity,
      transaction: transaction,
    );
  }
}
