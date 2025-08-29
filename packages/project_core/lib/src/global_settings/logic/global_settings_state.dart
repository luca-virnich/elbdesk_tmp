import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:project_core/src/global_settings/logic/global_settings_provider.dart';
import 'package:project_core/src/global_settings/models/global_settings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'global_settings_state.g.dart';

/// GlobalSettings State
///
/// This state is used to manage and update the global settings
@riverpod
class GlobalSettingsState extends _$GlobalSettingsState
    implements EntityState<GlobalSettings> {
  GlobalSettingsState() {
    _initializeStateManager();
  }

  late final EntityStateManager<GlobalSettings> _stateManager;

  void _initializeStateManager() {
    _stateManager = EntityStateManager<GlobalSettings>(
      setLoadingState: () => state = const AsyncLoading(),
      setDataState: (GlobalSettings item) => state = AsyncData(item),
      setErrorState: (Object error, StackTrace stackTrace) =>
          state = AsyncError(error, stackTrace),
      fetchAndLockFn: () => ref
          .read(globalSettingsRepositoryProvider)
          .fetchAndLock(entityId, sessionId),
      releaseFn: () => ref
          .read(globalSettingsRepositoryProvider)
          .release(entityId, sessionId),
      fetchByIdFn: () =>
          ref.read(globalSettingsRepositoryProvider).fetchById(entityId),
      updateWithReleaseFn: () =>
          ref.read(globalSettingsRepositoryProvider).update(
                entity: state.requireValue,
                release: true,
                sessionId: sessionId,
              ),
    );
  }

  @override
  Future<GlobalSettings> build(int entityId, String sessionId) async {
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
    final userId = sessionManager.signedInUser?.id;
    state = AsyncData(
      state.requireValue.copyWith.meta(
        lastModifiedAt: DateTime.now(),
        lastModifiedById: userId,
        isDraft: false,
      ),
    );
  }

  // *
  // * GlobalSettings-specific methods
  // *

  /// Update the AE endpoint path
  void updateAeEndpointPath(String path) {
    state = AsyncData(
      state.requireValue.copyWith(
        data: state.requireValue.data.copyWith(
          aeEndpointPath: path,
        ),
      ),
    );
  }

  /// Update the pdf viewer url
  void updatePdfViewerUrl(String path) {
    state = AsyncData(
      state.requireValue.copyWith(
        data: state.requireValue.data.copyWith(
          pdfViewerUrl: path,
        ),
      ),
    );
  }

  /// Update the data import output path
  void updateDataImportFolderPath(String path) {
    state = AsyncData(
      state.requireValue.copyWith(
        data: state.requireValue.data.copyWith(
          dataImportFolderPath: path,
        ),
      ),
    );
  }

  /// Update the artwork folder path
  void updateArtworkFolderPath(String path) {
    state = AsyncData(
      state.requireValue.copyWith(
        data: state.requireValue.data.copyWith(
          artworkFolderPath: path,
        ),
      ),
    );
  }
}
