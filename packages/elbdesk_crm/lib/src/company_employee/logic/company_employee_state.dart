import 'dart:async';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'company_employee_state.g.dart';

/// The State of the current company employee.
@riverpod
class CompanyEmployeeState extends _$CompanyEmployeeState
    implements EntityState<CompanyEmployee> {
  CompanyEmployeeState() {
    _initializeStateManager();
  }
  late final EntityStateManager<CompanyEmployee> _stateManager;

  @override
  Future<CompanyEmployee> build(int entityId, String sessionId) async {
    return _stateManager.build(
      id: entityId,
      sessionId: sessionId,
      ref: ref,
    );
  }

  void _initializeStateManager() {
    _stateManager = EntityStateManager<CompanyEmployee>(
      setLoadingState: () => state = const AsyncLoading(),
      setDataState: (CompanyEmployee companyEmployee) =>
          state = AsyncData(companyEmployee),
      setErrorState: (Object error, StackTrace stackTrace) =>
          state = AsyncError(error, stackTrace),
      fetchAndLockFn: () => ref
          .read(companyEmployeeRepositoryProvider)
          .fetchAndLock(entityId, sessionId),
      releaseFn: () => ref
          .read(companyEmployeeRepositoryProvider)
          .release(entityId, sessionId),
      fetchByIdFn: () =>
          ref.read(companyEmployeeRepositoryProvider).fetchById(entityId),
      updateWithReleaseFn: () =>
          ref.read(companyEmployeeRepositoryProvider).update(
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

  void updatePosition(String position) {
    state = AsyncData(
      state.requireValue.copyWith(
        position: position,
      ),
    );
  }

  void updateIsActive(bool isActive) {
    state = AsyncData(
      state.requireValue.copyWith(
        active: isActive,
      ),
    );
  }

  void addDepartment(CompanyDepartment department) {
    state = AsyncData(
      state.requireValue.copyWith(
        departments: [
          ...state.requireValue.departments ?? [],
          department,
        ],
      ),
    );
  }
}
