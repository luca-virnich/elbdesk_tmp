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

enum MigrationMatsCompanyField implements _i1.SerializableModel {
  idAccount,
  account,
  account2,
  idAramis,
  idStaff,
  idAvVerantw,
  standort,
  shippingStreet1,
  shippingStreet2,
  shippingPostalCode,
  shippingCity,
  shippingCountry,
  shippingState,
  phone1,
  phone2,
  fax,
  email,
  website,
  isMigrated,
  createdAt,
  createdBy,
  lastModifiedAt,
  lastModifiedBy,
  deletedAt,
  isDraft;

  static MigrationMatsCompanyField fromJson(String name) {
    switch (name) {
      case 'idAccount':
        return MigrationMatsCompanyField.idAccount;
      case 'account':
        return MigrationMatsCompanyField.account;
      case 'account2':
        return MigrationMatsCompanyField.account2;
      case 'idAramis':
        return MigrationMatsCompanyField.idAramis;
      case 'idStaff':
        return MigrationMatsCompanyField.idStaff;
      case 'idAvVerantw':
        return MigrationMatsCompanyField.idAvVerantw;
      case 'standort':
        return MigrationMatsCompanyField.standort;
      case 'shippingStreet1':
        return MigrationMatsCompanyField.shippingStreet1;
      case 'shippingStreet2':
        return MigrationMatsCompanyField.shippingStreet2;
      case 'shippingPostalCode':
        return MigrationMatsCompanyField.shippingPostalCode;
      case 'shippingCity':
        return MigrationMatsCompanyField.shippingCity;
      case 'shippingCountry':
        return MigrationMatsCompanyField.shippingCountry;
      case 'shippingState':
        return MigrationMatsCompanyField.shippingState;
      case 'phone1':
        return MigrationMatsCompanyField.phone1;
      case 'phone2':
        return MigrationMatsCompanyField.phone2;
      case 'fax':
        return MigrationMatsCompanyField.fax;
      case 'email':
        return MigrationMatsCompanyField.email;
      case 'website':
        return MigrationMatsCompanyField.website;
      case 'isMigrated':
        return MigrationMatsCompanyField.isMigrated;
      case 'createdAt':
        return MigrationMatsCompanyField.createdAt;
      case 'createdBy':
        return MigrationMatsCompanyField.createdBy;
      case 'lastModifiedAt':
        return MigrationMatsCompanyField.lastModifiedAt;
      case 'lastModifiedBy':
        return MigrationMatsCompanyField.lastModifiedBy;
      case 'deletedAt':
        return MigrationMatsCompanyField.deletedAt;
      case 'isDraft':
        return MigrationMatsCompanyField.isDraft;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "MigrationMatsCompanyField"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
