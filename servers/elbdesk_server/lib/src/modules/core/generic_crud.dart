// ignore_for_file: avoid_dynamic_calls

import 'dart:async';

import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/endpoint_utils.dart';
import 'package:elbdesk_server/src/modules/core/entity_log/entity_log_endpoint.dart';
import 'package:elbdesk_server/src/modules/core/entity_log/entity_log_handler.dart';
import 'package:elbdesk_server/src/modules/core/utils/elb_exception_thrower.dart';
import 'package:elbdesk_shared/elbdesk_shared.dart';
import 'package:serverpod/serverpod.dart';

/// Generic CRUD operations for all entities.
///
/// This is used in the Endpoints of a specific entity and was created to
/// reduce code duplication and to have a single place to manage the
/// generic CRUD operations.
///
class GenericCrud {
  /// @nodoc
  const GenericCrud._();

  /// **Create a new entity**
  ///
  static Future<T> create<T>(
    Session session,
    Future<T> future,
  ) async {
    try {
      final dto = await future;

      return dto;
    } on DatabaseQueryException catch (e) {
      session.log('database query exception: $e');

      throw e.toElbException();
    } catch (e) {
      throw ElbException(
        exceptionType: ElbExceptionType.unknown,
        message: e.toString(),
      );
    }
  }

  /// **Fetches and locks an entity**
  ///
  /// Returns the entity if it was locked by the user, null otherwise.
  ///
  /// See [lockEntity] for more information on how this is done
  ///
  static Future<T?> fetchAndLockEntity<T>(
    Session session, {
    required int id,
    required String editingSessionId,
    required Future<T?> Function(Session, int, Transaction) fetchById,
    required String tableName,
    required StreamController<T> streamController,
    required TableType tableType,
  }) async {
    final userId = await CoreUtils.getCurrentUserId(session);
    final entity = await session.db.transaction((transaction) async {
      await lockEntity(
        session,
        tableName: tableName,
        id: id,
        editingSessionId: editingSessionId,
        userId: userId,
        transaction: transaction,
      );
      final entity = await fetchById(session, id, transaction);
      return entity;
    });

    if (entity != null &&
        (entity as dynamic).editingSession == editingSessionId) {
      streamController.add(entity);
    }

    return entity;
  }

  /// **Tries to lock an entity**
  ///
  /// Returns true if the entity was locked by the user, false otherwise.
  ///
  /// See [lockEditSessionQuery] for more information on how this is done
  /// Entities are locked with a raw SQL query to avoid race conditions
  ///
  static Future<bool> lockEntity(
    Session session, {
    required String tableName,
    required int id,
    required String editingSessionId,
    required int userId,
    required Transaction transaction,
  }) async {
    final now = DateTime.now().toUtc();
    final asPostgresTimestamp = now.toIso8601String();

    final result = await session.db.unsafeQuery(
      lockEditSessionQuery(
        tableName: tableName,
      ),
      parameters: QueryParameters.named({
        'id': id,
        'editingSessionValue': editingSessionId,
        'editingByIdValue': userId,
        'editingSinceValue': asPostgresTimestamp,
      }),
      transaction: transaction,
    );

    return result.isNotEmpty;
  }

  /// **Updates an existing entity**
  ///
  /// This is used to update an existing entity in the database
  ///
  static Future<T> update<T>(
    Session session, {
    required Future<T?> Function(Session, int, Transaction) fetchById,
    required String sessionId,
    required T newEntity,
    required Future<T> Function(Session, T, Transaction) updateEntity,
    required TableType tableType,
    required StreamController<T> streamController,
    required bool release,
    bool hasManyToManyRelations = false,
    Transaction? transaction,
    List<LogField<T>>? logFields,
  }) async {
    if (transaction != null) {
      final updated = await _update<T>(
        session,
        fetchById: fetchById,
        sessionId: sessionId,
        newEntity: newEntity,
        updateEntity: updateEntity,
        tableType: tableType,
        streamController: streamController,
        release: release,
        transaction: transaction,
        logFields: logFields,
      );
      streamController.add(updated);
      return updated;
    }

    final updatedEntity = await session.db.transaction((transaction) async {
      final updated = await _update<T>(
        session,
        logFields: logFields,
        fetchById: fetchById,
        sessionId: sessionId,
        newEntity: newEntity,
        updateEntity: updateEntity,
        tableType: tableType,
        streamController: streamController,
        release: release,
        transaction: transaction,
      );
      return updated;
    });

    streamController.add(updatedEntity);
    return updatedEntity;
  }

