import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/artwork_color/models/artwork_color.dart';
import 'package:elbdesk_prepress/src/prepress_color_palette/logic/prepress_color_palette_provider.dart';
import 'package:elbdesk_prepress/src/prepress_color_palette/models/prepress_color_palette.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'prepress_color_palette_state.g.dart';

/// Color Book State
///
/// This state is used to manage and update the color book currently displayed
@riverpod
class PrepressColorPaletteState extends _$PrepressColorPaletteState
    implements EntityState<PrepressColorPalette> {
  PrepressColorPaletteState() {
    _initializeStateManager();
  }

  late final EntityStateManager<PrepressColorPalette> _stateManager;

  @override
  Future<PrepressColorPalette> build(int entityId, String sessionId) async {
    return _stateManager.build(
      id: entityId,
      sessionId: sessionId,
      ref: ref,
    );
  }

  void _initializeStateManager() {
    _stateManager = EntityStateManager<PrepressColorPalette>(
      setLoadingState: () => state = const AsyncLoading(),
      setDataState: (PrepressColorPalette item) => state = AsyncData(item),
      setErrorState: (Object error, StackTrace stackTrace) =>
          state = AsyncError(error, stackTrace),
      fetchAndLockFn: () => ref
          .read(prepressColorPaletteRepositoryProvider)
          .fetchAndLock(entityId, sessionId),
      releaseFn: () => ref
          .read(prepressColorPaletteRepositoryProvider)
          .release(entityId, sessionId),
      fetchByIdFn: () =>
          ref.read(prepressColorPaletteRepositoryProvider).fetchById(entityId),
      updateWithReleaseFn: () =>
          ref.read(prepressColorPaletteRepositoryProvider).update(
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
  // * General
  // *

  /// Update the color book name
  void updatePaletteName(String paletteName) {
    state = AsyncData(
      state.requireValue.copyWith(
        paletteName: paletteName,
      ),
    );
  }

  /// Update the description
  void updateDescription(String description) {
    state = AsyncData(
      state.requireValue.copyWith(
        description: description,
      ),
    );
  }

  /// Update colors list
  void updateColors(List<ArtworkColor> colors) {
    state = AsyncData(
      state.requireValue.copyWith(
        colors: colors,
      ),
    );
  }

  /// Add a color to the color palette
  void addColor(ArtworkColor color) {
    state = AsyncData(
      state.requireValue.copyWith(
        colors: [...(state.requireValue.colors ?? <ArtworkColor>[]), color],
      ),
    );
  }
}
