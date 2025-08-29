---
sidebar_position: 2
---

# Entity Endpoint (Server)

Each Entity should have its own Endpoint on the Server, called

`EntityEndpoint`, e.g. the Endpoint for `LanguageCode`/`LanguageCodeDTO` should be `LanguageCodeEndpoint`.

## Example

Below is the `LanguageCodeEndpoint` as an example with explanations:

### Global StreamController

```dart
final languageCodeStreamController =
    StreamController<LanguageCodeDTO>.broadcast();
```    
**Global** StreamController for the DTO, we are using it to push updates to the client. It has to be defined as global to use the same instance also from other endpoints.


### Class Definition
```dart
class LanguageCodeEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;
}
```
Class definition: Every Endpoint requires login (except the initial super admin registration).


### Include All Getter

```dart
static LanguageCodeDTOInclude get _includeAll => LanguageCodeDTO.include(
        editedBy: UserInfo.include(),
        lastModifiedBy: UserInfo.include(),
        deletedBy: UserInfo.include(),
        createdBy: UserInfo.include(),
      );
```
We define a getter for all includes so we don't have to repeat the code later at different methods, if needed. You can also define other includes here (or use them in the method where needed).

### Watch (for Stream)

```dart
Stream<LanguageCodeDTO> watch(
    Session session,
    Stream<LanguageCodeDTO> stream, {
    required String sessionId,
    required int entityId,
  }) async* {
    session.addWillCloseListener(
      (session) {
        release(session, entityId: entityId, sessionId: sessionId);
      },
    );

    yield* languageCodeStreamController.stream
        .where((event) => event.id == entityId)
        .map((event) {
      return event;
    });
  }
```

