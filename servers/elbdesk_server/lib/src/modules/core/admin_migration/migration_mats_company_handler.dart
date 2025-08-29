import 'package:elbdesk_backend_core_server/src/utils/core_utils.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/admin_migration/endpoints/migration_mats_company_endpoint.dart';
import 'package:elbdesk_server/src/modules/core/admin_migration/migration_mats_company_utils.dart';
import 'package:elbdesk_server/src/modules/core/custom_entity_keys/custom_entiy_keys_endpoint.dart';
import 'package:elbdesk_server/src/modules/core/generic_crud.dart';
import 'package:serverpod/serverpod.dart';

/// Handler class for MigrationMatsCompany business logic
class MigrationMatsCompanyHandler {
  const MigrationMatsCompanyHandler._();

  /// Fetches MigrationMatsCompany by ID
  static Future<MigrationMatsCompanyDTO?> fetchById(
    Session session,
    int id,
  ) async {
    return MigrationMatsCompanyDTO.db.findById(
      session,
      id,
    );
  }

  /// Updates MigrationMatsCompany
  static Future<MigrationMatsCompanyDTO> update(
    Session session,
    MigrationMatsCompanyDTO entity,
  ) async {
    return MigrationMatsCompanyDTO.db.updateRow(
      session,
      entity,
    );
  }

  /// Creates a new MigrationMatsCompany
  static Future<MigrationMatsCompanyDTO> create(
    Session session,
    MigrationMatsCompanyDTO entity,
  ) async {
    final userId = (await session.authenticated)?.userId;

    final newEntity = entity.copyWith(
      createdAt: DateTime.now(),
      createdById: userId,
      lastModifiedAt: DateTime.now(),
      lastModifiedById: userId,
      isMigrated: false,
    );

    return MigrationMatsCompanyDTO.db.insertRow(
      session,
      newEntity,
    );
  }

  /// Deletes a MigrationMatsCompany
  static Future<void> delete(
    Session session,
    MigrationMatsCompanyDTO entity,
  ) async {
    await MigrationMatsCompanyDTO.db.deleteRow(
      session,
      entity,
    );
  }

  /// Fetches MigrationMatsCompany by ID with relations
  static Future<MigrationMatsCompanyDTO?> _fetchById(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return MigrationMatsCompanyDTO.db.findById(
      session,
      id,
      transaction: transaction,
    );
  }

  /// Fetches MigrationMatsCompany by ID without relations
  static Future<MigrationMatsCompanyDTO?> fetchByIdWithoutRelations(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return MigrationMatsCompanyDTO.db
        .findById(session, id, transaction: transaction);
  }

  /// Deletes draft MigrationMatsCompany
  static Future<MigrationMatsCompanyDTO?> deleteDraft(
    Session session,
    MigrationMatsCompanyDTO entity,
    Transaction transaction,
  ) async {
    return MigrationMatsCompanyDTO.db.deleteRow(
      session,
      entity,
      transaction: transaction,
    );
  }

