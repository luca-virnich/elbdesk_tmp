import 'package:collection/collection.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

/// Utility class for MigrationMatsPerson operations
class MigrationMatsPersonUtils {
  const MigrationMatsPersonUtils._();

  /// Table type for MigrationMatsPerson
  static const tableType = TableType.migrationMatsPerson;

  /// Builds filter expression from filter
  static Expression<dynamic>? buildExpression(Filter? filter) {
    return buildFilterExpression<MigrationMatsPersonDTOTable,
        MigrationMatsPersonField>(
      table: MigrationMatsPersonDTOTable(),
      filter: filter,
      enumFromString: (String fieldKey) => MigrationMatsPersonField.values
          .firstWhereOrNull((e) => e.name == fieldKey),
      getDbField: (table, field) => dbFieldFromEnum(field)(table),
    );
  }

  /// Include pattern for MigrationMatsPerson relations
  static MigrationMatsPersonDTOInclude get includeAll =>
      MigrationMatsPersonDTO.include();

  /// Returns the column to order by based on the field
  static Column<dynamic> Function(MigrationMatsPersonDTOTable) orderBy(
    MigrationMatsPersonField? sortByField,
  ) {
    if (sortByField == null) {
      return dbFieldFromEnum(MigrationMatsPersonField.createdAt);
    }
    return dbFieldFromEnum(sortByField);
  }

  /// Maps MATS salutation to SalutationCode
  static Future<SalutationCodeDTO?> mapSalutation(
    Session session,
    String? anredeLang,
    String? anrede,
    List<SalutationCodeDTO> salutationCodes,
  ) async {
    if (anredeLang == null && anrede == null) return null;
    if (salutationCodes.isEmpty) return null;

    // Clean up the input
    final cleanAnredeLang = (anredeLang ?? '')
        .toLowerCase()
        .trim()
        .replaceAll('"', '')
        .replaceAll(',', '')
        .replaceAll('.', '');
    final cleanAnrede = (anrede ?? '')
        .toLowerCase()
        .trim()
        .replaceAll('"', '')
        .replaceAll(',', '')
        .replaceAll('.', '');

    // Try to find a match based on anredeLang first
    for (final code in salutationCodes) {
      final description = code.description.toLowerCase();
      if (cleanAnredeLang.contains(description)) {
        return code;
      }
    }

    // If no match found, try with anrede
    for (final code in salutationCodes) {
      final description = code.description.toLowerCase();
      if (cleanAnrede.contains(description)) {
        return code;
      }
    }

    // Helper function to find salutation code
    SalutationCodeDTO? findSalutationCode(
      bool Function(SalutationCodeDTO code) matcher,
    ) {
      return salutationCodes.firstWhereOrNull(matcher);
    }

    // Try to infer from patterns
    // Formal male
    if (cleanAnredeLang.contains('sehr geehrter herr') ||
        cleanAnredeLang.contains('dear mr') ||
        cleanAnredeLang.contains('dear sir') ||
        cleanAnrede.contains('herr') ||
        cleanAnrede.contains('mr') ||
        cleanAnredeLang.contains('sehr geehrter')) {
      return findSalutationCode((code) {
        final desc = code.description.toLowerCase();
        return desc.contains('herr') || desc.contains('mr');
      });
    }

    // Formal female
    if (cleanAnredeLang.contains('sehr geehrte frau') ||
        cleanAnredeLang.contains('dear mrs') ||
        cleanAnredeLang.contains('dear ms') ||
        cleanAnredeLang.contains('dear madam') ||
        cleanAnrede.contains('frau') ||
        cleanAnrede.contains('mrs') ||
        cleanAnrede.contains('ms') ||
        cleanAnredeLang.contains('sehr geehrte')) {
      return findSalutationCode((code) {
        final desc = code.description.toLowerCase();
        return desc.contains('frau') ||
            desc.contains('mrs') ||
            desc.contains('ms');
      });
    }

    // Informal male
    if (cleanAnredeLang.contains('lieber') ||
        cleanAnredeLang.contains('dear') ||
        cleanAnredeLang.contains('hallo') ||
        cleanAnredeLang.contains('hi')) {
      return findSalutationCode((code) {
        final desc = code.description.toLowerCase();
        return (desc.contains('herr') || desc.contains('mr')) &&
            (desc.contains('informell') || desc.contains('informal'));
      });
    }

    // Informal female
    if (cleanAnredeLang.contains('liebe') ||
        cleanAnredeLang.contains('dear') ||
        cleanAnredeLang.contains('hallo') ||
        cleanAnredeLang.contains('hi')) {
      return findSalutationCode((code) {
        final desc = code.description.toLowerCase();
        return (desc.contains('frau') ||
                desc.contains('mrs') ||
                desc.contains('ms')) &&
            (desc.contains('informell') || desc.contains('informal'));
      });
    }

    // Simple forms
    if (cleanAnrede == 'mr' || cleanAnrede == 'herr') {
      return findSalutationCode((code) {
        final desc = code.description.toLowerCase();
        return desc.contains('herr') || desc.contains('mr');
      });
    }

    if (cleanAnrede == 'mrs' || cleanAnrede == 'ms' || cleanAnrede == 'frau') {
      return findSalutationCode((code) {
        final desc = code.description.toLowerCase();
        return desc.contains('frau') ||
            desc.contains('mrs') ||
            desc.contains('ms');
      });
    }

    return null;
  }

