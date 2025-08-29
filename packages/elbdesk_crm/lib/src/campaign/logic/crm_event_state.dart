import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'crm_event_state.g.dart';

/// The State of the current CRM event.
@riverpod
class CrmEventState extends _$CrmEventState implements EntityState<CrmEvent> {
  CrmEventState() {
    _initializeStateManager();
  }
  late final EntityStateManager<CrmEvent> _stateManager;

  @override
  Future<CrmEvent> build(int entityId, String sessionId) async {
    if (entityId == 0) {
      return CrmEvent.initial();
    }

    return _stateManager.build(
      id: entityId,
      sessionId: sessionId,
      ref: ref,
    );
  }

  void _initializeStateManager() {
    _stateManager = EntityStateManager<CrmEvent>(
      setLoadingState: () => state = const AsyncLoading(),
      setDataState: (CrmEvent crmEvent) => state = AsyncData(crmEvent),
      setErrorState: (Object error, StackTrace stackTrace) =>
          state = AsyncError(error, stackTrace),
      fetchAndLockFn: () => ref
          .read(crmEventRepositoryProvider)
          .fetchAndLock(entityId, sessionId),
      releaseFn: () =>
          ref.read(crmEventRepositoryProvider).release(entityId, sessionId),
      fetchByIdFn: () =>
          ref.read(crmEventRepositoryProvider).fetchById(entityId),
      updateWithReleaseFn: () => ref.read(crmEventRepositoryProvider).update(
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

  /// Updates the name of the CRM event
  void updateName(String name) {
    state = AsyncData(
      state.requireValue.copyWith(
        name: name,
      ),
    );
  }

  /// Updates the description of the CRM event
  void updateDescription(String description) {
    state = AsyncData(
      state.requireValue.copyWith(
        description: description,
      ),
    );
  }

  /// Updates the start date of the CRM event
  void updateStartDate(DateTime startDate) {
    state = AsyncData(
      state.requireValue.copyWith(
        startDate: startDate,
      ),
    );
  }

  /// Updates the end date of the CRM event
  void updateEndDate(DateTime? endDate) {
    state = AsyncData(
      state.requireValue.copyWith(
        endDate: endDate,
      ),
    );
  }

  /// Updates the execution date of the CRM event
  void updateExecutionDate(DateTime? executionDate) {
    state = AsyncData(
      state.requireValue.copyWith(
        executionDate: executionDate,
      ),
    );
  }

  /// Updates the contacts of the CRM event
  void updateContacts(List<Contact> contacts) {
    state = AsyncData(
      state.requireValue.copyWith(
        contacts: contacts,
      ),
    );
  }

  /// Adds a contact to the CRM event
  void addContacts(List<Contact> contacts) {
    final currentContacts = [...state.requireValue.contacts];
    // Check if contact already exists
    final newContacts = contacts
        .where((c) => !currentContacts.any((cc) => cc.meta.id == c.meta.id))
        .toList();
    if (newContacts.isNotEmpty) {
      currentContacts.addAll(newContacts);
      updateContacts(currentContacts);
    }
  }

  /// Removes a contact from the CRM event
  void removeContact(Contact contact) {
    final currentContacts = [...state.requireValue.contacts]
      ..removeWhere((c) => c.meta.id == contact.meta.id);
    updateContacts(currentContacts);
  }

  /// Updates the status of the CRM event
  void updateStatus(CrmEventStatus status) {
    state = AsyncData(
      state.requireValue.copyWith(
        status: status,
      ),
    );
  }
}
