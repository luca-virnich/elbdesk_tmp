/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

enum MigrationMatsPersonField implements _i1.SerializableModel {
  idContact,
  nameFirst,
  nameLast,
  anrede,
  titel,
  department,
  position,
  anredeLang,
  idAccount,
  isPerson,
  primaryStreet1,
  primaryStreet2,
  primaryPostalCode,
  primaryCity,
  primaryCountry,
  primaryState,
  telefon1,
  telefon2,
  mobilTelefon,
  fax,
  email,
  status,
  wK,
  wWf,
  wFp,
  contactInfor,
  isMigrated,
  createdAt,
  createdBy,
  lastModifiedAt,
  lastModifiedBy,
  deletedAt,
  isDraft;

  static MigrationMatsPersonField fromJson(String name) {
    switch (name) {
      case 'idContact':
        return MigrationMatsPersonField.idContact;
      case 'nameFirst':
        return MigrationMatsPersonField.nameFirst;
      case 'nameLast':
        return MigrationMatsPersonField.nameLast;
      case 'anrede':
        return MigrationMatsPersonField.anrede;
      case 'titel':
        return MigrationMatsPersonField.titel;
      case 'department':
        return MigrationMatsPersonField.department;
      case 'position':
        return MigrationMatsPersonField.position;
      case 'anredeLang':
        return MigrationMatsPersonField.anredeLang;
      case 'idAccount':
        return MigrationMatsPersonField.idAccount;
      case 'isPerson':
        return MigrationMatsPersonField.isPerson;
      case 'primaryStreet1':
        return MigrationMatsPersonField.primaryStreet1;
      case 'primaryStreet2':
        return MigrationMatsPersonField.primaryStreet2;
      case 'primaryPostalCode':
        return MigrationMatsPersonField.primaryPostalCode;
      case 'primaryCity':
        return MigrationMatsPersonField.primaryCity;
      case 'primaryCountry':
        return MigrationMatsPersonField.primaryCountry;
      case 'primaryState':
        return MigrationMatsPersonField.primaryState;
      case 'telefon1':
        return MigrationMatsPersonField.telefon1;
      case 'telefon2':
        return MigrationMatsPersonField.telefon2;
      case 'mobilTelefon':
        return MigrationMatsPersonField.mobilTelefon;
      case 'fax':
        return MigrationMatsPersonField.fax;
      case 'email':
        return MigrationMatsPersonField.email;
      case 'status':
        return MigrationMatsPersonField.status;
      case 'wK':
        return MigrationMatsPersonField.wK;
      case 'wWf':
        return MigrationMatsPersonField.wWf;
      case 'wFp':
        return MigrationMatsPersonField.wFp;
      case 'contactInfor':
        return MigrationMatsPersonField.contactInfor;
      case 'isMigrated':
        return MigrationMatsPersonField.isMigrated;
      case 'createdAt':
        return MigrationMatsPersonField.createdAt;
      case 'createdBy':
        return MigrationMatsPersonField.createdBy;
      case 'lastModifiedAt':
        return MigrationMatsPersonField.lastModifiedAt;
      case 'lastModifiedBy':
        return MigrationMatsPersonField.lastModifiedBy;
      case 'deletedAt':
        return MigrationMatsPersonField.deletedAt;
      case 'isDraft':
        return MigrationMatsPersonField.isDraft;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "MigrationMatsPersonField"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