  /// Maps language based on salutation hints
  static Future<LanguageCodeDTO?> mapLanguage(
    Session session,
    String? anredeLang,
    String? anrede,
    List<LanguageCodeDTO> languageCodes,
  ) async {
    if (anredeLang == null && anrede == null) return null;
    if (languageCodes.isEmpty) return null;

    // Clean up the input
    final cleanAnredeLang = (anredeLang ?? '')
        .toLowerCase()
        .trim()
        .replaceAll('"', '')
        .replaceAll(',', '')
        .replaceAll('.', '');
    final cleanAnrede = (anrede ?? '')
        .toLowerCase()
        .trim()
        .replaceAll('"', '')
        .replaceAll(',', '')
        .replaceAll('.', '');

    // German salutation patterns
    final germanIndicators = [
      'sehr geehrte',
      'sehr geehrter',
      'lieber',
      'liebe',
      'herr',
      'frau',
    ];

    // English salutation patterns
    final englishIndicators = [
      'dear',
      'mr',
      'mrs',
      'ms',
    ];

    // Check for German indicators
    for (final indicator in germanIndicators) {
      if (cleanAnredeLang.contains(indicator) ||
          cleanAnrede.contains(indicator)) {
        return languageCodes.firstWhereOrNull(
          (code) => code.code == 'DEU',
        );
      }
    }

    // Check for English indicators
    for (final indicator in englishIndicators) {
      if (cleanAnredeLang.contains(indicator) ||
          cleanAnrede.contains(indicator)) {
        // Default to British English (ENG) if no specific variant is indicated
        return languageCodes.firstWhereOrNull(
          (code) => code.code == 'ENG',
        );
      }
    }

    return null;
  }

  /// Maps country from MATS data to CountryCode
  static Future<CountryCodeDTO?> mapCountry(
    Session session,
    String? country,
    List<CountryCodeDTO> countryCodes,
  ) async {
    if (country == null || country.trim().isEmpty) return null;
    if (countryCodes.isEmpty) return null;

    final cleanCountry = country.toLowerCase().trim();

    // Try exact match with country name or code
    return countryCodes.firstWhereOrNull(
      (code) =>
          code.countryRegionName.toLowerCase() == cleanCountry ||
          code.code.toLowerCase() == cleanCountry,
    );
  }

