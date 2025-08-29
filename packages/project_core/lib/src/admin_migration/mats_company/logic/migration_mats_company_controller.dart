// import 'dart:io';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:project_core/src/admin_migration/mats_company/models/migration_mats_company.dart';
import 'package:project_core/src/admin_migration/mats_company/repositories/migration_mats_company_repository.dart';

/// Controller for managing migration mats company data
class MigrationMatsCompanyController {
  /// Migration Mats Company Controller constructor
  const MigrationMatsCompanyController({
    required this.repository,
  });

  /// Migration Mats Company Repository
  final MigrationMatsCompanyRepository repository;

  /// Maps CSV headers to model fields
  static const _headerMapping = {
    'ID_Account': 'idAccount',
    'Account': 'account',
    'Account2': 'account2',
    'id_Aramis': 'idAramis',
    'ID_Staff': 'idStaff',
    'ID_AV_verantw': 'idAvVerantw',
    'Standort': 'standort',
    'Shipping_Street1': 'shippingStreet1',
    'Shipping_Street2': 'shippingStreet2',
    'Shipping_Postal_Code': 'shippingPostalCode',
    'Shipping_City': 'shippingCity',
    'Shipping_Country': 'shippingCountry',
    'Shipping_State': 'shippingState',
    'Phone1': 'phone1',
    'Phone2': 'phone2',
    'Fax': 'fax',
    'Email': 'email',
    'Webseite': 'website',
  };

  /// Normalizes a string value
  /// (only trims whitespace and removes null characters)
  String _sanitizeString(dynamic value) {
    if (value == null) return '';
    // Remove null characters and trim whitespace
    return value.toString().replaceAll('\u0000', '').trim();
  }

  /// Normalizes company data
  Map<String, dynamic> _normalizeCompanyData(Map<String, dynamic> values) {
    final normalized = <String, dynamic>{};

    // Only trim whitespace and remove null characters from string fields
    values.forEach((key, value) {
      if (value is String) {
        final normalizedValue = _sanitizeString(value);
        // Only set the value if it's not empty, otherwise keep it null
        if (normalizedValue.isNotEmpty) {
          normalized[key] = normalizedValue;
        }
      } else {
        normalized[key] = value;
      }
    });

    return normalized;
  }

