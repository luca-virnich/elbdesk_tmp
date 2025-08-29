import 'dart:async';
import 'dart:io';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_core/src/features/entity_note_notifications/entity_note_notification_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'entity_note_notification_provider.freezed.dart';
part 'entity_note_notification_provider.g.dart';

@riverpod
EntityNoteNotificationRepository entityNoteNotificationRepository(
  Ref ref,
) {
  return EntityNoteNotificationRepository(
    endpoint: EndpointEntityNoteNotification(
      ElbDeskCore.client,
    ),
  );
}

@riverpod
Future<List<EntityNoteNotification>> fetchEntityNoteNotifications(
  Ref ref,
) async {
  final userId = sessionManager.signedInUser?.id;
  if (userId == null) {
    return [];
  }
  final repository = ref.watch(entityNoteNotificationRepositoryProvider);
  return repository.fetchNotifications(userId);
}

@riverpod
Stream<EntityNoteNotification> watchEntityNoteNotificationsStream(
  Ref ref,
) async* {
  final endpoint = EndpointEntityNoteNotification(
    ElbDeskCore.client,
  );
  final streamHelper = ServerpodStreamManager<EntityNoteNotification,
      EntityNoteNotificationDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: endpoint.watch,
    convertDtoToModel: EntityNoteNotification.fromDTO,
    onError: (error) {
      dlog('Error occurred in streamNotes: $error');
    },
  );
}

@riverpod
Future<int> getUnreadNotificationsCount(Ref ref) async {
  final notifications =
      await ref.watch(watchEntityNoteNotificationsProvider.future);
  return notifications
      .where((notification) => notification.readAt == null)
      .length;
}

@riverpod
class WatchEntityNoteNotifications extends _$WatchEntityNoteNotifications {
  @override
  Future<List<EntityNoteNotification>> build() async {
    final initals =
        await ref.watch(fetchEntityNoteNotificationsProvider.future);

    ref.listen(watchEntityNoteNotificationsStreamProvider, (previous, next) {
      if (next is AsyncData<EntityNoteNotification>) {
        handleEvent(next.value);
        if (Platform.isWindows && !kIsWeb) {
          WindowsTaskbar.setFlashTaskbarAppIcon(
            mode: TaskbarFlashMode.tray | TaskbarFlashMode.timernofg,
            timeout: const Duration(milliseconds: 500),
          );
        }
      }
    });

    return initals;
  }

  Future<void> handleEvent(EntityNoteNotification notification) async {
    final currentList = state.whenData((list) => [...list]).requireValue;

    // If notification is cleared, remove it from the list
    if (notification.clearedAt != null) {
      final updatedList = currentList
          .where((element) => element.id != notification.id)
          .toList();
      state = AsyncData(updatedList);
      // no notificatoon overlay
      return;
    }

    // Update existing notification or add new one
    final existingIndex = currentList.indexWhere(
      (element) => element.id == notification.id,
    );

    if (existingIndex >= 0) {
      // Replace existing notification with updated one
      final updatedList = [...currentList];
      updatedList[existingIndex] = notification;
      // fetch current notification from current state list
      final currentNotification = currentList[existingIndex];
      final hasNewMessage = currentNotification.message != notification.message;
      if (hasNewMessage) {
        // show notification overlay
        ref
            .read(notificationOverlayStateProvider.notifier)
            .showNotificationOverlay(
              EntityNotificationOvleray(
                message: notification.message,
                type: EntityNotificationOverlayType.updatedMessage,
              ),
            );
      }

      state = AsyncData(updatedList);
    } else {
      ref
          .read(notificationOverlayStateProvider.notifier)
          .showNotificationOverlay(
            EntityNotificationOvleray(
              message: notification.message,
              type: EntityNotificationOverlayType.newMessage,
            ),
          );
      // Add new notification at the beginning of the list
      state = AsyncData([notification, ...currentList]);
    }
  }
}

enum EntityNotificationOverlayType {
  newMessage,
  updatedMessage,
}

@freezed
class EntityNotificationOvleray with _$EntityNotificationOvleray {
  const factory EntityNotificationOvleray({
    required String message,
    required EntityNotificationOverlayType type,
  }) = _EntityNotificationOvleray;

  factory EntityNotificationOvleray.fromJson(Map<String, dynamic> json) =>
      _$EntityNotificationOvlerayFromJson(json);

  const EntityNotificationOvleray._();
}

@riverpod
class NotificationOverlayState extends _$NotificationOverlayState {
  @override
  EntityNotificationOvleray? build() {
    return null;
  }

  void showNotificationOverlay(EntityNotificationOvleray notification) {
    state = notification;
  }
}
