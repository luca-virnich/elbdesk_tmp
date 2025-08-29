import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/src/contact/repositories/contact_repository.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'contact_provider.g.dart';

@riverpod
ContactRepository contactRepository(Ref ref) {
  final endpoint = serverpodClient.contact;
  return ContactRepository(
    ref: ref,
    endpoint: endpoint,
  );
}

@riverpod
Future<List<Contact>> findContacts(
  Ref ref,
  String sessionId,
) async {
  final (sort, filter) = ref.watch(
    tableSortAndFilterProvider(
      sessionId,
      TableType.contact.name,
    ),
  );

  return ref.watch(contactRepositoryProvider).find(sort: sort, filter: filter);
}

@riverpod
Future<List<Contact>> findCompanyContacts(
  Ref ref,
  String sessionId, {
  Sort? sort,
  Filter? filter,
}) async {
  final (sort, filter) = ref.watch(
    tableSortAndFilterProvider(
      sessionId,
      TableType.contactCompany.name,
    ),
  );

  return ref.watch(contactRepositoryProvider).findCompanyContacts(
        sort: sort,
        filter: filter,
      );
}

@riverpod
Future<List<Contact>> findPersonContacts(
  Ref ref,
  String sessionId, {
  Sort? sort,
  Filter? filter,
}) async {
  final (sort, filter) = ref.watch(
    tableSortAndFilterProvider(
      sessionId,
      TableType.contactPerson.name,
    ),
  );

  return ref.watch(contactRepositoryProvider).findPersonContacts(
        sort: sort,
        filter: filter,
      );
}

@riverpod
Stream<Contact> watchContactEntityCard(
  Ref ref, {
  required String sessionId,
  required int contactId,
}) async* {
  final streamHelper = ServerpodStreamManager<Contact, ContactDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.contact.watcEntityCard(
      sessionId: sessionId,
      entityId: contactId,
      releaseOnClose: true,
    ),
    convertDtoToModel: Contact.fromDTO,
    onError: (error) {
      dlog('Error occurred in streamContact: $error');
    },
  );
}

@riverpod
Future<Contact> fetchContactById(
  Ref ref,
  int contactId,
) async {
  final repo = ref.watch(contactRepositoryProvider);
  return repo.fetchById(contactId);
}

@riverpod
Future<List<SpotlightItem>> findContactsSpotlight(
  Ref ref,
  String query,
) async {
  final repo = ref.watch(contactRepositoryProvider);
  final items = await repo.findSpotlight(query);
  return items;
}

@riverpod
Stream<Contact> watchContactUpdates(
  Ref ref, {
  required int contactId,
}) async* {
  final streamHelper = ServerpodStreamManager<Contact, ContactDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.contact.watchUpdates(
      entityId: contactId,
    ),
    convertDtoToModel: Contact.fromDTO,
  );
}

@riverpod
class FetchAndWatchContact extends _$FetchAndWatchContact {
  @override
  Future<Contact> build(int contactId) async {
    ref.listen(
        watchContactUpdatesProvider(
          contactId: contactId,
        ), (previous, next) {
      if (next is AsyncData<Contact>) {
        state = next;
      }
    });
    final initial =
        await ref.watch(contactRepositoryProvider).fetchById(contactId);
    return state.value ?? initial;
  }
}
