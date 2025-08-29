// import 'dart:async';

// import 'package:collection/collection.dart';
// import 'package:elbdesk_server/src/expressions/core/filter_expression.dart';
// import 'package:elbdesk_server/src/generated/protocol.dart';
// import 'package:elbdesk_server/src/modules/core/entity_log/entity_log_endpoint.dart';
// import 'package:elbdesk_server/src/modules/core/generic_crud.dart';
// import 'package:serverpod/serverpod.dart';

// final salesOrderStatusStreamController =
//     StreamController<SalesOrderStatusDTO>.broadcast();

// /// Sales Order Status Endpoint
// ///
// /// Handles all the endpoint methods for the Sales Order Status entity
// class SalesOrderStatusEndpoint extends Endpoint {
//   @override
//   bool get requireLogin => true;

//   final _tableType = TableType.salesOrderStatus;

//   /// Watch a sales order status Stream
//   Stream<SalesOrderStatusDTO> watch(
//     Session session,
//     Stream<SalesOrderStatusDTO> stream, {
//     required String sessionId,
//     required int entityId,
//   }) async* {
//     session.addWillCloseListener(
//       (session) {
//         release(session, entityId: entityId, sessionId: sessionId);
//       },
//     );

//     yield* salesOrderStatusStreamController.stream
//         .where((event) => event.id == entityId)
//         .map((event) {
//       return event;
//     });
//   }

//   /// Fetch a sales order status by ID
//   Future<SalesOrderStatusDTO?> fetchById(Session session, int id) async {
//     return SalesOrderStatusDTO.db.findById(
//       session,
//       id,
//     );
//   }

//   /// Release a sales order status for editing
//   Future<void> release(
//     Session session, {
//     required int entityId,
//     required String sessionId,
//   }) async {
//     await GenericCrud.releaseEntity<SalesOrderStatusDTO>(
//       session,
//       entityId: entityId,
//       sessionId: sessionId,
//       fetchById: fetchById,
//       updateEntity: SalesOrderStatusDTO.db.updateRow,
//       tableType: _tableType,
//       streamController: salesOrderStatusStreamController,
//       deleteDraft: SalesOrderStatusDTO.db.deleteRow,
//     );
//   }

//   /// Fetch and lock a sales order status
//   Future<SalesOrderStatusDTO?> fetchAndLock(
//     Session session, {
//     required int id,
//     required String editingSessionId,
//   }) async {
//     return GenericCrud.fetchAndLockEntity<SalesOrderStatusDTO>(
//       session,
//       id: id,
//       tableType: _tableType,
//       editingSessionId: editingSessionId,
//       fetchById: fetchById,
//       tableName: SalesOrderStatusDTOTable().tableName,
//       streamController: salesOrderStatusStreamController,
//     );
//   }

//   /// Create a new sales order status
//   Future<SalesOrderStatusDTO> create(
//     Session session, {
//     required SalesOrderStatusDTO entity,
//     required String sessionId,
//     required bool release,
//   }) async {
//     final userId = (await session.authenticated)!.userId;
//     final initialEntity = _initialDto(
//       userId: userId,
//       sessionId: sessionId,
//       entity: entity,
//       release: release,
//     );
//     return GenericCrud.create(
//       session,
//       SalesOrderStatusDTO.db.insertRow(session, initialEntity),
//     );
//   }

//   /// Fetch all sales order statuses available
//   Future<List<SalesOrderStatusDTO>> fetchAll(Session session) async {
//     return SalesOrderStatusDTO.db.find(
//       session,
//       orderBy: (SalesOrderStatusDTOTable t) => t.orderId,
//     );
//   }

//   /// Find sales order statuses by filter
//   Future<List<SalesOrderStatusDTO>> find(
//     Session session, {
//     Sort? sort,
//     Filter? filter,
//   }) async {
//     final sortByField = SalesOrderStatusField.values.firstWhereOrNull(
//       (e) => e.name == sort?.fieldKey,
//     );

//     final expression =
//         buildFilterExpression<SalesOrderStatusDTOTable, SalesOrderStatusField>(
//       table: SalesOrderStatusDTOTable(),
//       filter: filter,
//       enumFromString: (String fieldKey) => SalesOrderStatusField.values
//           .firstWhereOrNull((e) => e.name == fieldKey),
//       getDbField: (table, field) => _dbFieldFromEnum(field)(table),
//     );

//     return SalesOrderStatusDTO.db.find(
//       session,
//       where: expression == null ? null : (t) => expression,
//       orderBy: sortByField != null
//           ? _dbFieldFromEnum(sortByField)
//           : _dbFieldFromEnum(SalesOrderStatusField.orderId),
//       orderDescending: sort?.orderDescending ?? false,
//     );
//   }

