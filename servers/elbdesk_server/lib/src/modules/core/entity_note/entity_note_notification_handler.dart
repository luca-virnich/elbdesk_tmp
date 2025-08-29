import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/modules/core/entity_note/entity_note_additional_data_handler.dart';
import 'package:serverpod/serverpod.dart';

class EntityNoteNotificationHandler {
  const EntityNoteNotificationHandler._();

  static Future<void> handleNewNote(EntityNoteDTO note) async {
    final session = await Serverpod.instance.createSession();

    final (:label, :additionalData) =
        await EntityNoteAdditionalDataHandler.getAdditionalData(session, note);

    await EntityNoteNotificationNotifier.notifyNewNote(
      session,
      note: note,
      label: label,
      additionalData: additionalData,
    );
  }

  static Future<void> handleUpdatedNote(EntityNoteDTO note) async {
    final session = await Serverpod.instance.createSession();
    final (:label, :additionalData) =
        await EntityNoteAdditionalDataHandler.getAdditionalData(session, note);
    await EntityNoteNotificationNotifier.notifyUpdatedNote(
      session,
      note: note,
      label: label,
      additionalData: additionalData,
    );
  }
}

// ! FIXME
// TODO(luca): Where should this go?

class IdPrefixes {
  /// Private constructor to prevent instantiation.
  const IdPrefixes._();

  static const String soi = 'FA';
  static const String product = 'P';
  static const String bearer = 'T';
  static const String layer = 'L';
}
