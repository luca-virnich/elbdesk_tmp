---
title: "Notes and Notifications"
description: "Adding Notes and Note Notifications to a Floating Card"
sidebar_position: 2
---

:::important
After adding notes the first time to a card, you need to make sure the cards min size still works with expanded right side navigation and opened notes chat. If the min size is too small and the content creates an overflow, adjust the min size for that window in the `floating_window_type.dart`.
:::

# Adding Notes and Note Notifications to a Floating Card

This section explains how to implement notes including notifications for entities in floating cards. Following these steps will enable users to receive notifications about notes and access note chats through notification tiles.

## Implementation Steps

### 1. Add a New Notification Tile

In `entity_note_notification_tile.dart`, add a new statement to the switch case that returns a new notification tile Widget for the type of entity you're adding:

```dart
class _YourEntityTile extends ConsumerWidget {
  const _YourEntityTile({required this.notification});

  final EntityNoteNotification notification;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Parse additional data from the notification
    final additionalData = YourEntityAdditionalData.fromJson(
      notification.additionalData ?? {},
    );

    return _BaseTile(
      subtitle: additionalData.customProperty ?? '',
      icon: TableTypeWrapper(TableType.yourEntity).tableIcon,
      notification: notification,
      onPressed: () {
        ref.read(floatingWindowDataStateProvider.notifier).addWindow(
              FloatingYourEntityWindowData(
                entityId: notification.entityId,
                initialNoteId: notification.id,
                initialNoteParentId: notification.parentId,
                // Add any other necessary properties from additionalData
              ),
            );
      },
    );
  }
}
```

The `_BaseTile` provides a consistent look across different notification tiles, with:
- Label and subtitle for identifying the entity
- Icon for visual representation
- Notification data for the message display
- onPressed handler for opening the entity window when clicked. It is important to privde the initialNoteId and initialNoteParentId, this will open the floating card with the chat or thread already opened.

### 2. Create Additional Data Class

As it can be seen in the previous example, we need to create an additional data class.
It should be located in the entity's class definition file `your_entity.dart`.

```dart
class YourEntityAdditionalData implements AdditionalEntityData {
  const YourEntityAdditionalData({
    required this.customProperty,
    // Add other properties needed
    // for example a custom name or another id which is required by the addWindow() method
  });

  final String? customProperty;
  // Other fields

  factory YourEntityAdditionalData.fromJson(Map<String, dynamic> json) {
    return YourEntityAdditionalData(
      customProperty: json['customProperty'] as String?,
      // Parse other properties
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'customProperty': customProperty,
      // Add other properties
    };
  }
}
```

### 3. Update Floating Window Data

In `floating_new_entity_window_data.dart`, add the `initialNoteId` and `initialNoteParentId` parameters:

```dart
@immutable
class FloatingYourEntityWindowData extends FloatingWindowData {
  FloatingYourEntityWindowData({
    required this.entityId,
    // Add these
    this.initialNoteId,
    this.initialNoteParentId,
  }) : super(
          type: FloatingWindowType.yourEntity,
          floatingWindowId: const Uuid().v4(),
          createdAt: DateTime.now(),
          taskbarIcon: AppIcons.yourEntityIcon,
        );

  @override
  void onClose() {}

  @override
  void onSave() {}

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FloatingYourEntityWindowData &&
        other.entityId == entityId &&
        other.type == type &&
        other.floatingWindowId == floatingWindowId &&
        other.createdAt == createdAt &&
        other.taskbarIcon == taskbarIcon &&
        // Add these
        other.initialNoteId == initialNoteId &&
        other.initialNoteParentId == initialNoteParentId;
  }

  @override
  int get hashCode => Object.hash(
        entityId,
        type,
        floatingWindowId,
        createdAt,
        taskbarIcon,
        // Add these
        initialNoteId,
        initialNoteParentId,
      );

  final int entityId;
  // Add these
  final int? initialNoteId;
  final int? initialNoteParentId;
}
```

Make sure the parameters are:
- Nullable
- Not required
- Included in the `==` operator
- Included in the `hashCode` getter

### 4. Update Floating Entity Card

In the `floating_new_entity_card.dart`, pass the note IDs to the entity card:

```dart
class FloatingYourEntityCard extends HookWidget {
  const FloatingYourEntityCard({
    required this.data,
    super.key,
  });

  final FloatingYourEntityWindowData data;

  @override
  Widget build(BuildContext context) {
    final floatingWindowFocus = useFocusNode();
    return FloatingWindow(
      key: Key('floating-${data.floatingWindowId}'),
      windowType: data.type,
      windowId: data.floatingWindowId,
      floatingWindowFocus: floatingWindowFocus,
      child: YourEntityCard(
        floatingWindowId: data.floatingWindowId,
        entityId: data.entityId,
        floatingWindowFocus: floatingWindowFocus,
        // Add these
        initialNoteId: data.initialNoteId,
        initialNoteParentId: data.initialNoteParentId,
      ),
    );
  }
}
```

### 5. Update Entity Card

In the entity card implementation, add the note IDs as parameters:

```dart
class YourEntityCard extends HookConsumerWidget {
  const YourEntityCard({
    required this.floatingWindowId,
    required this.entityId,
    required this.floatingWindowFocus,
    //Add these
    this.initialNoteId,
    this.initialNoteParentId,
    super.key,
  });

  final String floatingWindowId;
  final int entityId;
  final FocusNode floatingWindowFocus;
  //Add these
  final int? initialNoteId;
  final int? initialNoteParentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Card implementation ...
    
    return FloatingCardBody(
      floatingWindowId: floatingWindowId,
      navigatorKey: navigatorKey,
      // Add these, they will set up the notes section
      noteEntityId: entityId,
      noteEntity: TableType.yourEntity,
      // Pass the parameters to FloatingCardBody
      initialNoteId: initialNoteId,
      initialNoteParentId: initialNoteParentId,
      children: [
        // ...
      ],
    );
  }
}
```

The `FloatingCardBody` will use these parameters to:
- Set up the note chats section
- Open the correct note thread when notification is clicked


### 6. Add Note Data Handler

In `entity_note_notification_handler.dart`, add a static method to fetch the label and additional data for your entity:

```dart
static Future<({String label, String additionalData})> yourEntityLabelAndData(
  Session session,
  int id,
) async {
  final entity = await YourEntityDTO.db.findById(session, id);
  if (entity == null) {
    return (label: '', additionalData: '{}');
  }
  
  final additionalData = {
    'customProperty': entity.customProperty,
    // Add other properties needed for notifications
  };
  
  return (
    label: entity.name, 
    additionalData: jsonEncode(additionalData)
  );
}
```

Then add your entity to the switch statement in the handler functions:

```dart
final (:label, :additionalData) = switch (note.entity) {
  TableType.contact => await contactLabel(session, note.entityId),
  TableType.salesOrder => await salesOrderLabelAndData(session, note.entityId),
  // Add your entity
  TableType.yourEntity => await yourEntityLabelAndData(session, note.entityId),
  _ => (label: note.entity.name, additionalData: '{}'),
};
```