  /// Fetches and locks MigrationMatsCompany for editing
  static Future<MigrationMatsCompanyDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String sessionId,
  }) async {
    return GenericCrud.fetchAndLockEntity<MigrationMatsCompanyDTO>(
      session,
      id: id,
      tableType: MigrationMatsCompanyUtils.tableType,
      editingSessionId: sessionId,
      fetchById: _fetchById,
      tableName: MigrationMatsCompanyDTOTable().tableName,
      streamController: migrationMatsCompanyStreamController,
    );
  }

  /// Migrates a batch of MigrationMatsCompanies to Contacts
  static Future<List<ContactDTO>> migrateToContacts(
    Session session, {
    required int offset,
    required int limit,
  }) async {
    final result = <ContactDTO>[];

    // Fetch all required codes once
    final countryCodes = await CountryCodeDTO.db.find(session);

    // Fetch batch of MigrationMatsCompanies
    final matsCompanies = await MigrationMatsCompanyDTO.db.find(
      session,
      where: (t) => t.isMigrated.equals(false) & (t.id > offset),
      orderBy: (t) => t.id,
      limit: limit,
    );

    session
      ..log('Found ${matsCompanies.length} companies to migrate')
      ..log('Processing batch ${offset + 1} to ${offset + limit}');

    // Process each company sequentially
    for (final matsCompany in matsCompanies) {
      session.log(
        'Processing company ${matsCompany.id}: '
        'isMigrated=${matsCompany.isMigrated}',
      );

      try {
        final name = matsCompany.account ?? '';
        final street1 = matsCompany.shippingStreet1 ?? '';
        final postCode = matsCompany.shippingPostalCode ?? '';
        final city = matsCompany.shippingCity ?? '';
        final phone =
            MigrationMatsCompanyUtils.parsePhoneNumber(matsCompany.phone1);
        final email = matsCompany.email ?? '';
        final website = matsCompany.website ?? '';

        // Try to map the country
        final countryCode = await MigrationMatsCompanyUtils.mapCountry(
          session,
          matsCompany.shippingCountry,
          countryCodes,
        );

        // Check if contact already exists for this MatsCompany through the
        // relation
        final existingContact = await ContactDTO.db.findFirstRow(
          session,
          where: (t) => t.migrationMatsCompanyId.equals(matsCompany.id),
        );

        // Create or update contact in a single transaction
        final savedContact = await session.db.transaction((transaction) async {
          final customId = existingContact?.customId ??
              await CustomEntityKeysHandler.getNextIntKey(
                session,
                TableType.contact,
                transaction,
              );

          // Check for missing required fields
          final missingFields = <String>[];
          if (name.isEmpty) missingFields.add('name');

          // Create or update contact data
          final contact = ContactDTO(
            // Basic info
            id: existingContact?.id,
            firstName: '',
            lastName: '',
            fullName: name,
            title: matsCompany.account2,
            initials: existingContact?.initials ?? '',
            customId: customId,
            customIdString: customId.toString(),

            // Address
            address: street1,
            address2: matsCompany.shippingStreet2 ?? '',
            address3: existingContact?.address3 ?? '',
            postCode: postCode,
            city: city,
            state: matsCompany.shippingState ?? '',

            // Contact details
            phone: phone,
            phone2:
                MigrationMatsCompanyUtils.parsePhoneNumber(matsCompany.phone2),
            mobile: '', // Companies don't have mobile numbers
            email: email,
            fax: MigrationMatsCompanyUtils.parsePhoneNumber(matsCompany.fax),
            website: website,

            // Type and status
            type: ContactType.company.name,
            importantNote: missingFields.isNotEmpty
                ? 'MIGRATION - MISSING FIELDS: ${missingFields.join(", ")}'
                : '',

            // Meta
            createdAt: existingContact?.createdAt ?? DateTime.now(),
            createdById: existingContact?.createdById,
            lastModifiedAt: DateTime.now(),
            lastModifiedById: (await session.authenticated)?.userId,
            isDraft: false,

            // Relations
            countryCode: countryCode,
            countryCodeId: countryCode?.id,
            languageCode: existingContact?.languageCode,
            languageCodeId: existingContact?.languageCodeId,
            salutationCode: existingContact?.salutationCode,
            // always company
            salutationCodeId: 3,
            customer: existingContact?.customer,

            matsCompanyId: matsCompany.idAramis,
            migrationMatsCompany: matsCompany,
            migrationMatsCompanyId: matsCompany.id,
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

          // Mark the company as migrated
          await MigrationMatsCompanyDTO.db.updateRow(
            session,
            matsCompany.copyWith(
              isMigrated: true,
              lastModifiedAt: DateTime.now(),
              lastModifiedById: (await session.authenticated)?.userId,
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
        session.log('Failed to migrate contact ${matsCompany.id}: $e');
      }
    }

    return result;
  }

  /// Migrates companies to customers
  static Future<List<CustomerDTO>> migrateToCustomers(
    Session session, {
    required int offset,
    required int limit,
  }) async {
    final result = <CustomerDTO>[];

    // Fetch batch of contacts that are companies and have both IDs set
    final contacts = await ContactDTO.db.find(
      session,
      where: (t) =>
          t.type.equals(ContactType.company.name) &
          t.matsCompanyId.notEquals(null as String?) &
          t.matsCompanyId.notEquals('') &
          t.migrationMatsCompanyId.notEquals(null as int?) &
          (t.migrationMatsCompanyId > offset) &
          t.migrationMatsCompany.isMigrated.equals(true) &
          // Only process contacts with matsCompanyId below 20000
          // we only want to migrate contacts with an id_Aramais smaller than
          // 20000 to customers, because the other ids are referring to
          // creditors, maybe we have to migrate them later in a different way
          // id_Aramis is copied to matsCompanyId when creating contacts
          (t.matsCompanyId < '20000'),
      orderBy: (t) => t.migrationMatsCompanyId,
      limit: limit,
    );

    session.log(
      'Found ${contacts.length} company contacts to process for customers',
    );

    // Process each contact sequentially
    for (final contact in contacts) {
      try {
        session.log(
          'Processing contact: ${contact.fullName} (ID: ${contact.id}, '
          'matsCompanyId: ${contact.matsCompanyId}, '
          'migrationMatsCompanyId: ${contact.migrationMatsCompanyId})',
        );

        // Fetch the related MigrationMatsCompany
        final matsCompany = await MigrationMatsCompanyDTO.db.findFirstRow(
          session,
          where: (t) => t.id.equals(contact.migrationMatsCompanyId),
        );

        if (matsCompany == null) {
          session.log(
            'Could not find MATS company for contact ${contact.fullName} '
            'with migrationMatsCompanyId ${contact.migrationMatsCompanyId}',
          );
          continue;
        }

        // Check if customer already exists for this contact through the
        // relation
        final existingCustomer = await CustomerDTO.db.findFirstRow(
          session,
          where: (t) => t.contactId.equals(contact.id),
        );

        if (existingCustomer != null) {
          session.log(
            'Customer already exists for contact ${contact.fullName}',
          );
          result.add(existingCustomer);
          continue;
        }

        // Create customer in a single transaction
        final savedCustomer = await session.db.transaction((transaction) async {
          // Use matsCompanyId as customId instead of generating a new one
          // The fallback to customEntityKeys should usually not be needed,
          // because the query above should only return contacts with
          // proper matsCompanyIds. But just in case, we have a fallback.
          //
          // We want to do this to have the "old" IDs from the Aramis system
          // in Elbdesk. This way the customer can keep working with the
          // "known" Ids.
          //
          // -> These are actually known by the employees of the customer and
          // are used frequently in daily business.
          final customId = int.tryParse(contact.matsCompanyId ?? '') ??
              await CustomEntityKeysHandler.getNextIntKey(
                session,
                TableType.customer,
                transaction,
              );

          // Create customer data
          final customer = CustomerDTO(
            // Basic info
            id: null,
            customId: customId,
            customIdString: customId.toString(),
            vatId: '',
            invoiceEmail: matsCompany.email ?? contact.email,

            // Meta
            createdAt: DateTime.now(),
            createdById: (await session.authenticated)?.userId,
            lastModifiedAt: DateTime.now(),
            lastModifiedById: (await session.authenticated)?.userId,
            isDraft: false,

            // Relations
            contact: contact,
            contactId: contact.id,

            // Default values
            invoiceDeliveryMethod: null,
            salesOrderHints: null,
            ftpInterfaces: [],
          );

          return CustomerDTO.db.insertRow(
            session,
            customer,
            transaction: transaction,
          );
        });

        result.add(savedCustomer);
        session.log(
          'Successfully created customer for ${contact.fullName} '
          '(Contact ID: ${contact.id}, Customer ID: ${savedCustomer.id})',
        );
      } catch (e) {
        session.log('Failed to create customer for ${contact.fullName}: $e');
      }
    }

    session.log(
      'Finished processing batch. Created ${result.length} customers.',
    );
    return result;
  }

  /// Assigns employees to companies based on matching accountId
  static Future<(int assignedCount, bool hasMoreContacts, int lastProcessedId)>
      assignEmployeesToCompanies(
    Session session, {
    required int offset,
    required int limit,
  }) async {
    var assignedCount = 0;
    var hasMoreContacts = false;
    var lastProcessedId = offset; // Track the last processed ID

    // Fetch a batch of person contacts with accountId
    final personContacts = await ContactDTO.db.find(
      session,
      where: (t) =>
          t.type.equals(ContactType.person.name) &
          t.migrationMatsPersonId.notEquals(null as int?) &
          (t.migrationMatsPersonId > offset),
      orderBy: (t) => t.migrationMatsPersonId,
      limit: limit + 1,
    );

    // Check if there are more contacts to process
    hasMoreContacts = personContacts.length > limit;

    // Process only the requested limit
    final contactsToProcess = personContacts.take(limit).toList();

    session.log(
      'Found ${contactsToProcess.length} person contacts to process for '
      'employee assignments',
    );

    // Process each person contact
    for (final personContact in contactsToProcess) {
      try {
        // Update last processed ID
        lastProcessedId =
            personContact.migrationMatsPersonId ?? lastProcessedId;

        // Get the person's migration data to find the accountId
        final matsPerson = await MigrationMatsPersonDTO.db.findFirstRow(
          session,
          where: (t) => t.id.equals(personContact.migrationMatsPersonId),
        );

        if (matsPerson == null ||
            matsPerson.idAccount == null ||
            matsPerson.idAccount!.isEmpty) {
          session.log(
            'Person ${personContact.fullName} has no valid account reference',
          );
          continue;
        }

        session
            .log('Looking for company with accountId: ${matsPerson.idAccount}');

        // Find the company contact with matching accountId
        final companyContact =
            await MigrationMatsCompanyUtils.findCompanyByAccountId(
          session,
          matsPerson.idAccount!,
        );

        if (companyContact == null) {
          session
              .log('No company found with accountId: ${matsPerson.idAccount}');
          continue;
        }

        session.log(
          'Found company ${companyContact.fullName} for '
          'person ${personContact.fullName}',
        );

        // Check if the association already exists through the relation
        final existingAssociation = await CompanyEmployeeDTO.db.findFirstRow(
          session,
          where: (t) =>
              t.companyId.equals(companyContact.id) &
              t.employeeId.equals(personContact.id),
        );

        if (existingAssociation != null) {
          session.log(
            'Association already exists for ${personContact.fullName} '
            'and ${companyContact.fullName}',
          );
          continue;
        }

        // Create the association in a transaction
        await session.db.transaction((transaction) async {
          final companyEmployee = CompanyEmployeeDTO(
            // Relation
            company: companyContact,
            companyId: companyContact.id!,
            employee: personContact,
            employeeId: personContact.id!,

            // Details
            position: [
              if (matsPerson.department?.isNotEmpty ?? false)
                matsPerson.department!,
              if (matsPerson.position?.isNotEmpty ?? false)
                matsPerson.position!,
            ].join(' | '),
            active: true,
            note: '',

            // Meta
            createdAt: DateTime.now(),
            createdById: (await session.authenticated)?.userId,
            lastModifiedAt: DateTime.now(),
            lastModifiedById: (await session.authenticated)?.userId,
            isDraft: false,
          );

          await CompanyEmployeeDTO.db.insertRow(
            session,
            companyEmployee,
            transaction: transaction,
          );
        });

        assignedCount++;
        session.log(
          'Created association between ${personContact.fullName} '
          'and ${companyContact.fullName}',
        );
      } catch (e) {
        session.log(
          'Failed to process association for ${personContact.fullName}: $e',
        );
      }
    }

    session.log('Assigned $assignedCount employees to companies in this batch');
    return (assignedCount, hasMoreContacts, lastProcessedId);
  }

  /// Imports a batch of migration mats companies
  static Future<void> import(
    Session session, {
    required List<MigrationMatsCompanyDTO> companies,
  }) async {
    const batchSize = 20;
    for (var i = 0; i < companies.length; i += batchSize) {
      final end =
          (i + batchSize < companies.length) ? i + batchSize : companies.length;
      final batch = companies.sublist(i, end);

      for (final company in batch) {
        final existing = await MigrationMatsCompanyDTO.db.findFirstRow(
          session,
          where: (t) => t.idAccount.equals(company.idAccount),
        );

        if (existing != null) {
          // Check if there are any changes in the company data
          final hasChanges = _hasCompanyChanges(existing, company);

          if (hasChanges) {
            // Update existing record only if there are changes
            await update(
              session,
              company.copyWith(
                id: existing.id,
                createdAt: existing.createdAt,
                createdById: existing.createdById,
                lastModifiedAt: DateTime.now(),
                lastModifiedById: (await session.authenticated)?.userId,
                isMigrated: false,
              ),
            );
            session.log('Updated company with idAccount: ${company.idAccount}');
          } else {
            session.log(
              'No changes for company with idAccount: ${company.idAccount}',
            );
          }
        } else {
          // Create new record
          await create(session, company);
          session
              .log('Created new company with idAccount: ${company.idAccount}');
        }
      }
    }
  }

  /// Checks if there are any changes between two company records
  static bool _hasCompanyChanges(
    MigrationMatsCompanyDTO existing,
    MigrationMatsCompanyDTO newCompany,
  ) {
    return existing.account != newCompany.account ||
        existing.account2 != newCompany.account2 ||
        existing.idAramis != newCompany.idAramis ||
        existing.shippingStreet1 != newCompany.shippingStreet1 ||
        existing.shippingStreet2 != newCompany.shippingStreet2 ||
        existing.shippingPostalCode != newCompany.shippingPostalCode ||
        existing.shippingCity != newCompany.shippingCity ||
        existing.shippingState != newCompany.shippingState ||
        existing.shippingCountry != newCompany.shippingCountry ||
        existing.phone1 != newCompany.phone1 ||
        existing.phone2 != newCompany.phone2 ||
        existing.fax != newCompany.fax ||
        existing.email != newCompany.email ||
        existing.website != newCompany.website;
  }

  /// Creates departments from MigrationMatsPerson entries where
  /// isPerson = false
  static Future<
          (int createdCount, bool hasMoreDepartments, int lastProcessedId)>
      createDepartments(
    Session session, {
    required int offset,
    required int limit,
  }) async {
    return session.db.transaction((transaction) async {
      var createdCount = 0;
      var hasMoreDepartments = false;
      var lastProcessedId = offset;

      // Fetch a batch of department entries (isPerson = false)
      final departmentEntries = await MigrationMatsPersonDTO.db.find(
        session,
        where: (t) => t.isPerson.equals(false) & (t.id > offset),
        orderBy: (t) => t.id,
        limit: limit + 1,
        transaction: transaction,
      );

      // Check if there are more departments to process
      hasMoreDepartments = departmentEntries.length > limit;

      // Process only the requested limit
      final departmentsToProcess = departmentEntries.take(limit).toList();

      session.log(
        'Found ${departmentsToProcess.length} department entries to process',
      );

      // Process each department entry
      for (final departmentEntry in departmentsToProcess) {
        try {
          // Update last processed ID
          lastProcessedId = departmentEntry.id ?? lastProcessedId;

          final departmentName = departmentEntry.nameFirst ?? '';
          final description = departmentEntry.nameLast ??
              ''; // Use nameLast as description if available
          final accountId = departmentEntry.idAccount;

          // Skip if no department name
          if (departmentName.isEmpty) {
            session.log(
              'Skipping department entry ${departmentEntry.id}: '
              'no department name',
            );
            continue;
          }

          // Find the company contact with matching accountId
          ContactDTO? companyContact;
          if (accountId != null && accountId.isNotEmpty) {
            companyContact =
                await MigrationMatsCompanyUtils.findCompanyByAccountId(
              session,
              accountId,
              transaction: transaction,
            );
          }

          if (companyContact == null) {
            session.log(
              'No company found with accountId: $accountId',
            );
            continue;
          }

          // Check if department already exists for this company
          CompanyDepartmentDTO? existingDepartment;
          existingDepartment = await CompanyDepartmentDTO.db.findFirstRow(
            session,
            where: (t) =>
                t.companyId.equals(companyContact!.id) &
                t.name.equals(departmentName),
            transaction: transaction,
          );

          if (existingDepartment != null) {
            session.log(
              'Department "$departmentName" already exists for company '
              '${companyContact.fullName}',
            );
            continue;
          }

          final (:userId, :now) =
              await CoreUtils.getCurrentTimeAndUser(session);

          // Create the department
          final companyDepartment = CompanyDepartmentDTO(
            // Basic info
            name: departmentName,
            description: description.isNotEmpty ? description : null,

            // Relations
            company: companyContact,
            companyId: companyContact.id!,
            employees: [],

            // Meta
            createdAt: now,
            createdById: userId,
            lastModifiedAt: now,
            lastModifiedById: userId,
            isDraft: false,
          );

          await CompanyDepartmentDTO.db.insertRow(
            session,
            companyDepartment,
            transaction: transaction,
          );

          createdCount++;
          session.log(
            'Created department "$departmentName" for company '
            '${companyContact.fullName}',
          );
        } catch (e) {
          session.log(
            'Failed to create department from entry ${departmentEntry.id}: $e',
          );
        }
      }

      session.log('Created $createdCount departments in this batch');
      return (createdCount, hasMoreDepartments, lastProcessedId);
    });
  }
}
