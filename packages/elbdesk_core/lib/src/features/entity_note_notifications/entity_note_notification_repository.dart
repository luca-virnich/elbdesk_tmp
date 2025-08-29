import 'package:elbdesk_backend_core_client/elbdesk_backend_core_client.dart';
import 'package:elbdesk_core/src/features/entity_note_notifications/models/entity_note_notification.dart';

class EntityNoteNotificationRepository {
  EntityNoteNotificationRepository({required this.endpoint});

  final EndpointEntityNoteNotification endpoint;

  Future<List<EntityNoteNotification>> fetchNotifications(int userId) async {
    final notifications = await endpoint.fetchUnreadNotifications(
      userId: userId,
    );
    return notifications.map(EntityNoteNotification.fromDTO).toList();
  }

  Future<void> markAsRead(int notificationId) async {
    await endpoint.markAsRead(notificationId);
  }

  Future<void> markAsUnRead(int notificationId) async {
    await endpoint.markAsUnRead(notificationId);
  }

  Future<void> markAsCleared(int notificationId) async {
    await endpoint.markAsCleared(notificationId);
  }
}
