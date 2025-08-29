import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'crm_event_provider.g.dart';

/// Provider for CRM event repository
@riverpod
CrmEventRepository crmEventRepository(Ref ref) {
  return CrmEventRepository(
    ref: ref,
    endpoint: serverpodClient.crmEvent,
  );
}

/// Provider to fetch a CRM event by ID
@riverpod
Future<CrmEvent?> fetchCrmEvent(Ref ref, int id) async {
  return ref.watch(crmEventRepositoryProvider).fetchById(id);
}

/// Provider that fetches all contacts but filters out contacts that are already
/// assigned to the event
@riverpod
Future<List<Contact>> fetchContactsNotInEvent(
  Ref ref,
  int eventId,
  String sessionId,
) async {
  final (sort, filter) = ref.watch(
    tableSortAndFilterProvider(sessionId, TableType.contact.name),
  );
  final contacts =
      await ref.watch(crmEventRepositoryProvider).fetchContactsNotInEvent(
            eventId,
            sort,
            filter,
          );

  return contacts;
}

/// Provider to watch a specific event by ID
@riverpod
Stream<CrmEvent> watchCrmEvent(
  Ref ref, {
  required int entityId,
  required String sessionId,
}) async* {
  final streamHelper = ServerpodStreamManager<CrmEvent, CrmEventDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.crmEvent.watch(
      sessionId: sessionId,
      entityId: entityId,
    ),
    convertDtoToModel: CrmEvent.fromDTO,
    onError: (error) {
      dlog('Error occurred in watchCrmEvent: $error');
    },
  );
}

/// Provider that watches contacts for a CRM event
/// and filters them according to the table filter provided through the
/// tableSessionId
@riverpod
Stream<Contact?> watchEventContactsWithFilter(
  Ref ref,
  int eventId,
  String tableSessionId,
) {
  final (sort, filter) = ref.watch(
    tableSortAndFilterProvider(tableSessionId, TableType.contact.name),
  );

  final streamHelper = ServerpodStreamManager<Contact?, ContactDTO?>();
  return streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.crmEvent.watchEventContactsWithFilter(
      entityId: eventId,
      filter: filter,
    ),
    convertDtoToModel: (contact) {
      return contact == null ? null : Contact.fromDTO(contact);
    },
  );
}

/// Provider to watch all CRM events
@riverpod
Stream<CrmEvent> watchAllCrmEvents(
  Ref ref,
) {
  final streamHelper = ServerpodStreamManager<CrmEvent, CrmEventDTO>();
  return streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.crmEvent.watchAll(),
    convertDtoToModel: CrmEvent.fromDTO,
  );
}

/// Provider to find CRM events by session ID with table sorting and filtering
@riverpod
Future<List<CrmEvent>> findCrmEvents(
  Ref ref,
  String sessionId,
) async {
  final (sorting, filtering) = ref.watch(
    tableSortAndFilterProvider(sessionId, TableType.crmEvent.name),
  );

  return ref
      .watch(crmEventRepositoryProvider)
      .find(sort: sorting, filter: filtering);
}

/// Provider to find CRM events with filter and sort
@riverpod
Future<List<CrmEvent>> findEvents(
  Ref ref, {
  Sort? sort,
  Filter? filter,
}) async {
  final repository = ref.watch(crmEventRepositoryProvider);
  return repository.find(sort: sort, filter: filter);
}

/// Provider that combines initial fetching with watching for updates
@riverpod
class FetchAndWatchAllCrmEvents extends _$FetchAndWatchAllCrmEvents {
  @override
  Future<List<CrmEvent>> build() async {
    ref.cacheFor(const Duration(minutes: 5));
    ref.listen(watchAllCrmEventsProvider, (previous, next) {
      if (next is AsyncData<CrmEvent>) {
        handleEvent(next.value);
      }
    });
    final initial = await ref.watch(crmEventRepositoryProvider).fetchAll();
    return initial;
  }

  /// Updates the state when a CRM event is added or modified
  Future<void> handleEvent(CrmEvent crmEvent) async {
    final current = await future;

    final index = current.indexWhere(
      (element) => element.meta.id == crmEvent.meta.id,
    );
    if (index != -1) {
      final updatedList = List<CrmEvent>.from(current);
      updatedList[index] = crmEvent;
      state = AsyncData(updatedList);
    } else {
      state = AsyncData([...current, crmEvent]);
    }
  }
}

/// Provider that watches contact deletions for a CRM event
@riverpod
Stream<int> watchEventContactDeletions(
  Ref ref,
  int eventId,
) async* {
  final streamHelper = ServerpodStreamManager<int, int>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.crmEvent.watchContactDeletions(
      eventId: eventId,
    ),
    convertDtoToModel: (dto) => dto,
    onError: (error) {
      dlog(
        'Error occurred in watchEventContactDeletions: '
        '$error',
      );
    },
  );
}

/// Provider that fetches all contacts for a CRM event and watches for changes
/// Filters according to the table filter provided through the tableSessionId
@riverpod
class FetchAndWatchEventContacts extends _$FetchAndWatchEventContacts {
  @override
  Future<List<Contact>> build(
    int eventId,
    String tableSessionId,
  ) async {
    ref
      ..listen(
        watchEventContactsWithFilterProvider(
          eventId,
          tableSessionId,
        ),
        (previous, next) {
          if (next is AsyncData<Contact?>) {
            if (next.value != null) {
              handleEvent(next.value!);
            }
          }
        },
      )
      ..listen(
        watchEventContactDeletionsProvider(eventId),
        (previous, next) {
          if (next is AsyncData<int>) {
            handleDeletion(next.value);
          }
        },
      );

    final (sort, filter) = ref.watch(
      tableSortAndFilterProvider(tableSessionId, TableType.contact.name),
    );

    final initial =
        await ref.read(crmEventRepositoryProvider).fetchContactsInEvent(
              eventId,
              sort,
              filter,
            );
    return initial;
  }

  /// Updates the state when a contact is added or modified
  Future<void> handleEvent(Contact contact) async {
    final currentList = await future;

    final existingIndex = currentList.indexWhere(
      (element) => element.meta.id == contact.meta.id,
    );

    if (existingIndex != -1) {
      // Update existing contact
      final updatedList = List<Contact>.from(currentList);
      updatedList[existingIndex] = contact;
      state = AsyncData(updatedList);
    } else {
      // Add new contact
      state = AsyncData([...currentList, contact]);
    }
  }

  /// Handles contact deletion by removing it from the state
  Future<void> handleDeletion(int contactId) async {
    final currentList = await future;

    state = AsyncData(
      currentList.where((item) => item.meta.id != contactId).toList(),
    );
  }
}
