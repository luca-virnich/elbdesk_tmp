import 'dart:ui';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/artwork_color/logic/artwork_color_provider.dart';
import 'package:elbdesk_prepress/src/artwork_color/models/artwork_color.dart';
import 'package:elbdesk_prepress/src/prepress_color_palette/models/prepress_color_palette.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'artwork_color_state.g.dart';

/// ArtworkColor State
///
/// This state is used to manage and update the color currently displayed
@riverpod
class ArtworkColorState extends _$ArtworkColorState
    implements EntityState<ArtworkColor> {
  ArtworkColorState() {
    _initializeStateManager();
  }

  late final EntityStateManager<ArtworkColor> _stateManager;

  @override
  Future<ArtworkColor> build(int entityId, String sessionId) async {
    return _stateManager.build(
      id: entityId,
      sessionId: sessionId,
      ref: ref,
    );
  }

  void _initializeStateManager() {
    _stateManager = EntityStateManager<ArtworkColor>(
      setLoadingState: () => state = const AsyncLoading(),
      setDataState: (ArtworkColor item) => state = AsyncData(item),
      setErrorState: (Object error, StackTrace stackTrace) =>
          state = AsyncError(error, stackTrace),
      fetchAndLockFn: () => ref
          .read(artworkColorRepositoryProvider)
          .fetchAndLock(entityId, sessionId),
      releaseFn: () =>
          ref.read(artworkColorRepositoryProvider).release(entityId, sessionId),
      fetchByIdFn: () =>
          ref.read(artworkColorRepositoryProvider).fetchById(entityId),
      updateWithReleaseFn: () =>
          ref.read(artworkColorRepositoryProvider).update(
                entity: state.requireValue,
                release: true,
                sessionId: sessionId,
              ),
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
  // * ArtworkColor-specific methods
  // *

  /// Update the color name
  void updateCoeColorName(String colorName) {
    state = AsyncData(
      state.requireValue.copyWith(
        colorName: colorName,
      ),
    );
  }

  /// Update the short name
  void updateShortName(String shortName) {
    state = AsyncData(
      state.requireValue.copyWith(
        shortName: shortName,
      ),
    );
  }

  /// Update the hex code
  void updateColor(Color color) {
    state = AsyncData(
      state.requireValue.copyWith(
        color: color,
      ),
    );
  }

  /// Update the color palette
  void updateColorPalette(PrepressColorPalette colorPalette) {
    state = AsyncData(
      state.requireValue.copyWith(
        colorPalette: colorPalette,
      ),
    );
  }
}
