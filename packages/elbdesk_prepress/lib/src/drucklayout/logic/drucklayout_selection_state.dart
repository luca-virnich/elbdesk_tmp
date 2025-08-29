import 'dart:async';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'drucklayout_selection_state.g.dart';

@riverpod
class DrucklayoutSelectionState extends _$DrucklayoutSelectionState
    implements EntityState<DrucklayoutSelection> {
  DrucklayoutSelectionState() {
    _initializeStateManager();
  }
  late final EntityStateManager<DrucklayoutSelection> _stateManager;

  @override
  Future<DrucklayoutSelection> build(
    int entityId,
    String sessionId,
  ) async {
    if (entityId == 0) {
      return DrucklayoutSelection.initial();
    }

    return _stateManager.build(
      id: entityId,
      sessionId: sessionId,
      ref: ref,
    );
  }

  void _initializeStateManager() {
    _stateManager = EntityStateManager<DrucklayoutSelection>(
      setLoadingState: () => state = const AsyncLoading(),
      setDataState: (DrucklayoutSelection drucklayoutSelection) =>
          state = AsyncData(drucklayoutSelection),
      setErrorState: (Object error, StackTrace stackTrace) =>
          state = AsyncError(error, stackTrace),
      fetchAndLockFn: () => ref
          .read(drucklayoutSelectionRepositoryProvider)
          .fetchAndLock(entityId, sessionId),
      releaseFn: () => ref
          .read(drucklayoutSelectionRepositoryProvider)
          .release(entityId, sessionId),
      fetchByIdFn: () =>
          ref.read(drucklayoutSelectionRepositoryProvider).fetchById(entityId),
      updateWithReleaseFn: () =>
          ref.read(drucklayoutSelectionRepositoryProvider).update(
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

  @override
  void updateMetaAfterSave() {
    final userId = ref.read(authUserStateProvider)!.id;
    state = AsyncData(
      state.requireValue.copyWith.meta(
        lastModifiedAt: DateTime.now(),
        lastModifiedById: userId,
        isDraft: false,
      ),
    );
  }

  Future<void> updateDrucklayoutPreSelectionId(
    int drucklayoutPreSelectionId,
  ) async {
    state = AsyncData(
      state.requireValue.copyWith(
        drucklayoutPreSelectionId: drucklayoutPreSelectionId,
      ),
    );
  }

  void updateDescription(String description) {
    state = AsyncData(state.requireValue.copyWith(description: description));
  }
}
