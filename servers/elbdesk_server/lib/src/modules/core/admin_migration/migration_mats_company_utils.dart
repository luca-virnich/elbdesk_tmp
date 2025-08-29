import 'package:collection/collection.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

/// Utility class for MigrationMatsCompany operations
class MigrationMatsCompanyUtils {
  const MigrationMatsCompanyUtils._();

  /// Table type for MigrationMatsCompany
  static const tableType = TableType.migrationMatsCompany;

  /// Builds filter expression from filter
  static Expression<dynamic>? buildExpression(Filter? filter) {
    return buildFilterExpression<MigrationMatsCompanyDTOTable,
        MigrationMatsCompanyField>(
      table: MigrationMatsCompanyDTOTable(),
      filter: filter,
      enumFromString: (String fieldKey) => MigrationMatsCompanyField.values
          .firstWhereOrNull((e) => e.name == fieldKey),
      getDbField: (table, field) => dbFieldFromEnum(field)(table),
    );
  }

  /// Include pattern for MigrationMatsCompany relations
  static MigrationMatsCompanyDTOInclude get includeAll =>
      MigrationMatsCompanyDTO.include();

  /// Returns the column to order by based on the field
  static Column<dynamic> Function(MigrationMatsCompanyDTOTable) orderBy(
    MigrationMatsCompanyField? sortByField,
  ) {
    if (sortByField == null) {
      return dbFieldFromEnum(MigrationMatsCompanyField.createdAt);
    }
    return dbFieldFromEnum(sortByField);
  }

  /// Parses a phone number to match the validator pattern
  ///
  /// The pattern allows:
  /// - Optional + at start
  /// - Numbers, spaces, and hyphens
  /// - Must start with a number or +
  /// - Must contain at least 3 numbers
  static String parsePhoneNumber(String? phone) {
    if (phone == null || phone.trim().isEmpty) return '';

    // Remove all non-allowed characters except + at start
    final cleaned = phone.replaceAll(RegExp(r'[^\d\s\-\+]'), '');

    // Ensure it starts with + or a number
    if (!RegExp(r'^[\+\d]').hasMatch(cleaned)) return '';

    // Count numbers to ensure minimum length
    final numberCount = cleaned.replaceAll(RegExp(r'[^\d]'), '').length;
    if (numberCount < 3) return '';

    return cleaned;
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

  /// Helper method to find a company contact by accountId
  static Future<ContactDTO?> findCompanyByAccountId(
    Session session,
    String accountId, {
    Transaction? transaction,
  }) async {
    // First try to find the matching MigrationMatsCompany
    final matsCompany = await MigrationMatsCompanyDTO.db.findFirstRow(
      session,
      where: (t) => t.idAccount.equals(accountId),
      transaction: transaction,
    );

    if (matsCompany == null) {
      session.log('No MigrationMatsCompany found with idAccount: $accountId');
      return null;
    }

    // Then find the corresponding contact
    return ContactDTO.db.findFirstRow(
      session,
      where: (t) =>
          t.type.equals(ContactType.company.name) &
          t.migrationMatsCompanyId.equals(matsCompany.id),
      transaction: transaction,
    );
  }

  /// Maps the enum values to the corresponding database fields
  static Column<dynamic> Function(MigrationMatsCompanyDTOTable) dbFieldFromEnum(
    MigrationMatsCompanyField sortFieldEnum,
  ) {
    switch (sortFieldEnum) {
      case MigrationMatsCompanyField.idAccount:
        return (MigrationMatsCompanyDTOTable t) => t.idAccount;
      case MigrationMatsCompanyField.account:
        return (MigrationMatsCompanyDTOTable t) => t.account;
      case MigrationMatsCompanyField.account2:
        return (MigrationMatsCompanyDTOTable t) => t.account2;
      case MigrationMatsCompanyField.idAramis:
        return (MigrationMatsCompanyDTOTable t) => t.idAramis;
      case MigrationMatsCompanyField.idStaff:
        return (MigrationMatsCompanyDTOTable t) => t.idStaff;
      case MigrationMatsCompanyField.idAvVerantw:
        return (MigrationMatsCompanyDTOTable t) => t.idAvVerantw;
      case MigrationMatsCompanyField.standort:
        return (MigrationMatsCompanyDTOTable t) => t.standort;
      case MigrationMatsCompanyField.shippingStreet1:
        return (MigrationMatsCompanyDTOTable t) => t.shippingStreet1;
      case MigrationMatsCompanyField.shippingStreet2:
        return (MigrationMatsCompanyDTOTable t) => t.shippingStreet2;
      case MigrationMatsCompanyField.shippingPostalCode:
        return (MigrationMatsCompanyDTOTable t) => t.shippingPostalCode;
      case MigrationMatsCompanyField.shippingCity:
        return (MigrationMatsCompanyDTOTable t) => t.shippingCity;
      case MigrationMatsCompanyField.shippingCountry:
        return (MigrationMatsCompanyDTOTable t) => t.shippingCountry;
      case MigrationMatsCompanyField.shippingState:
        return (MigrationMatsCompanyDTOTable t) => t.shippingState;
      case MigrationMatsCompanyField.phone1:
        return (MigrationMatsCompanyDTOTable t) => t.phone1;
      case MigrationMatsCompanyField.phone2:
        return (MigrationMatsCompanyDTOTable t) => t.phone2;
      case MigrationMatsCompanyField.fax:
        return (MigrationMatsCompanyDTOTable t) => t.fax;
      case MigrationMatsCompanyField.email:
        return (MigrationMatsCompanyDTOTable t) => t.email;
      case MigrationMatsCompanyField.website:
        return (MigrationMatsCompanyDTOTable t) => t.website;
      case MigrationMatsCompanyField.isMigrated:
        return (MigrationMatsCompanyDTOTable t) => t.isMigrated;
      case MigrationMatsCompanyField.createdAt:
        return (MigrationMatsCompanyDTOTable t) => t.createdAt;
      case MigrationMatsCompanyField.createdBy:
        return (MigrationMatsCompanyDTOTable t) => t.createdById;
      case MigrationMatsCompanyField.lastModifiedAt:
        return (MigrationMatsCompanyDTOTable t) => t.lastModifiedAt;
      case MigrationMatsCompanyField.lastModifiedBy:
        return (MigrationMatsCompanyDTOTable t) => t.lastModifiedById;
      case MigrationMatsCompanyField.deletedAt:
        return (MigrationMatsCompanyDTOTable t) => t.deletedAt;
      case MigrationMatsCompanyField.isDraft:
        return (MigrationMatsCompanyDTOTable t) => t.isDraft;
    }
  }
}
