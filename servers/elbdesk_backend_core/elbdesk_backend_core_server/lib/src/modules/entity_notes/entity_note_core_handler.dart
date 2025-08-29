import 'dart:async';

import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';

final entityNoteStreamController = StreamController<EntityNoteDTO>.broadcast();

class EntityNoteCoreHandler {
  const EntityNoteCoreHandler._();

  static Future<EntityNoteDTO> createNote(
      Session session, EntityNoteDTO note) async {
    final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);
    final insertedNote = await EntityNoteDTO.db.insertRow(
      session,
      note.copyWith(
        createdById: userId,
        createdAt: now,
      ),
    );
    entityNoteStreamController.add(insertedNote);
    return insertedNote;
  }

  static Future<EntityNoteDTO> deleteNote(
      Session session, EntityNoteDTO note) async {
    final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);
    final updatedNote = await EntityNoteDTO.db.updateRow(
      session,
      note.copyWith(
        createdById: userId,
        deletedAt: now,
      ),
    );
    entityNoteStreamController.add(updatedNote);
    return updatedNote;
  }

  static Future<EntityNoteDTO> restoreNote(
      Session session, EntityNoteDTO note) async {
    final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);
    final updatedNote = await EntityNoteDTO.db.updateRow(
      session,
      note.copyWith(
        createdById: userId,
        deletedAt: null,
      ),
    );
    entityNoteStreamController.add(updatedNote);
    return updatedNote;
  }

  static Future<EntityNoteDTO> updateNote(
      Session session, EntityNoteDTO note) async {
    final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);
    final updatedNote = await EntityNoteDTO.db.updateRow(
      session,
      note.copyWith(
        createdById: userId,
        lastModifiedAt: now,
      ),
    );
    entityNoteStreamController.add(updatedNote);
    return updatedNote;
  }

  static Future<EntityNoteDTO> createSystemNote(Session session,
      {required EntityNoteDTO note, required String hardcodedSender}) async {
    final insertedNote = await EntityNoteDTO.db.insertRow(
      session,
      note.copyWith(
        createdAt: DateTime.now(),
        createdById: null,
        hardcodedSender: hardcodedSender,
      ),
    );

    entityNoteStreamController.add(insertedNote);

    return insertedNote;
  }
}
