import 'dart:async';

import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';

class EntityNoteCoreEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Stream<EntityNoteDTO> watch(
    Session session, {
    required String tableType,
    required int entityId,
  }) async* {
    yield* entityNoteStreamController.stream
        .where(
      (event) => event.tableType == tableType && event.entityId == entityId,
    )
        .map((event) {
      return event;
    });
  }

  Future<List<EntityNoteDTO>> fetchNotes(
    Session session, {
    required String tableType,
    required int entityId,
  }) async {
    return EntityNoteDTO.db.find(
      session,
      where: (t) => t.tableType.equals(tableType) & t.entityId.equals(entityId),
      orderBy: (t) => t.createdAt,
      orderDescending: true,
    );
  }

  Future<void> createNote(
    Session session,
    EntityNoteDTO note,
  ) async {
    await EntityNoteCoreHandler.createNote(session, note);
  }

  Future<void> updateNote(
    Session session,
    EntityNoteDTO note,
  ) async {
    await EntityNoteCoreHandler.updateNote(session, note);
  }

  Future<void> deleteNote(
    Session session,
    EntityNoteDTO note,
  ) async {
    await EntityNoteCoreHandler.deleteNote(session, note);
  }

  Future<void> restoreNote(
    Session session,
    EntityNoteDTO note,
  ) async {
    await EntityNoteCoreHandler.restoreNote(session, note);
  }
}
