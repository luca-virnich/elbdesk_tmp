// import 'dart:io';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:project_core/src/admin_migration/mats_person/models/migration_mats_person.dart';
import 'package:project_core/src/admin_migration/mats_person/repositories/migration_mats_person_repository.dart';

/// Controller for managing migration mats person data
class MigrationMatsPersonController {
  /// Migration Mats Person Controller constructor
  const MigrationMatsPersonController({
    required this.repository,
  });

  /// Migration Mats Person Repository
  final MigrationMatsPersonRepository repository;

  /// Maps CSV headers to model fields
  static const _headerMapping = {
    'ID_Contact': 'idContact',
    'Name_First': 'nameFirst',
    'Name_Last': 'nameLast',
    'Anrede': 'anrede',
    'Titel': 'titel',
    'Department': 'department',
    'Position': 'position',
    'Anrede_lang': 'anredeLang',
    'id_account': 'idAccount',
    'Primary_Street1': 'primaryStreet1',
    'Primary_Street2': 'primaryStreet2',
    'Primary_Postal_Code': 'primaryPostalCode',
    'Primary_City': 'primaryCity',
    'Primary_Country': 'primaryCountry',
    'Primary_State': 'primaryState',
    'Telefon1': 'telefon1',
    'Telefon2': 'telefon2',
    'Mobil-Telefon': 'mobilTelefon',
    'Fax': 'fax',
    'Email': 'email',
    'Status': 'status',
    'W_K': 'wK',
    'W_WF': 'wWf',
    'W_FP': 'wFp',
    'contact_infor': 'contactInfor',
    'Person': 'isPerson',
  };

  /// Normalizes a string value
  /// (only trims whitespace and removes null characters)
  String _sanitizeString(dynamic value) {
    if (value == null) return '';
    // Remove null characters and trim whitespace
    return value.toString().replaceAll('\u0000', '').trim();
  }

  /// Normalizes contact data
  Map<String, dynamic> _normalizeContactData(Map<String, dynamic> values) {
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

  /// Parses a CSV file and returns a list of MigrationMatsPerson objects
  Future<List<MigrationMatsPerson>> parseCsv(XFile file) async {
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
      throw Exception('CSV file is empty');
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
      dlog('\nExpected headers:');
      for (final header in _headerMapping.keys) {
        dlog('- "$header"');
      }
      dlog('\nMissing headers: ${missingHeaders.join(', ')}');
      throw Exception('Missing required headers: ${missingHeaders.join(', ')}');
    }

    // Process all contacts (skip header line)
    final contactLines = lines.sublist(1);
    final totalContacts = contactLines.length;
    dlog('Starting import of $totalContacts contacts...');

    final result = <MigrationMatsPerson>[];
    var skippedInvalidLength = 0;
    var skippedErrors = 0;

    for (var i = 0; i < contactLines.length; i++) {
      final line = contactLines[i].trim();

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

        // Debug: Show first few rows
        if (i < 3) {
          dlog('Row ${i + 1} parsed: ${row.length} fields');
          dlog('Row content: $row');
        }

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

        // Convert Person field to boolean (1 = true, 0 = false)
        final personValue = values['isPerson']?.toString().trim();
        final isPerson = personValue == '1';
        values['isPerson'] = isPerson; // Store as boolean, not string

        // Normalize the data
        final normalizedValues = _normalizeContactData(values);

        // Create proper JSON structure
        final json = {
          'data': normalizedValues,
          'isMigrated': false,
          'meta': {
            'createdAt': DateTime.now().toIso8601String(),
            'isDraft': false,
          },
        };
        result.add(MigrationMatsPerson.fromJson(json));

        // Print progress every 500 contacts
        if (i % 500 == 0) {
          final percentage = ((i + 1) / totalContacts * 100).toStringAsFixed(1);
          dlog('Progress: $percentage% (${i + 1}/$totalContacts)');
        }
      } catch (e) {
        skippedErrors++;
        // Only log the first few errors to avoid spam
        if (skippedErrors <= 3) {
          dlog('\nError processing row ${i + 1}: $e');
          dlog('Row content: $line');
        } else if (skippedErrors == 4) {
          dlog('\n... (suppressing further error logs)');
        }
        continue;
      }
    }

    dlog('\nParsing Summary:');
    dlog('Total rows in file: $totalContacts');
    dlog('Successfully parsed: ${result.length}');
    dlog('Skipped due to invalid length: $skippedInvalidLength');
    dlog('Skipped due to errors: $skippedErrors');

    if (result.isEmpty) {
      throw Exception('No valid contacts were found in the CSV file');
    }

    dlog('\nSuccessfully parsed ${result.length} contacts');
    return result;
  }

  /// Imports a list of MigrationMatsPerson objects
  Future<void> import(
    List<MigrationMatsPerson> persons, {
    void Function(double progress)? onProgress,
    bool Function()? isCancelled,
  }) async {
    const batchSize = 50;
    var totalImported = 0;
    var totalFailed = 0;

    dlog('\nStarting import of ${persons.length} contacts...');

    for (var i = 0; i < persons.length; i += batchSize) {
      // Check for cancellation before processing each batch
      if (isCancelled?.call() ?? false) {
        throw Exception('Import abgebrochen');
      }

      final end =
          (i + batchSize < persons.length) ? i + batchSize : persons.length;
      final batch = persons.sublist(i, end);

      try {
        // Try importing the entire batch first
        await repository.import(batch);
        totalImported += batch.length;
        onProgress?.call((i + batch.length) / persons.length);
      } catch (e) {
        // If batch fails, try each contact individually
        for (var j = 0; j < batch.length; j++) {
          // Check for cancellation before processing each contact
          if (isCancelled?.call() ?? false) {
            throw Exception('Import abgebrochen');
          }

          try {
            // Print the full data for the first failed contact
            if (totalFailed == 0) {
              dlog('\nFirst failed contact data:');
              dlog('JSON: ${batch[j].toJson()}');
            }

            await repository.import([batch[j]]);
            totalImported++;
            onProgress?.call((i + j + 1) / persons.length);
          } catch (e) {
            totalFailed++;
            // Only print failed contacts
            dlog('\nFailed contact:');
            dlog('ID: ${batch[j].data.idContact}');
            dlog('Name: ${batch[j].data.nameFirst} ${batch[j].data.nameLast}');
            dlog('Error: $e');
          }
        }
      }
    }

    dlog('\nImport Summary:');
    dlog('Total contacts to import: ${persons.length}');
    dlog('Successfully imported: $totalImported');
    dlog('Failed to import: $totalFailed');

    if (totalFailed > 0) {
      throw Exception('Import completed with $totalFailed failed contacts');
    }
  }

  /// Migrates all available persons to contacts in batches
  Future<List<Contact>> migrateToContacts({
    required int totalCount,
    void Function(double progress)? onProgress,
    bool Function()? isCancelled,
  }) async {
    const batchSize = 50;
    final result = <Contact>[];
    var totalProcessed = 0;
    var lastProcessedId = 0;

    dlog('\nStarting migration of $totalCount contacts...');
    dlog('Batch size: $batchSize');

    while (totalProcessed < totalCount) {
      if (isCancelled?.call() ?? false) {
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

      // Update the last processed ID to the last contact's ID
      if (contacts.isNotEmpty) {
        final newLastProcessedId =
            contacts.last.migrationMatsPersonId ?? lastProcessedId;
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
}
