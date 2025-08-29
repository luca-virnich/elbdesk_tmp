import 'dart:async';

import 'package:collection/collection.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart'
    as bc;
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/spotlight/spotlight_constants.dart';
import 'package:elbdesk_server/src/modules/crm/contact/contact_handler.dart';
import 'package:elbdesk_server/src/modules/crm/contact/contact_utils.dart';
import 'package:serverpod/serverpod.dart';

final contactStreamController = StreamController<ContactDTO>.broadcast();

/// Endpoint for [ContactDTO]
class ContactEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  // @override
  // Set<Scope> get requiredScopes => AppScope.contact.rwd;

  static const _tableType = TableType.contact;

  Stream<ContactDTO> watcEntityCard(
    Session session, {
    required String sessionId,
    required int entityId,
    required bool releaseOnClose,
  }) async* {
    if (releaseOnClose) {
      session.addWillCloseListener(
        (session) {
          release(session, entityId: entityId, sessionId: sessionId);
        },
      );
    }

    yield* contactStreamController.stream
        .where((event) => event.id == entityId)
        .map((event) {
      return event;
    });
  }

  Stream<ContactDTO> watchUpdates(
    Session session, {
    required int entityId,
  }) async* {
    yield* contactStreamController.stream
        .where((event) => event.id == entityId)
        .map((event) {
      return event;
    });
  }

  Future<ContactDTO> create(
    Session session, {
    required String sessionId,
    required ContactType type,
  }) async {
    return ContactHandler.create(
      session,
      sessionId: sessionId,
      type: type,
    );
  }

  Future<ContactDTO?> fetchById(
    Session session,
    int id,
  ) async {
    return ContactDTO.db.findById(
      session,
      id,
      include: ContactUtils.includeAll,
    );
  }

  Future<List<SpotlightItem>> findSpotlight(
    Session session, {
    required String query,
  }) async {
    final isContactId = int.tryParse(query);

    if (isContactId != null) {
      final contacts = await ContactDTO.db.find(
        session,
        where: (t) => t.customIdString.ilike('%$query%'),
        include: ContactDTO.include(),
        limit: SpotlightConstants.spotlightLimit,
      );
      return contacts
          .map(
            (e) => SpotlightItem(
              primaryKey: e.id!,
              title: e.fullName,
              description: e.fullName,
              type: SpotlightType.contact,
            ),
          )
          .toList();
    }

    final contacts = await ContactDTO.db.find(
      session,
      where: (t) => t.fullName.ilike('%$query%') & t.isDraft.equals(false),
      orderBy: (t) => t.fullName,
      orderDescending: false,
      include: ContactDTO.include(),
      limit: SpotlightConstants.spotlightLimit,
    );
    final spotlightItems = contacts.map(
      (e) => SpotlightItem(
        primaryKey: e.id!,
        title: e.fullName,
        description: e.fullName,
        type: SpotlightType.contact,
      ),
    );
    return spotlightItems.toList();
  }

  /// Fetch all unique string values for a given contact property
  ///
  /// This method retrieves contacts and extracts the values of the specified
  /// [field]
  /// It performs an optimized database query to only fetch non-deleted contacts
  /// where the specified field is non-null and, for string types, non-empty
  /// Returns a list of unique, non-empty string values for that property
  ///
  /// For fields where such an optimized query cannot be built (e.g., complex
  /// types or unhandled fields), an empty list is returned
  Future<List<String>> findContactPropertyValues(
    Session session,
    ContactField field,
    String searchTerm,
  ) async {
    return ContactHandler.findContactPropertyValues(
      session,
      field,
      searchTerm,
    );
  }

  Future<List<ContactDTO>> find(
    Session session, {
    bc.Sort? sort,
    bc.Filter? filter,
  }) async {
    return ContactHandler.find(
      session,
      sort: sort,
      filter: filter,
    );
  }

  Future<List<ContactDTO>> findCompanies(
    Session session, {
    Sort? sort,
    Filter? filter,
  }) async {
    final sortByField = ContactField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );

    final filterExpression = ContactUtils.buildExpression(filter);

    var expression = ContactDTOTable().type.equals(ContactType.company.name);

    if (filterExpression != null) {
      expression = expression & filterExpression;
    }

    return ContactDTO.db.find(
      session,
      where: (t) => expression,
      orderBy: ContactUtils.orderBy(sortByField),
      orderDescending: sort?.orderDescending ?? false,
      include: ContactUtils.includeAll,
    );
  }

  Future<List<ContactDTO>> findPersons(
    Session session, {
    Sort? sort,
    Filter? filter,
  }) async {
    final sortByField = ContactField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );

    final filterExpression = ContactUtils.buildExpression(filter);

    var expression = ContactDTOTable().type.equals(ContactType.person.name);

    if (filterExpression != null) {
      expression = expression & filterExpression;
    }

    return ContactDTO.db.find(
      session,
      where: (t) => expression,
      orderBy: ContactUtils.orderBy(sortByField),
      orderDescending: sort?.orderDescending ?? false,
      include: ContactUtils.includeAll,
    );
  }

  /// The update happens inside of the unsafeQuery method
  Future<ContactDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return ContactHandler.fetchAndLock(
      session,
      id: id,
      sessionId: editingSessionId,
    );
  }

  // * UPDATE
  Future<ContactDTO> update(
    Session session, {
    required ContactDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    return ContactHandler.update(
      session,
      entity: entity,
      sessionId: sessionId,
      release: release,
    );
  }

  Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    await ContactHandler.release(
      session,
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  // * DELETE

  Future<bool> delete(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    return ContactHandler.delete(
      session,
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  Future<List<EntityLockDTO>> findEntityLocks(Session session) async {
    final entities = await ContactDTO.db.find(
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
}
