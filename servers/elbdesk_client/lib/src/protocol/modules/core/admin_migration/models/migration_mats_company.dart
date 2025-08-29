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

abstract class MigrationMatsCompanyDTO implements _i1.SerializableModel {
  MigrationMatsCompanyDTO._({
    this.id,
    this.idAccount,
    this.account,
    this.account2,
    this.idAramis,
    this.idStaff,
    this.idAvVerantw,
    this.standort,
    this.shippingStreet1,
    this.shippingStreet2,
    this.shippingPostalCode,
    this.shippingCity,
    this.shippingCountry,
    this.shippingState,
    this.phone1,
    this.phone2,
    this.fax,
    this.email,
    this.website,
    required this.isMigrated,
    required this.createdAt,
    this.createdById,
    this.lastModifiedAt,
    this.lastModifiedById,
    this.deletedAt,
    this.deletedById,
    this.editingById,
    this.editingSince,
    required this.isDraft,
    this.editingSession,
  });

  factory MigrationMatsCompanyDTO({
    int? id,
    String? idAccount,
    String? account,
    String? account2,
    String? idAramis,
    String? idStaff,
    String? idAvVerantw,
    String? standort,
    String? shippingStreet1,
    String? shippingStreet2,
    String? shippingPostalCode,
    String? shippingCity,
    String? shippingCountry,
    String? shippingState,
    String? phone1,
    String? phone2,
    String? fax,
    String? email,
    String? website,
    required bool isMigrated,
    required DateTime createdAt,
    int? createdById,
    DateTime? lastModifiedAt,
    int? lastModifiedById,
    DateTime? deletedAt,
    int? deletedById,
    int? editingById,
    DateTime? editingSince,
    required bool isDraft,
    String? editingSession,
  }) = _MigrationMatsCompanyDTOImpl;

