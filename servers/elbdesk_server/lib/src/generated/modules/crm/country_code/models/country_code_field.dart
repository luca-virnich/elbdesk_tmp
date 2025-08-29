/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

enum CountryCodeField implements _i1.SerializableModel {
  id,
  code,
  countryRegionName,
  isoCode,
  numericCode,
  addressFormat,
  contactAddressFormat,
  federalRegion,
  euCode,
  intrastatCode,
  taxScheme,
  showState,
  isPrimary,
  lastModifiedAt,
  lastModifiedBy,
  createdAt,
  createdBy,
  deletedAt,
  isDraft;

  static CountryCodeField fromJson(String name) {
    switch (name) {
      case 'id':
        return CountryCodeField.id;
      case 'code':
        return CountryCodeField.code;
      case 'countryRegionName':
        return CountryCodeField.countryRegionName;
      case 'isoCode':
        return CountryCodeField.isoCode;
      case 'numericCode':
        return CountryCodeField.numericCode;
      case 'addressFormat':
        return CountryCodeField.addressFormat;
      case 'contactAddressFormat':
        return CountryCodeField.contactAddressFormat;
      case 'federalRegion':
        return CountryCodeField.federalRegion;
      case 'euCode':
        return CountryCodeField.euCode;
      case 'intrastatCode':
        return CountryCodeField.intrastatCode;
      case 'taxScheme':
        return CountryCodeField.taxScheme;
      case 'showState':
        return CountryCodeField.showState;
      case 'isPrimary':
        return CountryCodeField.isPrimary;
      case 'lastModifiedAt':
        return CountryCodeField.lastModifiedAt;
      case 'lastModifiedBy':
        return CountryCodeField.lastModifiedBy;
      case 'createdAt':
        return CountryCodeField.createdAt;
      case 'createdBy':
        return CountryCodeField.createdBy;
      case 'deletedAt':
        return CountryCodeField.deletedAt;
      case 'isDraft':
        return CountryCodeField.isDraft;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "CountryCodeField"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
