# Entity State (Client)

Every Entity needs his own StateProvider. This is always used with the EntityId and the SessionId, where the SessionId represents in the end the opened window.

### State Class Definiton

Every State class should implement the `EntityState<T>` class.




An Exmample from the `LanguageCodeState`:

### Basic Implementation

```dart
@riverpod
class LanguageCodeState extends _$LanguageCodeState
    implements EntityState<LanguageCode> {
  LanguageCodeState() {
    _initializeStateManager();
  }
  late final EntityStateManager<LanguageCode> _stateManager;

  @override
  Future<LanguageCode> build(int entityId, String sessionId) async {
    /// In Some case we want to work with the State class also when we don't 
    /// have the Entity already at the Server, in this case we are using `0` as 
    /// id
    if (entityId == 0) {
      return LanguageCode.initial();
    }

    return _stateManager.build(
      id: entityId,
      sessionId: sessionId,
      ref: ref,
    );
  }

  void _initializeStateManager() {
    _stateManager = EntityStateManager<LanguageCode>(
      setLoadingState: () => state = const AsyncLoading(),
      setDataState: (LanguageCode languageCode) =>
          state = AsyncData(languageCode),
      setErrorState: (Object error, StackTrace stackTrace) =>
          state = AsyncError(error, stackTrace),
      fetchAndLockFn: () => ref
          .read(languageCodeRepositoryProvider)
          .fetchAndLock(entityId, sessionId),
      releaseFn: () =>
          ref.read(languageCodeRepositoryProvider).release(entityId, sessionId),
      fetchByIdFn: () =>
          ref.read(languageCodeRepositoryProvider).fetchById(entityId),
      updateWithReleaseFn: () =>
          ref.read(languageCodeRepositoryProvider).update(
                entity: state.requireValue,
                release: true,
                sessionId: sessionId,
              ),
    );
  }

  @override
  Future<void> refetchWithoutLock() async {
    return _stateManager.refetchWithoutLock();
  }

  @override
  Future<void> refetchWithLock() async {
    return _stateManager.refetchWithLock();
  }

  @override
  Future<void> saveAndUnlockAndRefetch() async {
    return _stateManager.saveAndUnlockAndRefetch();
  }

}
```

### Additionl State Operations

```dart
  void updateCode(String code) {
    state = AsyncData(state.requireValue.copyWith(code: code));
  }

  void updateName(String name) {
    state = AsyncData(state.requireValue.copyWith(name: name));
  }
```