import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:project_core/project_core.dart';
import 'package:project_core/src/app_user/models/app_scope_permission.dart';
import 'package:project_core/src/service_user/_export_service_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'service_user_state.g.dart';

/// ServiceUser State
///
/// This state is used to manage and update the serviceUser details
@riverpod
class ServiceUserState extends _$ServiceUserState
    implements EntityState<ServiceUser> {
  ServiceUserState() {
    _initializeStateManager();
  }
  late final EntityStateManager<ServiceUser> _stateManager;

  void _initializeStateManager() {
    _stateManager = EntityStateManager<ServiceUser>(
      setLoadingState: () => state = const AsyncLoading(),
      setDataState: (ServiceUser serviceUser) => state = AsyncData(serviceUser),
      setErrorState: (Object error, StackTrace stackTrace) =>
          state = AsyncError(error, stackTrace),
      fetchAndLockFn: () => ref
          .read(serviceUserRepositoryProvider)
          .fetchAndLock(entityId, sessionId),
      releaseFn: () =>
          ref.read(serviceUserRepositoryProvider).release(entityId, sessionId),
      fetchByIdFn: () =>
          ref.read(fetchServiceUserProvider(entityId, sessionId).future),
      updateWithReleaseFn: () => ref.read(serviceUserRepositoryProvider).update(
            entity: state.requireValue,
            sessionId: sessionId,
            release: true,
          ),
    );
  }

  @override
  Future<ServiceUser> build(int entityId, String sessionId) async {
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

  void updateUser(ServiceUser user) {
    state = AsyncData(user);
  }

  // *
  // * ServiceUserInfo
  // *

  void updateServiceName(String serviceName) {
    state = AsyncData(
      state.requireValue.copyWith(
        serviceName: serviceName,
      ),
    );
  }

  /// Update service description
  void updateServiceDescription(String? serviceDescription) {
    state = AsyncData(
      state.requireValue.copyWith(
        serviceDescription: serviceDescription ?? '',
      ),
    );
  }

  void updateScopePermissions({
    required AppScope scope,
    required AppScopePermission scopePermission,
  }) {
    final scopePermissions = scopePermission.scopePermissions(scope);

    // Remove scopePermissions for the given scope from the state
    final cleanScopePermissions = state.requireValue.userInfo.scopeNames
        .where((value) => value.split('.').first != scope.name)
        .toList();

    // Add the new scopePermissions to the state
    final updatedScopePermissions = [
      ...cleanScopePermissions,
      ...scopePermissions,
    ];
    state = AsyncData(
      state.requireValue.copyWith(
        userInfo: state.requireValue.userInfo
            .copyWith(scopeNames: updatedScopePermissions),
      ),
    );
  }

  /// Update Scopes
  void updateScopes(List<String> scopeNames) {
    state = AsyncData(
      state.requireValue.copyWith(
        userInfo: state.requireValue.userInfo.copyWith(scopeNames: scopeNames),
      ),
    );
  }

  /// Update blocked
  void updateBlocked({bool blocked = false}) {
    state = AsyncData(
      state.requireValue.copyWith(
        userInfo: state.requireValue.userInfo.copyWith(blocked: blocked),
      ),
    );
  }

  /// Update Is Active
  void updateIsActive(bool isActive) {
    state = AsyncData(
      state.requireValue.copyWith(
        isActive: isActive,
      ),
    );
  }
}

@riverpod
Stream<ServiceUser> watchServiceUser(
  Ref ref, {
  required String sessionId,
  required int serviceUserId,
}) async* {
  final streamHelper = ServerpodStreamManager<ServiceUser, ServiceUserDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.serviceUser.watch(
      sessionId: sessionId,
      entityId: serviceUserId,
    ),
    convertDtoToModel: ServiceUser.fromDTO,
    onError: (error) {
      dlog('Error occurred in streamServiceUser: $error');
    },
  );
}