//   /// Update a sales order status
//   Future<SalesOrderStatusDTO> update(
//     Session session, {
//     required SalesOrderStatusDTO entity,
//     required String sessionId,
//     required bool release,
//   }) async {
//     return GenericCrud.update(
//       session,
//       fetchById: fetchById,
//       sessionId: sessionId,
//       newEntity: entity,
//       updateEntity: SalesOrderStatusDTO.db.updateRow,
//       tableType: _tableType,
//       streamController: salesOrderStatusStreamController,
//       release: release,
//       logFields: _getLogFields(),
//     );
//   }

//   /// Get the log fields for a sales order status
//   ///
//   /// Returns a list of LogField objects that represent the fields of a
//   /// SalesOrderStatusDTO that should be logged in the entity log history
//   List<LogField<SalesOrderStatusDTO>> _getLogFields() {
//     return SalesOrderStatusField.values
//         .map((field) {
//           switch (field) {
//             case SalesOrderStatusField.description:
//               return LogField<SalesOrderStatusDTO>(
//                 fieldName: field.name,
//                 getValue: (entity) => entity.description,
//               );
//             case SalesOrderStatusField.color:
//               return LogField<SalesOrderStatusDTO>(
//                 fieldName: field.name,
//                 getValue: (entity) => entity.color,
//               );

//             case SalesOrderStatusField.id:
//             case SalesOrderStatusField.orderId:
//             case SalesOrderStatusField.createdAt:
//             case SalesOrderStatusField.lastModifiedAt:
//             case SalesOrderStatusField.createdBy:
//             case SalesOrderStatusField.lastModifiedBy:
//             case SalesOrderStatusField.deletedAt:
//             case SalesOrderStatusField.isDraft:
//               return null;
//           }
//         })
//         .whereType<LogField<SalesOrderStatusDTO>>()
//         .toList();
//   }

//   /// Get the database field from the enum
//   /// These are the fields that are used to sort the sales order statuses
//   Column<dynamic> Function(SalesOrderStatusDTOTable) _dbFieldFromEnum(
//     SalesOrderStatusField sortFieldEnum,
//   ) {
//     switch (sortFieldEnum) {
//       case SalesOrderStatusField.orderId:
//         return (SalesOrderStatusDTOTable t) => t.orderId;
//       case SalesOrderStatusField.id:
//         return (SalesOrderStatusDTOTable t) => t.id;
//       case SalesOrderStatusField.description:
//         return (SalesOrderStatusDTOTable t) => t.description;
//       case SalesOrderStatusField.color:
//         return (SalesOrderStatusDTOTable t) => t.color;

//       case SalesOrderStatusField.createdAt:
//         return (SalesOrderStatusDTOTable t) => t.createdAt;
//       case SalesOrderStatusField.lastModifiedAt:
//         return (SalesOrderStatusDTOTable t) => t.lastModifiedAt;
//       case SalesOrderStatusField.createdBy:
//         return (SalesOrderStatusDTOTable t) => t.createdById;
//       case SalesOrderStatusField.lastModifiedBy:
//         return (SalesOrderStatusDTOTable t) => t.lastModifiedById;
//       case SalesOrderStatusField.deletedAt:
//         return (SalesOrderStatusDTOTable t) => t.deletedAt;
//       case SalesOrderStatusField.isDraft:
//         return (SalesOrderStatusDTOTable t) => t.isDraft;
//     }
//   }

//   /// Initial Sales Order Status
//   ///
//   /// Used when creating a new sales order status
//   SalesOrderStatusDTO _initialDto({
//     required int userId,
//     required String sessionId,
//     required SalesOrderStatusDTO entity,
//     required bool release,
//   }) {
//     return SalesOrderStatusDTO(
//       orderId: entity.orderId,
//       description: entity.description,
//       color: entity.color,
//       createdAt: DateTime.now(),
//       isDraft: false,
//       createdById: userId,
//       editingSince: null,
//       editingById: null,
//       deletedAt: null,
//       deletedById: null,
//       lastModifiedAt: null,
//       lastModifiedById: null,
//       editingSession: release ? null : sessionId,
//     );
//   }

//   /// Find all entity locks for a sales order status
//   Future<List<EntityLockDTO>> findEntityLocks(Session session) async {
//     final entities = await SalesOrderStatusDTO.db.find(
//       session,
//       where: (t) =>
//           t.editingSession.notEquals(null as String?) &
//           t.editingSession.notEquals(''),
//     );

//     return entities
//         .map(
//           (e) => EntityLockDTO(
//             entityType: _tableType,
//             entityId: e.id!,
//             editingSessionId: e.editingSession!,
//             lockedAt: e.editingSince!,
//             userId: e.editingById,
//           ),
//         )
//         .toList();
//   }
// }
