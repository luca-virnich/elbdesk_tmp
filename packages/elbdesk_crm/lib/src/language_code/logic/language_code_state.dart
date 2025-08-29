import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/src/country_code/models/country_code.dart';
import 'package:elbdesk_crm/src/language_code/logic/language_code_provider.dart';
import 'package:elbdesk_crm/src/language_code/models/language_code.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'language_code_state.g.dart';

/// The State of the current language code.
@riverpod
class LanguageCodeState extends _$LanguageCodeState
    implements EntityState<LanguageCode> {
  LanguageCodeState() {
    _initializeStateManager();
  }
  late final EntityStateManager<LanguageCode> _stateManager;

  @override
  Future<LanguageCode> build(int entityId, String sessionId) async {
    if (entityId == 0) {
      return LanguageCode.initial();
    }

    return _stateManager.build(
      id: entityId,
      sessionId: sessionId,
      ref: ref,
    );
  }

  void _initializeStateManager() {
    _stateManager = EntityStateManager<LanguageCode>(
      setLoadingState: () => state = const AsyncLoading(),
      setDataState: (LanguageCode languageCode) =>
          state = AsyncData(languageCode),
      setErrorState: (Object error, StackTrace stackTrace) =>
          state = AsyncError(error, stackTrace),
      fetchAndLockFn: () => ref
          .read(languageCodeRepositoryProvider)
          .fetchAndLock(entityId, sessionId),
      releaseFn: () =>
          ref.read(languageCodeRepositoryProvider).release(entityId, sessionId),
      fetchByIdFn: () =>
          ref.read(languageCodeRepositoryProvider).fetchById(entityId),
      updateWithReleaseFn: () =>
          ref.read(languageCodeRepositoryProvider).update(
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

  void updateName(String name) {
    state = AsyncData(state.requireValue.copyWith(name: name));
  }

  void updateIsPrimary(bool isPrimary) {
    state = AsyncData(state.requireValue.copyWith(isPrimary: isPrimary));
  }
}

@riverpod
Stream<CountryCode> watchCountryCode(
  Ref ref, {
  required String sessionId,
  required int countryCodeId,
}) async* {
  final streamHelper = ServerpodStreamManager<CountryCode, CountryCodeDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.countryCode.watchEntity(
      sessionId: sessionId,
      entityId: countryCodeId,
    ),
    convertDtoToModel: CountryCode.fromDTO,
    onError: (error) {
      dlog('Error occurred in streamCountryCode: $error');
    },
  );
}