  /// Parses a CSV file and returns a list of MigrationMatsCompany objects
  Future<List<MigrationMatsCompany>> parseCsv(XFile file) async {
    // First read the file as string to handle line breaks
    final content = await file.readAsString();

    // Clean the content: trim whitespace and normalize line endings
    final cleanedContent = content.trim().replaceAll('\r\n', '\n');

    // Split into lines and filter out empty ones
    final lines = cleanedContent
        .split('\n')
        .where((line) => line.trim().isNotEmpty)
        .toList();

    if (lines.isEmpty) {
      throw ElbException(
        exceptionType: ElbExceptionType.conflict,
        message: 'CSV file is empty',
      );
    }

    // Parse only the first line for headers
    final headerLine = lines.first;
    final headers = const CsvToListConverter(
      fieldDelimiter: ',',
      shouldParseNumbers: false,
      eol: '\n',
    ).convert(headerLine).first.map((e) => e.toString().trim()).toList();

    // More robust header cleaning
    final normalizedHeaders = headers.map((h) {
      // Remove all quotes and trim
      final cleaned = h.replaceAll('"', '').trim();
      // Remove any trailing commas or quotes
      return cleaned.replaceAll(RegExp(r'[,]$'), '');
    }).toList();

    // Check headers case-insensitively
    final missingHeaders = _headerMapping.keys.where((expectedHeader) {
      return !normalizedHeaders.any(
        (actualHeader) =>
            actualHeader.toLowerCase() == expectedHeader.toLowerCase(),
      );
    }).toList();

    if (missingHeaders.isNotEmpty) {
      throw ElbException(
        exceptionType: ElbExceptionType.validationFormError,
        message: 'Missing required headers: ${missingHeaders.join(', ')}',
      );
    }

    // Process all companies (skip header line)
    final companyLines = lines.sublist(1);
    final totalCompanies = companyLines.length;
    dlog('Starting import of $totalCompanies companies...');

    final result = <MigrationMatsCompany>[];
    var skippedInvalidLength = 0;
    var skippedErrors = 0;

    for (var i = 0; i < companyLines.length; i++) {
      final line = companyLines[i].trim();

      // Skip empty lines
      if (line.isEmpty) {
        dlog('Skipping empty line at position ${i + 1}');
        continue;
      }

      try {
        final row = const CsvToListConverter(
          fieldDelimiter: ',',
          shouldParseNumbers: false,
          eol: '\n',
        ).convert(line).first;

        // Validate row length
        if (row.length < normalizedHeaders.length) {
          skippedInvalidLength++;
          dlog(
            '\nWarning: Row ${i + 1} has ${row.length} columns, '
            'expected ${normalizedHeaders.length}',
          );
          dlog('Row content: $line');
          continue;
        }

        final values = <String, dynamic>{};

        // Map each column to its corresponding field
        for (var j = 0; j < normalizedHeaders.length; j++) {
          final header = normalizedHeaders[j];
          if (_headerMapping.containsKey(header)) {
            final field = _headerMapping[header]!;
            final value = row[j]?.toString().trim();
            values[field] = value;
          }
        }

        // Normalize the data
        final normalizedValues = _normalizeCompanyData(values);

        // Create proper JSON structure
        final json = {
          'data': normalizedValues,
          'isMigrated': false,
          'meta': {
            'createdAt': DateTime.now().toIso8601String(),
            'isDraft': false,
          },
        };
        result.add(MigrationMatsCompany.fromJson(json));

        // Print progress every 500 companies
        if (i % 500 == 0) {
          final percentage =
              ((i + 1) / totalCompanies * 100).toStringAsFixed(1);
          dlog('Progress: $percentage% (${i + 1}/$totalCompanies)');
        }
      } catch (e) {
        skippedErrors++;
        dlog('\nError processing row ${i + 1}: $e');
        dlog('Row content: $line');
        continue;
      }
    }

    dlog('\nParsing Summary:');
    dlog('Total rows in file: $totalCompanies');
    dlog('Successfully parsed: ${result.length}');
    dlog('Skipped due to invalid length: $skippedInvalidLength');
    dlog('Skipped due to errors: $skippedErrors');

    if (result.isEmpty) {
      throw ElbException(
        exceptionType: ElbExceptionType.validationFormError,
        message: 'No valid companies were found in the CSV file',
      );
    }

    dlog('\nSuccessfully parsed ${result.length} companies');
    return result;
  }

  /// Imports a list of MigrationMatsCompany objects
  Future<void> import(
    List<MigrationMatsCompany> companies, {
    void Function(double progress)? onProgress,
    bool Function()? isCancelled,
  }) async {
    const batchSize = 50;
    var totalImported = 0;
    var totalFailed = 0;

    dlog('\nStarting import of ${companies.length} companies...');

    for (var i = 0; i < companies.length; i += batchSize) {
      // Check for cancellation before processing each batch
      if (isCancelled?.call() ?? false) {
        dlog('\nImport cancelled after processing $totalImported companies');
        throw ElbException(
          exceptionType: ElbExceptionType.conflict,
          message: 'Import cancelled by user',
        );
      }

      final end =
          (i + batchSize < companies.length) ? i + batchSize : companies.length;
      final batch = companies.sublist(i, end);

      try {
        // Try importing the entire batch first
        await repository.import(batch);
        totalImported += batch.length;
        onProgress?.call((i + batch.length) / companies.length);
      } catch (e) {
        // If batch fails, try each company individually
        for (var j = 0; j < batch.length; j++) {
          // Check for cancellation before processing each company
          if (isCancelled?.call() ?? false) {
            dlog(
              '\nImport cancelled after processing $totalImported companies',
            );
            throw ElbException(
              exceptionType: ElbExceptionType.conflict,
              message: 'Import cancelled by user',
            );
          }

          try {
            // Print the full data for the first failed company
            if (totalFailed == 0) {
              dlog('\nFirst failed company data:');
              dlog('JSON: ${batch[j].toJson()}');
            }

            await repository.import([batch[j]]);
            totalImported++;
            onProgress?.call((i + j + 1) / companies.length);
          } catch (e) {
            totalFailed++;
            // Only print failed companies
            dlog('\nFailed company:');
            dlog('ID: ${batch[j].data.idAccount}');
            dlog('Name: ${batch[j].data.account}');
            dlog('Error: $e');
          }
        }
      }
    }

    dlog('\nImport Summary:');
    dlog('Total companies to import: ${companies.length}');
    dlog('Successfully imported: $totalImported');
    dlog('Failed to import: $totalFailed');

    if (totalFailed > 0) {
      throw ElbException(
        exceptionType: ElbExceptionType.conflict,
        message: 'Import completed with $totalFailed failed companies',
      );
    }
  }

