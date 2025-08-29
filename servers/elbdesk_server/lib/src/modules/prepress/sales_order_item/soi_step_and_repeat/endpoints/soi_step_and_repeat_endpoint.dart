// import 'dart:async';

// import 'package:collection/collection.dart';
// import 'package:elbdesk_server/src/expressions/core/filter_expression.dart';
// import 'package:elbdesk_server/src/generated/protocol.dart';
// import 'package:elbdesk_server/src/modules/core/custom_entity_keys/custom_entiy_keys_endpoint.dart';
// import 'package:elbdesk_server/src/modules/core/generic_crud.dart';
// import 'package:serverpod/serverpod.dart';

// final soiStepAndRepeatStreamController =
//     StreamController<SoiStepAndRepeatDTO>.broadcast();

// final soiStepAndRepeatStreamForSalesOrderController =
//     StreamController<SoiStepAndRepeatDTO>.broadcast();

// final removeStepAndRepeatFromSalesOrderController =
//     StreamController<int>.broadcast();

// class SoiStepAndRepeatEndpoint extends Endpoint {
//   @override
//   bool get requireLogin => true;

//   static const _tableType = TableType.soiStepAndRepeat;

//   // Include for fetching sois in the sales order which are shown
//   // as list. We dont need the customer/contact information or
//   // the sales order information
//   static final _tableInSalesOrderInclude = SoiStepAndRepeatDTO.include(
//     artwork: ArtworkDTO.include(),
//   );

//   Stream<SoiStepAndRepeatDTO> watch(
//     Session session,
//     Stream<SoiStepAndRepeatDTO> stream, {
//     required String sessionId,
//     required int entityId,
//   }) async* {
//     session.addWillCloseListener(
//       (session) {
//         release(session, entityId: entityId, sessionId: sessionId);
//       },
//     );

//     yield* soiStepAndRepeatStreamController.stream
//         .where((event) => event.id == entityId)
//         .map((event) {
//       return event;
//     });
//   }

//   Stream<SoiStepAndRepeatDTO> watchForSalesOrder(
//     Session session,
//     Stream<SoiStepAndRepeatDTO> stream, {
//     required int salesOrderId,
//   }) async* {
//     yield* soiStepAndRepeatStreamForSalesOrderController.stream
//         .where((event) => event.salesOrderId == salesOrderId)
//         .map((event) {
//       return event;
//     });
//   }

//   Stream<int> watchDeletionsForSalesOrder(
//     Session session,
//     Stream<int> stream, {
//     required int salesOrderId,
//   }) async* {
//     yield* removeStepAndRepeatFromSalesOrderController.stream;
//   }

//   Future<SoiStepAndRepeatDTO> createFromSalesOrderArtwork(
//     Session session, {
//     required int salesOrderId,
//     required int artworkId,
//   }) async {
//     final userId = (await session.authenticated)?.userId;

//     final now = DateTime.now();
//     final soiId = await CustomEntityKeysEndpoint().getNextIntKeyTransaction(
//       TableType.salesOrderItem,
//     );

//     final initialSoiStepAndRepeat = _initialSoiStepAndRepeat(
//       artworkId: artworkId,
//       soiId: soiId,
//       userId: userId!,
//       now: now,
//       salesOrderId: salesOrderId,
//     );
//     final inserted = await GenericCrud.create<SoiStepAndRepeatDTO>(
//       session,
//       SoiStepAndRepeatDTO.db.insertRow(
//         session,
//         initialSoiStepAndRepeat,
//       ),
//     );
//     final fetch = await fetchById(session, inserted.id!);

//     soiStepAndRepeatStreamForSalesOrderController.add(fetch!);

//     return inserted;
//   }

