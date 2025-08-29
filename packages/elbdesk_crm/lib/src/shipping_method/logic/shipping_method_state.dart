import 'dart:async';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/src/shipping_method/models/shipping_method.dart';
import 'package:elbdesk_crm/src/shipping_method/providers/shipping_method_provider.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shipping_method_state.g.dart';

@riverpod
class ShippingMethodState extends _$ShippingMethodState
    implements EntityState<ShippingMethod> {
  ShippingMethodState() {
    _initializeStateManager();
  }

  late final EntityStateManager<ShippingMethod> _stateManager;

  @override
  Future<ShippingMethod> build(int entityId, String sessionId) async {
    if (entityId == 0) {
      return ShippingMethod.initial();
    }

    return _stateManager.build(
      id: entityId,
      sessionId: sessionId,
      ref: ref,
    );
  }

  void _initializeStateManager() {
    _stateManager = EntityStateManager<ShippingMethod>(
      setLoadingState: () => state = const AsyncLoading(),
      setDataState: (ShippingMethod shippingMethod) =>
          state = AsyncData(shippingMethod),
      setErrorState: (Object error, StackTrace stackTrace) =>
          state = AsyncError(error, stackTrace),
      fetchAndLockFn: () => ref
          .read(shippingMethodRepositoryProvider)
          .fetchAndLock(entityId, sessionId),
      releaseFn: () => ref
          .read(shippingMethodRepositoryProvider)
          .release(entityId, sessionId),
      fetchByIdFn: () =>
          ref.read(shippingMethodRepositoryProvider).fetchById(entityId),
      updateWithReleaseFn: () =>
          ref.read(shippingMethodRepositoryProvider).update(
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
    final userId = ref.read(authUserStateProvider)!.id;
    state = AsyncData(
      state.requireValue.copyWith.meta(
        lastModifiedAt: DateTime.now(),
        lastModifiedById: userId,
        isDraft: false,
      ),
    );
  }

  // Shipping Method specific update methods
  void updateCode(String code) {
    state = AsyncData(state.requireValue.copyWith(code: code));
  }

  void updateDescription(String description) {
    state = AsyncData(state.requireValue.copyWith(description: description));
  }

  void updateIsActive(bool isActive) {
    state = AsyncData(state.requireValue.copyWith(isActive: isActive));
  }
}
