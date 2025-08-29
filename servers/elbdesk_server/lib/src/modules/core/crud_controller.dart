// import 'dart:async';

// import 'package:elbdesk_server/src/generated/protocol.dart';
// import 'package:elbdesk_server/src/modules/core/entity_log/entity_log_endpoint.dart';
// import 'package:elbdesk_server/src/modules/core/generic_crud.dart';
// import 'package:serverpod/serverpod.dart';

// /// A controller that combines CRUD operations with recent entity tracking
// class CrudController {
//   const CrudController._();

//   /// **Creates a new entity**
//   ///
//   /// This is used to create a new entity in the database
//   ///
//   /// - creates the entity in the database
//   /// - adds the entity to recent entities
//   /// - streams the entity to the client
//   ///
//   static Future<T> create<T>(
//     Session session,
//     Future<T> future,
//   ) async {
//     final entity = await GenericCrud.create(session, future);

//     return entity;
//   }

//   /// **Fetches and locks an entity**
//   ///
//   /// Returns the entity if it was locked by the user, null otherwise.
//   ///
//   /// See [GenericCrud.lockEntity] for more information on how this is done
//   ///
//   /// - adds the entity to recent entities
//   /// - fetches and locks the entity
//   /// - streams the entity to the client
//   ///
//   static Future<T?> fetchAndLockEntity<T>(
//     Session session, {
//     required int id,
//     required String editingSessionId,
//     required Future<T?> Function(Session, int) fetchById,
//     required String tableName,
//     required StreamController<T> streamController,
//     required TableType tableType,
//   }) async {
//     // Add entity to recent entities
//     // Fetch&lock is usually used when opening an entity

//     return GenericCrud.fetchAndLockEntity<T>(
//       session,
//       id: id,
//       tableType: tableType,
//       editingSessionId: editingSessionId,
//       fetchById: fetchById,
//       tableName: tableName,
//       streamController: streamController,
//     );
//   }

//   /// **Updates an existing entity**
//   ///
//   /// This is used to update an existing entity in the database
//   ///
//   /// - updates the entity in the database
//   /// - adds the entity to recent entities
//   /// - streams the entity to the client
//   ///
//   static Future<T> updateEntity<T>(
//     Session session, {
//     required Future<T?> Function(Session, int) fetchById,
//     required String sessionId,
//     required T newEntity,
//     required Future<T> Function(Session, T) updateEntity,
//     required TableType tableType,
//     required StreamController<T> streamController,
//     required bool release,
//     bool hasManyToManyRelations = false,
//     List<LogField<T>>? logFields,
//   }) async {
//     final updatedEntity = await GenericCrud.update(
//       session,
//       fetchById: fetchById,
//       sessionId: sessionId,
//       newEntity: newEntity,
//       updateEntity: updateEntity,
//       tableType: tableType,
//       streamController: streamController,
//       release: release,
//       logFields: logFields,
//     );

//     return updatedEntity;
//   }

//   /// **Releases an entity**
//   ///
//   /// This is used to release an entity from the editing session, which frees
//   /// it up to be edited again by another user.
//   ///
//   static Future<void> releaseEntity<T>(
//     Session session, {
//     required int entityId,
//     required String sessionId,
//     required Future<T?> Function(Session, int) fetchById,
//     required Future<T> Function(Session, T) updateEntity,
//     required TableType tableType,
//     required StreamController<T> streamController,
//     required Future<T> Function(Session, T)? deleteDraft,
//   }) async {
//     await GenericCrud.releaseEntity<T>(
//       session,
//       entityId: entityId,
//       sessionId: sessionId,
//       fetchById: fetchById,
//       updateEntity: updateEntity,
//       tableType: tableType,
//       streamController: streamController,
//       deleteDraft: deleteDraft,
//     );
//   }

//   /// **Deletes an entity**
//   /// - deletes the entity from the database
//   /// - adds the entity to recent entities with a deletedAt timestamp
//   /// - streams the entity to the client
//   ///
//   /// This is used to soft delete an entity from the database
//   ///
//   /// Entities are not actually deleted from the database, but are marked as
//   /// deletedAt and are thereby not fetched anymore.
//   ///
//   static Future<bool> deleteEntity<T>(
//     Session session, {
//     required int id,
//     required String sessionId,
//     required Future<T?> Function(Session, int) fetchById,
//     required Future<T> Function(Session, T) updateEntity,
//     required TableType tableType,
//     required StreamController<T> streamController,
//   }) async {
//     final isDeleted = await GenericCrud.deleteEntity<T>(
//       session,
//       id: id,
//       sessionId: sessionId,
//       fetchById: fetchById,
//       updateEntity: updateEntity,
//       tableType: tableType,
//       streamController: streamController,
//     );

//     // Add entity to recent entities
//     // This updates the recent entity with the deletedAt timestamp.
//     // This change is streamed to the client
//     //
//     // **It is important to do this after the entity has been soft deleted,**
//     // **otherwise the deletedAt timestamp will not be set**

//     return isDeleted;
//   }
// }
