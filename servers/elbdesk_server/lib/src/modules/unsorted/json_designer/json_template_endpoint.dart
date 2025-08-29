// import 'dart:async';

// import 'package:elbdesk_server/src/generated/protocol.dart';
// import 'package:elbdesk_server/src/modules/core/generic_crud.dart';
// import 'package:serverpod/serverpod.dart';

// final jsonTemplateStreamController =
//     StreamController<JsonTemplateDTO>.broadcast();

// /// Endpoint for managing JSON templates.
// class JsonTemplateEndpoint extends Endpoint {
//   @override
//   bool get requireLogin => true;

//   final _tableType = TableType.jsonTemplate;

//   Stream<JsonTemplateDTO> watch(
//     Session session,
//     Stream<JsonTemplateDTO> stream, {
//     required String sessionId,
//     required int entityId,
//   }) async* {
//     session.addWillCloseListener(
//       (session) {
//         release(session, entityId: entityId, sessionId: sessionId);
//       },
//     );

//     yield* jsonTemplateStreamController.stream
//         .where((event) => event.id == entityId)
//         .map((event) {
//       return event;
//     });
//   }

//   Future<JsonTemplateDTO> create(
//     Session session,
//     String sessionId,
//   ) async {
//     final userId = (await session.authenticated)?.userId;

//     final initialTemplate = JsonTemplateDTO(
//       name: '',
//       type: JsonTemplateType.speedy,
//       createdById: userId,
//       json: JsonDTO(
//         name: 'Items',
//         type: JsonFieldType.object,
//         jsonKey: 'items',
//         jsonValue: '',
//         uuid: const Uuid().v4(),
//         children: {},
//       ),
//       editingSession: sessionId,
//       isDraft: true,
//       createdAt: DateTime.now(),
//     );

//     return GenericCrud.create(
//       session,
//       JsonTemplateDTO.db.insertRow(session, initialTemplate),
//     );
//   }

//   Future<JsonTemplateDTO?> fetchById(Session session, int id) async {
//     return JsonTemplateDTO.db.findById(
//       session,
//       id,
//     );
//   }

//   Future<List<JsonTemplateDTO>> fetchAll(Session session) async {
//     return JsonTemplateDTO.db.find(
//       session,
//       orderBy: _jsonTemplateDbFieldFromEnum(JsonTemplateField.description),
//       where: (t) => t.deletedAt.equals(null) & t.isDraft.equals(false),
//       orderDescending: false,
//     );
//   }

//   Future<void> release(
//     Session session, {
//     required int entityId,
//     required String sessionId,
//   }) async {
//     await GenericCrud.releaseEntity<JsonTemplateDTO>(
//       session,
//       entityId: entityId,
//       sessionId: sessionId,
//       fetchById: fetchById,
//       updateEntity: JsonTemplateDTO.db.updateRow,
//       tableType: _tableType,
//       streamController: jsonTemplateStreamController,
//       deleteDraft: JsonTemplateDTO.db.deleteRow,
//     );
//   }

//   Future<JsonTemplateDTO?> fetchAndLock(
//     Session session, {
//     required int id,
//     required String editingSessionId,
//   }) async {
//     return GenericCrud.fetchAndLockEntity<JsonTemplateDTO>(
//       session,
//       id: id,
//       tableType: _tableType,
//       editingSessionId: editingSessionId,
//       fetchById: fetchById,
//       tableName: JsonTemplateDTOTable().tableName,
//       streamController: jsonTemplateStreamController,
//     );
//   }

//   Future<JsonTemplateDTO> update(
//     Session session, {
//     required JsonTemplateDTO entityDto,
//     required String sessionId,
//     required bool release,
//   }) async {
//     // check if the entity is being edited by the user
//     final serverEntity = await fetchById(session, entityDto.id!);
//     if (serverEntity!.editingSession != sessionId) {
//       throw ElbException(
//         exceptionType: ElbExceptionType.conflict,
//         elbExceptionMessage: ElbExceptionMessage.invalidSessionId,
//         message: 'Invalid sessionId',
//       );
//     } else {
//       // we have to check if the requestest contact is the latest version