Provides a stream listener for the `StreamController`. We are using this to receive real-time updates from an entity in the client. Whenever we "open an entity" on the client (technically a row of a table), we are listening to this stream (that's why it is filtered by the id). When the stream is closed, the `addWillCloseListener` will be executed, and the edit session will be removed from the entity.

### Fetch By Id

```dart
Future<LanguageCodeDTO?> fetchById(Session session, int id) async {
    return LanguageCodeDTO.db.findById(
      session,
      id,
      include: _includeAll,
    );
}
```

This function fetches an entity (or a row from a table) by its ID. You can define the include parameters here. Typically, we use the `_includeAll` getter to include all related entities.

### Release

```dart
Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    await GenericCrud.releaseEntity<LanguageCodeDTO>(
      session,
      entityId: entityId,
      sessionId: sessionId,
      fetchById: fetchById,
      updateEntity: LanguageCodeDTO.db.updateRow,
      tableType: TableType.languageCode,
      streamController: languageCodeStreamController,
    );
}
```

The `release` method is called when the user finishes editing an entity. It releases the entity by updating it in the database and removing the edit session. The `GenericCrud.releaseEntity` method simplifies the process of releasing an entity.

### Fetch And Lock

```dart
Future<LanguageCodeDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editSessionId,
  }) async {
    return GenericCrud.fetchAndLockEntity<LanguageCodeDTO>(
      session,
      id: id,
      tableType: TableType.languageCode,
      editSessionId: editSessionId,
      fetchById: fetchById,
      tableName: LanguageCodeDTOTable().tableName,
      streamController: languageCodeStreamController,
    );
}
```

This function fetches an entity and locks it for editing by associating it with an edit session. The entity is fetched by its ID, and the edit session is tied to it.

### Create

```dart
Future<LanguageCodeDTO> create(
    Session session, {
    required LanguageCodeDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    final userId = (await session.authenticated)!.userId;
    final initialEntity = _initialDto(
      userId: userId,
      sessionId: sessionId,
      entity: entity,
      release: release,
    );
    return GenericCrud.create(
      session,
      LanguageCodeDTO.db.insertRow(session, initialEntity),
    );
}
```

This function creates a new entity in the database. It first prepares the entity with initial values, including the user who created it, and then inserts it into the database using `GenericCrud.create`.

### Fetch All

```dart
Future<List<LanguageCodeDTO>> fetchAll(Session session) async {
    return LanguageCodeDTO.db.find(
      session,
    );
}
```

This function fetches all entities (or rows) from the table. It uses the `find` method of the `LanguageCodeDTO` to retrieve the entire collection.

### Find

```dart
Future<List<LanguageCodeDTO>> find(
    Session session, {
    Sort? sort,
    Filter? filter,
  }) async {
    final sortByField = LanguageCodeField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );

    final expression =
        buildFilterExpression<LanguageCodeDTOTable, LanguageCodeField>(
      table: LanguageCodeDTOTable(),
      filter: filter,
      enumFromString: (String fieldKey) =>
          LanguageCodeField.values.firstWhereOrNull((e) => e.name == fieldKey)!,
      getDbField: (table, field) => _dbFieldFromEnum(field)(table),
    );

    return LanguageCodeDTO.db.find(
      session,
      where: expression == null ? null : (t) => expression,
      orderBy: sortByField != null
          ? _dbFieldFromEnum(sortByField)
          : _dbFieldFromEnum(LanguageCodeField.code),
      orderDescending: sort?.orderDescending ?? false,
    );
}
```

This function retrieves a list of entities filtered by a provided filter expression and sorted by a specified field. It uses the `buildFilterExpression` utility function to dynamically build the filter condition.

### Update

```dart
Future<LanguageCodeDTO> update(
    Session session, {
    required LanguageCodeDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    return GenericCrud.update(
      session,
      fetchById: fetchById,
      sessionId: sessionId,
      newEntity: entity,
      updateEntity: LanguageCodeDTO.db.updateRow,
      tableType: TableType.languageCode,
      streamController: languageCodeStreamController,
      release: release,
      logFields: _getLogFields(),
    );
}
```

The `update` function is responsible for updating an entity in the database. It uses `GenericCrud.update` to handle the update logic and tracks changes with log fields.

### Log Fields

```dart
List<LogField<LanguageCodeDTO>> _getLogFields() {
    return LanguageCodeField.values
        .map((field) {
          switch (field) {
            case LanguageCodeField.languageName:
              return LogField<LanguageCodeDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.languageName,
              );
            case LanguageCodeField.code:
              return LogField<LanguageCodeDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.code,
              );

            case LanguageCodeField.id:
              return null;
          }
        })
        .whereType<LogField<LanguageCodeDTO>>()
        .toList();
}
```

This helper function creates log fields to track changes to the `LanguageCodeDTO` entity. It creates a `LogField` for each field in the `LanguageCodeDTO` entity that needs to be tracked.

### Database Fields

```dart
Column<dynamic> Function(LanguageCodeDTOTable) _dbFieldFromEnum(
    LanguageCodeField sortFieldEnum,
  ) {
    switch (sortFieldEnum) {
      case LanguageCodeField.code:
        return (LanguageCodeDTOTable t) => t.code;
      case LanguageCodeField.id:
        return (LanguageCodeDTOTable t) => t.id;
      case LanguageCodeField.languageName:
        return (LanguageCodeDTOTable t) => t.languageName;
    }
}
```

This function maps the enum value for a `LanguageCodeField` to the corresponding database field in the `LanguageCodeDTOTable`. It allows for dynamic sorting by field.

### Initial DTO

```dart
LanguageCodeDTO _initialDto({
    required int userId,
    required String sessionId,
    required LanguageCodeDTO entity,
    required bool release,
  }) {
    return LanguageCodeDTO(
      code: entity.code,
      languageName: entity.languageName,
      createdAt: DateTime.now(),
      isDraft: false,
      createdById: userId,
      editedAt: null,
      editedById: null,
      deletedAt: null,
      deletedById: null,
      lastModifiedAt: null,
      lastModifiedBy: null,
      editSession: release ? null : sessionId,
    );
}
```

This function initializes a new `LanguageCodeDTO` with required values such as creation time, user IDs, and draft status. It prepares the entity to be inserted into the database.

