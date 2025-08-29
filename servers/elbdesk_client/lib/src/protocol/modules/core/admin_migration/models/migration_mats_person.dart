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

abstract class MigrationMatsPersonDTO implements _i1.SerializableModel {
  MigrationMatsPersonDTO._({
    this.id,
    this.idContact,
    this.nameFirst,
    this.nameLast,
    this.anrede,
    this.titel,
    this.department,
    this.position,
    this.anredeLang,
    this.idAccount,
    required this.isPerson,
    this.primaryStreet1,
    this.primaryStreet2,
    this.primaryPostalCode,
    this.primaryCity,
    this.primaryCountry,
    this.primaryState,
    this.telefon1,
    this.telefon2,
    this.mobilTelefon,
    this.fax,
    this.email,
    this.status,
    this.wK,
    this.wWf,
    this.wFp,
    this.contactInfor,
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

  factory MigrationMatsPersonDTO({
    int? id,
    String? idContact,
    String? nameFirst,
    String? nameLast,
    String? anrede,
    String? titel,
    String? department,
    String? position,
    String? anredeLang,
    String? idAccount,
    required bool isPerson,
    String? primaryStreet1,
    String? primaryStreet2,
    String? primaryPostalCode,
    String? primaryCity,
    String? primaryCountry,
    String? primaryState,
    String? telefon1,
    String? telefon2,
    String? mobilTelefon,
    String? fax,
    String? email,
    String? status,
    String? wK,
    String? wWf,
    String? wFp,
    String? contactInfor,
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
  }) = _MigrationMatsPersonDTOImpl;

  factory MigrationMatsPersonDTO.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return MigrationMatsPersonDTO(
      id: jsonSerialization['id'] as int?,
      idContact: jsonSerialization['idContact'] as String?,
      nameFirst: jsonSerialization['nameFirst'] as String?,
      nameLast: jsonSerialization['nameLast'] as String?,
      anrede: jsonSerialization['anrede'] as String?,
      titel: jsonSerialization['titel'] as String?,
      department: jsonSerialization['department'] as String?,
      position: jsonSerialization['position'] as String?,
      anredeLang: jsonSerialization['anredeLang'] as String?,
      idAccount: jsonSerialization['idAccount'] as String?,
      isPerson: jsonSerialization['isPerson'] as bool,
      primaryStreet1: jsonSerialization['primaryStreet1'] as String?,
      primaryStreet2: jsonSerialization['primaryStreet2'] as String?,
      primaryPostalCode: jsonSerialization['primaryPostalCode'] as String?,
      primaryCity: jsonSerialization['primaryCity'] as String?,
      primaryCountry: jsonSerialization['primaryCountry'] as String?,
      primaryState: jsonSerialization['primaryState'] as String?,
      telefon1: jsonSerialization['telefon1'] as String?,
      telefon2: jsonSerialization['telefon2'] as String?,
      mobilTelefon: jsonSerialization['mobilTelefon'] as String?,
      fax: jsonSerialization['fax'] as String?,
      email: jsonSerialization['email'] as String?,
      status: jsonSerialization['status'] as String?,
      wK: jsonSerialization['wK'] as String?,
      wWf: jsonSerialization['wWf'] as String?,
      wFp: jsonSerialization['wFp'] as String?,
      contactInfor: jsonSerialization['contactInfor'] as String?,
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

  String? idContact;

  String? nameFirst;

  String? nameLast;

  String? anrede;

  String? titel;

  String? department;

  String? position;

  String? anredeLang;

  String? idAccount;

  bool isPerson;

  String? primaryStreet1;

  String? primaryStreet2;

  String? primaryPostalCode;

  String? primaryCity;

  String? primaryCountry;

  String? primaryState;

  String? telefon1;

  String? telefon2;

  String? mobilTelefon;

  String? fax;

  String? email;

  String? status;

  String? wK;

  String? wWf;

  String? wFp;

  String? contactInfor;

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

  /// Returns a shallow copy of this [MigrationMatsPersonDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MigrationMatsPersonDTO copyWith({
    int? id,
    String? idContact,
    String? nameFirst,
    String? nameLast,
    String? anrede,
    String? titel,
    String? department,
    String? position,
    String? anredeLang,
    String? idAccount,
    bool? isPerson,
    String? primaryStreet1,
    String? primaryStreet2,
    String? primaryPostalCode,
    String? primaryCity,
    String? primaryCountry,
    String? primaryState,
    String? telefon1,
    String? telefon2,
    String? mobilTelefon,
    String? fax,
    String? email,
    String? status,
    String? wK,
    String? wWf,
    String? wFp,
    String? contactInfor,
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
      if (idContact != null) 'idContact': idContact,
      if (nameFirst != null) 'nameFirst': nameFirst,
      if (nameLast != null) 'nameLast': nameLast,
      if (anrede != null) 'anrede': anrede,
      if (titel != null) 'titel': titel,
      if (department != null) 'department': department,
      if (position != null) 'position': position,
      if (anredeLang != null) 'anredeLang': anredeLang,
      if (idAccount != null) 'idAccount': idAccount,
      'isPerson': isPerson,
      if (primaryStreet1 != null) 'primaryStreet1': primaryStreet1,
      if (primaryStreet2 != null) 'primaryStreet2': primaryStreet2,
      if (primaryPostalCode != null) 'primaryPostalCode': primaryPostalCode,
      if (primaryCity != null) 'primaryCity': primaryCity,
      if (primaryCountry != null) 'primaryCountry': primaryCountry,
      if (primaryState != null) 'primaryState': primaryState,
      if (telefon1 != null) 'telefon1': telefon1,
      if (telefon2 != null) 'telefon2': telefon2,
      if (mobilTelefon != null) 'mobilTelefon': mobilTelefon,
      if (fax != null) 'fax': fax,
      if (email != null) 'email': email,
      if (status != null) 'status': status,
      if (wK != null) 'wK': wK,
      if (wWf != null) 'wWf': wWf,
      if (wFp != null) 'wFp': wFp,
      if (contactInfor != null) 'contactInfor': contactInfor,
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

class _MigrationMatsPersonDTOImpl extends MigrationMatsPersonDTO {
  _MigrationMatsPersonDTOImpl({
    int? id,
    String? idContact,
    String? nameFirst,
    String? nameLast,
    String? anrede,
    String? titel,
    String? department,
    String? position,
    String? anredeLang,
    String? idAccount,
    required bool isPerson,
    String? primaryStreet1,
    String? primaryStreet2,
    String? primaryPostalCode,
    String? primaryCity,
    String? primaryCountry,
    String? primaryState,
    String? telefon1,
    String? telefon2,
    String? mobilTelefon,
    String? fax,
    String? email,
    String? status,
    String? wK,
    String? wWf,
    String? wFp,
    String? contactInfor,
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
          idContact: idContact,
          nameFirst: nameFirst,
          nameLast: nameLast,
          anrede: anrede,
          titel: titel,
          department: department,
          position: position,
          anredeLang: anredeLang,
          idAccount: idAccount,
          isPerson: isPerson,
          primaryStreet1: primaryStreet1,
          primaryStreet2: primaryStreet2,
          primaryPostalCode: primaryPostalCode,
          primaryCity: primaryCity,
          primaryCountry: primaryCountry,
          primaryState: primaryState,
          telefon1: telefon1,
          telefon2: telefon2,
          mobilTelefon: mobilTelefon,
          fax: fax,
          email: email,
          status: status,
          wK: wK,
          wWf: wWf,
          wFp: wFp,
          contactInfor: contactInfor,
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

  /// Returns a shallow copy of this [MigrationMatsPersonDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MigrationMatsPersonDTO copyWith({
    Object? id = _Undefined,
    Object? idContact = _Undefined,
    Object? nameFirst = _Undefined,
    Object? nameLast = _Undefined,
    Object? anrede = _Undefined,
    Object? titel = _Undefined,
    Object? department = _Undefined,
    Object? position = _Undefined,
    Object? anredeLang = _Undefined,
    Object? idAccount = _Undefined,
    bool? isPerson,
    Object? primaryStreet1 = _Undefined,
    Object? primaryStreet2 = _Undefined,
    Object? primaryPostalCode = _Undefined,
    Object? primaryCity = _Undefined,
    Object? primaryCountry = _Undefined,
    Object? primaryState = _Undefined,
    Object? telefon1 = _Undefined,
    Object? telefon2 = _Undefined,
    Object? mobilTelefon = _Undefined,
    Object? fax = _Undefined,
    Object? email = _Undefined,
    Object? status = _Undefined,
    Object? wK = _Undefined,
    Object? wWf = _Undefined,
    Object? wFp = _Undefined,
    Object? contactInfor = _Undefined,
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
    return MigrationMatsPersonDTO(
      id: id is int? ? id : this.id,
      idContact: idContact is String? ? idContact : this.idContact,
      nameFirst: nameFirst is String? ? nameFirst : this.nameFirst,
      nameLast: nameLast is String? ? nameLast : this.nameLast,
      anrede: anrede is String? ? anrede : this.anrede,
      titel: titel is String? ? titel : this.titel,
      department: department is String? ? department : this.department,
      position: position is String? ? position : this.position,
      anredeLang: anredeLang is String? ? anredeLang : this.anredeLang,
      idAccount: idAccount is String? ? idAccount : this.idAccount,
      isPerson: isPerson ?? this.isPerson,
      primaryStreet1:
          primaryStreet1 is String? ? primaryStreet1 : this.primaryStreet1,
      primaryStreet2:
          primaryStreet2 is String? ? primaryStreet2 : this.primaryStreet2,
      primaryPostalCode: primaryPostalCode is String?
          ? primaryPostalCode
          : this.primaryPostalCode,
      primaryCity: primaryCity is String? ? primaryCity : this.primaryCity,
      primaryCountry:
          primaryCountry is String? ? primaryCountry : this.primaryCountry,
      primaryState: primaryState is String? ? primaryState : this.primaryState,
      telefon1: telefon1 is String? ? telefon1 : this.telefon1,
      telefon2: telefon2 is String? ? telefon2 : this.telefon2,
      mobilTelefon: mobilTelefon is String? ? mobilTelefon : this.mobilTelefon,
      fax: fax is String? ? fax : this.fax,
      email: email is String? ? email : this.email,
      status: status is String? ? status : this.status,
      wK: wK is String? ? wK : this.wK,
      wWf: wWf is String? ? wWf : this.wWf,
      wFp: wFp is String? ? wFp : this.wFp,
      contactInfor: contactInfor is String? ? contactInfor : this.contactInfor,
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
