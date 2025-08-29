---
sidebar_position: 3
---



# Generic Crud

The GenericCrud class offers generic methods for CRUD (Create, Read, Update, Delete) operations in a Serverpod application. It simplifies recurring logic implementations such as error handling, entity locking, and stream processing.


## Definition of the GenericCrud Class

```dart
class GenericCrud {
  const GenericCrud._();
  // ...
}
```

The class is implemented as a singleton by making the constructor private. This prevents instances of the class from being created externally.

## Method Overview

- `create`
- `updateSimple`
- `update`
- `stream`
- `release`
- `lockEntity`
- `fetchAndLockEntity`
- `releaseEntity`
- `deleteEntity`
- `deleteEntityLockLog`
- `createEntityLockLog`

### create

```dart
static Future<T> create<T>(
  Session session,
  Future<T> future,
) async {
  try {
    final dto = await future;

    return dto;
  } catch (e) {
    final message = e.toString();
    if (message.contains('duplicate key value')) {
      throw HiddenException(
        message: 'Record already exists',
      );
    }
    throw ElbException(
      errorType: ExceptionType.serverError,
      value: ExceptionValue.unknown,
      message: 'Failed to create record: ${e.toString()}',
    );
  }
}
```

#### Description

This method creates a new object of type `T`. It executes the provided asynchronous operation and catches any exceptions to translate them into specific error types.

#### Parameters

- `session`: The current user session.
- `future`: A Future representing the creation operation of the object.

#### Return Value

A Future of type `T` containing the created object.

#### Error Handling

- Throws a `HiddenException` if a record with the same key already exists.
- Throws an `ElbException` for other errors.

### updateSimple

```dart
static Future<T> updateSimple<T>(
  Session session,
  Future<T> future,
) async {
  try {
    final dto = await future;
    return dto;
  } catch (e) {
    final message = e.toString();

    if (message.contains('duplicate key value')) {
      throw HiddenException(
        message: 'Code already exists',
      );
    }

    throw ElbException(
      value: ExceptionValue.unknown,
      errorType: ExceptionType.serverError,
      message: 'Failed to update: ${e.toString()}',
    );
  }
}
```

#### Description

Updates an existing object of type `T`. Similar to the `create` method, it handles specific database errors and translates them into custom exceptions.

#### Error Handling

- Throws a `HiddenException` if an object with the same code already exists.
- Throws an `ElbException` for other errors.

### update

```dart
static Future<T> update<T>(Session session,
    {required Future<T?> Function(Session, int) fetchById,
    required String sessionId,
    required T newEntity,
    required Future<T> Function(Session, T) updateEntity,
    required TableType tableType,
    required StreamController<T> streamController,
    required bool release}) async {
  // Implementation...
}
```

#### Description

Performs a comprehensive update that considers the following aspects:

- Locks the entity for editing.
- Validates the editing session.
- Updates timestamp and user information.
- Optionally releases the lock after updating.
- Notifies about changes via stream.

#### Parameters

- `fetchById`: Function to retrieve the current state of the entity.
- `sessionId`: The ID of the current editing session.
- `newEntity`: The updated object.
- `updateEntity`: Function to save changes to the database.
- `tableType`: The type of the table for lock logs.
- `streamController`: Controller for streaming updates.
- `release`: Whether to release the lock after updating.

#### Error Handling

- Throws an `ElbException` if the entity is not found.
- Throws an `ElbException` if the editing session is invalid.
- Throws an `ElbException` if the entity has been modified by another user.

### stream

```dart
Stream<T> stream<T>(Session session, Stream<T> stream) {
  return stream;
}
```

#### Description

Returns a stream of objects of type `T`. This can be used to send real-time updates to clients.

### release

```dart
static Future<void> release<T>(Session session, Future<void> future) async {
  await future;
}
```

#### Description

Executes an asynchronous operation and waits for its completion. Can be used to release resources or finish background tasks.

### lockEntity

```dart
static Future<bool> lockEntity(
  Session session, {
  required String tableName,
  required int id,
  required String editSessionId,
  required int userId,
}) async {
  var result = await session.db.unsafeQuery(
    lockEditSessionQuery(
      tableName: tableName,
    ),
    parameters: QueryParameters.named({
      'id': id,
      'editSessionValue': editSessionId,
      'editedByIdValue': userId,
    }),
  );

  return result.isNotEmpty;
}
```

#### Description

Attempts to lock an entity for editing. This prevents multiple users from editing the same entity simultaneously.

#### Return Value

- `true` if the lock was successful.
- `false` if the entity is already locked.

### fetchAndLockEntity

```dart
static Future<T?> fetchAndLockEntity<T>(
  Session session, {
  required int id,
  required String editSessionId,
  required Future<T?> Function(Session, int) fetchById,
  required String tableName,
  required StreamController<T> streamController,
  required TableType tableType,
}) async {
  // Implementation...
}
```

#### Description

Retrieves an entity and attempts to lock it for editing. If successful, a lock log is created, and the entity is sent over the stream.

### releaseEntity

```dart
static Future<void> releaseEntity<T>(
  Session session, {
  required int entityId,
  required String sessionId,
  required Future<T?> Function(Session, int) fetchById,
  required Future<T> Function(Session, T) updateEntity,
  required TableType tableType,
  required StreamController<T> streamController,
}) async {
  // Implementation...
}
```

#### Description

Releases the lock on an entity by resetting the editing session. Updates the entity in the database and sends the update over the stream.

### deleteEntity

```dart
static Future<bool> deleteEntity<T>(
  Session session, {
  required int id,
  required String sessionId,
  required Future<T?> Function(Session, int) fetchById,
  required Future<T> Function(Session, T) updateEntity,
  required TableType tableType,
  required StreamController<T> streamController,
}) async {
  // Implementation...
}
```

#### Description

Marks an entity as deleted by setting `deletedAt` and `deletedById`. Checks if the editing session is valid before performing the deletion.

#### Return Value

- `true` if the deletion was successful.

#### Error Handling

- Throws an `ElbException` if the entity is not found.
- Throws an `ElbException` if the editing session is invalid.

### deleteEntityLockLog

```dart
static void deleteEntityLockLog<T>(
  Session session,
  TableType tableType,
  int lockedObjectId,
) {
  EntityLockEndpoint().deleteDataLockByDto(
    session,
    tableType: tableType,
    lockedObjectId: lockedObjectId,
  );
}
```

#### Description

Deletes the lock log of an entity to free it up for other users.

### createEntityLockLog

```dart
static void createEntityLockLog<T>(
  Session session, {
  required TableType tableType,
  required int lockedObjectId,
  required String editSessionId,
}) {
  EntityLockEndpoint().createEntityLock(
    session,
    tableType: tableType,
    lockedObjectId: lockedObjectId,
    editSessionId: editSessionId,
  );
}
```

#### Description

Creates a lock log for an entity to prevent others from editing it.

## Summary

The GenericCrud class provides a set of helper methods that simplify and standardize the implementation of CRUD operations. By handling errors, locks, and streams, it ensures data integrity and enhances the user experience.
