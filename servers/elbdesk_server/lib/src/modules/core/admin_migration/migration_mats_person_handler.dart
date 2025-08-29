import 'dart:async';

import 'package:elbdesk_backend_core_server/src/utils/core_utils.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/admin_migration/endpoints/migration_mats_person_endpoint.dart';
import 'package:elbdesk_server/src/modules/core/admin_migration/migration_mats_person_utils.dart';
import 'package:elbdesk_server/src/modules/core/custom_entity_keys/custom_entiy_keys_endpoint.dart';
import 'package:elbdesk_server/src/modules/core/generic_crud.dart';
import 'package:serverpod/serverpod.dart';

/// Handler class for MigrationMatsPerson business logic
class MigrationMatsPersonHandler {
  const MigrationMatsPersonHandler._();

  /// Fetches MigrationMatsPerson by ID
  static Future<MigrationMatsPersonDTO?> fetchById(
    Session session,
    int id,
  ) async {
    return MigrationMatsPersonDTO.db.findById(
      session,
      id,
    );
  }

  /// Updates MigrationMatsPerson
  static Future<MigrationMatsPersonDTO> update(
    Session session,
    MigrationMatsPersonDTO entity,
  ) async {
    return MigrationMatsPersonDTO.db.updateRow(
      session,
      entity,
    );
  }

  /// Creates a new MigrationMatsPerson
  static Future<MigrationMatsPersonDTO> create(
    Session session,
    MigrationMatsPersonDTO entity,
  ) async {
    final (:now, :userId) = await CoreUtils.getCurrentTimeAndUser(session);

    final newEntity = entity.copyWith(
      createdAt: now,
      createdById: userId,
      isMigrated: false,
    );

    return MigrationMatsPersonDTO.db.insertRow(session, newEntity);
  }

  /// Deletes a MigrationMatsPerson
  static Future<void> delete(
    Session session,
    MigrationMatsPersonDTO entity,
  ) async {
    await MigrationMatsPersonDTO.db.deleteRow(
      session,
      entity,
    );
  }

  /// Fetches MigrationMatsPerson by ID with relations
  static Future<MigrationMatsPersonDTO?> _fetchById(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return MigrationMatsPersonDTO.db.findById(
      session,
      id,
      transaction: transaction,
    );
  }

  /// Fetches MigrationMatsPerson by ID without relations
  static Future<MigrationMatsPersonDTO?> fetchByIdWithoutRelations(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return MigrationMatsPersonDTO.db
        .findById(session, id, transaction: transaction);
  }

  /// Deletes draft MigrationMatsPerson
  static Future<MigrationMatsPersonDTO?> deleteDraft(
    Session session,
    MigrationMatsPersonDTO entity,
    Transaction transaction,
  ) async {
    return MigrationMatsPersonDTO.db.deleteRow(
      session,
      entity,
      transaction: transaction,
    );
  }

