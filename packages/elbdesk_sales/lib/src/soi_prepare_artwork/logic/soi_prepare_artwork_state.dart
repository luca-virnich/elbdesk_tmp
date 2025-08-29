import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_sales/src/soi_prepare_artwork/logic/soi_prepare_artwork_provider.dart';
import 'package:elbdesk_sales/src/soi_prepare_artwork/models/soi_prepare_artwork.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'soi_prepare_artwork_state.g.dart';

/// Sales Order State
///
/// This state is used to manage and update the sales order details
@riverpod
class SoiPrepareArtworkState extends _$SoiPrepareArtworkState
    implements EntityState<SoiPrepareArtwork> {
  ///@nodoc
  SoiPrepareArtworkState() {
    _initializeStateManager();
  }
  late final EntityStateManager<SoiPrepareArtwork> _stateManager;

  void _initializeStateManager() {
    _stateManager = EntityStateManager<SoiPrepareArtwork>(
      setLoadingState: () => state = const AsyncLoading(),
      setDataState: (SoiPrepareArtwork soiPrepareArtwork) =>
          state = AsyncData(soiPrepareArtwork),
      setErrorState: (Object error, StackTrace stackTrace) =>
          state = AsyncError(error, stackTrace),
      fetchAndLockFn: () => ref
          .read(soiPrepareArtworkRepositoryProvider)
          .fetchAndLock(entityId, sessionId),
      releaseFn: () => ref
          .read(soiPrepareArtworkRepositoryProvider)
          .release(entityId, sessionId),
      fetchByIdFn: () =>
          ref.read(soiPrepareArtworkRepositoryProvider).fetchById(entityId),
      updateWithReleaseFn: () =>
          ref.read(soiPrepareArtworkRepositoryProvider).update(
                entity: state.requireValue,
                release: true,
                sessionId: sessionId,
              ),
    );
  }

  @override
  Future<SoiPrepareArtwork> build(int entityId, String sessionId) async {
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

  /// Update the order name
  void updateDescription(String description) {
    state = AsyncData(
      state.requireValue.copyWith(
        salesOrderItem: state.requireValue.salesOrderItem
            ?.copyWith(description: description),
      ),
    );
  }

  /// Update the handling user
  void updateAssignedUser(LightUser? user) {
    state = AsyncData(
      state.requireValue.copyWith(
        salesOrderItem: state.requireValue.salesOrderItem?.copyWith(
          assignedUser: user,
        ),
      ),
    );
  }

  void updateBillableTime(int billableTime) {
    state = AsyncData(
      state.requireValue.copyWith(
        salesOrderItem: state.requireValue.salesOrderItem
            ?.copyWith(billableTime: billableTime),
      ),
    );
  }

  /// Update assigned App User by id

  void updateStatus(SalesOrderItemStatus status) {
    state = AsyncData(
      state.requireValue.copyWith(
        salesOrderItem:
            state.requireValue.salesOrderItem?.copyWith(status: status),
      ),
    );
  }

  void updateEyeCStatus(EyeCStatus? eyeCStatus) {
    state = AsyncData(
      state.requireValue.copyWith(
        eyeCStatus: eyeCStatus,
      ),
    );
  }

  void updateDifficultyLevel(
    SoiPrepareArtworkDifficultyLevel? difficultyLevel,
  ) {
    state = AsyncData(
      state.requireValue.copyWith(difficultyLevel: difficultyLevel),
    );
  }

  void onDeadlineDateChanged(DateTime? date) {
    state = AsyncData(
      state.requireValue.copyWith(
        salesOrderItem:
            state.requireValue.salesOrderItem?.copyWith(deadline: date),
      ),
    );
  }
}
