import 'dart:async';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'drucklayout_pre_selection_state.g.dart';

@riverpod
class DrucklayoutPreSelectionState extends _$DrucklayoutPreSelectionState
    implements EntityState<DrucklayoutPreSelection> {
  DrucklayoutPreSelectionState() {
    _initializeStateManager();
  }
  late final EntityStateManager<DrucklayoutPreSelection> _stateManager;

  @override
  Future<DrucklayoutPreSelection> build(
    int entityId,
    String sessionId,
  ) async {
    if (entityId == 0) {
      return DrucklayoutPreSelection.initial();
    }

    return _stateManager.build(
      id: entityId,
      sessionId: sessionId,
      ref: ref,
    );
  }

  void _initializeStateManager() {
    _stateManager = EntityStateManager<DrucklayoutPreSelection>(
      setLoadingState: () => state = const AsyncLoading(),
      setDataState: (DrucklayoutPreSelection drucklayoutPreSelection) =>
          state = AsyncData(drucklayoutPreSelection),
      setErrorState: (Object error, StackTrace stackTrace) =>
          state = AsyncError(error, stackTrace),
      fetchAndLockFn: () => ref
          .read(drucklayoutPreSelectionRepositoryProvider)
          .fetchAndLock(entityId, sessionId),
      releaseFn: () => ref
          .read(drucklayoutPreSelectionRepositoryProvider)
          .release(entityId, sessionId),
      fetchByIdFn: () => ref
          .read(drucklayoutPreSelectionRepositoryProvider)
          .fetchById(entityId),
      updateWithReleaseFn: () =>
          ref.read(drucklayoutPreSelectionRepositoryProvider).update(
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

  Future<void> updateCustomerId(int customerId) async {
    state = AsyncData(state.requireValue.copyWith(customerId: customerId));
  }

  void updateDescription(String description) {
    state = AsyncData(state.requireValue.copyWith(description: description));
  }
}
