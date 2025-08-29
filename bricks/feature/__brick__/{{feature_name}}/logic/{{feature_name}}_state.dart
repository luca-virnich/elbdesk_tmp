import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import '{{#snakeCase}}{{feature_name}}{{/snakeCase}}_provider.dart';
import '../models/{{#snakeCase}}{{feature_name}}{{/snakeCase}}.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '{{#snakeCase}}{{feature_name}}{{/snakeCase}}_state.g.dart';

/// {{#pascalCase}}{{feature_name}}{{/pascalCase}} State
///
/// This state is used to manage and update the {{#snakeCase}}{{feature_name}}{{/snakeCase}} details
@riverpod
class {{#pascalCase}}{{feature_name}}{{/pascalCase}}State extends _${{#pascalCase}}{{feature_name}}{{/pascalCase}}State
    implements EntityState<{{#pascalCase}}{{feature_name}}{{/pascalCase}}> {
  ///@nodoc
  {{#pascalCase}}{{feature_name}}{{/pascalCase}}State() {
    _initializeStateManager();
  }
  late final EntityStateManager<{{#pascalCase}}{{feature_name}}{{/pascalCase}}> _stateManager;

  void _initializeStateManager() {
    _stateManager = EntityStateManager<{{#pascalCase}}{{feature_name}}{{/pascalCase}}>(
      setLoadingState: () => state = const AsyncLoading(),
      setDataState: ({{#pascalCase}}{{feature_name}}{{/pascalCase}} item) =>
          state = AsyncData(item),
      setErrorState: (Object error, StackTrace stackTrace) =>
          state = AsyncError(error, stackTrace),
      fetchAndLockFn: () => ref
          .read({{#camelCase}}{{feature_name}}{{/camelCase}}RepositoryProvider)
          .fetchAndLock(entityId, sessionId),
      releaseFn: () => ref
          .read({{#camelCase}}{{feature_name}}{{/camelCase}}RepositoryProvider)
          .release(entityId, sessionId),
      fetchByIdFn: () =>
          ref.read({{#camelCase}}{{feature_name}}{{/camelCase}}RepositoryProvider).fetchById(entityId),
      updateWithReleaseFn: () =>
          ref.read({{#camelCase}}{{feature_name}}{{/camelCase}}RepositoryProvider).update(
                entity: state.requireValue,
                release: true,
                sessionId: sessionId,
              ),
    );
  }

  @override
  Future<{{#pascalCase}}{{feature_name}}{{/pascalCase}}> build(int entityId, String sessionId) async {
    return _stateManager.build(
      id: entityId,
      sessionId: sessionId,
      ref: ref,
    );
  }

  @override
  Future<void> refetchWithLock() {
    return _stateManager.refetchWithLock();
  }

  @override
  Future<void> refetchWithoutLock() {
    return _stateManager.refetchWithoutLock();
  }

  @override
  Future<void> saveAndUnlockAndRefetch() async {
    return _stateManager.saveAndUnlockAndRefetch();
  }

  @override
  void updateMetaAfterSave() {
    final userId = ref.read(authUserStateProvider)!.id!;
    state = AsyncData(
      state.requireValue.copyWith.meta(
        lastModifiedAt: DateTime.now(),
        lastModifiedById: userId,
        isDraft: false,
      ),
    );
  }

  // *
  // * General
  // *

  /// Update the name
  void updateName(String name) {
    state = AsyncData(
      state.requireValue.copyWith(name: name),
    );
  }

  /// Update the description
  void updateDescription(String description) {
    state = AsyncData(
      state.requireValue.copyWith(description: description),
    );
  }
} 