//       final now = DateTime.now();

//       if (serverEntity.lastModifiedAt != null &&
//           serverEntity.lastModifiedAt!.isAfter(now)) {
//         throw ElbException(
//           exceptionType: ElbExceptionType.conflict,
//           elbExceptionMessage: ElbExceptionMessage.modifiedByAnotherUser,
//           message: 'Contact has been modified by another user',
//         );
//       }
//       final userId = (await session.authenticated)?.userId;

//       // update last modified at
//       final updatedEntity = entityDto.copyWith(
//         lastModifiedAt: now,
//         lastModifiedById: userId,
//         editingSession: release ? null : serverEntity.editingSession,
//         editingSince: release ? null : now,
//         editingById: release ? null : userId,
//         createdById: serverEntity.createdById,
//         isDraft: false,
//         deletedAt: serverEntity.deletedAt,
//         deletedById: serverEntity.deletedById,
//       );

//       try {
//         final savedEntity =
//             await JsonTemplateDTO.db.updateRow(session, updatedEntity);

//         final refetchedEntity = await fetchById(session, savedEntity.id!);
//         session.log('refetchedEntity: $refetchedEntity');

//         if (release) {}
//         jsonTemplateStreamController.add(updatedEntity);

//         return updatedEntity;
//       } catch (e) {
//         throw ElbException(
//           exceptionType: ElbExceptionType.unknown,
//           message: e.toString(),
//         );
//       }
//     }
//   }

//   Future<bool> delete(
//     Session session, {
//     required int id,
//     required String sessionId,
//   }) async {
//     final deleted = await GenericCrud.markEntityAsDeleted<JsonTemplateDTO>(
//       session,
//       id: id,
//       sessionId: sessionId,
//       fetchById: fetchById,
//       updateEntity: JsonTemplateDTO.db.updateRow,
//       tableType: _tableType,
//       streamController: jsonTemplateStreamController,
//     );
//     return deleted;
//   }

//   Column<dynamic> Function(JsonTemplateDTOTable) _jsonTemplateDbFieldFromEnum(
//     JsonTemplateField sortFieldEnum,
//   ) {
//     switch (sortFieldEnum) {
//       case JsonTemplateField.description:
//         return (JsonTemplateDTOTable t) => t.name;
//       case JsonTemplateField.id:
//         return (JsonTemplateDTOTable t) => t.id;
//       case JsonTemplateField.type:
//         return (JsonTemplateDTOTable t) => t.type;
//       case JsonTemplateField.json:
//         return (JsonTemplateDTOTable t) => t.json;
//       case JsonTemplateField.createdAt:
//         return (JsonTemplateDTOTable t) => t.createdAt;
//       case JsonTemplateField.createdBy:
//         return (JsonTemplateDTOTable t) => t.createdById;

//       case JsonTemplateField.isDraft:
//         return (JsonTemplateDTOTable t) => t.isDraft;
//       case JsonTemplateField.lastModifiedAt:
//         return (JsonTemplateDTOTable t) => t.lastModifiedAt;
//       case JsonTemplateField.lastModifiedBy:
//         return (JsonTemplateDTOTable t) => t.lastModifiedById;
//       case JsonTemplateField.editingSession:
//         return (JsonTemplateDTOTable t) => t.editingSession;
//       case JsonTemplateField.deletedBy:
//         return (JsonTemplateDTOTable t) => t.deletedById;
//       case JsonTemplateField.deletedAt:
//         return (JsonTemplateDTOTable t) => t.deletedAt;
//     }
//   }

//   Future<List<EntityLockDTO>> findEntityLocks(Session session) async {
//     final entities = await JsonTemplateDTO.db.find(
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
