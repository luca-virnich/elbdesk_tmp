# Endpoints

As Serverpod can't work with Interfaces, we have to deal with our own implementations, so we are working with a "GenericCrud" Class for the most of the 
common Operations

## Generic CRUD Operations

```dart
class GenericCrud {
  const GenericCrud._();

  /// Creates an Entity, as the initialization of the new Entity is mainly different 
  /// for every Endpoint/Class, we are just passing the inserRow Future to this Method
  static Future<T> create<T>(
    Session session,
    Future<T> future,
  ) async {
    try {
      final dto = await future;

      return dto;
    } catch (e) {
      /// When working with unique keys, we are detecting a duplication here
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

  /// Updates an Entity
  /// Add Update to StreamController
  /// Add Log-Entries for the Entity
  /// Can Release the Entity (removes sessionId)
  static Future<T> update<T>(
    Session session, {
    required Future<T?> Function(Session, int) fetchById,
    required String sessionId,
    required T newEntity,
    required Future<T> Function(Session, T) updateEntity,
    required TableType tableType,
    required StreamController<T> streamController,
    required bool release,
    List<LogField<T>>? logFields,
  }) async {
    try {
      final serverEntity = await fetchById(session, (newEntity as dynamic).id!);
      if (serverEntity == null) {
        throw ElbException(
          value: ExceptionValue.unknown,
          errorType: ExceptionType.invalidData,
          message: 'Entity not found',
        );
      }
      final dynamicServerEntity = serverEntity as dynamic;
      if (dynamicServerEntity.editSession != sessionId) {
        throw ElbException(
          value: ExceptionValue.invalidSessionId,
          errorType: ExceptionType.invalidSessionId,
          message: 'Invalid sessionId',
        );
      }
      final now = DateTime.now();
      if (dynamicServerEntity.lastModifiedAt != null &&
          dynamicServerEntity.lastModifiedAt!.isAfter(now)) {
        throw ElbException(
          value: ExceptionValue.modifiedByAnotherUser,
          errorType: ExceptionType.invalidData,
          message: 'Entity has been modified by another user',
        );
      }
      final userId = (await session.authenticated)?.userId;
      final updatedEntity = newEntity.copyWith(
        lastModifiedAt: now,
        lastModifiedById: userId,
        editSession: release ? null : dynamicServerEntity.editSession,
        editedAt: release ? null : now,
        editedById: release ? null : userId,
        createdById: dynamicServerEntity.createdById,
        isDraft: false,
        editedBy: dynamicServerEntity.editedBy,
        deletedAt: dynamicServerEntity.deletedAt,
        deletedById: dynamicServerEntity.deletedById,
        createdBy: dynamicServerEntity.createdBy,
      );
      final savedEntity = await updateEntity(session, updatedEntity);
      // final refetchedEntity = await fetchById(session, (savedEntity as dynamic).id!);

      if (release) {
        unawaited(EntityLockEndpoint().deleteDataLockByDto(
          session,
          tableType: tableType,
          lockedObjectId: (savedEntity as dynamic).id!,
        ));
      }
      streamController.add(savedEntity);
      EntityLogEndpoint().create<T, dynamic>(
        session: session,
        oldEntity: serverEntity,
        newEntity: savedEntity,
        userId: userId!,
        editedAt: now,
        tableType: tableType,
        fields: logFields ?? [],
      );

      return savedEntity;
    } catch (e) {
      throw ElbException(
        value: ExceptionValue.unknown,
        errorType: ExceptionType.serverError,
        message: 'Failed to update: ${e.toString()}',
      );
    }
  }

  Stream<T> stream<T>(Session session, Stream<T> stream) {
    return stream;
  }

  static Future<void> release<T>(Session session, Future<void> future) async {
    await future;
  }

  /// Locks an Entity for editing, return false if the 
  /// Entity is already locked
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

  /// Fetches and Lock an Entity
  /// Adds Lock to Lock-Overview
  static Future<T?> fetchAndLockEntity<T>(
    Session session, {
    required int id,
    required String editSessionId,
    required Future<T?> Function(Session, int) fetchById,
    required String tableName,
    required StreamController<T> streamController,
    required TableType tableType,
  }) async {
    final authenticated = await session.authenticated;
    final userId = authenticated!.userId;

    final locked = await lockEntity(
      session,
      tableName: tableName,
      id: id,
      editSessionId: editSessionId,
      userId: userId,
    );

    if (!locked) {
      return null;
    }

    final entity = await fetchById(session, id);

    if (entity != null && (entity as dynamic).editSession == editSessionId) {
      createEntityLockLog(
        session,
        tableType: tableType,
        lockedObjectId: id,
        editSessionId: editSessionId,
      );
      streamController.add(entity);
    }

    return entity;
  }

  /// Release an Entity after editing
  /// Notofies a Stream
  static Future<void> releaseEntity<T>(
    Session session, {
    required int entityId,
    required String sessionId,
    required Future<T?> Function(Session, int) fetchById,
    required Future<T> Function(Session, T) updateEntity,
    required TableType tableType,
    required StreamController<T> streamController,
  }) async {
    final entity = await fetchById(session, entityId);
    if (entity == null) {
      return;
    }
    if ((entity as dynamic).editSession != sessionId) {
      return;
    }

    final updatedEntity = (entity as dynamic).copyWith(
      editedById: null,
      editedBy: null,
      editSession: null,
      editedAt: null,
    );

    final savedEntity = await updateEntity(session, updatedEntity);
    deleteEntityLockLog(session, tableType, entityId);
    streamController.add(savedEntity);
  }

  /// Deletes an Entity and notifies a Stream
  static Future<bool> deleteEntity<T>(
    Session session, {
    required int id,
    required String sessionId,
    required Future<T?> Function(Session, int) fetchById,
    required Future<T> Function(Session, T) updateEntity,
    required TableType tableType,
    required StreamController<T> streamController,
  }) async {
    final entity = await fetchById(session, id);
    if (entity == null) {
      throw ElbException(
        value: ExceptionValue.unknown,
        errorType: ExceptionType.invalidData,
        message: 'Entity not found',
      );
    }
    if ((entity as dynamic).editSession != sessionId) {
      throw ElbException(
        value: ExceptionValue.invalidSessionId,
        errorType: ExceptionType.invalidSessionId,
        message: 'Invalid sessionId',
      );
    }
    try {
      final userId = (await session.authenticated)?.userId;
      final deletedEntity = (entity as dynamic).copyWith(
        deletedAt: DateTime.now(),
        deletedById: userId,
      );
      await updateEntity(session, deletedEntity);
      deleteEntityLockLog(session, tableType, id);
      streamController.add(deletedEntity);
      return true;
    } catch (e) {
      throw ElbException(
        value: ExceptionValue.unknown,
        errorType: ExceptionType.serverError,
        message: 'Failed to delete entity: ${e.toString()}',
      );
    }
  }
 
  /// Deletes the Entity-Lock-Entry
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

  /// Creates the Entity-Lock-Entry
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
}
```