  factory MigrationMatsCompanyDTO.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return MigrationMatsCompanyDTO(
      id: jsonSerialization['id'] as int?,
      idAccount: jsonSerialization['idAccount'] as String?,
      account: jsonSerialization['account'] as String?,
      account2: jsonSerialization['account2'] as String?,
      idAramis: jsonSerialization['idAramis'] as String?,
      idStaff: jsonSerialization['idStaff'] as String?,
      idAvVerantw: jsonSerialization['idAvVerantw'] as String?,
      standort: jsonSerialization['standort'] as String?,
      shippingStreet1: jsonSerialization['shippingStreet1'] as String?,
      shippingStreet2: jsonSerialization['shippingStreet2'] as String?,
      shippingPostalCode: jsonSerialization['shippingPostalCode'] as String?,
      shippingCity: jsonSerialization['shippingCity'] as String?,
      shippingCountry: jsonSerialization['shippingCountry'] as String?,
      shippingState: jsonSerialization['shippingState'] as String?,
      phone1: jsonSerialization['phone1'] as String?,
      phone2: jsonSerialization['phone2'] as String?,
      fax: jsonSerialization['fax'] as String?,
      email: jsonSerialization['email'] as String?,
      website: jsonSerialization['website'] as String?,
      isMigrated: jsonSerialization['isMigrated'] as bool,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      createdById: jsonSerialization['createdById'] as int?,
      lastModifiedAt: jsonSerialization['lastModifiedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastModifiedAt']),
      lastModifiedById: jsonSerialization['lastModifiedById'] as int?,
      deletedAt: jsonSerialization['deletedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['deletedAt']),
      deletedById: jsonSerialization['deletedById'] as int?,
      editingById: jsonSerialization['editingById'] as int?,
      editingSince: jsonSerialization['editingSince'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['editingSince']),
      isDraft: jsonSerialization['isDraft'] as bool,
      editingSession: jsonSerialization['editingSession'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String? idAccount;

  String? account;

  String? account2;

  String? idAramis;

  String? idStaff;

  String? idAvVerantw;

  String? standort;

  String? shippingStreet1;

  String? shippingStreet2;

  String? shippingPostalCode;

  String? shippingCity;

  String? shippingCountry;

  String? shippingState;

  String? phone1;

  String? phone2;

  String? fax;

  String? email;

  String? website;

  bool isMigrated;

  DateTime createdAt;

  int? createdById;

  DateTime? lastModifiedAt;

  int? lastModifiedById;

  DateTime? deletedAt;

  int? deletedById;

  int? editingById;

  DateTime? editingSince;

  bool isDraft;

  String? editingSession;

  /// Returns a shallow copy of this [MigrationMatsCompanyDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MigrationMatsCompanyDTO copyWith({
    int? id,
    String? idAccount,
    String? account,
    String? account2,
    String? idAramis,
    String? idStaff,
    String? idAvVerantw,
    String? standort,
    String? shippingStreet1,
    String? shippingStreet2,
    String? shippingPostalCode,
    String? shippingCity,
    String? shippingCountry,
    String? shippingState,
    String? phone1,
    String? phone2,
    String? fax,
    String? email,
    String? website,
    bool? isMigrated,
    DateTime? createdAt,
    int? createdById,
    DateTime? lastModifiedAt,
    int? lastModifiedById,
    DateTime? deletedAt,
    int? deletedById,
    int? editingById,
    DateTime? editingSince,
    bool? isDraft,
    String? editingSession,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (idAccount != null) 'idAccount': idAccount,
      if (account != null) 'account': account,
      if (account2 != null) 'account2': account2,
      if (idAramis != null) 'idAramis': idAramis,
      if (idStaff != null) 'idStaff': idStaff,
      if (idAvVerantw != null) 'idAvVerantw': idAvVerantw,
      if (standort != null) 'standort': standort,
      if (shippingStreet1 != null) 'shippingStreet1': shippingStreet1,
      if (shippingStreet2 != null) 'shippingStreet2': shippingStreet2,
      if (shippingPostalCode != null) 'shippingPostalCode': shippingPostalCode,
      if (shippingCity != null) 'shippingCity': shippingCity,
      if (shippingCountry != null) 'shippingCountry': shippingCountry,
      if (shippingState != null) 'shippingState': shippingState,
      if (phone1 != null) 'phone1': phone1,
      if (phone2 != null) 'phone2': phone2,
      if (fax != null) 'fax': fax,
      if (email != null) 'email': email,
      if (website != null) 'website': website,
      'isMigrated': isMigrated,
      'createdAt': createdAt.toJson(),
      if (createdById != null) 'createdById': createdById,
      if (lastModifiedAt != null) 'lastModifiedAt': lastModifiedAt?.toJson(),
      if (lastModifiedById != null) 'lastModifiedById': lastModifiedById,
      if (deletedAt != null) 'deletedAt': deletedAt?.toJson(),
      if (deletedById != null) 'deletedById': deletedById,
      if (editingById != null) 'editingById': editingById,
      if (editingSince != null) 'editingSince': editingSince?.toJson(),
      'isDraft': isDraft,
      if (editingSession != null) 'editingSession': editingSession,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MigrationMatsCompanyDTOImpl extends MigrationMatsCompanyDTO {
  _MigrationMatsCompanyDTOImpl({
    int? id,
    String? idAccount,
    String? account,
    String? account2,
    String? idAramis,
    String? idStaff,
    String? idAvVerantw,
    String? standort,
    String? shippingStreet1,
    String? shippingStreet2,
    String? shippingPostalCode,
    String? shippingCity,
    String? shippingCountry,
    String? shippingState,
    String? phone1,
    String? phone2,
    String? fax,
    String? email,
    String? website,
    required bool isMigrated,
    required DateTime createdAt,
    int? createdById,
    DateTime? lastModifiedAt,
    int? lastModifiedById,
    DateTime? deletedAt,
    int? deletedById,
    int? editingById,
    DateTime? editingSince,
    required bool isDraft,
    String? editingSession,
  }) : super._(
          id: id,
          idAccount: idAccount,
          account: account,
          account2: account2,
          idAramis: idAramis,
          idStaff: idStaff,
          idAvVerantw: idAvVerantw,
          standort: standort,
          shippingStreet1: shippingStreet1,
          shippingStreet2: shippingStreet2,
          shippingPostalCode: shippingPostalCode,
          shippingCity: shippingCity,
          shippingCountry: shippingCountry,
          shippingState: shippingState,
          phone1: phone1,
          phone2: phone2,
          fax: fax,
          email: email,
          website: website,
          isMigrated: isMigrated,
          createdAt: createdAt,
          createdById: createdById,
          lastModifiedAt: lastModifiedAt,
          lastModifiedById: lastModifiedById,
          deletedAt: deletedAt,
          deletedById: deletedById,
          editingById: editingById,
          editingSince: editingSince,
          isDraft: isDraft,
          editingSession: editingSession,
        );

  /// Returns a shallow copy of this [MigrationMatsCompanyDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MigrationMatsCompanyDTO copyWith({
    Object? id = _Undefined,
    Object? idAccount = _Undefined,
    Object? account = _Undefined,
    Object? account2 = _Undefined,
    Object? idAramis = _Undefined,
    Object? idStaff = _Undefined,
    Object? idAvVerantw = _Undefined,
    Object? standort = _Undefined,
    Object? shippingStreet1 = _Undefined,
    Object? shippingStreet2 = _Undefined,
    Object? shippingPostalCode = _Undefined,
    Object? shippingCity = _Undefined,
    Object? shippingCountry = _Undefined,
    Object? shippingState = _Undefined,
    Object? phone1 = _Undefined,
    Object? phone2 = _Undefined,
    Object? fax = _Undefined,
    Object? email = _Undefined,
    Object? website = _Undefined,
    bool? isMigrated,
    DateTime? createdAt,
    Object? createdById = _Undefined,
    Object? lastModifiedAt = _Undefined,
    Object? lastModifiedById = _Undefined,
    Object? deletedAt = _Undefined,
    Object? deletedById = _Undefined,
    Object? editingById = _Undefined,
    Object? editingSince = _Undefined,
    bool? isDraft,
    Object? editingSession = _Undefined,
  }) {
    return MigrationMatsCompanyDTO(
      id: id is int? ? id : this.id,
      idAccount: idAccount is String? ? idAccount : this.idAccount,
      account: account is String? ? account : this.account,
      account2: account2 is String? ? account2 : this.account2,
      idAramis: idAramis is String? ? idAramis : this.idAramis,
      idStaff: idStaff is String? ? idStaff : this.idStaff,
      idAvVerantw: idAvVerantw is String? ? idAvVerantw : this.idAvVerantw,
      standort: standort is String? ? standort : this.standort,
      shippingStreet1:
          shippingStreet1 is String? ? shippingStreet1 : this.shippingStreet1,
      shippingStreet2:
          shippingStreet2 is String? ? shippingStreet2 : this.shippingStreet2,
      shippingPostalCode: shippingPostalCode is String?
          ? shippingPostalCode
          : this.shippingPostalCode,
      shippingCity: shippingCity is String? ? shippingCity : this.shippingCity,
      shippingCountry:
          shippingCountry is String? ? shippingCountry : this.shippingCountry,
      shippingState:
          shippingState is String? ? shippingState : this.shippingState,
      phone1: phone1 is String? ? phone1 : this.phone1,
      phone2: phone2 is String? ? phone2 : this.phone2,
      fax: fax is String? ? fax : this.fax,
      email: email is String? ? email : this.email,
      website: website is String? ? website : this.website,
      isMigrated: isMigrated ?? this.isMigrated,
      createdAt: createdAt ?? this.createdAt,
      createdById: createdById is int? ? createdById : this.createdById,
      lastModifiedAt:
          lastModifiedAt is DateTime? ? lastModifiedAt : this.lastModifiedAt,
      lastModifiedById:
          lastModifiedById is int? ? lastModifiedById : this.lastModifiedById,
      deletedAt: deletedAt is DateTime? ? deletedAt : this.deletedAt,
      deletedById: deletedById is int? ? deletedById : this.deletedById,
      editingById: editingById is int? ? editingById : this.editingById,
      editingSince:
          editingSince is DateTime? ? editingSince : this.editingSince,
      isDraft: isDraft ?? this.isDraft,
      editingSession:
          editingSession is String? ? editingSession : this.editingSession,
    );
  }
}
