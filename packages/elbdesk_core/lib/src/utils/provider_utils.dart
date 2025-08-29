import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider_utils.g.dart';

class EntityStateManager<T> {
  /// Constructor
  EntityStateManager({
    required this.setLoadingState,
    required this.setDataState,
    required this.setErrorState,
    required this.fetchAndLockFn,
    required this.releaseFn,
    required this.fetchByIdFn,
    required this.updateWithReleaseFn,
  });
  final VoidCallback setLoadingState;
  final void Function(T) setDataState;
  final void Function(Object, StackTrace) setErrorState;
  final Future<T?> Function() fetchAndLockFn;
  final Future<void> Function() releaseFn;
  final Future<T?> Function() fetchByIdFn;
  final Future<void> Function() updateWithReleaseFn;

  bool _isDisposed = false;

  Completer<void>? _lockCompleter;

  Future<T> build({
    required int id,
    required String sessionId,
    required Ref ref,
  }) async {
    final viewOnly = ref.watch(entityViewOnlyProvider(sessionId));

    _lockCompleter = Completer<void>();
    ref.onDispose(() {
      _isDisposed = true;
    });

    final object = viewOnly ? await fetchByIdFn() : await fetchAndLockFn();

    _lockCompleter?.complete();

    if (_isDisposed) {
      await releaseFn();
    }

    return object!;
  }

  Future<void> refetchWithLock() async {
    setLoadingState();

    try {
      final object = await fetchAndLockFn();
      if (object != null) {
        setDataState(object);
      } else {
        setErrorState('Failed to fetch object', StackTrace.empty);
      }
    } catch (error, stackTrace) {
      setErrorState(error, stackTrace);
    }
  }

  Future<void> refetchWithoutLock() async {
    setLoadingState();

    try {
      final object = await fetchByIdFn();
      setDataState(object as T);
    } catch (error, stackTrace) {
      setErrorState(error, stackTrace);
    }
  }

  Future<void> saveAndUnlockAndRefetch() async {
    setLoadingState();
    await updateWithReleaseFn();

    // TODO(tk): Check if this is correct
    // I implemented this because the state was previously not updated with
    // the refetched data - That way an old sessionId was stored
    // Old code:
    //await fetchByIdFn();

    // New code is the full try block:
    try {
      final object = await fetchByIdFn();
      setDataState(object as T);
    } catch (error, stackTrace) {
      setErrorState(error, stackTrace);
    }
  }
}

class ServerpodStreamManager<T, D> {
  StreamController<T>? _inStream;
  late StreamSubscription<D> _subscription;

  Stream<T> setupStream({
    required Ref ref,
    required Stream<D> Function() startListening,
    required T Function(D) convertDtoToModel,
    void Function(Object error)? onError,
  }) {
    _inStream = StreamController<T>.broadcast();

    // When the provider is disposed
    ref.onDispose(() {
      _subscription.cancel();
      _inStream?.close();
    });

    // Start the stream subscription
    final outStream = startListening();

    // Process incoming data and convert it to the desired model
    _subscription = outStream.listen(
      (dto) {
        _inStream?.add(convertDtoToModel(dto));
      },
      onError: (Object error) {
        if (onError != null) {
          onError(error);
          _inStream?.addError(error);
        } else {
          _inStream?.addError(error);
        }
      },
    );

    return _inStream!.stream;
  }
}

@riverpod
class EntityViewOnly extends _$EntityViewOnly {
  @override
  bool build(String sessionId) {
    return false;
  }

  void setViewOnly(bool value) {
    state = value;
  }
}

// ****************************************************************
// * Generic Helper for handling stream updates
// * Can be reused across different providers with the same pattern
// ****************************************************************

/// Generic helper class for handling stream updates with add/update/remove logic
class StreamUpdateHandler {
  // Private constructor to prevent instantiation
  const StreamUpdateHandler._();

  /// Handles stream updates for a list of entities
  ///
  /// Type parameters:
  /// - T: The entity type being handled
  ///
  /// Parameters:
  /// - currentState: The current AsyncValue state
  /// - removedId: ID of entity to remove (if any)
  /// - entity: Entity to add or update (if any)
  /// - getId: Function to extract ID from entity
  ///
  /// Returns the updated AsyncValue state
  static AsyncValue<List<T>> handleUpdate<T>({
    required AsyncValue<List<T>> currentState,
    required int? removedId,
    required T? entity,
    required int? Function(T) getId,
  }) {
    final currentList = currentState.valueOrNull ?? [];

    if (entity != null) {
      // Add or update
      final entityId = getId(entity);
      final existingIndex = currentList.indexWhere(
        (item) => getId(item) == entityId,
      );

      if (existingIndex != -1) {
        // Update existing
        final updatedList = [...currentList];
        updatedList[existingIndex] = entity;
        return AsyncValue.data(updatedList);
      } else {
        // Add new
        return AsyncValue.data([...currentList, entity]);
      }
    } else if (removedId != null) {
      // Remove from list
      return AsyncValue.data(
        currentList.where((item) => getId(item) != removedId).toList(),
      );
    }

    // No changes
    return currentState;
  }

  /// Simplified version for entities with a standard meta.id field
  /// Uses dynamic access to get the ID
  static AsyncValue<List<T>> handleUpdateWithMetaId<T>({
    required AsyncValue<List<T>> currentState,
    required int? removedId,
    required T? entity,
  }) {
    return handleUpdate(
      currentState: currentState,
      removedId: removedId,
      entity: entity,
      getId: (item) {
        final dynamic dynamicItem = item;
        return dynamicItem.meta.id as int?;
      },
    );
  }
}
