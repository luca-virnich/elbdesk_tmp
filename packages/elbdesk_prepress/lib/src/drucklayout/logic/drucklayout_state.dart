import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/drucklayout/logic/drucklayout_provider.dart';
import 'package:elbdesk_prepress/src/drucklayout/models/drucklayout.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'drucklayout_state.g.dart';

/// Drucklayout State
///
/// This state is used to manage and update the drucklayout details
@riverpod
class DrucklayoutState extends _$DrucklayoutState
    implements EntityState<Drucklayout> {
  ///@nodoc
  DrucklayoutState() {
    _initializeStateManager();
  }
  late final EntityStateManager<Drucklayout> _stateManager;

  void _initializeStateManager() {
    _stateManager = EntityStateManager<Drucklayout>(
      setLoadingState: () => state = const AsyncLoading(),
      setDataState: (Drucklayout item) => state = AsyncData(item),
      setErrorState: (Object error, StackTrace stackTrace) =>
          state = AsyncError(error, stackTrace),
      fetchAndLockFn: () => ref
          .read(drucklayoutRepositoryProvider)
          .fetchAndLock(entityId, sessionId),
      releaseFn: () =>
          ref.read(drucklayoutRepositoryProvider).release(entityId, sessionId),
      fetchByIdFn: () =>
          ref.read(drucklayoutRepositoryProvider).fetchById(entityId),
      updateWithReleaseFn: () => ref.read(drucklayoutRepositoryProvider).update(
            entity: state.requireValue,
            release: true,
            sessionId: sessionId,
          ),
    );
  }

  @override
  Future<Drucklayout> build(int entityId, String sessionId) async {
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
  void updateTitle(String title) {
    state = AsyncData(
      state.requireValue.copyWith(title: title),
    );
  }

  /// Update the description
  void updateDescription(String description) {
    state = AsyncData(
      state.requireValue.copyWith(description: description),
    );
  }
}

/// State provider for selected existing Drucklayout during Drucklayout
/// assignment
@riverpod
class SelectedExistingDrucklayoutState
    extends _$SelectedExistingDrucklayoutState {
  @override
  Drucklayout? build(String sessionId) {
    return null;
  }

  void updateSelectedDrucklayout(Drucklayout drucklayout) {
    state = drucklayout;
  }

  void clearSelectedDrucklayout() {
    state = null;
  }

  void setNewDrucklayout() {
    state = null;
  }
}

/// State provider for selecting Nutzenlayouts during Drucklayout assignment
@riverpod
class SelectedNutzenlayoutsForDrucklayoutState
    extends _$SelectedNutzenlayoutsForDrucklayoutState {
  @override
  Set<int> build(String sessionId) {
    return <int>{};
  }

  /// Toggle a Nutzenlayout selection
  void toggleNutzenlayout(int nutzenlayoutId) {
    final currentSelection = Set<int>.from(state);
    if (currentSelection.contains(nutzenlayoutId)) {
      currentSelection.remove(nutzenlayoutId);
    } else {
      currentSelection.add(nutzenlayoutId);
    }
    state = currentSelection;
  }

  /// Add a Nutzenlayout to the selection
  void addNutzenlayout(int nutzenlayoutId) {
    final currentSelection = Set<int>.from(state)..add(nutzenlayoutId);
    state = currentSelection;
  }

  /// Remove a Nutzenlayout from the selection
  void removeNutzenlayout(int nutzenlayoutId) {
    final currentSelection = Set<int>.from(state)..remove(nutzenlayoutId);
    state = currentSelection;
  }

  /// Clear all selected Nutzenlayouts
  void clearSelection() {
    state = <int>{};
  }

  /// Check if a Nutzenlayout is selected
  bool isSelected(int nutzenlayoutId) {
    return state.contains(nutzenlayoutId);
  }

  /// Get the count of selected Nutzenlayouts
  int get selectedCount => state.length;
}
