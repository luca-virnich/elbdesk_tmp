import 'dart:async';

import '../models/{{#snakeCase}}{{feature_name}}{{/snakeCase}}.dart';
import '../repositories/{{#snakeCase}}{{feature_name}}{{/snakeCase}}_repository.dart';
import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '{{#snakeCase}}{{feature_name}}{{/snakeCase}}_provider.g.dart';

@riverpod
{{#pascalCase}}{{feature_name}}{{/pascalCase}}Repository {{#camelCase}}{{feature_name}}{{/camelCase}}Repository(
  Ref ref,
) {
  return {{#pascalCase}}{{feature_name}}{{/pascalCase}}Repository(
    endpoint: serverpodClient.{{#camelCase}}{{feature_name}}{{/camelCase}},
  );
}

/// Find {{#pascalCase}}{{feature_name}}{{/pascalCase}} Provider
@riverpod
Future<List<{{#pascalCase}}{{feature_name}}{{/pascalCase}}>> find{{#pascalCase}}{{feature_name}}{{/pascalCase}}s(
  Ref ref,
  String sessionId,
) async {
  final repository = ref.watch({{#camelCase}}{{feature_name}}{{/camelCase}}RepositoryProvider);
  final (sort, filter) = ref.watch(
    tableSortAndFilterProvider(
      sessionId,
      TableType.{{#camelCase}}{{feature_name}}{{/camelCase}},
    ),
  );
  return repository.find(sort: sort, filter: filter);
}

@riverpod
Future<List<{{#pascalCase}}{{feature_name}}{{/pascalCase}}>> fetch{{#pascalCase}}{{feature_name}}{{/pascalCase}}s(
  Ref ref,
) async {
  return ref
      .watch({{#camelCase}}{{feature_name}}{{/camelCase}}RepositoryProvider)
      .fetchAll();
}

@riverpod
Future<{{#pascalCase}}{{feature_name}}{{/pascalCase}}?> fetch{{#pascalCase}}{{feature_name}}{{/pascalCase}}(
  Ref ref,
  int id,
) async {
  return ref
      .watch({{#camelCase}}{{feature_name}}{{/camelCase}}RepositoryProvider)
      .fetchById(id);
}

@riverpod
Stream<{{#pascalCase}}{{feature_name}}{{/pascalCase}}> watch{{#pascalCase}}{{feature_name}}{{/pascalCase}}(
  Ref ref, {
  required int entityId,
  required String sessionId,
}) async* {
  final streamHelper =
      ServerpodStreamManager<{{#pascalCase}}{{feature_name}}{{/pascalCase}}, {{#pascalCase}}{{feature_name}}{{/pascalCase}}DTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.{{#camelCase}}{{feature_name}}{{/camelCase}}.watchEntity(
      sessionId: sessionId,
      entityId: entityId,
    ),
    convertDtoToModel: {{#pascalCase}}{{feature_name}}{{/pascalCase}}.fromDTO,
    onError: (error) {
      dlog('Error occurred in watch{{#pascalCase}}{{feature_name}}{{/pascalCase}}: $error');
    },
  );
}
