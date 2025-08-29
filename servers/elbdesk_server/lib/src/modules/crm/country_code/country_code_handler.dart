import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/generic_crud.dart';
import 'package:elbdesk_server/src/modules/crm/country_code/country_code_utils.dart';
import 'package:elbdesk_server/src/modules/crm/country_code/endpoints/country_code_endpoint.dart';
import 'package:serverpod/serverpod.dart';

class CountryCodeHandler {
  const CountryCodeHandler._();

  static Future<CountryCodeDTO> create(
    Session session,
    CountryCodeDTO entity,
    String sessionId,
    bool release,
  ) async {
    final (:oldPrimary, :inserted) =
        await session.db.transaction((transaction) async {
      final tableName = CountryCodeDTOTable().tableName;
      CountryCodeDTO? oldPrimary;

      if (entity.isPrimary) {
        final currentPrimary = await CountryCodeDTO.db.findFirstRow(
          session,
          where: (t) => t.isPrimary.equals(true),
          transaction: transaction,
        );
        if (currentPrimary != null) {
          await session.db.unsafeQuery(
            'UPDATE $tableName SET "isPrimary" = FALSE WHERE id=${currentPrimary.id}',
            transaction: transaction,
          );
          oldPrimary = await CountryCodeDTO.db.findById(
            session,
            currentPrimary.id!,
            transaction: transaction,
          );
        }
      }
      final inserted = await GenericCrud.create(
        session,
        CountryCodeDTO.db.insertRow(session, entity, transaction: transaction),
      );
      return (oldPrimary: oldPrimary, inserted: inserted);
    });
    countryCodeStreamController.add(inserted);
    if (oldPrimary != null) {
      countryCodeStreamController.add(oldPrimary);
    }
    return inserted;
  }

  static Future<CountryCodeDTO> update(
    Session session,
    CountryCodeDTO entity,
    String sessionId,
    bool release,
  ) async {
    final (:oldPrimary, :updated) =
        await session.db.transaction((transaction) async {
      final tableName = CountryCodeDTOTable().tableName;
      CountryCodeDTO? oldPrimary;
      if (entity.isPrimary) {
        final currentPrimary = await CountryCodeDTO.db.findFirstRow(
          session,
          where: (t) => t.isPrimary.equals(true) & t.id.notEquals(entity.id),
          transaction: transaction,
        );
        if (currentPrimary != null && currentPrimary.id != entity.id) {
          await session.db.unsafeQuery(
            'UPDATE $tableName SET "isPrimary" = FALSE WHERE id=${currentPrimary.id}',
            transaction: transaction,
          );
          oldPrimary = await CountryCodeDTO.db.findById(
            session,
            currentPrimary.id!,
            transaction: transaction,
          );
        }
      }
      final updated = await GenericCrud.update(
        session,
        fetchById: _fetchById,
        sessionId: sessionId,
        newEntity: entity,
        updateEntity: CountryCodeHandler.updateRow,
        tableType: CountryCodeUtils.tableType,
        streamController: countryCodeStreamController,
        release: release,
        transaction: transaction,
      );
      return (oldPrimary: oldPrimary, updated: updated);
    });

    if (oldPrimary != null) {
      countryCodeStreamController.add(oldPrimary);
    }
    return updated;
  }

  static Future<CountryCodeDTO?> fetchByIdWithoutRelations(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return CountryCodeDTO.db.findById(
      session,
      id,
      transaction: transaction,
    );
  }

  static Future<CountryCodeDTO?> _fetchById(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return CountryCodeDTO.db.findById(
      session,
      id,
      transaction: transaction,
    );
  }

  static Future<CountryCodeDTO> updateRow(
    Session session,
    CountryCodeDTO entity,
    Transaction transaction,
  ) async {
    return CountryCodeDTO.db.updateRow(
      session,
      entity,
      transaction: transaction,
    );
  }

  static Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    await GenericCrud.releaseEntity<CountryCodeDTO>(
      session,
      entityId: entityId,
      sessionId: sessionId,
      fetchById: _fetchById,
      updateEntity: updateRow,
      tableType: CountryCodeUtils.tableType,
      streamController: countryCodeStreamController,
      deleteDraft: null,
    );
  }

  static Future<CountryCodeDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return GenericCrud.fetchAndLockEntity<CountryCodeDTO>(
      session,
      id: id,
      tableType: CountryCodeUtils.tableType,
      editingSessionId: editingSessionId,
      fetchById: _fetchById,
      tableName: CountryCodeDTOTable().tableName,
      streamController: countryCodeStreamController,
    );
  }
}
