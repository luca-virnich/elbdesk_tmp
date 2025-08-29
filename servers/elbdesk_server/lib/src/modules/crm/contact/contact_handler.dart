import 'package:collection/collection.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/custom_entity_keys/custom_entiy_keys_endpoint.dart';
import 'package:elbdesk_server/src/modules/core/entity_log/entity_log_handler.dart';
import 'package:elbdesk_server/src/modules/core/generic_crud.dart';
import 'package:elbdesk_server/src/modules/crm/contact/contact_utils.dart';
import 'package:elbdesk_server/src/modules/crm/contact/endpoints/contact_endpoint.dart';
import 'package:serverpod/serverpod.dart';

class ContactHandler {
  const ContactHandler._();

  static Future<ContactDTO> create(
    Session session, {
    required String sessionId,
    required ContactType type,
  }) async {
    final res = await session.db.transaction((transaction) async {
      final (:now, :userId) = await CoreUtils.getCurrentTimeAndUser(session);

      final primaryCountryCode = await CountryCodeDTO.db.findFirstRow(
        session,
        where: (t) => t.isPrimary.equals(true),
        transaction: transaction,
      );
      final primaryLanguageCode = await LanguageCodeDTO.db.findFirstRow(
        session,
        where: (t) => t.isPrimary.equals(true),
        transaction: transaction,
      );

      SalutationCodeDTO? primarySalutationCode;

      if (type == ContactType.person) {
        primarySalutationCode = await SalutationCodeDTO.db.findFirstRow(
          session,
          where: (t) => t.isPrimaryPerson.equals(true),
          transaction: transaction,
        );
      }
      if (type == ContactType.company) {
        primarySalutationCode = await SalutationCodeDTO.db.findFirstRow(
          session,
          where: (t) => t.isPrimaryCompany.equals(true),
          transaction: transaction,
        );
      }

      final contact = ContactUtils.initialContact(
        userId: userId,
        sessionId: sessionId,
        type: type,
        now: now,
        countryCode: primaryCountryCode,
        languageCode: primaryLanguageCode,
        salutationCode: primarySalutationCode,
      );

      return GenericCrud.create(
        session,
        ContactDTO.db.insertRow(
          session,
          contact,
          transaction: transaction,
        ),
      );
    });

    return res;
  }