  /// **Releases an entity**
  ///
  /// This is used to release an entity from the editing session, which frees
  /// it up to be edited again by another user.
  ///
  static Future<void> releaseEntity<T>(
    Session session, {
    required int entityId,
    required String sessionId,
    // TODO(TK): check how to clearify this, when we are releasing the entity
    // we are updating the stream, so we need all the stuff

    // required Future<T?> Function(Session, int, Transaction)
    //     fetchWithoutRelations,
    required Future<T?> Function(Session, int, Transaction) fetchById,
    required Future<T> Function(Session, T, Transaction) updateEntity,
    required TableType tableType,
    required StreamController<T> streamController,
    required Future<T?> Function(Session, T, Transaction)? deleteDraft,
  }) async {
    final releasedEntity = await session.db.transaction((transaction) async {
      final entity = await fetchById(
        session,
        entityId,
        transaction,
      );
      if (entity == null) {
        return null;
      }
      final currentEditSession = (entity as dynamic).editingSession as String?;
      if (currentEditSession != sessionId && sessionId != 'hard-release') {
        return null;
      }

      if (deleteDraft != null) {
        final isDraft = (entity as dynamic).isDraft as bool? ?? false;
        if (isDraft) {
          try {
            await deleteDraft(session, entity as T, transaction);
            return entity;
          } catch (e) {
            session.log('Failed to delete draft: $e');
            return null;
          }
        }
      }
      final updatedEntity = (entity as dynamic).copyWith(
        editingById: null,
        editingSession: null,
        editingSince: null,
      );

      final savedEntity =
          await updateEntity(session, updatedEntity as T, transaction);
      return savedEntity;
    });

    if (releasedEntity != null) {
      streamController.add(releasedEntity);
    }
  }

  /// **Deletes an entity**
  ///
  /// This is used to soft delete an entity from the database
  ///
  /// Entities are not actually deleted from the database, but are marked as
  /// deletedAt and are thereby not fetched anymore.
  ///
  static Future<bool> markEntityAsDeleted<T>(
    Session session, {
    required int id,
    required String sessionId,
    required Future<T?> Function(Session, int, Transaction)
        fetchWithoutRelations,
    required Future<T> Function(Session, T, Transaction) updateRow,
    required TableType tableType,
    required StreamController<T> streamController,
    Transaction? transaction,
  }) async {
    Future<T> deleteFn(Transaction transaction) async {
      final entity = await fetchWithoutRelations(session, id, transaction);
      if (entity == null) {
        throw await ElbExceptionThrower.validationError(
          session,
          exceptionType: ElbExceptionType.notFound,
          message: ElbValidationError.entityNotFound,
        );
      }
      final editingSession = (entity as dynamic).editingSession as String?;
      if (editingSession != null &&
          editingSession.isNotEmpty &&
          editingSession != sessionId &&
          sessionId != 'table') {
        throw await ElbExceptionThrower.validationError(
          session,
          exceptionType: ElbExceptionType.conflict,
          message: ElbValidationError.invalidSessionId,
        );
      }

      final userId = await CoreUtils.getCurrentUserId(session);
      final deletedEntity = (entity as dynamic).copyWith(
        deletedAt: DateTime.now(),
        deletedById: userId,
      );
      await updateRow(session, deletedEntity as T, transaction);
      return deletedEntity;
    }

    T? deletedEntity;
    if (transaction != null) {
      deletedEntity = await deleteFn(transaction);
    } else {
      deletedEntity = await session.db.transaction((transaction) async {
        try {
          return deleteFn(transaction);
        } on ElbException {
          rethrow;
        } on DatabaseQueryException catch (e) {
          throw e.toElbException();
        } catch (e) {
          throw ElbException(
            exceptionType: ElbExceptionType.unknown,
            message: e.toString(),
          );
        }
      });
    }

    if (deletedEntity != null) {
      streamController.add(deletedEntity);
      return true;
    } else {
      return false;
    }
  }

