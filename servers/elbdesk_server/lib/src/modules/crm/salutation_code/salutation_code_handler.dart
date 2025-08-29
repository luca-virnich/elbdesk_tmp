import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/generic_crud.dart';
import 'package:elbdesk_server/src/modules/crm/salutation_code/endpoints/salutation_code_endpoint.dart';
import 'package:elbdesk_server/src/modules/crm/salutation_code/salutation_code_utils.dart';
import 'package:serverpod/serverpod.dart';

class SalutationCodeHandler {
  const SalutationCodeHandler._();

  static Future<SalutationCodeDTO> create(
    Session session, {
    required SalutationCodeDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    final (:newSalutationCode, :oldPrimaryPerson, :oldPrimaryCompany) =
        await session.db.transaction((transaction) async {
      final tableName = SalutationCodeDTOTable().tableName;
      final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);
      SalutationCodeDTO? oldPrimaryPerson;
      SalutationCodeDTO? oldPrimaryCompany;
      if (entity.isPrimaryPerson) {
        final currentPrimaryPerson = await SalutationCodeDTO.db.findFirstRow(
          session,
          where: (t) => t.isPrimaryPerson.equals(true),
          transaction: transaction,
        );
        if (currentPrimaryPerson != null) {
          await session.db.unsafeQuery(
            'UPDATE $tableName SET "isPrimaryPerson" = FALSE WHERE id=${currentPrimaryPerson.id}',
            transaction: transaction,
          );
          oldPrimaryPerson = await SalutationCodeDTO.db.findById(
            session,
            currentPrimaryPerson.id!,
            transaction: transaction,
          );
        }
      }
      if (entity.isPrimaryCompany) {
        final currentPrimaryCompany = await SalutationCodeDTO.db.findFirstRow(
          session,
          where: (t) => t.isPrimaryCompany.equals(true),
          transaction: transaction,
        );
        if (currentPrimaryCompany != null) {
          await session.db.unsafeQuery(
            'UPDATE $tableName SET "isPrimaryCompany" = FALSE WHERE id=${currentPrimaryCompany.id}',
            transaction: transaction,
          );
          oldPrimaryCompany = await SalutationCodeDTO.db.findById(
            session,
            currentPrimaryCompany.id!,
            transaction: transaction,
          );
        }
      }

      // update meta
      entity = entity.copyWith(
        editingSession: sessionId,
        createdById: userId,
        createdAt: now,
      );

      final newSalutationCode = await GenericCrud.create(
        session,
        SalutationCodeDTO.db
            .insertRow(session, entity, transaction: transaction),
      );
      return (
        newSalutationCode: newSalutationCode,
        oldPrimaryPerson: oldPrimaryPerson,
        oldPrimaryCompany: oldPrimaryCompany
      );
    });
    salutationCodeStreamController.add(newSalutationCode);
    if (oldPrimaryPerson != null) {
      salutationCodeStreamController.add(oldPrimaryPerson);
    }
    if (oldPrimaryCompany != null) {
      salutationCodeStreamController.add(oldPrimaryCompany);
    }
    return newSalutationCode;
  }

  static Future<SalutationCodeDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return GenericCrud.fetchAndLockEntity<SalutationCodeDTO>(
      session,
      id: id,
      tableType: SalutationCodeUtils.tableType,
      editingSessionId: editingSessionId,
      fetchById: _fetchById,
      tableName: SalutationCodeDTOTable().tableName,
      streamController: salutationCodeStreamController,
    );
  }

  static Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    await GenericCrud.releaseEntity<SalutationCodeDTO>(
      session,
      entityId: entityId,
      sessionId: sessionId,
      fetchById: _fetchById,
      updateEntity: _updateRow,
      tableType: SalutationCodeUtils.tableType,
      streamController: salutationCodeStreamController,
      deleteDraft: _deleteDraft,
    );
  }

  static Future<SalutationCodeDTO?> _fetchById(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return SalutationCodeDTO.db.findById(session, id, transaction: transaction);
  }

  static Future<SalutationCodeDTO> _updateRow(
    Session session,
    SalutationCodeDTO entity,
    Transaction transaction,
  ) async {
    return SalutationCodeDTO.db.updateRow(
      session,
      entity,
      transaction: transaction,
    );
  }

  static Future<SalutationCodeDTO> update(
    Session session, {
    required SalutationCodeDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    final (:newSalutationCode, :oldPrimaryPerson, :oldPrimaryCompany) =
        await session.db.transaction((transaction) async {
      final tableName = SalutationCodeDTOTable().tableName;
      SalutationCodeDTO? oldPrimaryPerson;
      SalutationCodeDTO? oldPrimaryCompany;
      if (entity.isPrimaryPerson) {
        final currentPrimaryPerson = await SalutationCodeDTO.db.findFirstRow(
          session,
          where: (t) => t.isPrimaryPerson.equals(true),
          transaction: transaction,
        );
        if (currentPrimaryPerson != null) {
          await session.db.unsafeQuery(
            'UPDATE $tableName SET "isPrimaryPerson" = FALSE WHERE id=${currentPrimaryPerson.id}',
            transaction: transaction,
          );
          oldPrimaryPerson = await SalutationCodeDTO.db.findById(
            session,
            currentPrimaryPerson.id!,
            transaction: transaction,
          );
        }
      }
      if (entity.isPrimaryCompany) {
        final currentPrimaryCompany = await SalutationCodeDTO.db.findFirstRow(
          session,
          where: (t) => t.isPrimaryCompany.equals(true),
          transaction: transaction,
        );
        if (currentPrimaryCompany != null) {
          await session.db.unsafeQuery(
            'UPDATE $tableName SET "isPrimaryCompany" = FALSE WHERE id=${currentPrimaryCompany.id}',
            transaction: transaction,
          );
          oldPrimaryCompany = await SalutationCodeDTO.db.findById(
            session,
            currentPrimaryCompany.id!,
            transaction: transaction,
          );
        }
      }
      final newSalutationCode = await GenericCrud.update(
        session,
        fetchById: _fetchById,
        sessionId: sessionId,
        newEntity: entity,
        updateEntity: _updateRow,
        tableType: SalutationCodeUtils.tableType,
        streamController: salutationCodeStreamController,
        release: release,
        transaction: transaction,
      );
      return (
        newSalutationCode: newSalutationCode,
        oldPrimaryPerson: oldPrimaryPerson,
        oldPrimaryCompany: oldPrimaryCompany
      );
    });

    if (oldPrimaryPerson != null) {
      salutationCodeStreamController.add(oldPrimaryPerson);
    }
    if (oldPrimaryCompany != null) {
      salutationCodeStreamController.add(oldPrimaryCompany);
    }
    return newSalutationCode;

    // return GenericCrud.update(
    //   session,
    //   fetchWithoutRelations: _fetchById,
    //   fetchById: _fetchById,
    //   sessionId: sessionId,
    //   newEntity: entity,
    //   updateEntity: _updateRow,
    //   tableType: SalutationCodeUtils.tableType,
    //   streamController: salutationCodeStreamController,
    //   release: release,
    //   logFields: [

    //   ],
    // );
  }

  static Future<SalutationCodeDTO?> _deleteDraft(
    Session session,
    SalutationCodeDTO entity,
    Transaction transaction,
  ) async {
    return SalutationCodeDTO.db.deleteRow(
      session,
      entity,
      transaction: transaction,
    );
  }
}
