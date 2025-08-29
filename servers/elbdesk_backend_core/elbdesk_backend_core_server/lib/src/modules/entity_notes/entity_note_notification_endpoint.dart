import 'dart:async';

import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';

final entityNoteNotificationStreamController =
    StreamController<EntityNoteNotificationDTO>.broadcast();

class EntityNoteNotificationEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Stream<EntityNoteNotificationDTO> watch(
    Session session,
  ) async* {
    final userId = await CoreUtils.getCurrentUserId(session);
    yield* entityNoteNotificationStreamController.stream
        // .where((event) => event.userId == userId && event.senderId != userId)
        .where((event) => event.userId == userId)
        .map((event) {
      return event;
    });
  }

  Future<void> updateNotification(
    Session session,
    EntityNoteNotificationDTO notification,
  ) async {
    final updated = await EntityNoteNotificationDTO.db.updateRow(
      session,
      notification,
    );
    entityNoteNotificationStreamController.add(updated);
  }

  Future<void> createNotification(
    Session session,
    EntityNoteNotificationDTO notification,
  ) async {
    final insertedNotification = await EntityNoteNotificationDTO.db.insertRow(
      session,
      notification,
    );

    entityNoteNotificationStreamController.add(insertedNotification);
  }

  Future<void> markAsRead(Session session, int notificationId) async {
    await session.db.unsafeQuery(
      'UPDATE ed_core_entity_note_notification SET "readAt" = NOW() WHERE id=$notificationId',
    );
    final notification = await EntityNoteNotificationDTO.db.findById(
      session,
      notificationId,
    );
    if (notification == null) {
      return;
    }
    entityNoteNotificationStreamController.add(notification);
  }

  Future<void> markAsUnRead(Session session, int notificationId) async {
    await session.db.unsafeQuery(
      'UPDATE ed_core_entity_note_notification SET "readAt" = NULL WHERE id=$notificationId',
    );
    final notification = await EntityNoteNotificationDTO.db.findById(
      session,
      notificationId,
    );
    if (notification == null) {
      return;
    }
    entityNoteNotificationStreamController.add(notification);
  }

  Future<void> markAsCleared(Session session, int notificationId) async {
    await session.db.transaction((transaction) async {
      await session.db.unsafeQuery(
        'UPDATE ed_core_entity_note_notification SET "clearedAt" = NOW() WHERE id=$notificationId',
        transaction: transaction,
      );
    });
    final notification = await EntityNoteNotificationDTO.db.findById(
      session,
      notificationId,
    );

    if (notification == null) {
      return;
    }
    entityNoteNotificationStreamController.add(notification);
  }

  // Future<void> deleteNote(Session session, EntityNoteDTO note) async {
  //   final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);
  //   if (userId != note.createdById!) {
  //     return;
  //   }
  //   await EntityNoteDTO.db.updateRow(
  //     session,
  //     note.copyWith(
  //       createdById: userId,
  //       deletedAt: now,
  //     ),
  //   );
  //   final withUser = await EntityNoteDTO.db.findById(
  //     session,
  //     note.id!,
  //     include: EntityNoteDTO.include(
  //       createdBy: UserInfo.include(),
  //     ),
  //   );
  //   entityNoteStreamController.add(withUser!);
  // }

  Future<List<EntityNoteNotificationDTO>> fetchUnreadNotifications(
    Session session, {
    required int userId,
  }) async {
    return EntityNoteNotificationDTO.db.find(
      session,
      where: (t) =>
          t.userId.equals(userId) &
          t.clearedAt.equals(null as DateTime?) &
          t.senderId.notEquals(userId),
      orderBy: (t) => t.createdAt,
      orderDescending: true,
    );
  }
}
