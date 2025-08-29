import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine/logic/artwork_quarantine_provider.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine/models/artwork_quarantine.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'artwork_quarantine_state.g.dart';

/// Artwork Quarantine State
///
/// This state is used to manage artwork quarantine items
@riverpod
class ArtworkQuarantineState extends _$ArtworkQuarantineState
    implements EntityState<ArtworkQuarantine> {
  ///@nodoc
  ArtworkQuarantineState() {
    _initializeStateManager();
  }
  late final EntityStateManager<ArtworkQuarantine> _stateManager;

  void _initializeStateManager() {
    _stateManager = EntityStateManager<ArtworkQuarantine>(
      setLoadingState: () => state = const AsyncLoading(),
      setDataState: (ArtworkQuarantine quarantine) =>
          state = AsyncData(quarantine),
      setErrorState: (Object error, StackTrace stackTrace) =>
          state = AsyncError(error, stackTrace),
      fetchAndLockFn: () async {
        final repository = ref.read(artworkQuarantineRepositoryProvider);
        return repository.fetchAndLock(entityId, sessionId);
      },
      releaseFn: () async {
        final repository = ref.read(artworkQuarantineRepositoryProvider);
        await repository.release(entityId, sessionId);
      },
      fetchByIdFn: () async {
        final repository = ref.read(artworkQuarantineRepositoryProvider);
        return repository.fetchById(entityId);
      },
      updateWithReleaseFn: () async {
        final repository = ref.read(artworkQuarantineRepositoryProvider);
        await repository.update(
          entity: state.requireValue,
          release: true,
          sessionId: sessionId,
        );
      },
    );
  }

  @override
  Future<ArtworkQuarantine> build(int entityId, String sessionId) async {
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
      state.requireValue.copyWith(
        meta: state.requireValue.meta.copyWith(
          lastModifiedAt: DateTime.now(),
          lastModifiedById: userId,
          isDraft: false,
        ),
      ),
    );
  }

  /// Update description
  void updateDescription(String description) {
    state = AsyncData(
      state.requireValue.copyWith(
        general: state.requireValue.general.copyWith(description: description),
      ),
    );
  }

  /// Update keywords
  void updateKeywords(String? keywords) {
    state = AsyncData(
      state.requireValue.copyWith(
        general: state.requireValue.general.copyWith(keywords: keywords),
      ),
    );
  }

  /// Update dimensions
  void updateWidth(double width) {
    state = AsyncData(
      state.requireValue.copyWith(
        artworkData: state.requireValue.artworkData.copyWith(width: width),
      ),
    );
  }

  void updateHeight(double height) {
    state = AsyncData(
      state.requireValue.copyWith(
        artworkData: state.requireValue.artworkData.copyWith(height: height),
      ),
    );
  }

  /// Update corner radius
  void updateCornerRadius(double? cornerRadius) {
    state = AsyncData(
      state.requireValue.copyWith(
        artworkData:
            state.requireValue.artworkData.copyWith(cornerRadius: cornerRadius),
      ),
    );
  }

  /// Update print process type
  void updatePrintProcessType(ArtworkPrintProcessType printProcessType) {
    state = AsyncData(
      state.requireValue.copyWith(
        general: state.requireValue.general
            .copyWith(printProcessType: printProcessType),
      ),
    );
  }

  /// Update product type
  void updateProductType(ProductType productType) {
    state = AsyncData(
      state.requireValue.copyWith(
        general: state.requireValue.general.copyWith(productType: productType),
      ),
    );
  }

  /// Update artwork type
  void updateArtworkType(ArtworkType artworkType) {
    state = AsyncData(
      state.requireValue.copyWith(
        general: state.requireValue.general.copyWith(type: artworkType),
      ),
    );
  }
}
