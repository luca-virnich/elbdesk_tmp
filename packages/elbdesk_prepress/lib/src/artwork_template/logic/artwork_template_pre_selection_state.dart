import 'dart:async';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/artwork_template/logic/artwork_template_provider.dart';
import 'package:elbdesk_prepress/src/artwork_template/models/artwork_template_pre_selection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'artwork_template_pre_selection_state.g.dart';

@riverpod
class ArtworkTemplatePreSelectionState
    extends _$ArtworkTemplatePreSelectionState
    implements EntityState<ArtworkTemplatePreSelection> {
  ArtworkTemplatePreSelectionState() {
    _initializeStateManager();
  }
  late final EntityStateManager<ArtworkTemplatePreSelection> _stateManager;

  @override
  Future<ArtworkTemplatePreSelection> build(
    int entityId,
    String sessionId,
  ) async {
    if (entityId == 0) {
      return ArtworkTemplatePreSelection.initial();
    }

    return _stateManager.build(
      id: entityId,
      sessionId: sessionId,
      ref: ref,
    );
  }

  void _initializeStateManager() {
    _stateManager = EntityStateManager<ArtworkTemplatePreSelection>(
      setLoadingState: () => state = const AsyncLoading(),
      setDataState: (ArtworkTemplatePreSelection artworkTemplatePreSelection) =>
          state = AsyncData(artworkTemplatePreSelection),
      setErrorState: (Object error, StackTrace stackTrace) =>
          state = AsyncError(error, stackTrace),
      fetchAndLockFn: () => ref
          .read(artworkTemplatePreSelectionRepositoryProvider)
          .fetchAndLock(entityId, sessionId),
      releaseFn: () => ref
          .read(artworkTemplatePreSelectionRepositoryProvider)
          .release(entityId, sessionId),
      fetchByIdFn: () => ref
          .read(artworkTemplatePreSelectionRepositoryProvider)
          .fetchById(entityId),
      updateWithReleaseFn: () =>
          ref.read(artworkTemplatePreSelectionRepositoryProvider).update(
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
    final userId = ref.read(authUserStateProvider)!.id!;
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