//   // Future<ArtworkDTO> create(
//   //   Session session, {
//   //   required String sessionId,
//   //   required int customerId,
//   //   required int artworkPreSelectionId,
//   //   required int artworkSelectionId,
//   // }) async {
//   //   final userId = (await session.authenticated)?.userId;
//   //   final artwork = _initialArtwork(
//   //     userId: userId!,
//   //     customerId: customerId,
//   //     artworkPreSelectionId: artworkPreSelectionId,
//   //     artworkSelectionId: artworkSelectionId,
//   //   );

//   //   return GenericCrud.create(
//   //     session,
//   //     ArtworkDTO.db.insertRow(
//   //       session,
//   //       artwork,
//   //     ),
//   //   );
//   // }

//   Future<SoiStepAndRepeatDTO?> fetchById(Session session, int id) async {
//     return SoiStepAndRepeatDTO.db.findById(
//       session,
//       id,
//       include: SoiStepAndRepeatDTO.include(
//         artwork: ArtworkDTO.include(
//           customer: CustomerDTO.include(
//             contact: ContactDTO.include(),
//           ),
//         ),
//         salesOrder: SalesOrderDTO.include(),
//       ),
//     );
//   }

//   Future<List<SoiStepAndRepeatDTO>> fetchForSalesOrder(
//     Session session,
//     int salesOrderId,
//   ) async {
//     return SoiStepAndRepeatDTO.db.find(
//       session,
//       where: (t) =>
//           t.salesOrderId.equals(salesOrderId) &
//           t.deletedAt.equals(null as DateTime?),
//       include: _tableInSalesOrderInclude,
//     );
//   }

//   Future<SoiStepAndRepeatDTO?> fetchAndLock(
//     Session session, {
//     required int id,
//     required String editingSessionId,
//   }) async {
//     return GenericCrud.fetchAndLockEntity<SoiStepAndRepeatDTO>(
//       session,
//       id: id,
//       tableType: _tableType,
//       editingSessionId: editingSessionId,
//       fetchById: fetchById,
//       tableName: SoiStepAndRepeatDTOTable().tableName,
//       streamController: soiStepAndRepeatStreamController,
//     );
//   }

//   // * UPDATE
//   Future<SoiStepAndRepeatDTO> update(
//     Session session, {
//     required SoiStepAndRepeatDTO entity,
//     required String sessionId,
//     required bool release,
//   }) async {
//     final updated = await GenericCrud.update<SoiStepAndRepeatDTO>(
//       session,
//       fetchById: fetchById,
//       sessionId: sessionId,
//       newEntity: entity,
//       updateEntity: SoiStepAndRepeatDTO.db.updateRow,
//       tableType: _tableType,
//       streamController: soiStepAndRepeatStreamController,
//       release: release,
//       logFields: [],
//     );
//     // final prevSalesOrderId = entity.salesOrderId;
//     // final nextSalesOrderId = updated.salesOrderId;
//     // // if the old sales order id is not the same as the new sales order id, we
//     // // need to remove the artwork from the old sales order
//     // if (prevSalesOrderId != nextSalesOrderId) {
//     //   removeArtworkFromSalesOrderController.add(entity.id!);
//     // }
//     // artworkStreamForSalesOrderController.add(updated);
//     return updated;
//   }

//   Future<void> release(
//     Session session, {
//     required int entityId,
//     required String sessionId,
//   }) async {
//     await GenericCrud.releaseEntity<SoiStepAndRepeatDTO>(
//       session,
//       entityId: entityId,
//       sessionId: sessionId,
//       fetchById: fetchById,
//       updateEntity: SoiStepAndRepeatDTO.db.updateRow,
//       tableType: _tableType,
//       streamController: soiStepAndRepeatStreamController,
//       deleteDraft: SoiStepAndRepeatDTO.db.deleteRow,
//     );
//   }

//   // * DELETE

//   Future<bool> delete(
//     Session session, {
//     required int entityId,
//     required String sessionId,
//   }) async {
//     return GenericCrud.markEntityAsDeleted<SoiStepAndRepeatDTO>(
//       session,
//       id: entityId,
//       sessionId: sessionId,
//       fetchById: fetchById,
//       updateEntity: SoiStepAndRepeatDTO.db.updateRow,
//       tableType: _tableType,
//       streamController: soiStepAndRepeatStreamController,
//     );
//   }

