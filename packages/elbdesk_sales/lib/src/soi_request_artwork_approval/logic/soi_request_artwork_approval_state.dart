import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_sales/src/soi_request_artwork_approval/_export_soi_request_artwork_approval.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'soi_request_artwork_approval_state.g.dart';

/// Sales Order State
///
/// This state is used to manage and update the sales order details
@riverpod
class SoiRequestArtworkApprovalState extends _$SoiRequestArtworkApprovalState
    implements EntityState<SoiRequestArtworkApproval> {
  ///@nodoc
  SoiRequestArtworkApprovalState() {
    _initializeStateManager();
  }

  late final EntityStateManager<SoiRequestArtworkApproval> _stateManager;

  void _initializeStateManager() {
    _stateManager = EntityStateManager<SoiRequestArtworkApproval>(
      setLoadingState: () => state = const AsyncLoading(),
      setDataState: (SoiRequestArtworkApproval soiRequestArtworkApproval) =>
          state = AsyncData(soiRequestArtworkApproval),
      setErrorState: (Object error, StackTrace stackTrace) =>
          state = AsyncError(error, stackTrace),
      fetchAndLockFn: () => ref
          .read(soiRequestArtworkApprovalRepositoryProvider)
          .fetchAndLock(entityId, sessionId),
      releaseFn: () => ref
          .read(soiRequestArtworkApprovalRepositoryProvider)
          .release(entityId, sessionId),
      fetchByIdFn: () => ref
          .read(soiRequestArtworkApprovalRepositoryProvider)
          .fetchById(entityId),
      updateWithReleaseFn: () =>
          ref.read(soiRequestArtworkApprovalRepositoryProvider).update(
                entity: state.requireValue,
                release: true,
                sessionId: sessionId,
              ),
    );
  }

  @override
  Future<SoiRequestArtworkApproval> build(
    int entityId,
    String sessionId,
  ) async {
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
    final userId = ref.read(authUserStateProvider)!.id;
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

  void updateType(SoiRequestArtworkApprovalType type) {
    state = AsyncData(
      state.requireValue.copyWith(
        type: type,
      ),
    );
  }

  void updateDeadline(DateTime? deadline) {
    state = AsyncData(
      state.requireValue.copyWith(
        salesOrderItem:
            state.requireValue.salesOrderItem?.copyWith(deadline: deadline),
      ),
    );
  }
}
