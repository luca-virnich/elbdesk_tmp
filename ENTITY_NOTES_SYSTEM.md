# Entity Notes & Notifications System Documentation

## Overview

The Entity Notes and Notifications system in ElbDesk provides a comprehensive communication layer that allows users to add contextual notes to any entity (customers, sales orders, etc.) with real-time updates, mentions, and notifications. This guide explains the architecture, data flow, and implementation details for developers.

## Table of Contents
1. [Architecture Overview](#architecture-overview)
2. [Data Models](#data-models)
3. [Core Components](#core-components)
4. [Data Flow](#data-flow)
5. [Mentions System](#mentions-system)
6. [Notifications System](#notifications-system)
7. [UI Components](#ui-components)
8. [Implementation Guide](#implementation-guide)
9. [Best Practices](#best-practices)

## Architecture Overview

The system consists of three main layers:

```
┌─────────────────────────────────────────────────────────────┐
│                        CLIENT LAYER                          │
│  ┌─────────────────┐  ┌──────────────────┐  ┌────────────┐ │
│  │ EntityNotesView │  │ NotificationTile │  │ Repository │ │
│  └────────┬────────┘  └────────┬─────────┘  └──────┬─────┘ │
│           │                    │                     │       │
│           └────────────────────┴─────────────────────┘       │
└───────────────────────────────┬─────────────────────────────┘
                                │ WebSocket
┌───────────────────────────────┴─────────────────────────────┐
│                        SERVER LAYER                          │
│  ┌─────────────────┐  ┌──────────────────┐  ┌────────────┐ │
│  │ EntityNoteEndpt │  │ NotificationHndlr │  │ AdditionalD│ │
│  └────────┬────────┘  └────────┬─────────┘  └──────┬─────┘ │
│           └────────────────────┴─────────────────────┘       │
└───────────────────────────────┬─────────────────────────────┘
                                │
┌───────────────────────────────┴─────────────────────────────┐
│                      DATABASE LAYER                          │
│  ┌─────────────────┐  ┌──────────────────────────────────┐ │
│  │  entity_notes   │  │  entity_note_notifications      │ │
│  └─────────────────┘  └──────────────────────────────────┘ │
└─────────────────────────────────────────────────────────────┘
```

## Data Models

### EntityNote (Client & Server)

```dart
// Location: packages/elbdesk_core/lib/src/features/entity_notes/entity_note.dart
class EntityNote {
  final int id;
  final String entityId;        // Format: "table_name:entity_id"
  final int userId;
  final String note;            // Contains encoded mentions: [user:123]
  final DateTime created;
  final int? parentId;          // For threading
  final List<Mention> mentions; // Parsed mention data
  final bool isDeleting;        // Soft delete state
  final List<EntityNote> children; // Thread replies
}
```

### EntityNoteNotification

```dart
// Location: packages/elbdesk_core/lib/src/features/entity_note_notifications/models/
class EntityNoteNotification {
  final int id;
  final int noteId;
  final int recipientUserId;
  final bool isRead;
  final DateTime created;
  final String additionalData;  // JSON with entity context
  final String notePreview;
  final int senderUserId;
  final String senderName;
}
```

### Mention

```dart
// Server: servers/elbdesk_server/lib/src/modules/core/entity_note/models/mention.spy.yaml
class Mention {
  final int userId;
  final String userName;
  final int start;              // Text position start
  final int end;                // Text position end
}
```

## Core Components

### Server-Side Components

#### 1. EntityNoteEndpoint
**Location**: `servers/elbdesk_server/lib/src/modules/core/entity_note/endpoints/entity_note_endpoint.dart`

Responsibilities:
- CRUD operations for entity notes
- Real-time streaming of note updates
- Mention parsing and encoding
- Thread management

Key Methods:
```dart
Future<EntityNote> createNote(String entityId, String note, List<Mention> mentions)
Future<EntityNote> updateNote(int noteId, String note, List<Mention> mentions)
Stream<List<EntityNote>> watchNotes(String entityId)
Future<void> deleteNote(int noteId)
```

#### 2. EntityNoteNotificationHandler
**Location**: `servers/elbdesk_server/lib/src/modules/core/entity_note/entity_note_notification_handler.dart`

Responsibilities:
- Creates notifications for mentioned users
- Updates notifications when notes are edited
- Manages notification lifecycle
- Attaches entity-specific context data

Key Methods:
```dart
Future<void> handleNoteCreated(EntityNote note, List<Mention> mentions)
Future<void> handleNoteUpdated(EntityNote note, List<Mention> mentions)
Future<void> markAsRead(int notificationId)
```

#### 3. EntityNoteAdditionalDataHandler
**Location**: `servers/elbdesk_server/lib/src/modules/core/entity_note/entity_note_additional_data_handler.dart`

Generates entity-specific metadata for notifications:
- Customer names for customer entities
- Order numbers for sales orders
- Item descriptions for order items
- Labels and icons for different entity types

### Client-Side Components

#### 1. EntityNoteRepository
**Location**: `packages/elbdesk_core/lib/src/features/entity_notes/entity_note_repository.dart`

Responsibilities:
- Client-server communication
- Mention encoding/decoding
- Local state management
- Optimistic updates

Key Methods:
```dart
Future<void> addNote(String entityId, String note, List<Mention> mentions)
Stream<List<EntityNote>> watchNotes(String entityId)
String encodeMentions(String text, List<Mention> mentions)
String decodeMentions(String encodedText)
```

#### 2. WatchNotes Provider
**Location**: `packages/elbdesk_core/lib/src/features/entity_notes/logic/`

Maintains real-time note state with:
- Automatic reconnection
- Hierarchical thread structure
- Optimistic updates
- Error handling

## Data Flow

### Creating a Note with Mentions

1. **User Input**: User types note with @mentions in `EntityNoteInputTextField`
2. **Mention Parsing**: `MentionTextController` tracks mention positions
3. **Encoding**: Repository converts "@John Doe" → "[user:123]"
4. **Server Processing**:
   - Note saved to database
   - Notifications created for each mention
   - Streams updated for all viewers
5. **Client Updates**: All connected clients receive the new note
6. **Notification Delivery**: Mentioned users receive notifications

### Notification Flow

```
User creates note → Server extracts mentions → Create notifications
                                             ↓
Desktop alert ← Stream to recipients ← Save to database
     ↓
Click opens entity window with notes visible
```

## Mentions System

### How Mentions Work

1. **Trigger**: User types "@" character
2. **Autocomplete**: Dropdown shows matching users
3. **Selection**: Creates `Mention` object with:
   - User ID and name
   - Text positions (start/end)
4. **Visual**: Mentions appear in blue
5. **Storage**: Encoded format in database

### Mention Encoding/Decoding

**Before Save**: 
```
"Please review this @John Doe and @Jane Smith"
↓
"Please review this [user:123] and [user:456]"
```

**On Display**:
```
"Please review this [user:123] and [user:456]"
↓
"Please review this @John Doe and @Jane Smith"
```

## Notifications System

### Notification Creation Rules

- Created for each mentioned user (except sender)
- Updated when note is edited with new mentions
- Linked to specific entity for context
- Include preview of note content
- Real-time delivery via streams

### Entity-Specific Context

Each entity type has custom notification data:

```json
// Customer notification
{
  "entityLabel": "Customer ABC Corp",
  "entitySubLabel": "ID: 12345",
  "entityType": "customer"
}

// Sales order notification  
{
  "entityLabel": "Order #SO-2024-001",
  "entitySubLabel": "Customer: ABC Corp",
  "entityType": "sales_order"
}
```

## UI Components

### EntityNotesView
**Location**: `packages/elbdesk_core/lib/src/features/entity_notes/entity_notes_view.dart`

Main notes interface with:
- Threaded conversation view
- Real-time updates
- Mention input field
- Delete with undo
- Loading states

### ChatBubble
**Location**: `packages/elbdesk_core/lib/src/features/entity_notes/ui/chat_bubble.dart`

Renders individual notes with:
- User avatar
- Formatted text with mentions
- Timestamps
- Reply threading
- Delete button (own notes)

### EntityNoteNotificationTile
**Location**: `packages/elbdesk_core/lib/src/features/entity_note_notifications/widgets/`

Notification display with:
- Entity context
- Note preview
- Read/unread state
- Click to navigate

## Implementation Guide

### Adding Notes to a New Entity

1. **Define Entity ID Format**:
```dart
final entityId = "${TableType.yourTable.name}:$entityPrimaryKey";
```

2. **Add Notes View**:
```dart
EntityNotesView(
  entityId: entityId,
  onNoteAdded: () {
    // Optional callback
  },
)
```

3. **Handle Additional Data** (Server):
```dart
// In EntityNoteAdditionalDataHandler
case TableType.yourTable:
  final entity = await db.yourTable.findById(entityId);
  return {
    'entityLabel': entity.name,
    'entitySubLabel': entity.description,
    'entityType': table.name,
  };
```

### Implementing Custom Notification Handling

1. **Create Custom Tile**:
```dart
class YourEntityNotificationTile extends EntityNotificationBaseTile {
  @override
  Widget buildContent(BuildContext context) {
    // Your custom layout
  }
  
  @override
  Future<void> onTap(BuildContext context, WidgetRef ref) {
    // Open your entity window
  }
}
```

2. **Register in Notification System**:
```dart
// In your notification display logic
switch (entityType) {
  case 'your_table':
    return YourEntityNotificationTile(notification);
}
```

## Best Practices

### Performance
- Use streams for real-time updates
- Implement pagination for large note threads
- Cache user data for mention display
- Batch notification updates

### Security
- Validate mention user IDs on server
- Check entity access permissions
- Sanitize note content
- Audit note modifications

### User Experience
- Show optimistic updates immediately
- Provide clear feedback for actions
- Handle offline scenarios gracefully
- Implement proper loading states

### Code Organization
- Keep mention logic in dedicated controllers
- Separate UI from business logic
- Use providers for state management
- Follow repository pattern

## Troubleshooting

### Common Issues

1. **Mentions not highlighting**:
   - Check mention positions are correct
   - Verify encoding/decoding logic
   - Ensure TextSpan builder is working

2. **Notifications not appearing**:
   - Verify WebSocket connection
   - Check user permissions
   - Confirm notification handler is running

3. **Threading issues**:
   - Ensure parentId is set correctly
   - Check recursive building of threads
   - Verify deletion doesn't break hierarchy

### Debugging Tips

- Enable Serverpod logging for streams
- Use browser DevTools for WebSocket inspection
- Check notification table for created records
- Monitor mention encoding in network tab

## Future Enhancements

Potential improvements to consider:
- Rich text editing (bold, italic, etc.)
- File attachments
- Notification preferences per user
- Email notification integration
- Mobile push notifications
- Note templates
- Bulk mention (@all, @team)
- Note search and filtering