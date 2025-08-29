import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Repository for CRM events
class CrmEventRepository implements EntityRepository<CrmEvent> {
  /// Constructor
  CrmEventRepository({
    required this.ref,
    required this.endpoint,
  });

  /// Reference to the provider
  final Ref ref;

  /// API endpoint for CRM events
  final EndpointCrmEvent endpoint;

  /// Create a new CRM event
  ///
  /// Returns the ID of the created CRM event
  Future<int> create({
    required String sessionId,
  }) async {
    final createdDto = await endpoint.create(
      entity: CrmEvent.initial().toDTO(),
      sessionId: sessionId,
      release: true,
    );
    return createdDto.id!;
  }

  @override
  Future<CrmEvent> createAndReturnEntity({
    required CrmEvent entity,
    required bool release,
    required String sessionId,
  }) async {
    final dto = entity.toDTO();
    final createdDto = await endpoint.create(
      entity: dto,
      sessionId: sessionId,
      release: release,
    );
    return CrmEvent.fromDTO(createdDto);
  }

  @override
  Future<bool> delete(int entityId, String sessionId) async {
    return endpoint.delete(
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  @override
  Future<List<CrmEvent>> find({Sort? sort, Filter? filter}) async {
    final dtoList = await endpoint.find(
      sort: sort,
      filter: filter,
    );

    return dtoList.map(CrmEvent.fromDTO).toList();
  }

  @override
  Future<CrmEvent?> fetchById(int id) async {
    final dto = await endpoint.fetchById(id);
    return dto != null ? CrmEvent.fromDTO(dto) : null;
  }

  @override
  Future<CrmEvent> update({
    required CrmEvent entity,
    required bool release,
    required String sessionId,
  }) async {
    final dto = entity.toDTO();
    final updatedDto = await endpoint.update(
      entity: dto,
      sessionId: sessionId,
      release: release,
    );
    return CrmEvent.fromDTO(updatedDto);
  }

  @override
  Future<List<CrmEvent>> fetchAll() async {
    final events = await endpoint.fetchAll();
    return events.map(CrmEvent.fromDTO).toList();
  }

  @override
  Future<CrmEvent?> fetchAndLock(int entityId, String sessionId) async {
    final event = await endpoint.fetchAndLock(
      id: entityId,
      editingSessionId: sessionId,
    );
    return event != null ? CrmEvent.fromDTO(event) : null;
  }

  @override
  Future<void> release(int entityId, String sessionId) async {
    await endpoint.release(
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  /// Adds contacts to a CRM event
  Future<void> addContactsToEvent({
    required int eventId,
    required List<int> contactIds,
    required String sessionId,
  }) async {
    await endpoint.addContactsToEvent(
      eventId: eventId,
      contactIds: contactIds,
      sessionId: sessionId,
    );
  }

  /// Deletes a contact from a CRM event
  Future<void> deleteContactFromEvent({
    required int eventId,
    required int contactId,
  }) async {
    await endpoint.deleteContactFromEvent(
      eventId: eventId,
      contactId: contactId,
    );
  }

  /// Watches a specific CRM event for changes
  Stream<CrmEvent> watch({
    required String sessionId,
    required int entityId,
  }) async* {
    final stream = endpoint.watch(
      sessionId: sessionId,
      entityId: entityId,
    );

    await for (final event in stream) {
      yield CrmEvent.fromDTO(event);
    }
  }

  /// Fetches all contacts that are not yet assigned to an event
  /// and filters them according to the provided table filter
  Future<List<Contact>> fetchContactsNotInEvent(
    int eventId,
    Sort? sort,
    Filter? filter,
  ) async {
    final contacts = await endpoint.fetchContactsNotInEvent(
      eventId: eventId,
      sort: sort,
      filter: filter,
    );
    return contacts.map(Contact.fromDTO).toList();
  }

  /// Fetches all contacts that are assigned to an event
  /// and filters them according to the provided table filter
  Future<List<Contact>> fetchContactsInEvent(
    int eventId,
    Sort? sort,
    Filter? filter,
  ) async {
    final contacts = await endpoint.fetchContactsInEvent(
      eventId: eventId,
      sort: sort,
      filter: filter,
    );
    return contacts.map(Contact.fromDTO).toList();
  }

  /// Fetches all entity locks for CRM events
  Future<List<EntityLockDTO>> findEntityLocks() async {
    return endpoint.findEntityLocks();
  }
}
