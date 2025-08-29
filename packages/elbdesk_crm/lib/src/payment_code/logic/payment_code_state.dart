import 'dart:async';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/src/payment_code/logic/payment_code_provider.dart';
import 'package:elbdesk_crm/src/payment_code/models/payment_code.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'payment_code_state.g.dart';

@riverpod
class PaymentCodeState extends _$PaymentCodeState
    implements EntityState<PaymentCode> {
  PaymentCodeState() {
    _initializeStateManager();
  }

  late final EntityStateManager<PaymentCode> _stateManager;

  @override
  Future<PaymentCode> build(int entityId, String sessionId) async {
    if (entityId == 0) {
      return PaymentCode.initial();
    }

    return _stateManager.build(
      id: entityId,
      sessionId: sessionId,
      ref: ref,
    );
  }

  void _initializeStateManager() {
    _stateManager = EntityStateManager<PaymentCode>(
      setLoadingState: () => state = const AsyncLoading(),
      setDataState: (PaymentCode paymentCode) => state = AsyncData(paymentCode),
      setErrorState: (Object error, StackTrace stackTrace) =>
          state = AsyncError(error, stackTrace),
      fetchAndLockFn: () => ref
          .read(paymentCodeRepositoryProvider)
          .fetchAndLock(entityId, sessionId),
      releaseFn: () =>
          ref.read(paymentCodeRepositoryProvider).release(entityId, sessionId),
      fetchByIdFn: () =>
          ref.read(paymentCodeRepositoryProvider).fetchById(entityId),
      updateWithReleaseFn: () => ref.read(paymentCodeRepositoryProvider).update(
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

  void updateCode(String code) {
    state = AsyncData(state.requireValue.copyWith(code: code));
  }

  void updateDescription(String description) {
    state = AsyncData(state.requireValue.copyWith(description: description));
  }

  void updateDueDateCalculation(String dueDateCalculation) {
    state = AsyncData(
      state.requireValue.copyWith(dueDateCalculation: dueDateCalculation),
    );
  }

  void updateDiscountDateCalculation(String discountDateCalculation) {
    state = AsyncData(
      state.requireValue
          .copyWith(discountDateCalculation: discountDateCalculation),
    );
  }

  void updateDiscountPercentage(double discountPercentage) {
    state = AsyncData(
      state.requireValue.copyWith(discountPercentage: discountPercentage),
    );
  }

  void updateCalculateDiscountOnCreditNote(bool calculateDiscountOnCreditNote) {
    state = AsyncData(
      state.requireValue.copyWith(
        calculateDiscountOnCreditNote: calculateDiscountOnCreditNote,
      ),
    );
  }
}
