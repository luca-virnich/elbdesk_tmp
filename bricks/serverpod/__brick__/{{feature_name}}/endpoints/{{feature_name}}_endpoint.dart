import 'dart:async';

import 'package:elbdesk_server/src/generated/protocol.dart';
import '../{{feature_name}}_handler.dart';
import '../{{feature_name}}_utils.dart';
import 'package:serverpod/serverpod.dart';

/// Stream controller for {{#pascalCase}}{{feature_name}}{{/pascalCase}}
/// 
/// This is used to broadcast updates to the client
/// Exposed through watch endpoints
final {{#camelCase}}{{feature_name}}{{/camelCase}}StreamController = StreamController<{{#pascalCase}}{{feature_name}}{{/pascalCase}}DTO>.broadcast();

/// Endpoint for [{{#pascalCase}}{{feature_name}}{{/pascalCase}}DTO]
/// 
/// This exposes the endpoints for {{#pascalCase}}{{feature_name}}{{/pascalCase}}
/// 
/// Used by the corresponding repository in the clients frontend
///
class {{#pascalCase}}{{feature_name}}{{/pascalCase}}Endpoint extends Endpoint {

  /// Whether the endpoint requires a login
  @override
  bool get requireLogin => true;

  /// * General CRUD *

  /// Creates a new {{#pascalCase}}{{feature_name}}{{/pascalCase}}
  Future<{{#pascalCase}}{{feature_name}}{{/pascalCase}}DTO> create(
    Session session, {
    required String sessionId,
    required bool release,
  }) async {
    return {{#pascalCase}}{{feature_name}}{{/pascalCase}}Handler.create(
      session,
      sessionId: sessionId,
      release: release,
    );
  }

    /// Updates a {{#pascalCase}}{{feature_name}}{{/pascalCase}}
  Future<{{#pascalCase}}{{feature_name}}{{/pascalCase}}DTO> update(
    Session session, {
    required {{#pascalCase}}{{feature_name}}{{/pascalCase}}DTO entity,
    required String sessionId,
    required bool release,
  }) async {
    return {{#pascalCase}}{{feature_name}}{{/pascalCase}}Handler.update(
      session,
      entity: entity,
      sessionId: sessionId,
      release: release,
    );
  }


  /// Deletes a {{#pascalCase}}{{feature_name}}{{/pascalCase}}
  Future<bool> delete(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    return {{#pascalCase}}{{feature_name}}{{/pascalCase}}Handler.delete(
      session,
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  /// * Fetching *


  /// Fetches a single {{#pascalCase}}{{feature_name}}{{/pascalCase}} by id
  Future<{{#pascalCase}}{{feature_name}}{{/pascalCase}}DTO?> fetchById(
    Session session,
    int id,
  ) async {
    return {{#pascalCase}}{{feature_name}}{{/pascalCase}}Handler.fetchById(
      session,
      id,
      null,
    );
  }

  /// Finds all {{#pascalCase}}{{feature_name}}{{/pascalCase}} entities
  /// 
  /// Filtered and sorted by the given parameters
  /// These are usually defined through table settings in the client
  Future<List<{{#pascalCase}}{{feature_name}}{{/pascalCase}}DTO>> find(
    Session session, {
    Sort? sort,
    Filter? filter,
  }) async {
    return {{#pascalCase}}{{feature_name}}{{/pascalCase}}Handler.find(
      session,
      sort: sort,
      filter: filter,
    );
  }


  /// Fetches and locks a single {{#pascalCase}}{{feature_name}}{{/pascalCase}} by id
  Future<{{#pascalCase}}{{feature_name}}{{/pascalCase}}DTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return {{#pascalCase}}{{feature_name}}{{/pascalCase}}Handler.fetchAndLock(
      session,
      id: id,
      editingSessionId: editingSessionId,
    );
  }


  /// * Streams *

  /// Watches updates for a single {{#pascalCase}}{{feature_name}}{{/pascalCase}}
  /// Watch changes to a specific {{#snakeCase}}{{feature_name}}{{/snakeCase}}
  Stream<{{#pascalCase}}{{feature_name}}{{/pascalCase}}DTO> watchEntity(
    Session session, {
    required String sessionId,
    required int entityId,
  }) async* {
    yield* {{#pascalCase}}{{feature_name}}{{/pascalCase}}Handler.watchEntity(
      session,
      sessionId: sessionId,
      entityId: entityId,
    );
  }


  /// * Other *

  /// Releases a {{#pascalCase}}{{feature_name}}{{/pascalCase}}
  Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    await {{#pascalCase}}{{feature_name}}{{/pascalCase}}Handler.release(
      session,
      entityId: entityId,
      sessionId: sessionId,
    );
  }


  /// Finds all locked entities for {{#pascalCase}}{{feature_name}}{{/pascalCase}}
  Future<List<EntityLockDTO>> findEntityLocks(Session session) async {
    return {{#pascalCase}}{{feature_name}}{{/pascalCase}}Handler.findEntityLocks(session);
  }
} 