  static Future<ContactDTO> update(
    Session session, {
    required ContactDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    final (:now, :userId) = await CoreUtils.getCurrentTimeAndUser(session);

    try {
      final contact = await session.db.transaction((transaction) async {
        final serverContact = await _fetchById(
          session,
          entity.id!,
          transaction,
        );

        await GenericCrud.validateUpdate(
          session,
          sessionId: sessionId,
          serverEntity: serverContact,
          now: now,
        );

        final customId = await ContactHandler.getCustomId(
          session,
          serverCustomId: serverContact!.customId,
          transaction: transaction,
        );
        entity = entity.copyWith(
          customId: customId,
          customIdString: customId.toString(),
        );

        final withUpdatedMeta = GenericCrud.modifyEntityDataMeta(
          entity,
          serverContact,
          userId,
          release,
          now,
        );
        final insertedContact = await ContactHandler.updateRow(
          session,
          withUpdatedMeta,
          transaction,
        );

        final withRelations = await ContactDTO.db.findById(
          session,
          insertedContact.id!,
          include: ContactUtils.includeAll,
          transaction: transaction,
        );

        await EntityLogHandler.create<ContactDTO>(
          session,
          oldEntity: serverContact,
          newEntity: withRelations!,
          userId: userId,
          editedAt: now,
          tableType: ContactUtils.tableType,
          fields: ContactUtils.getLogFields(),
          transaction: transaction,
        );

        return withRelations;
      });

      contactStreamController.add(contact);

      return contact;
    } on DatabaseQueryException catch (e) {
      session.log('Database query exception during contact update: $e');
      final message = e.message;
      if (message.contains('duplicate key value')) {
        throw e.toElbException(ElbExceptionType.conflict);
      }
      throw e.toElbException(ElbExceptionType.unknown);
    } catch (e) {
      session.log('Unexpected error during contact update: $e');
      throw ElbException(
        exceptionType: ElbExceptionType.unknown,
        message: e.toString(),
      );
    }
  }

  static Future<ContactDTO?> _fetchById(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return ContactDTO.db.findById(
      session,
      id,
      transaction: transaction,
      include: ContactUtils.includeAll,
    );
  }

  static Future<ContactDTO> updateRow(
    Session session,
    ContactDTO entity,
    Transaction transaction,
  ) async {
    return ContactDTO.db.updateRow(session, entity, transaction: transaction);
  }

  static Future<ContactDTO?> fetchByIdWithoutRelations(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return ContactDTO.db.findById(session, id, transaction: transaction);
  }

  static Future<ContactDTO?> deleteDraft(
    Session session,
    ContactDTO entity,
    Transaction transaction,
  ) async {
    return ContactDTO.db.deleteRow(session, entity, transaction: transaction);
  }

  static Future<int> getCustomId(
    Session session, {
    required int? serverCustomId,
    required Transaction transaction,
  }) async {
    if (serverCustomId != null) {
      return serverCustomId;
    } else {
      return CustomEntityKeysHandler.getNextIntKey(
        session,
        TableType.contact,
        transaction,
      );
    }
  }

  static Future<ContactDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String sessionId,
  }) async {
    return GenericCrud.fetchAndLockEntity<ContactDTO>(
      session,
      id: id,
      tableType: ContactUtils.tableType,
      editingSessionId: sessionId,
      fetchById: _fetchById,
      tableName: ContactDTOTable().tableName,
      streamController: contactStreamController,
    );
  }

  static Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    await GenericCrud.releaseEntity<ContactDTO>(
      fetchById: _fetchById,
      session,
      entityId: entityId,
      sessionId: sessionId,
      updateEntity: updateRow,
      tableType: ContactUtils.tableType,
      streamController: contactStreamController,
      deleteDraft: deleteDraft,
    );
  }

  static Future<bool> delete(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    final deleted = session.db.transaction((transaction) async {
      final customer = await CustomerDTO.db.find(
        session,
        where: (t) =>
            t.contactId.equals(entityId) &
            t.deletedAt.equals(null as DateTime?),
        transaction: transaction,
      );
      if (customer.isNotEmpty) {
        throw ElbException(
          exceptionType: ElbExceptionType.conflict,
          message: 'Customer already exists',
        );
      } else {
        return GenericCrud.markEntityAsDeleted<ContactDTO>(
          session,
          id: entityId,
          sessionId: sessionId,
          fetchWithoutRelations: _fetchById,
          updateRow: updateRow,
          tableType: ContactUtils.tableType,
          streamController: contactStreamController,
          transaction: transaction,
        );
      }
    });

    return deleted;
  }

  /// Find all unique string values for a given contact property
  ///
  /// This method retrieves contacts and extracts the values of the specified
  /// [field]
  /// It performs an optimized database query to only fetch non-deleted contacts
  /// where the specified field is non-null and, for string types, non-empty
  /// Returns a list of unique, non-empty string values for that property
  ///
  /// For fields where such an optimized query cannot be built (e.g., complex
  /// types or unhandled fields), an empty list is returned
  static Future<List<String>> findContactPropertyValues(
    Session session,
    ContactField field,
    String searchTerm,
  ) async {
    final filter = Filter(
      filterGroups: [
        FilterGroup(
          nextOperator: FilterOperator.and,
          filters: [
            // Search term
            if (searchTerm.isNotEmpty)
              FilterField(
                fieldKey: field.name,
                value: searchTerm,
                filterOperator: FilterOperator.and,
                fieldType: FilterFieldType.text,
                uuid: const Uuid().v4(),
                type: FilterType.iLike,
              ),
            // field not empty
            FilterField(
              fieldKey: field.name,
              value: '',
              filterOperator: FilterOperator.and,
              fieldType: FilterFieldType.text,
              uuid: const Uuid().v4(),
              type: FilterType.notEqual,
            ),
          ],
        ),
      ],
    );

    // Fetch all contacts that match the provided filter
    final contacts = await find(session, filter: filter);

    // Extract the required string values from the contacts
    // Using a Set to ensure unique values
    final fieldName = field.name;
    final allValues = <String>{};
    for (final contact in contacts) {
      final json = contact.toJson();

      final propertyValue = json[fieldName] as String?;
      if (propertyValue != null && propertyValue.isNotEmpty) {
        allValues.add(propertyValue);
      }
    }
    return allValues.toList();
  }

  /// Finds contacts based on the provided sort and filter criteria.
  static Future<List<ContactDTO>> find(
    Session session, {
    Sort? sort,
    Filter? filter,
  }) async {
    final sortByField = ContactField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );

    final expression = ContactUtils.buildExpression(filter);

    return ContactDTO.db.find(
      session,
      where: expression == null ? null : (t) => expression,
      orderBy: ContactUtils.orderBy(sortByField),
      orderDescending: sort?.orderDescending ?? false,
      include: ContactUtils.includeAll,
    );
  }
}
