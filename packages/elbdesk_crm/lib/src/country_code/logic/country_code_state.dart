import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/src/country_code/logic/country_code_provider.dart';
import 'package:elbdesk_crm/src/country_code/models/country_code.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'country_code_state.g.dart';

/// The State of the current country code.
@riverpod
class CountryCodeState extends _$CountryCodeState
    implements EntityState<CountryCode> {
  CountryCodeState() {
    _initializeStateManager();
  }
  late final EntityStateManager<CountryCode> _stateManager;

  @override
  Future<CountryCode> build(int entityId, String sessionId) async {
    if (entityId == 0) {
      return CountryCode.initial();
    }
    return _stateManager.build(
      id: entityId,
      sessionId: sessionId,
      ref: ref,
    );
  }

  void _initializeStateManager() {
    _stateManager = EntityStateManager<CountryCode>(
      setLoadingState: () => state = const AsyncLoading(),
      setDataState: (CountryCode countryCode) => state = AsyncData(countryCode),
      setErrorState: (Object error, StackTrace stackTrace) =>
          state = AsyncError(error, stackTrace),
      fetchAndLockFn: () => ref
          .read(countryCodeRepositoryProvider)
          .fetchAndLock(entityId, sessionId),
      releaseFn: () =>
          ref.read(countryCodeRepositoryProvider).release(entityId, sessionId),
      fetchByIdFn: () =>
          ref.read(countryCodeRepositoryProvider).fetchById(entityId),
      updateWithReleaseFn: () => ref.read(countryCodeRepositoryProvider).update(
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
      state.requireValue.copyWith
          .meta(lastModifiedAt: DateTime.now(), lastModifiedById: userId),
    );
  }

  void updateCode(String code) {
    state = AsyncData(state.requireValue.copyWith(code: code));
  }

  void updateCountryRegionName(String name) {
    state = AsyncData(state.requireValue.copyWith(name: name));
  }

  void updateIsoCode(String isoCode) {
    state = AsyncData(state.requireValue.copyWith(isoCode: isoCode));
  }

  void updateNumericCode(int? numericCode) {
    state = AsyncData(state.requireValue.copyWith(numericIsoCode: numericCode));
  }

  void updateFederalRegion(String federalRegion) {
    state =
        AsyncData(state.requireValue.copyWith(federalRegion: federalRegion));
  }

  void updateEuCode(String euCode) {
    state = AsyncData(state.requireValue.copyWith(euCode: euCode));
  }

  void updateIsPrimary(bool isPrimary) {
    state = AsyncData(state.requireValue.copyWith(isPrimary: isPrimary));
  }

  void updateIntrastatCode(String intrastatCode) {
    state =
        AsyncData(state.requireValue.copyWith(intrastatCode: intrastatCode));
  }

  void updateAddressFormat(CountryCodeAddressFormat? addressFormat) {
    state =
        AsyncData(state.requireValue.copyWith(addressFormat: addressFormat));
  }

  void updateTaxScheme(String taxScheme) {
    state = AsyncData(state.requireValue.copyWith(taxScheme: taxScheme));
  }

  void updateShowState(bool showState) {
    state = AsyncData(state.requireValue.copyWith(showState: showState));
  }

  void updateContactAddressFormat(
    CountryCodeContactAddressFormat? contactAddressFormat,
  ) {
    state = AsyncData(
      state.requireValue.copyWith(contactAddressFormat: contactAddressFormat),
    );
  }
}
