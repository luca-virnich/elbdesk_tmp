import 'dart:async';

import 'package:collection/collection.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/crm/contact/contact_utils.dart';
import 'package:elbdesk_server/src/modules/crm/crm_event/crm_event_handler.dart';
import 'package:elbdesk_server/src/modules/crm/crm_event/crm_event_utils.dart';
import 'package:serverpod/serverpod.dart';

final eventStreamController = StreamController<CrmEventDTO>.broadcast();

final eventContactJTStreamController =
    StreamController<CrmEventContactJT>.broadcast();

final eventContactDeletionStreamController =
    StreamController<CrmEventContactJT>.broadcast();

class CrmEventEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  final _tableType = TableType.crmEvent;

  Stream<CrmEventDTO> watch(
    Session session, {
    required String sessionId,
    required int entityId,
  }) async* {
    session.addWillCloseListener(
      (session) {
        CrmEventHandler.release(
          session,
          entityId: entityId,
          sessionId: sessionId,
        );
      },
    );

    yield* eventStreamController.stream
        .where((event) => event.id == entityId)
        .map((event) {
      return event;
    });
  }

  Stream<int> watchContactDeletions(
    Session session, {
    required int eventId,
  }) async* {
    yield* eventContactDeletionStreamController.stream
        .where((eventContactJt) => eventContactJt.crmEventId == eventId)
        .map((eventContactJt) => eventContactJt.contactId);
  }

  /// Watches all contacts that are assigned to the event and filters
  /// them according to the provided table filter
  Stream<ContactDTO?> watchEventContactsWithFilter(
    Session session, {
    required int entityId,
    required Filter? filter,
  }) async* {
    yield* eventContactJTStreamController.stream
        .where((eventContactJT) => eventContactJT.crmEventId == entityId)
        .asyncMap((eventContactJT) async {
      final contact = await validateEventContactFilter(
        session,
        contactId: eventContactJT.contactId,
        filter: filter,
      );

      if (contact != null) {
        return contact;
      } else {
        return null;
      }
    });
  }

  /// Validates the contact filter and returns the contact if it is found
  Future<ContactDTO?> validateEventContactFilter(
    Session session, {
    required int contactId,
    Filter? filter,
  }) async {
    final filterExpression = ContactUtils.buildExpression(filter);

    var expression = ContactDTOTable().id.equals(contactId);
    if (filterExpression != null) {
      expression = expression & filterExpression;
    }

    return ContactDTO.db.findFirstRow(
      session,
      where: (t) => expression,
      include: ContactUtils.includeAll,
    );
  }

  /// Fetches all contacts that are assigned to the event
  /// and filters them according to the provided table filter
  Future<List<ContactDTO>> fetchContactsInEvent(
    Session session, {
    required int eventId,
    Sort? sort,
    Filter? filter,
  }) async {
    // 1. fetch all contact Ids through junction table with eventId
    final contactIds = await CrmEventContactJT.db
        .find(
          session,
          where: (jt) =>
              jt.crmEventId.equals(eventId) & jt.deletedAt.equals(null),
        )
        .then((e) => e.map((e) => e.contactId).toList());

    // Sort and filter
    final sortByField = ContactField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );
    final expression = ContactUtils.buildExpression(filter);

    // 2. fetch all contacts that are in the event
    final contacts = await ContactDTO.db.find(
      session,
      where: expression == null
          ? null
          : (t) =>
              expression &
              t.id.inSet(contactIds.toSet()) &
              t.deletedAt.equals(null),
      orderBy: ContactUtils.orderBy(sortByField),
      orderDescending: sort?.orderDescending ?? false,
      include: ContactUtils.includeAll,
    );
    return contacts;
  }

  /// Fetches all contacts that are not yet assigned to the event
  /// and filters them according to the provided table filter
  Future<List<ContactDTO>> fetchContactsNotInEvent(
    Session session, {
    required int eventId,
    Sort? sort,
    Filter? filter,
  }) async {
    // 1. fetch all contact Ids through junction table with eventId
    final contactIds = await CrmEventContactJT.db
        .find(
          session,
          where: (jt) =>
              jt.crmEventId.equals(eventId) & jt.deletedAt.equals(null),
        )
        .then((e) => e.map((e) => e.contactId).toList());

    // Sort and filter
    final sortByField = ContactField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );
    final expression = ContactUtils.buildExpression(filter);

    // 2. fetch all contacts that are not in the event
    final contacts = await ContactDTO.db.find(
      session,
      where: expression == null
          ? null
          : (t) =>
              expression &
              t.id.notInSet(contactIds.toSet()) &
              t.deletedAt.equals(null),
      orderBy: ContactUtils.orderBy(sortByField),
      orderDescending: sort?.orderDescending ?? false,
      include: ContactUtils.includeAll,
    );

    return contacts;
  }

  Stream<CrmEventDTO> watchAll(Session session) {
    return eventStreamController.stream;
  }

  Future<CrmEventDTO?> fetchById(Session session, int id) async {
    return CrmEventDTO.db.findById(
      session,
      id,
      include: CrmEventUtils.includeAll,
    );
  }

  Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    await CrmEventHandler.release(
      session,
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  Future<CrmEventDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return CrmEventHandler.fetchAndLock(
      session,
      id: id,
      editingSessionId: editingSessionId,
    );
  }

  Future<CrmEventDTO> create(
    Session session, {
    required CrmEventDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    return CrmEventHandler.create(
      session,
      entity: entity,
      sessionId: sessionId,
      release: release,
    );
  }

  /// Adds contacts to a CRM event through the junction table
  Future<void> addContactsToEvent(
    Session session, {
    required int eventId,
    required List<int> contactIds,
    required String sessionId,
  }) async {
    final eventContactJT = await CrmEventContactJT.db.insert(
      session,
      contactIds
          .map(
            (contactId) => CrmEventContactJT(
              crmEventId: eventId,
              contactId: contactId,
            ),
          )
          .toList(),
    );

    // Add the new JT entries to the stream
    for (final eventContact in eventContactJT) {
      eventContactJTStreamController.add(eventContact);
    }
  }

  /// Deletes a contact from a CRM event through the junction table
  /// Updates the JT entry with a deletedAt timestamp
  /// and adds the updated JT entry to the stream
  Future<void> deleteContactFromEvent(
    Session session, {
    required int eventId,
    required int contactId,
  }) async {
    final eventContactJT = await CrmEventContactJT.db.findFirstRow(
      session,
      where: (jt) =>
          jt.crmEventId.equals(eventId) &
          jt.contactId.equals(contactId) &
          jt.deletedAt.equals(null),
    );

    if (eventContactJT == null) {
      throw Exception('Contact not found in event');
    }

    final updatedEventContactJT = eventContactJT.copyWith(
      deletedAt: DateTime.now(),
    );

    await CrmEventContactJT.db.update(
      session,
      [updatedEventContactJT],
    );

    // Add the updated JT entry to the stream
    // (This ensures that the contact is removed from the event in other
    // clients as well)
    eventContactDeletionStreamController.add(updatedEventContactJT);
  }

  Future<List<CrmEventDTO>> fetchAll(Session session) async {
    return CrmEventDTO.db.find(
      session,
      orderBy: (t) => t.startDate,
    );
  }

  Future<List<CrmEventDTO>> find(
    Session session, {
    Sort? sort,
    Filter? filter,
  }) async {
    final sortByField = CrmEventField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );

    final expression = CrmEventUtils.buildExpression(filter);

    return CrmEventDTO.db.find(
      session,
      where: expression == null ? null : (t) => expression,
      orderBy: CrmEventUtils.orderBy(sortByField),
      orderDescending: sort?.orderDescending ?? false,
    );
  }

  Future<CrmEventDTO> update(
    Session session, {
    required CrmEventDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    return CrmEventHandler.update(
      session,
      entity: entity,
      sessionId: sessionId,
      release: release,
    );
  }

  Future<List<EntityLockDTO>> findEntityLocks(Session session) async {
    final entities = await CrmEventDTO.db.find(
      session,
      where: (t) =>
          t.editingSession.notEquals(null as String?) &
          t.editingSession.notEquals(''),
    );

    return entities
        .map(
          (e) => EntityLockDTO(
            tableType: _tableType.name,
            entityId: e.id!,
            editingSessionId: e.editingSession!,
            lockedAt: e.editingSince!,
            userId: e.editingById,
          ),
        )
        .toList();
  }

  Future<bool> delete(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    return CrmEventHandler.delete(
      session,
      entityId: entityId,
      sessionId: sessionId,
    );
  }
}