## Example

```dart

/// Create a StreamController globally
final languageCodeStreamController =
    StreamController<LanguageCodeDTO>.broadcast();


class LanguageCodeEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Define the includeAll getter
  static LanguageCodeDTOInclude get _includeAll => LanguageCodeDTO.include(
        editedBy: UserInfo.include(),
        lastModifiedBy: UserInfo.include(),
        deletedBy: UserInfo.include(),
        createdBy: UserInfo.include(),
      );
 
  /// Define the Stream, this pushed Entity-Updates to 
  /// the Client, so we can notify Users when there is 
  // an Update for an Entity
  Stream<LanguageCodeDTO> watch(Session session, Stream stream,
      {required String sessionId, required int entityId}) async* {
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

  /// Fetches the Entity by Id
  Future<LanguageCodeDTO?> fetchById(Session session, int id) async {
    return LanguageCodeDTO.db.findById(
      session,
      id,
      include: _includeAll,
    );
  }

  /// Release an Entity
  Future<void> release(Session session,
      {required int entityId, required String sessionId}) async {
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


  /// Fetch and Lock an Entity
  Future<LanguageCodeDTO?> fetchAndLock(Session session,
      {required int id, required String editSessionId}) async {
    return await GenericCrud.fetchAndLockEntity<LanguageCodeDTO>(
      session,
      id: id,
      tableType: TableType.countryCode,
      editSessionId: editSessionId,
      fetchById: (session, id) => fetchById(session, id),
      tableName: LanguageCodeDTOTable().tableName,
      streamController: languageCodeStreamController,
    );
  }

  /// Creates an Entity, this can be different for each 
  /// endpoint/entity
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

  /// Fetch all Entities, this is useful when we are 
  /// dealing with small datasets for relations.
  /// E.g.: Selection the Language for a Contact
  Future<List<LanguageCodeDTO>> fetchAll(Session session) async {
    return LanguageCodeDTO.db.find(
      session,
    );
  }

  /// Find an Entity based on the deliverd Filter and Sort
  Future<List<LanguageCodeDTO>> find(Session session,
      {Sort? sort, Filter? filter, int? id}) async {
    final sortByField = LanguageCodeField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );

    /// We have now a more generic way to filter Entities
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

  /// Updates the Entity
  Future<LanguageCodeDTO> update(
    Session session, {
    required LanguageCodeDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    return GenericCrud.update(
      session,
      fetchById: (session, id) => fetchById(session, id),
      sessionId: sessionId,
      newEntity: entity,
      updateEntity: LanguageCodeDTO.db.updateRow,
      tableType: TableType.languageCode,
      streamController: languageCodeStreamController,
      release: release,
    );
  }

  /// Maps the Field-Enum the related Database-Field 
  Column<dynamic> Function(LanguageCodeDTOTable) _dbFieldFromEnum(
      LanguageCodeField sortFieldEnum) {
    switch (sortFieldEnum) {
      case LanguageCodeField.code:
        return (LanguageCodeDTOTable t) => t.code;
      case LanguageCodeField.id:
        return (LanguageCodeDTOTable t) => t.id;
      case LanguageCodeField.languageName:
        return (LanguageCodeDTOTable t) => t.languageName;
    }
  }

  /// Defines an initialDto, not used in every Endpoint
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
}
```