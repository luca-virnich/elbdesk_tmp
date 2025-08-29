import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:elbdesk_crm/src/app_client/logic/app_client_provider.dart';
import 'package:elbdesk_crm/src/app_client/models/app_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_client_state.g.dart';

/// @nodoc
@riverpod
class AppClientState extends _$AppClientState
    implements EntityState<AppClient> {
  /// @nodoc
  AppClientState() {
    _initializeStateManager();
  }
  late final EntityStateManager<AppClient> _stateManager;

  @override
  Future<AppClient> build(int entityId, String sessionId) async {
    return _stateManager.build(
      id: entityId,
      sessionId: sessionId,
      ref: ref,
    );
  }

  void _initializeStateManager() {
    _stateManager = EntityStateManager<AppClient>(
      setLoadingState: () => state = const AsyncLoading(),
      setDataState: (AppClient appClient) => state = AsyncData(appClient),
      setErrorState: (Object error, StackTrace stackTrace) =>
          state = AsyncError(error, stackTrace),
      fetchAndLockFn: () => ref
          .read(appClientRepositoryProvider)
          .fetchAndLock(entityId, sessionId),
      releaseFn: () =>
          ref.read(appClientRepositoryProvider).release(entityId, sessionId),
      fetchByIdFn: () =>
          ref.read(appClientRepositoryProvider).fetchById(entityId),
      updateWithReleaseFn: () => ref.read(appClientRepositoryProvider).update(
            entity: state.requireValue,
            sessionId: sessionId,
            release: true,
          ),
    );
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

  void updateAutomationEngine(String automationEngine) {
    state = AsyncData(
      state.requireValue.copyWith(
        automationEngine: automationEngine,
      ),
    );
  }

  void updateDescription(String description) {
    state = AsyncData(
      state.requireValue.copyWith(
        description: description,
      ),
    );
  }

  void updateContact(Contact contact) {
    state = AsyncData(
      state.requireValue.copyWith(
        contact: contact,
      ),
    );
  }
}

@riverpod
Stream<AppClient> watchAppClient(
  Ref ref, {
  required String sessionId,
  required int appClientId,
}) async* {
  final streamHelper = ServerpodStreamManager<AppClient, AppClientDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.appClient.watch(
      sessionId: sessionId,
      entityId: appClientId,
    ),
    convertDtoToModel: AppClient.fromDTO,
    onError: (error) {
      dlog('Error occurred in watchAppClient: $error');
    },
  );
}
