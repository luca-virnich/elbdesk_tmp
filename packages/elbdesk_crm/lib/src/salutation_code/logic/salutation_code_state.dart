import 'dart:async';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/src/salutation_code/logic/salutation_code_provider.dart';
import 'package:elbdesk_crm/src/salutation_code/models/salutation_code.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'salutation_code_state.g.dart';

/// The State of the current salutation code.
@riverpod
class SalutationCodeState extends _$SalutationCodeState
    implements EntityState<SalutationCode> {
  SalutationCodeState() {
    _initializeStateManager();
  }
  late final EntityStateManager<SalutationCode> _stateManager;

  @override
  Future<SalutationCode> build(int entityId, String sessionId) async {
    if (entityId == 0) {
      return SalutationCode.initial();
    }
    return _stateManager.build(
      id: entityId,
      sessionId: sessionId,
      ref: ref,
    );
  }

  void _initializeStateManager() {
    _stateManager = EntityStateManager<SalutationCode>(
      setLoadingState: () => state = const AsyncLoading(),
      setDataState: (SalutationCode salutationCode) =>
          state = AsyncData(salutationCode),
      setErrorState: (Object error, StackTrace stackTrace) =>
          state = AsyncError(error, stackTrace),
      fetchAndLockFn: () => ref
          .read(salutationCodeRepositoryProvider)
          .fetchAndLock(entityId, sessionId),
      releaseFn: () => ref
          .read(salutationCodeRepositoryProvider)
          .release(entityId, sessionId),
      fetchByIdFn: () =>
          ref.read(salutationCodeRepositoryProvider).fetchById(entityId),
      updateWithReleaseFn: () =>
          ref.read(salutationCodeRepositoryProvider).update(
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

  void updateIsPrimaryPerson(bool isPrimaryPerson) {
    state = AsyncData(
      state.requireValue.copyWith(isPrimaryPerson: isPrimaryPerson),
    );
  }

  void updateIsPrimaryCompany(bool isPrimaryCompany) {
    state = AsyncData(
      state.requireValue.copyWith(isPrimaryCompany: isPrimaryCompany),
    );
  }
}
