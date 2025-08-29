import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:elbdesk_crm/src/salutation_code/models/salutation_code.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'contact_state.g.dart';

/// Contact State
///
/// This state is used to manage and update the contact details
@riverpod
class ContactState extends _$ContactState implements EntityState<Contact> {
  ///@nodoc
  ContactState() {
    _initializeStateManager();
  }
  late final EntityStateManager<Contact> _stateManager;

  void _initializeStateManager() {
    _stateManager = EntityStateManager<Contact>(
      setLoadingState: () => state = const AsyncLoading(),
      setDataState: (Contact contact) => state = AsyncData(contact),
      setErrorState: (Object error, StackTrace stackTrace) =>
          state = AsyncError(error, stackTrace),
      fetchAndLockFn: () =>
          ref.read(contactRepositoryProvider).fetchAndLock(entityId, sessionId),
      releaseFn: () =>
          ref.read(contactRepositoryProvider).release(entityId, sessionId),
      fetchByIdFn: () =>
          ref.read(contactRepositoryProvider).fetchById(entityId),
      updateWithReleaseFn: () => ref.read(contactRepositoryProvider).update(
            entity: state.requireValue,
            release: true,
            sessionId: sessionId,
          ),
    );
  }

  @override
  Future<Contact> build(int entityId, String sessionId) async {
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

  /// Update type
  void updateType(ContactType? type) {
    state = AsyncData(state.requireValue.copyWith.general(type: type));

    if (type == ContactType.company) {
      state = AsyncData(
        state.requireValue.copyWith.general(
          firstName: '',
          lastName: '',
        ),
      );
    }
  }

  void updateSalutationCode(SalutationCode? salutationCode) {
    state = AsyncData(
      state.requireValue.copyWith.general(salutationCode: salutationCode),
    );
  }

  void updateLanguageCode(LanguageCode? languageCode) {
    state = AsyncData(
      state.requireValue.copyWith.general(languageCode: languageCode),
    );
  }

  void updateCountryCode(CountryCode? countryCode) {
    state = AsyncData(
      state.requireValue.copyWith.address(
        countryCode: countryCode,
      ),
    );
  }

  void updateImportantNote(String importantNote) {
    state = AsyncData(
      state.requireValue.copyWith.general(importantNote: importantNote),
    );
  }

  /// Update birth date
  void updateBirthDate(DateTime? birthDate) {
    state =
        AsyncData(state.requireValue.copyWith.general(birthDate: birthDate));
  }

  /// Update the first name of the contact
  void updateFirstName(String firstName) {
    final lastName = state.requireValue.general.lastName;
    final name = '$firstName $lastName'.trim();

    state = AsyncData(
      state.requireValue.copyWith.general(firstName: firstName, name: name),
    );
  }

  /// Update the last name of the contact
  void updateLastName(String lastName) {
    final firstName = state.requireValue.general.firstName;
    final name = '$firstName $lastName'.trim();

    state = AsyncData(
      state.requireValue.copyWith.general(lastName: lastName, name: name),
    );
  }

  /// Updates the name of the contact
  void updateName(String name) {
    state = AsyncData(state.requireValue.copyWith.general(name: name));
  }

  /// Updates the name of the contact when its linkeed

  // *
  // * Communication
  // *

  // * Address

  /// Updates the address of the contact
  void updateAddress1(String address1) {
    state = AsyncData(
      state.requireValue.copyWith.address(
        address: address1,
      ),
    );
  }

  /// Updates the address of the contact
  void updateAddress2(String address2) {
    state = AsyncData(
      state.requireValue.copyWith.address(
        address2: address2,
      ),
    );
  }

  /// Updates the address of the contact
  void updateAddress3(String address3) {
    state = AsyncData(
      state.requireValue.copyWith.address(
        address3: address3,
      ),
    );
  }

  /// Updates the city of the contact
  void updateCity(String city) {
    state = AsyncData(
      state.requireValue.copyWith.address(
        city: city,
      ),
    );
  }

  /// Updates the state of the contact
  void updateState(String newState) {
    state = AsyncData(
      state.requireValue.copyWith.address(
        state: newState,
      ),
    );
  }

  /// Updates the post code of the contact
  void updatePostCode(String postCode) {
    state = AsyncData(
      state.requireValue.copyWith.address(
        postCode: postCode,
      ),
    );
  }

  // * Contact
  /// Updates the phone number of the contact
  void updatePhone(String phone) {
    state = AsyncData(
      state.requireValue.copyWith.communication(
        phone: phone,
      ),
    );
  }

  /// Updates the email of the contact
  void updateEmail(String email) {
    state = AsyncData(
      state.requireValue.copyWith.communication(
        email: email,
      ),
    );
  }

  /// Updates the mobile number of the contact
  void updateMobile(String mobile) {
    state = AsyncData(
      state.requireValue.copyWith.communication(
        mobile: mobile,
      ),
    );
  }

  /// Updates the Website of the contact
  void updateWebsite(String website) {
    state = AsyncData(
      state.requireValue.copyWith.communication(
        website: website,
      ),
    );
  }

  void setNoDraft() {
    state = AsyncData(state.requireValue.copyWith.meta(isDraft: false));
  }
}