  /// Maps the enum values to the corresponding database fields
  static Column<dynamic> Function(MigrationMatsPersonDTOTable) dbFieldFromEnum(
    MigrationMatsPersonField sortFieldEnum,
  ) {
    switch (sortFieldEnum) {
      case MigrationMatsPersonField.idContact:
        return (MigrationMatsPersonDTOTable t) => t.idContact;
      case MigrationMatsPersonField.nameFirst:
        return (MigrationMatsPersonDTOTable t) => t.nameFirst;
      case MigrationMatsPersonField.nameLast:
        return (MigrationMatsPersonDTOTable t) => t.nameLast;
      case MigrationMatsPersonField.anrede:
        return (MigrationMatsPersonDTOTable t) => t.anrede;
      case MigrationMatsPersonField.titel:
        return (MigrationMatsPersonDTOTable t) => t.titel;
      case MigrationMatsPersonField.department:
        return (MigrationMatsPersonDTOTable t) => t.department;
      case MigrationMatsPersonField.position:
        return (MigrationMatsPersonDTOTable t) => t.position;
      case MigrationMatsPersonField.anredeLang:
        return (MigrationMatsPersonDTOTable t) => t.anredeLang;
      case MigrationMatsPersonField.idAccount:
        return (MigrationMatsPersonDTOTable t) => t.idAccount;
      case MigrationMatsPersonField.isPerson:
        return (MigrationMatsPersonDTOTable t) => t.isPerson;
      case MigrationMatsPersonField.primaryStreet1:
        return (MigrationMatsPersonDTOTable t) => t.primaryStreet1;
      case MigrationMatsPersonField.primaryStreet2:
        return (MigrationMatsPersonDTOTable t) => t.primaryStreet2;
      case MigrationMatsPersonField.primaryPostalCode:
        return (MigrationMatsPersonDTOTable t) => t.primaryPostalCode;
      case MigrationMatsPersonField.primaryCity:
        return (MigrationMatsPersonDTOTable t) => t.primaryCity;
      case MigrationMatsPersonField.primaryCountry:
        return (MigrationMatsPersonDTOTable t) => t.primaryCountry;
      case MigrationMatsPersonField.primaryState:
        return (MigrationMatsPersonDTOTable t) => t.primaryState;
      case MigrationMatsPersonField.telefon1:
        return (MigrationMatsPersonDTOTable t) => t.telefon1;
      case MigrationMatsPersonField.telefon2:
        return (MigrationMatsPersonDTOTable t) => t.telefon2;
      case MigrationMatsPersonField.mobilTelefon:
        return (MigrationMatsPersonDTOTable t) => t.mobilTelefon;
      case MigrationMatsPersonField.fax:
        return (MigrationMatsPersonDTOTable t) => t.fax;
      case MigrationMatsPersonField.email:
        return (MigrationMatsPersonDTOTable t) => t.email;
      case MigrationMatsPersonField.status:
        return (MigrationMatsPersonDTOTable t) => t.status;
      case MigrationMatsPersonField.wK:
        return (MigrationMatsPersonDTOTable t) => t.wK;
      case MigrationMatsPersonField.wWf:
        return (MigrationMatsPersonDTOTable t) => t.wWf;
      case MigrationMatsPersonField.wFp:
        return (MigrationMatsPersonDTOTable t) => t.wFp;
      case MigrationMatsPersonField.contactInfor:
        return (MigrationMatsPersonDTOTable t) => t.contactInfor;
      case MigrationMatsPersonField.isMigrated:
        return (MigrationMatsPersonDTOTable t) => t.isMigrated;
      case MigrationMatsPersonField.createdAt:
        return (MigrationMatsPersonDTOTable t) => t.createdAt;
      case MigrationMatsPersonField.createdBy:
        return (MigrationMatsPersonDTOTable t) => t.createdById;
      case MigrationMatsPersonField.lastModifiedAt:
        return (MigrationMatsPersonDTOTable t) => t.lastModifiedAt;
      case MigrationMatsPersonField.lastModifiedBy:
        return (MigrationMatsPersonDTOTable t) => t.lastModifiedById;
      case MigrationMatsPersonField.deletedAt:
        return (MigrationMatsPersonDTOTable t) => t.deletedAt;
      case MigrationMatsPersonField.isDraft:
        return (MigrationMatsPersonDTOTable t) => t.isDraft;
    }
  }
}