  static Future<void> validateUpdate(
    Session session, {
    required String sessionId,
    required dynamic serverEntity,
    required DateTime now,
  }) async {
    if (serverEntity == null) {
      throw await ElbExceptionThrower.validationError(
        session,
        exceptionType: ElbExceptionType.notFound,
        message: ElbValidationError.entityNotFound,
      );
    }
    final serverEntitySessionId = serverEntity.editingSession as String?;
    if (serverEntitySessionId != sessionId) {
      throw await ElbExceptionThrower.validationError(
        session,
        exceptionType: ElbExceptionType.conflict,
        message: ElbValidationError.invalidSessionId,
      );
    }
    final lastModifiedAt = serverEntity.lastModifiedAt as DateTime?;
    if (lastModifiedAt != null && lastModifiedAt.isAfter(now)) {
      throw await ElbExceptionThrower.validationError(
        session,
        exceptionType: ElbExceptionType.conflict,
        message: ElbValidationError.modifiedByAnotherUser,
      );
    }
    final deletedAt = serverEntity.deletedAt as DateTime?;
    if (deletedAt != null) {
      throw await ElbExceptionThrower.validationError(
        session,
        exceptionType: ElbExceptionType.conflict,
        message: ElbValidationError.alreadyDeleted,
      );
    }
  }

  static T modifyEntityDataMeta<T>(
    T entity,
    T serverEntity,
    int userId,
    bool release,
    DateTime now,
  ) {
    final dynamicServerEntity = serverEntity as dynamic;
    final dynamicEntity = entity as dynamic;
    final updatedEntity = dynamicEntity.copyWith(
      lastModifiedAt: now,
      lastModifiedById: userId,
      editingSession: release ? null : dynamicServerEntity.editingSession,
      editingSince: release ? null : dynamicServerEntity.editingSince,
      editingById: release ? null : userId,
      createdById: dynamicServerEntity.createdById,
      isDraft: false,
      deletedAt: dynamicServerEntity.deletedAt,
      deletedById: dynamicServerEntity.deletedById,
    );
    return updatedEntity as T;
  }

  static Future<T> _update<T>(
    Session session, {
    required Future<T?> Function(Session, int, Transaction) fetchById,
    required String sessionId,
    required T newEntity,
    required Future<T> Function(Session, T, Transaction) updateEntity,
    required TableType tableType,
    required StreamController<T> streamController,
    required bool release,
    required Transaction transaction,
    bool hasManyToManyRelations = false,
    List<LogField<T>>? logFields,
  }) async {
    try {
      final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);
      final entityId = (newEntity as dynamic).id! as int;
      final serverEntity = await fetchById(
        session,
        entityId,
        transaction,
      );
      await validateUpdate(
        session,
        sessionId: sessionId,
        serverEntity: serverEntity,
        now: now,
      );

      final withUpdatedMeta = modifyEntityDataMeta(
        newEntity,
        serverEntity,
        userId,
        release,
        now,
      );

      await updateEntity(
        session,
        withUpdatedMeta as T,
        transaction,
      );

      final withRelations = await fetchById(
        session,
        entityId,
        transaction,
      );
      if (logFields != null) {
        await EntityLogHandler.create<T>(
          session,
          oldEntity: serverEntity as T,
          newEntity: withRelations as T,
          userId: userId,
          editedAt: now,
          tableType: tableType,
          fields: logFields,
          transaction: transaction,
        );
      }

      return withRelations as T;
    } on ElbException {
      rethrow;
    } on DatabaseQueryException catch (e) {
      session.log('database query exception: $e');

      throw e.toElbException();
    } catch (e) {
      throw ElbException(
        exceptionType: ElbExceptionType.unknown,
        message: e.toString(),
      );
    }
  }
}