  /// Migrates all available companies to contacts in batches
  Future<List<Contact>> migrateToContacts({
    required int totalCount,
    void Function(double progress)? onProgress,
    bool Function()? isCancelled,
  }) async {
    const batchSize = 50;
    final result = <Contact>[];
    var totalProcessed = 0;
    var lastProcessedId = 0;

    dlog('\nStarting migration of $totalCount companies...');
    dlog('Batch size: $batchSize');

    while (totalProcessed < totalCount) {
      if (isCancelled?.call() ?? false) {
        dlog(
          '\nMigration cancelled after processing $totalProcessed companies',
        );
        throw ElbException(
          exceptionType: ElbExceptionType.conflict,
          message: 'Migration abgebrochen',
        );
      }

      dlog('\nProcessing batch:');
      dlog('Last processed ID: $lastProcessedId');
      dlog('Total processed so far: $totalProcessed/$totalCount');

      final contacts = await repository.migrateToContacts(
        offset: lastProcessedId,
        limit: batchSize,
      );

      if (contacts.isEmpty) {
        dlog('No more contacts to process, breaking loop');
        break;
      }

      dlog('Received ${contacts.length} contacts from batch');
      result.addAll(contacts);
      totalProcessed += contacts.length;
      onProgress?.call(totalProcessed / totalCount);

      // Update the last processed ID
      if (contacts.isNotEmpty) {
        final newLastProcessedId =
            contacts.last.migrationMatsCompanyId ?? lastProcessedId;
        dlog(
          'Updating last processed ID: $lastProcessedId -> $newLastProcessedId',
        );
        lastProcessedId = newLastProcessedId;
      }
    }

    dlog('\nMigration completed:');
    dlog('Total contacts processed: $totalProcessed');
    dlog('Final last processed ID: $lastProcessedId');

    return result;
  }

  /// Migrates all available companies to customers in batches
  Future<List<Customer>> migrateToCustomers({
    required int totalCount,
    void Function(double progress)? onProgress,
    bool Function()? isCancelled,
  }) async {
    const batchSize = 50;
    final result = <Customer>[];
    var totalProcessed = 0;
    var lastProcessedId = 0;

    dlog('\nStarting customer migration of $totalCount companies...');
    dlog('Batch size: $batchSize');

    while (totalProcessed < totalCount) {
      if (isCancelled?.call() ?? false) {
        dlog(
          '\nCustomer migration cancelled after processing $totalProcessed companies',
        );
        throw ElbException(
          exceptionType: ElbExceptionType.conflict,
          message: 'Migration abgebrochen',
        );
      }

      dlog('\nProcessing batch:');
      dlog('Last processed ID: $lastProcessedId');
      dlog('Total processed so far: $totalProcessed/$totalCount');

      final customers = await repository.migrateToCustomers(
        offset: lastProcessedId,
        limit: batchSize,
      );

      if (customers.isEmpty) {
        dlog('No more customers to process, breaking loop');
        break;
      }

      dlog('Received ${customers.length} customers from batch');
      result.addAll(customers);
      totalProcessed += customers.length;
      onProgress?.call(totalProcessed / totalCount);

      // Update the last processed ID to the last customer's contact ID
      if (customers.isNotEmpty) {
        final newLastProcessedId =
            customers.last.contact?.migrationMatsCompanyId ?? lastProcessedId;
        dlog(
          'Updating last processed ID: $lastProcessedId -> $newLastProcessedId',
        );
        lastProcessedId = newLastProcessedId;
      }
    }

    dlog('\nCustomer migration completed:');
    dlog('Total customers processed: $totalProcessed');
    dlog('Final last processed ID: $lastProcessedId');

    return result;
  }

