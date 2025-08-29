import 'package:collection/collection.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/generic_crud.dart';
import 'package:elbdesk_server/src/modules/core/utils/core_utils.dart';
import '{{feature_name}}_utils.dart';
import 'endpoints/{{feature_name}}_endpoint.dart';
import 'package:serverpod/serverpod.dart';

// TODO(mason): Check includes. If the model has no relations, the methods
// won't allow an include parameter.

/// Handler for {{#pascalCase}}{{feature_name}}{{/pascalCase}}
/// 
/// This class defines the business logic for the exposed endpoints in
/// {{#pascalCase}}{{feature_name}}{{/pascalCase}}Endpoint.
/// 
/// It contains the logic for fetching, creating, updating, and deleting 
/// {{#pascalCase}}{{feature_name}}{{/pascalCase}} entities
/// 
class {{#pascalCase}}{{feature_name}}{{/pascalCase}}Handler {
  const {{#pascalCase}}{{feature_name}}{{/pascalCase}}Handler._();

  /// * General CRUD *
  
  /// Creates a new {{#pascalCase}}{{feature_name}}{{/pascalCase}} entity
  static Future<{{#pascalCase}}{{feature_name}}{{/pascalCase}}DTO> create(
    Session session, {
    required String sessionId,
    required bool release,
  }) async {
    final (:createdEntity) = await session.db.transaction((transaction) async {
      final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);

      final entity = {{#pascalCase}}{{feature_name}}{{/pascalCase}}Utils.initial{{#pascalCase}}{{feature_name}}{{/pascalCase}}(
        userId: userId,
        now: now,
        sessionId: sessionId,
      );

      final createdEntity = await GenericCrud.create(
        session,
        {{#pascalCase}}{{feature_name}}{{/pascalCase}}DTO.db
            .insertRow(session, entity, transaction: transaction),
      );

      return (createdEntity: createdEntity);
    });
    {{#camelCase}}{{feature_name}}{{/camelCase}}StreamController.add(createdEntity);
    return createdEntity;
  }

  /// Updates a {{#pascalCase}}{{feature_name}}{{/pascalCase}} entity
  static Future<{{#pascalCase}}{{feature_name}}{{/pascalCase}}DTO> update(
    Session session, {
    required {{#pascalCase}}{{feature_name}}{{/pascalCase}}DTO entity,
    required String sessionId,
    required bool release,
  }) async {
    final (:updated) = await session.db.transaction((transaction) async {
      final updated = await GenericCrud.update(
        session,
        fetchById: fetchById,
        sessionId: sessionId,
        newEntity: entity,
        updateEntity: _updateRow,
        tableType: {{#pascalCase}}{{feature_name}}{{/pascalCase}}Utils.tableType,
        streamController: {{#camelCase}}{{feature_name}}{{/camelCase}}StreamController,
        release: release,
        transaction: transaction,
      );

      return (updated: updated);
    });
    return updated;
  }

  /// Deletes a {{#pascalCase}}{{feature_name}}{{/pascalCase}} entity
  /// 
  /// This soft deletes an entity by setting the deletedAt field to now()
  static Future<bool> delete(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    return GenericCrud.markEntityAsDeleted<{{#pascalCase}}{{feature_name}}{{/pascalCase}}DTO>(
      session,
      id: entityId,
      sessionId: sessionId,
      fetchWithoutRelations: _fetchWithoutRelations,
      updateRow: _updateRow,
      tableType: {{#pascalCase}}{{feature_name}}{{/pascalCase}}Utils.tableType,
      streamController: {{#camelCase}}{{feature_name}}{{/camelCase}}StreamController,
    );
  }


  /// * Fetching *

  /// Fetches a single {{#pascalCase}}{{feature_name}}{{/pascalCase}} entity by id
  static Future<{{#pascalCase}}{{feature_name}}{{/pascalCase}}DTO?> fetchById(
    Session session,
    int id,
    Transaction? transaction,
  ) async {
    return {{#pascalCase}}{{feature_name}}{{/pascalCase}}DTO.db.findById(
      session,
      id,
      include: {{#pascalCase}}{{feature_name}}{{/pascalCase}}Utils.includeAll,
      transaction: transaction,
    );
  }

  /// Fetches and locks a single {{#pascalCase}}{{feature_name}}{{/pascalCase}} entity by id
  /// 
  /// The lock mechanism is implemented through the editSessionId of the entity
  static Future<{{#pascalCase}}{{feature_name}}{{/pascalCase}}DTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return GenericCrud.fetchAndLockEntity<{{#pascalCase}}{{feature_name}}{{/pascalCase}}DTO>(
      session,
      id: id,
      tableType: {{#pascalCase}}{{feature_name}}{{/pascalCase}}Utils.tableType,
      editingSessionId: editingSessionId,
      fetchById: fetchById,
      tableName: {{#pascalCase}}{{feature_name}}{{/pascalCase}}DTOTable().tableName,
      streamController: {{#camelCase}}{{feature_name}}{{/camelCase}}StreamController,
    );
  }

  /// Finds all {{#pascalCase}}{{feature_name}}{{/pascalCase}} entities
  static Future<List<{{#pascalCase}}{{feature_name}}{{/pascalCase}}DTO>> find(
    Session session, {
    Sort? sort,
    Filter? filter,
  }) async {
    final sortByField = {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );
    final expression = {{#pascalCase}}{{feature_name}}{{/pascalCase}}Utils.buildExpression(filter);

    return {{#pascalCase}}{{feature_name}}{{/pascalCase}}DTO.db.find(
      session,
      where: expression == null ? null : (t) => expression,
      orderBy: {{#pascalCase}}{{feature_name}}{{/pascalCase}}Utils.orderBy(sortByField),
      orderDescending: sort?.orderDescending ?? false,
      include: {{#pascalCase}}{{feature_name}}{{/pascalCase}}Utils.includeAll,
    );
  }

  /// Fetches a {{#pascalCase}}{{feature_name}}{{/pascalCase}} entity without relations
  static Future<{{#pascalCase}}{{feature_name}}{{/pascalCase}}DTO?> _fetchWithoutRelations(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return {{#pascalCase}}{{feature_name}}{{/pascalCase}}DTO.db.findById(session, id, transaction: transaction);
  }

  /// * Other *

  /// Releases a {{#pascalCase}}{{feature_name}}{{/pascalCase}} entity
  /// 
  /// This clears the editingSessionId of the entity
  static Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    await GenericCrud.releaseEntity<{{#pascalCase}}{{feature_name}}{{/pascalCase}}DTO>(
      session,
      entityId: entityId,
      sessionId: sessionId,
      fetchById: fetchById,
      updateEntity: _updateRow,
      tableType: {{#pascalCase}}{{feature_name}}{{/pascalCase}}Utils.tableType,
      streamController: {{#camelCase}}{{feature_name}}{{/camelCase}}StreamController,
      deleteDraft: _deleteDraft,
    );
  }


  /// Finds all locked entities for {{#pascalCase}}{{feature_name}}{{/pascalCase}}
  static Future<List<EntityLockDTO>> findEntityLocks(Session session) async {
    final entities = await {{#pascalCase}}{{feature_name}}{{/pascalCase}}DTO.db.find(
      session,
      where: (t) =>
          t.editingSession.notEquals(null as String?) &
          t.editingSession.notEquals(''),
    );

    return entities
        .map(
          (e) => EntityLockDTO(
            entityType: {{#pascalCase}}{{feature_name}}{{/pascalCase}}Utils.tableType,
            entityId: e.id!,
            editingSessionId: e.editingSession!,
            lockedAt: e.editingSince!,
            userId: e.editingById,
          ),
        )
        .toList();
  }

  /// * Streams *

  /// Watches updates for a single {{#pascalCase}}{{feature_name}}{{/pascalCase}} entity
  /// Watch changes to a specific {{#snakeCase}}{{feature_name}}{{/snakeCase}}
  static Stream<{{#pascalCase}}{{feature_name}}{{/pascalCase}}DTO> watchEntity(
    Session session, {
    required String sessionId,
    required int entityId,
  }) async* {
    session.addWillCloseListener(
      (session) {
        release(session, entityId: entityId, sessionId: sessionId);
      },
    );

    // Yield initial entity if it exists
    final initialEntity = await fetchById(session, entityId, null);
    if (initialEntity != null) {
      yield initialEntity;
    }

    yield* {{#camelCase}}{{feature_name}}{{/camelCase}}StreamController.stream
        .where((event) => event.id == entityId)
        .map((event) {
      return event;
    });
  }

  /// * Private *

  /// Updates a {{#pascalCase}}{{feature_name}}{{/pascalCase}} entity
    static Future<{{#pascalCase}}{{feature_name}}{{/pascalCase}}DTO> _updateRow(
    Session session,
    {{#pascalCase}}{{feature_name}}{{/pascalCase}}DTO entity,
    Transaction transaction,
  ) async {
    return {{#pascalCase}}{{feature_name}}{{/pascalCase}}DTO.db.updateRow(
      session,
      entity,
      transaction: transaction,
    );
  }

  /// Deletes a draft {{#pascalCase}}{{feature_name}}{{/pascalCase}} entity
  static Future<{{#pascalCase}}{{feature_name}}{{/pascalCase}}DTO?> _deleteDraft(
    Session session,
    {{#pascalCase}}{{feature_name}}{{/pascalCase}}DTO entity,
    Transaction transaction,
  ) async {
    return {{#pascalCase}}{{feature_name}}{{/pascalCase}}DTO.db.deleteRow(
      session,
      entity,
      transaction: transaction,
    );
  }
} 