  /// Fetches and locks MigrationMatsPerson for editing
  static Future<MigrationMatsPersonDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String sessionId,
  }) async {
    return GenericCrud.fetchAndLockEntity<MigrationMatsPersonDTO>(
      session,
      id: id,
      tableType: MigrationMatsPersonUtils.tableType,
      editingSessionId: sessionId,
      fetchById: _fetchById,
      tableName: MigrationMatsPersonDTOTable().tableName,
      streamController: migrationMatsPersonStreamController,
    );
  }

  // This method could probably be optimized to not fetch all
  // persons at once and skip them if they dont fit.
  // We could also just fetch the ones that are needed by changing the query.
  // But then the count endpoint method would also need to be adjusted I guess.
  // e.g. dont fetch mats entries with isPerson = false AND isMigrated = true
  //
  /// Migrates a batch of MigrationMatsPersons to Contacts
  static Future<List<ContactDTO>> migrateToContacts(
    Session session, {
    required int offset,
    required int limit,
  }) async {
    final (:now, :userId) = await CoreUtils.getCurrentTimeAndUser(session);

    final result = <ContactDTO>[];

    // Fetch all required codes once
    final salutationCodes = await SalutationCodeDTO.db.find(session);
    final languageCodes = await LanguageCodeDTO.db.find(session);
    final countryCodes = await CountryCodeDTO.db.find(session);

    // Fetch batch of MigrationMatsPersons
    final matsPersons = await MigrationMatsPersonDTO.db.find(
      session,
      where: (t) => t.isMigrated.equals(false) & (t.id > offset),
      orderBy: (t) => t.id,
      limit: limit,
    );

    session
      ..log('Found ${matsPersons.length} persons to migrate')
      ..log('Processing batch ${offset + 1} to ${offset + limit}');

    // Process each contact sequentially
    for (final matsPerson in matsPersons) {
      session.log(
        'Processing person ${matsPerson.id}: '
        'isMigrated=${matsPerson.isMigrated}',
      );

      if (matsPerson.isMigrated) {
        session.log('Skipping already migrated person: ${matsPerson.id}');
        continue;
      }

      if (!matsPerson.isPerson) {
        session.log('Skipping department: ${matsPerson.id}');
        continue;
      }

      try {
        final firstName = matsPerson.nameFirst ?? '';
        final lastName = matsPerson.nameLast ?? '';
        final street1 = matsPerson.primaryStreet1 ?? '';
        final postCode = matsPerson.primaryPostalCode ?? '';
        final city = matsPerson.primaryCity ?? '';
        final phone = matsPerson.telefon1 ?? '';
        final mobile = matsPerson.mobilTelefon ?? '';
        final email = matsPerson.email ?? '';

        // Try to map the salutation
        final salutationCode = await MigrationMatsPersonUtils.mapSalutation(
          session,
          matsPerson.anredeLang,
          matsPerson.anrede,
          salutationCodes,
        );

        // Try to map the language based on salutation
        final languageCode = await MigrationMatsPersonUtils.mapLanguage(
          session,
          matsPerson.anredeLang,
          matsPerson.anrede,
          languageCodes,
        );

        // Try to map the country
        final countryCode = await MigrationMatsPersonUtils.mapCountry(
          session,
          matsPerson.primaryCountry,
          countryCodes,
        );

        // Check if contact already exists for this MatsPerson through the
        // relation
        final existingContact = await ContactDTO.db.findFirstRow(
          session,
          where: (t) => t.migrationMatsPersonId.equals(matsPerson.id),
        );

        // Create contact in a single transaction
        final savedContact = await session.db.transaction((transaction) async {
          final customId = existingContact?.customId ??
              await CustomEntityKeysHandler.getNextIntKey(
                session,
                TableType.contact,
                transaction,
              );

          // Check for missing required fields
          final missingFields = <String>[];
          if (firstName.isEmpty) missingFields.add('firstName');
          if (lastName.isEmpty) missingFields.add('lastName');
          if (salutationCode == null) missingFields.add('salutationCode');
          if (languageCode == null) missingFields.add('languageCode');

          // Create or update contact data
          final contact = ContactDTO(
            // Basic info
            id: existingContact?.id,
            firstName: firstName,
            lastName: lastName,
            fullName: '$firstName $lastName'.trim(),
            title: matsPerson.titel,
            initials: existingContact?.initials ?? '',
            customId: customId,
            customIdString: customId.toString(),

            // Address
            address: street1,
            address2: matsPerson.primaryStreet2 ?? '',
            address3: existingContact?.address3 ?? '',
            postCode: postCode,
            city: city,
            state: matsPerson.primaryState ?? '',

            // Contact details
            phone: phone,
            phone2: matsPerson.telefon2,
            mobile: mobile,
            email: email,
            fax: matsPerson.fax,
            website: existingContact?.website ?? '',

            // Type and status
            type: ContactType.person.name,
            importantNote: missingFields.isNotEmpty
                ? 'MIGRATION - MISSING FIELDS: ${missingFields.join(", ")}'
                : '',

            // Meta
            createdAt: now,
            createdById: userId,
            lastModifiedAt: now,
            lastModifiedById: userId,
            isDraft: false,

            // Relations
            countryCode: countryCode,
            countryCodeId: countryCode?.id,
            languageCode: languageCode,
            languageCodeId: languageCode?.id,
            salutationCode: salutationCode,
            salutationCodeId: salutationCode?.id,
            customer: existingContact?.customer,

            matsContactId: matsPerson.idContact,
            migrationMatsPerson: matsPerson,
            migrationMatsPersonId: matsPerson.id,
          );

          // Insert or update the contact within the same transaction
          final savedContact = existingContact != null
              ? await ContactDTO.db.updateRow(
                  session,
                  contact,
                  transaction: transaction,
                )
              : await ContactDTO.db.insertRow(
                  session,
                  contact,
                  transaction: transaction,
                );

          // Mark the person as migrated
          await MigrationMatsPersonDTO.db.updateRow(
            session,
            matsPerson.copyWith(
              isMigrated: true,
              lastModifiedAt: now,
              lastModifiedById: userId,
            ),
            transaction: transaction,
          );

          return savedContact;
        });

        result.add(savedContact);
        session.log(
          'Successfully ${existingContact != null ? 'updated' : 'created'} '
          'contact: ${savedContact.fullName}',
        );
      } catch (e) {
        session.log('Failed to migrate contact ${matsPerson.id}: $e');
      }
    }

    return result;
  }

  /// Imports a batch of migration mats persons
  static Future<void> import(
    Session session, {
    required List<MigrationMatsPersonDTO> persons,
  }) async {
    final (:now, :userId) = await CoreUtils.getCurrentTimeAndUser(session);

    const batchSize = 20;
    for (var i = 0; i < persons.length; i += batchSize) {
      final end =
          (i + batchSize < persons.length) ? i + batchSize : persons.length;
      final batch = persons.sublist(i, end);

      for (final person in batch) {
        final existing = await MigrationMatsPersonDTO.db.findFirstRow(
          session,
          where: (t) => t.idContact.equals(person.idContact),
        );

        if (existing != null) {
          // Check if there are any changes in the person data
          final hasChanges = _hasPersonChanges(existing, person);

          if (hasChanges) {
            // Update existing record only if there are changes
            await update(
              session,
              person.copyWith(
                id: existing.id,
                createdAt: existing.createdAt,
                createdById: existing.createdById,
                lastModifiedAt: now,
                lastModifiedById: userId,
                // If the person is updated, we need to reset the migration
                // status to allow another migration
                isMigrated: false,
              ),
            );
            session.log('Updated person with idContact: ${person.idContact}');
          } else {
            session.log(
              'No changes for person with idContact: ${person.idContact}',
            );
          }
        } else {
          // Create new record
          await create(session, person);
          session.log('Created new person with idContact: ${person.idContact}');
        }
      }
    }
  }

  /// Checks if there are any changes between two person records
  static bool _hasPersonChanges(
    MigrationMatsPersonDTO existing,
    MigrationMatsPersonDTO newPerson,
  ) {
    return existing.nameFirst != newPerson.nameFirst ||
        existing.nameLast != newPerson.nameLast ||
        existing.titel != newPerson.titel ||
        existing.anrede != newPerson.anrede ||
        existing.anredeLang != newPerson.anredeLang ||
        existing.primaryStreet1 != newPerson.primaryStreet1 ||
        existing.primaryStreet2 != newPerson.primaryStreet2 ||
        existing.primaryPostalCode != newPerson.primaryPostalCode ||
        existing.primaryCity != newPerson.primaryCity ||
        existing.primaryState != newPerson.primaryState ||
        existing.primaryCountry != newPerson.primaryCountry ||
        existing.telefon1 != newPerson.telefon1 ||
        existing.telefon2 != newPerson.telefon2 ||
        existing.mobilTelefon != newPerson.mobilTelefon ||
        existing.fax != newPerson.fax ||
        existing.email != newPerson.email ||
        existing.position != newPerson.position ||
        existing.department != newPerson.department ||
        existing.idAccount != newPerson.idAccount;
  }
}
