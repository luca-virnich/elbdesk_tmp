import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_backend_core_server/src/modules/entity_notes/entity_note_notification_endpoint.dart';
import 'package:serverpod/serverpod.dart';

class EntityNoteNotificationNotifier {
  const EntityNoteNotificationNotifier._();

  static Future<void> notifyNewNote(Session session,
      {required EntityNoteDTO note,
      required String label,
      required String additionalData}) async {
    final now = DateTime.now();

    final mentions = note.mentions;
    final sender = note.createdById;
    final receivers = mentions.map((mention) => mention.userId).toSet();

    for (final receiver in receivers) {
      final notification = EntityNoteNotificationDTO(
        tableType: note.tableType,
        entityId: note.entityId,
        isUpdate: false,
        label: label,
        userId: receiver,
        noteId: note.id!,
        parentId: note.parentId,
        hardcodedSender: note.hardcodedSender,
        additionalData: additionalData,
        senderId: sender,
        createdAt: now,
        message: note.message,
      );
      await EntityNoteNotificationEndpoint().createNotification(
        session,
        notification,
      );
    }
    await session.close();
  }

  static Future<void> notifyUpdatedNote(Session session,
      {required EntityNoteDTO note,
      required String label,
      required String additionalData}) async {
    final receivers = note.mentions.map((mention) => mention.userId).toSet();

    final previousNotifications = await EntityNoteNotificationDTO.db.find(
      session,
      where: (t) => t.noteId.equals(note.id),
    );
    final previousReceivers = <int>{};
    for (final element in previousNotifications) {
      previousReceivers.add(element.userId!);
    }

    final sender = note.createdById;
    for (final receiver in receivers) {
      if (previousReceivers.contains(receiver)) {
        final previousNotification = previousNotifications.firstWhere(
          (element) => element.userId == receiver,
        );
        final notification = previousNotification.copyWith(
          message: note.message,
          createdAt: DateTime.now(),
          readAt: null,
          clearedAt: null,
          isUpdate: true,
        );
        await EntityNoteNotificationEndpoint().updateNotification(
          session,
          notification,
        );
      } else {
        final notification = EntityNoteNotificationDTO(
          tableType: note.tableType,
          entityId: note.entityId,
          isUpdate: true,
          label: label,
          userId: receiver,
          noteId: note.id!,
          parentId: note.parentId,
          additionalData: additionalData,
          senderId: sender,
          createdAt: DateTime.now(),
          message: note.message,
        );
        await EntityNoteNotificationEndpoint().createNotification(
          session,
          notification,
        );
      }
    }
    await session.close();
  }
}
