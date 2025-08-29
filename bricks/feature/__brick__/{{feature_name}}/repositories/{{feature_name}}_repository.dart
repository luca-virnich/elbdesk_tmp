import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import '../models/{{#snakeCase}}{{feature_name}}{{/snakeCase}}.dart';

/// Repository for managing {{#pascalCase}}{{feature_name}}{{/pascalCase}} entities
class {{#pascalCase}}{{feature_name}}{{/pascalCase}}Repository
    implements EntityRepository<{{#pascalCase}}{{feature_name}}{{/pascalCase}}> {
  {{#pascalCase}}{{feature_name}}{{/pascalCase}}Repository({
    required this.endpoint,
  });

  /// Serverpod Endpoint
  final Endpoint{{#pascalCase}}{{feature_name}}{{/pascalCase}} endpoint;

  /// * General CRUD *

  /// Create a new empty {{#snakeCase}}{{feature_name}}{{/snakeCase}} entity
  Future<int> create({
    required String sessionId,
    required bool release,
  }) async {
    final newEntity = await endpoint.create(
      sessionId: sessionId,
      release: release,
    );
    return newEntity.id!;
  }

  /// Create a new {{#snakeCase}}{{feature_name}}{{/snakeCase}} entity
  @override
  Future<{{#pascalCase}}{{feature_name}}{{/pascalCase}}> createAndReturnEntity({
    required String sessionId,
    required {{#pascalCase}}{{feature_name}}{{/pascalCase}} entity,
    required bool release,
  }) async {
    final newEntity = await endpoint.create(
      sessionId: sessionId,
      release: release,
    );
    return {{#pascalCase}}{{feature_name}}{{/pascalCase}}.fromDTO(newEntity);
  }

  /// Update a {{#snakeCase}}{{feature_name}}{{/snakeCase}} entity
  @override
  Future<{{#pascalCase}}{{feature_name}}{{/pascalCase}}> update({
    required {{#pascalCase}}{{feature_name}}{{/pascalCase}} entity,
    required bool release,
    required String sessionId,
  }) async {
    final updatedItem = await endpoint.update(
      entity: entity.toDTO(),
      sessionId: sessionId,
      release: release,
    );
    return {{#pascalCase}}{{feature_name}}{{/pascalCase}}.fromDTO(updatedItem);
  }

  /// Delete a {{#snakeCase}}{{feature_name}}{{/snakeCase}} entity
  @override
  Future<bool> delete(int entityId, String sessionId) async {
    return endpoint.delete(
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  /// * Fetching *

  /// Fetch all {{#snakeCase}}{{feature_name}}{{/snakeCase}} entities
  @override
  Future<List<{{#pascalCase}}{{feature_name}}{{/pascalCase}}>> fetchAll() async {
    final items = await endpoint.find();
    return items.map({{#pascalCase}}{{feature_name}}{{/pascalCase}}.fromDTO).toList();
  }

  /// Fetch a {{#snakeCase}}{{feature_name}}{{/snakeCase}} entity by id
  @override
  Future<{{#pascalCase}}{{feature_name}}{{/pascalCase}}> fetchById(int id) async {
    final item = await endpoint.fetchById(id);
    return {{#pascalCase}}{{feature_name}}{{/pascalCase}}.fromDTO(item!);
  }

  /// Fetch a {{#snakeCase}}{{feature_name}}{{/snakeCase}} entity by id
  @override
  Future<List<{{#pascalCase}}{{feature_name}}{{/pascalCase}}>> find({Sort? sort, Filter? filter}) async {
    final items = await endpoint.find(
      sort: sort,
      filter: filter,
    );
    return items.map({{#pascalCase}}{{feature_name}}{{/pascalCase}}.fromDTO).toList();
  }

  /// Fetch a {{#snakeCase}}{{feature_name}}{{/snakeCase}} entity by id
  /// and lock it for editing
  @override
  Future<{{#pascalCase}}{{feature_name}}{{/pascalCase}}?> fetchAndLock(
    int entityId,
    String sessionId,
  ) async {
    final item = await endpoint.fetchAndLock(
      id: entityId,
      editingSessionId: sessionId,
    );
    return item != null
        ? {{#pascalCase}}{{feature_name}}{{/pascalCase}}.fromDTO(item)
        : null;
  }

  /// * Other *

  /// Release a {{#snakeCase}}{{feature_name}}{{/snakeCase}} entity
  @override
  Future<void> release(int entityId, String sessionId) async {
    await endpoint.release(
      entityId: entityId,
      sessionId: sessionId,
    );
  }
} 