  /// Assigns employees to companies based on matching accountId values
  Future<int> assignEmployeesToCompanies({
    required int availableCompanyCount,
    required int availablePersonCount,
    void Function(double)? onProgress,
    bool Function()? isCancelled,
  }) async {
    const batchSize = 50;
    var totalProcessed = 0;
    var lastProcessedId = 0;
    var totalAssigned = 0;

    dlog('\nStarting employee assignment...');
    dlog('Batch size: $batchSize');

    while (totalProcessed < availablePersonCount) {
      if (isCancelled?.call() ?? false) {
        throw ElbException(
          exceptionType: ElbExceptionType.conflict,
          message: 'Employee assignment cancelled by user',
        );
      }

      dlog('\nProcessing batch:');
      dlog('Last processed ID: $lastProcessedId');
      dlog('Total processed so far: $totalProcessed/$availablePersonCount');

      final (assignedCount, hasMoreContacts, newLastProcessedId) =
          await repository.assignEmployeesToCompanies(
        offset: lastProcessedId,
        limit: batchSize,
      );

      if (!hasMoreContacts) {
        dlog('No more contacts to process, breaking loop');
        break;
      }

      dlog('Assigned $assignedCount employees in this batch');
      totalAssigned += assignedCount;
      totalProcessed += batchSize;

      // Update the offset for next batch
      lastProcessedId = newLastProcessedId;
      onProgress?.call(totalProcessed / availablePersonCount);
    }

    dlog('\nEmployee assignment completed:');
    dlog('Total employees assigned: $totalAssigned');
    dlog('Final last processed ID: $lastProcessedId');

    return totalAssigned;
  }

  /// Creates departments from MigrationMatsPerson entries where isPerson = false
  Future<int> createDepartments({
    required int availableDepartmentCount,
    void Function(double)? onProgress,
    bool Function()? isCancelled,
  }) async {
    const batchSize = 50;
    var totalProcessed = 0;
    var lastProcessedId = 0;
    var totalCreated = 0;

    dlog('\nStarting department creation...');
    dlog('Batch size: $batchSize');

    while (totalProcessed < availableDepartmentCount) {
      if (isCancelled?.call() ?? false) {
        throw ElbException(
          exceptionType: ElbExceptionType.conflict,
          message: 'Department creation cancelled by user',
        );
      }

      dlog('\nProcessing batch:');
      dlog('Last processed ID: $lastProcessedId');
      dlog('Total processed so far: $totalProcessed/$availableDepartmentCount');

      final (createdCount, hasMoreDepartments, newLastProcessedId) =
          await repository.createDepartments(
        offset: lastProcessedId,
        limit: batchSize,
      );

      if (!hasMoreDepartments) {
        dlog('No more departments to process, breaking loop');
        break;
      }

      dlog('Created $createdCount departments in this batch');
      totalCreated += createdCount;
      totalProcessed += batchSize;

      // Update the offset for next batch
      lastProcessedId = newLastProcessedId;
      onProgress?.call(totalProcessed / availableDepartmentCount);
    }

    dlog('\nDepartment creation completed:');
    dlog('Total departments created: $totalCreated');
    dlog('Final last processed ID: $lastProcessedId');

    return totalCreated;
  }
}
