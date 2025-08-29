import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Contact Repository Provider

/// @nodod
class ContactRepository implements EntityRepository<Contact> {
  /// Constructor
  ContactRepository({
    required this.ref,
    required this.endpoint,
  });

  /// Serverpod Client
  /// Necessary to interact with the serverpod backend

  final Ref ref;
  final EndpointContact endpoint;

  // we are using createContact instead

  @override
  Future<Contact> createAndReturnEntity({
    required String sessionId,
    required Contact entity,
    required bool release,
  }) async {
    throw UnimplementedError();
  }

  // we don't need this for now
  @override
  Future<List<Contact>> fetchAll() async {
    throw UnimplementedError();
  }

  @override
  Future<List<Contact>> find({Sort? sort, Filter? filter}) async {
    final contacts = (await endpoint.find(sort: sort, filter: filter))
        .map(Contact.fromDTO)
        .toList();
    return contacts;
  }

  Future<List<Contact>> findCompanyContacts({
    Sort? sort,
    Filter? filter,
  }) async {
    final contacts = (await endpoint.findCompanies(
      sort: sort,
      filter: filter,
    ))
        .map(Contact.fromDTO)
        .toList();
    return contacts;
  }

  Future<List<Contact>> findPersonContacts({Sort? sort, Filter? filter}) async {
    final contacts = (await endpoint.findPersons(
      sort: sort,
      filter: filter,
    ))
        .map(Contact.fromDTO)
        .toList();
    return contacts;
  }

  /// Create Contact
  ///
  /// Used to create a new contact

  Future<int> create({
    required String sessionId,
    required ContactType type,
  }) async {
    final newContact = await endpoint.create(
      sessionId: sessionId,
      type: type,
    );
    return newContact.id!;
  }

  @override
  Future<bool> delete(int entityId, String sessionId) async {
    return endpoint.delete(entityId: entityId, sessionId: sessionId);
  }

  @override
  Future<Contact> fetchById(int id) async {
    final contact = await endpoint.fetchById(id);
    return Contact.fromDTO(contact!);
  }

  @override
  Future<Contact> update({
    required Contact entity,
    required bool release,
    required String sessionId,
  }) async {
    final newContact = await endpoint.update(
      entity: entity.toDTO(),
      sessionId: sessionId,
      release: release,
    );
    // invalidates all company employees for all contact cards

    return Contact.fromDTO(
      newContact,
    );
  }

  @override
  Future<Contact?> fetchAndLock(
    int contactId,
    String sessionId,
  ) async {
    final contact = await endpoint.fetchAndLock(
      id: contactId,
      editingSessionId: sessionId,
    );

    return contact != null ? Contact.fromDTO(contact) : null;
  }

  @override
  Future<void> release(int entityId, String sessionId) async {
    await endpoint.release(
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  Future<List<SpotlightItem>> findSpotlight(String query) async {
    final contacts = await endpoint.findSpotlight(
      query: query,
    );
    return contacts;
  }

  Future<List<String>> findContactPropertyValues(
    ContactField field,
    String searchTerm,
  ) async {
    return endpoint.findContactPropertyValues(field, searchTerm);
  }
}
