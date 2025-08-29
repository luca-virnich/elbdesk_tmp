import 'package:collection/collection.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class CountryCodeUtils {
  const CountryCodeUtils._();

  static const tableType = TableType.countryCode;

  static Expression<dynamic>? buildExpression(Filter? filter) {
    final expression =
        buildFilterExpression<CountryCodeDTOTable, CountryCodeField>(
      table: CountryCodeDTOTable(),
      filter: filter,
      enumFromString: (String fieldKey) =>
          CountryCodeField.values.firstWhereOrNull((e) => e.name == fieldKey),
      getDbField: (table, field) => dbFieldFromEnum(field)(table),
    );
    return expression;
  }

  static Column<dynamic> Function(CountryCodeDTOTable) orderBy(
    CountryCodeField? sortField,
  ) {
    if (sortField == null) {
      return dbFieldFromEnum(CountryCodeField.countryRegionName);
    }
    return dbFieldFromEnum(sortField);
  }

  static CountryCodeDTO initialCountryCode({
    required int userId,
    required String sessionId,
    required CountryCodeDTO entity,
    required bool release,
  }) {
    return CountryCodeDTO(
      isPrimary: entity.isPrimary,
      code: entity.code,
      countryRegionName: entity.countryRegionName,
      isoCode: entity.isoCode,
      numericCode: entity.numericCode,
      addressFormat: entity.addressFormat,
      contactAddressFormat: entity.contactAddressFormat,
      showState: entity.showState,
      federalRegion: entity.federalRegion,
      euCode: entity.euCode,
      intrastatCode: entity.intrastatCode,
      taxScheme: entity.taxScheme,
      createdAt: DateTime.now(),
      isDraft: false,
      createdById: userId,
      editingSince: null,
      editingById: null,
      deletedAt: null,
      deletedById: null,
      lastModifiedAt: null,
      lastModifiedById: null,
      editingSession: release ? null : sessionId,
    );
  }

  static Column<dynamic> Function(CountryCodeDTOTable) dbFieldFromEnum(
    CountryCodeField sortFieldEnum,
  ) {
    switch (sortFieldEnum) {
      case CountryCodeField.code:
        return (CountryCodeDTOTable t) => t.code;
      case CountryCodeField.id:
        return (CountryCodeDTOTable t) => t.id;
      case CountryCodeField.showState:
        return (CountryCodeDTOTable t) => t.showState;
      case CountryCodeField.isoCode:
        return (CountryCodeDTOTable t) => t.isoCode;
      case CountryCodeField.addressFormat:
        return (CountryCodeDTOTable t) => t.addressFormat;
      case CountryCodeField.isPrimary:
        return (CountryCodeDTOTable t) => t.isPrimary;
      case CountryCodeField.numericCode:
        return (CountryCodeDTOTable t) => t.numericCode;
      case CountryCodeField.contactAddressFormat:
        return (CountryCodeDTOTable t) => t.contactAddressFormat;
      case CountryCodeField.federalRegion:
        return (CountryCodeDTOTable t) => t.federalRegion;
      case CountryCodeField.euCode:
        return (CountryCodeDTOTable t) => t.euCode;
      case CountryCodeField.intrastatCode:
        return (CountryCodeDTOTable t) => t.intrastatCode;
      case CountryCodeField.taxScheme:
        return (CountryCodeDTOTable t) => t.taxScheme;
      case CountryCodeField.countryRegionName:
        return (CountryCodeDTOTable t) => t.countryRegionName;
      case CountryCodeField.lastModifiedBy:
        return (CountryCodeDTOTable t) => t.lastModifiedById;
      case CountryCodeField.lastModifiedAt:
        return (CountryCodeDTOTable t) => t.lastModifiedAt;
      case CountryCodeField.createdAt:
        return (CountryCodeDTOTable t) => t.createdAt;
      case CountryCodeField.createdBy:
        return (CountryCodeDTOTable t) => t.createdById;
      case CountryCodeField.deletedAt:
        return (CountryCodeDTOTable t) => t.deletedAt;
      case CountryCodeField.isDraft:
        return (CountryCodeDTOTable t) => t.isDraft;
    }
  }
}