//   Future<List<SoiStepAndRepeatDTO>> find(
//     Session session, {
//     Sort? sort,
//     Filter? filter,
//   }) async {
//     final sortByField = SoiStepAndRepeatField.values.firstWhereOrNull(
//       (e) => e.name == sort?.fieldKey,
//     );
//     final expression =
//         buildFilterExpression<SoiStepAndRepeatDTOTable, SoiStepAndRepeatField>(
//       table: SoiStepAndRepeatDTOTable(),
//       filter: filter,
//       enumFromString: (String fieldKey) => SoiStepAndRepeatField.values
//           .firstWhereOrNull((e) => e.name == fieldKey),
//       getDbField: (table, field) => _dbFieldFromEnum(field)(table),
//     );

//     return SoiStepAndRepeatDTO.db.find(
//       session,
//       where: expression == null
//           // Filters out deleted entries
//           ? (t) => t.deletedAt.equals(null as DateTime?)
//           : (t) => expression,
//       orderBy: sortByField != null
//           ? _dbFieldFromEnum(sortByField)
//           : _dbFieldFromEnum(SoiStepAndRepeatField.description),
//       orderDescending: sort?.orderDescending ?? false,
//       include: SoiStepAndRepeatDTO.include(),
//     );
//   }

//   Column<dynamic> Function(SoiStepAndRepeatDTOTable) _dbFieldFromEnum(
//     SoiStepAndRepeatField sortFieldEnum,
//   ) {
//     switch (sortFieldEnum) {
//       case SoiStepAndRepeatField.soiId:
//         return (SoiStepAndRepeatDTOTable t) => t.soiId;
//       case SoiStepAndRepeatField.description:
//         return (SoiStepAndRepeatDTOTable t) => t.description;
//       case SoiStepAndRepeatField.createdAt:
//         return (SoiStepAndRepeatDTOTable t) => t.createdAt;
//       case SoiStepAndRepeatField.status:
//         return (SoiStepAndRepeatDTOTable t) => t.status;
//       case SoiStepAndRepeatField.artworks:
//         return (SoiStepAndRepeatDTOTable t) => t.id;
//       case SoiStepAndRepeatField.salesOrder:
//         return (SoiStepAndRepeatDTOTable t) => t.salesOrder.id;
//       case SoiStepAndRepeatField.createdBy:
//         return (SoiStepAndRepeatDTOTable t) => t.createdById;
//       case SoiStepAndRepeatField.lastModifiedBy:
//         return (SoiStepAndRepeatDTOTable t) => t.lastModifiedById;
//       case SoiStepAndRepeatField.deletedAt:
//         return (SoiStepAndRepeatDTOTable t) => t.deletedAt;
//       case SoiStepAndRepeatField.isDraft:
//         return (SoiStepAndRepeatDTOTable t) => t.isDraft;
//       case SoiStepAndRepeatField.lastModifiedAt:
//         return (SoiStepAndRepeatDTOTable t) => t.lastModifiedAt;
//     }
//   }

//   SoiStepAndRepeatDTO _initialSoiStepAndRepeat({
//     required int artworkId,
//     required int userId,
//     required DateTime now,
//     required int salesOrderId,
//     required int soiId,
//   }) {
//     return SoiStepAndRepeatDTO(
//       status: SoiStepAndRepeatStatus.wartenAufArtworks.name,
//       description: '',
//       artworkId: artworkId,
//       createdAt: now,
//       createdById: userId,
//       salesOrderId: salesOrderId,
//       isDraft: false,
//       soiId: soiId,
//     );
//   }

//   Future<List<EntityLockDTO>> findEntityLocks(Session session) async {
//     final entities = await SoiStepAndRepeatDTO.db.find(
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
