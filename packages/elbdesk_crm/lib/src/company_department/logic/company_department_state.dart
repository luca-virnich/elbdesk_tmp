import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/src/company_department/logic/company_department_provider.dart';
import 'package:elbdesk_crm/src/company_department/models/company_department.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'company_department_state.g.dart';

/// CompanyDepartment State
///
/// This state is used to manage and update the company_department details
@riverpod
class CompanyDepartmentState extends _$CompanyDepartmentState
    implements EntityState<CompanyDepartment> {
  ///@nodoc
  CompanyDepartmentState() {
    _initializeStateManager();
  }
  late final EntityStateManager<CompanyDepartment> _stateManager;

  void _initializeStateManager() {
    _stateManager = EntityStateManager<CompanyDepartment>(
      setLoadingState: () => state = const AsyncLoading(),
      setDataState: (CompanyDepartment item) => state = AsyncData(item),
      setErrorState: (Object error, StackTrace stackTrace) =>
          state = AsyncError(error, stackTrace),
      fetchAndLockFn: () => ref
          .read(companyDepartmentRepositoryProvider)
          .fetchAndLock(entityId, sessionId),
      releaseFn: () => ref
          .read(companyDepartmentRepositoryProvider)
          .release(entityId, sessionId),
      fetchByIdFn: () =>
          ref.read(companyDepartmentRepositoryProvider).fetchById(entityId),
      updateWithReleaseFn: () =>
          ref.read(companyDepartmentRepositoryProvider).update(
                entity: state.requireValue,
                release: true,
                sessionId: sessionId,
              ),
    );
  }

  @override
  Future<CompanyDepartment> build(int entityId, String sessionId) async {
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

  /// Update the name
  void updateName(String name) {
    state = AsyncData(
      state.requireValue.copyWith(name: name),
    );
  }

  /// Update the description
  void updateDescription(String description) {
    state = AsyncData(
      state.requireValue.copyWith(description: description),
    );
  }
}
