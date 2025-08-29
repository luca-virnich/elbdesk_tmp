import 'dart:async';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/artwork_template/logic/artwork_template_provider.dart';
import 'package:elbdesk_prepress/src/artwork_template/models/artwork_template_selection.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'artwork_template_selection_state.g.dart';

@riverpod
class ArtworkTemplateSelectionState extends _$ArtworkTemplateSelectionState
    implements EntityState<ArtworkTemplateSelection> {
  ArtworkTemplateSelectionState() {
    _initializeStateManager();
  }
  late final EntityStateManager<ArtworkTemplateSelection> _stateManager;

  @override
  Future<ArtworkTemplateSelection> build(
    int entityId,
    String sessionId,
  ) async {
    if (entityId == 0) {
      return ArtworkTemplateSelection.initial();
    }

    return _stateManager.build(
      id: entityId,
      sessionId: sessionId,
      ref: ref,
    );
  }

  void _initializeStateManager() {
    _stateManager = EntityStateManager<ArtworkTemplateSelection>(
      setLoadingState: () => state = const AsyncLoading(),
      setDataState: (ArtworkTemplateSelection artworkTemplateSelection) =>
          state = AsyncData(artworkTemplateSelection),
      setErrorState: (Object error, StackTrace stackTrace) =>
          state = AsyncError(error, stackTrace),
      fetchAndLockFn: () => ref
          .read(artworkTemplateSelectionRepositoryProvider)
          .fetchAndLock(entityId, sessionId),
      releaseFn: () => ref
          .read(artworkTemplateSelectionRepositoryProvider)
          .release(entityId, sessionId),
      fetchByIdFn: () => ref
          .read(artworkTemplateSelectionRepositoryProvider)
          .fetchById(entityId),
      updateWithReleaseFn: () =>
          ref.read(artworkTemplateSelectionRepositoryProvider).update(
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

  Future<void> updateArtworkTemplatePreSelectionId(
    int artworkTemplatePreSelectionId,
  ) async {
    state = AsyncData(
      state.requireValue.copyWith(
        artworkTemplatePreSelectionId: artworkTemplatePreSelectionId,
      ),
    );
  }

  void updateDescription(String description) {
    state = AsyncData(state.requireValue.copyWith(description: description));
  }
}
