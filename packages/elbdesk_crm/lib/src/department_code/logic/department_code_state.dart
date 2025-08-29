import 'dart:async';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/src/department_code/logic/department_code_provider.dart';
import 'package:elbdesk_crm/src/department_code/models/department_code.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'department_code_state.g.dart';

@riverpod
class DepartmentCodeState extends _$DepartmentCodeState
    implements EntityState<DepartmentCode> {
  DepartmentCodeState() {
    _initializeStateManager();
  }
  late final EntityStateManager<DepartmentCode> _stateManager;

  @override
  Future<DepartmentCode> build(int entityId, String sessionId) async {
    if (entityId == 0) {
      return DepartmentCode.initial();
    }

    return _stateManager.build(
      id: entityId,
      sessionId: sessionId,
      ref: ref,
    );
  }

  void _initializeStateManager() {
    _stateManager = EntityStateManager<DepartmentCode>(
      setLoadingState: () => state = const AsyncLoading(),
      setDataState: (DepartmentCode departmentCode) =>
          state = AsyncData(departmentCode),
      setErrorState: (Object error, StackTrace stackTrace) =>
          state = AsyncError(error, stackTrace),
      fetchAndLockFn: () => ref
          .read(departmentCodeRepositoryProvider)
          .fetchAndLock(entityId, sessionId),
      releaseFn: () => ref
          .read(departmentCodeRepositoryProvider)
          .release(entityId, sessionId),
      fetchByIdFn: () =>
          ref.read(departmentCodeRepositoryProvider).fetchById(entityId),
      updateWithReleaseFn: () =>
          ref.read(departmentCodeRepositoryProvider).update(
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
}
