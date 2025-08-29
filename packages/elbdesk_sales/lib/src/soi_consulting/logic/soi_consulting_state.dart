import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_sales/src/soi_consulting/logic/soi_consulting_provider.dart';
import 'package:elbdesk_sales/src/soi_consulting/models/soi_consulting.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'soi_consulting_state.g.dart';

/// Sales Order State
///
/// This state is used to manage and update the sales order details
@riverpod
class SoiConsultingState extends _$SoiConsultingState
    implements EntityState<SoiConsulting> {
  ///@nodoc
  SoiConsultingState() {
    _initializeStateManager();
  }
  late final EntityStateManager<SoiConsulting> _stateManager;

  void _initializeStateManager() {
    _stateManager = EntityStateManager<SoiConsulting>(
      setLoadingState: () => state = const AsyncLoading(),
      setDataState: (SoiConsulting soiConsulting) =>
          state = AsyncData(soiConsulting),
      setErrorState: (Object error, StackTrace stackTrace) =>
          state = AsyncError(error, stackTrace),
      fetchAndLockFn: () => ref
          .read(soiConsultingRepositoryProvider)
          .fetchAndLock(entityId, sessionId),
      releaseFn: () => ref
          .read(soiConsultingRepositoryProvider)
          .release(entityId, sessionId),
      fetchByIdFn: () =>
          ref.read(soiConsultingRepositoryProvider).fetchById(entityId),
      updateWithReleaseFn: () =>
          ref.read(soiConsultingRepositoryProvider).update(
                entity: state.requireValue,
                release: true,
                sessionId: sessionId,
              ),
    );
  }

  @override
  Future<SoiConsulting> build(int entityId, String sessionId) async {
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

  void updateDeadline(DateTime? deadline) {
    state = AsyncData(
      state.requireValue.copyWith(
        salesOrderItem:
            state.requireValue.salesOrderItem?.copyWith(deadline: deadline),
      ),
    );
  }

  /// Update the handling user
  // void updateAssignedAppUser(LightUser assignedAppUser) {
  //   state = AsyncData(
  //     state.requireValue.copyWith(
  //       salesOrderItem: state.requireValue.salesOrderItem?.copyWith(
  //         assignedUser: assignedAppUser,
  //       ),
  //     ),
  //   );
  // }

  /// remove assigned App User

  void updateAssignedUser(LightUser? assignedUser) {
    state = AsyncData(
      state.requireValue.copyWith(
        salesOrderItem: state.requireValue.salesOrderItem
            ?.copyWith(assignedUser: assignedUser),
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

  void updateText(String text) {
    state = AsyncData(
      state.requireValue.copyWith(text: text),
    );
  }
}
