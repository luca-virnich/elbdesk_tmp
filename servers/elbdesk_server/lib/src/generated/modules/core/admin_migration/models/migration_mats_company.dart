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

abstract class MigrationMatsCompanyDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = MigrationMatsCompanyDTOTable();

  static const db = MigrationMatsCompanyDTORepository._();

  @override
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

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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

  static MigrationMatsCompanyDTOInclude include() {
    return MigrationMatsCompanyDTOInclude._();
  }

  static MigrationMatsCompanyDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<MigrationMatsCompanyDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MigrationMatsCompanyDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MigrationMatsCompanyDTOTable>? orderByList,
    MigrationMatsCompanyDTOInclude? include,
  }) {
    return MigrationMatsCompanyDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MigrationMatsCompanyDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(MigrationMatsCompanyDTO.t),
      include: include,
    );
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

class MigrationMatsCompanyDTOTable extends _i1.Table<int?> {
  MigrationMatsCompanyDTOTable({super.tableRelation})
      : super(tableName: 'ed_migration_mats_company') {
    idAccount = _i1.ColumnString(
      'idAccount',
      this,
    );
    account = _i1.ColumnString(
      'account',
      this,
    );
    account2 = _i1.ColumnString(
      'account2',
      this,
    );
    idAramis = _i1.ColumnString(
      'idAramis',
      this,
    );
    idStaff = _i1.ColumnString(
      'idStaff',
      this,
    );
    idAvVerantw = _i1.ColumnString(
      'idAvVerantw',
      this,
    );
    standort = _i1.ColumnString(
      'standort',
      this,
    );
    shippingStreet1 = _i1.ColumnString(
      'shippingStreet1',
      this,
    );
    shippingStreet2 = _i1.ColumnString(
      'shippingStreet2',
      this,
    );
    shippingPostalCode = _i1.ColumnString(
      'shippingPostalCode',
      this,
    );
    shippingCity = _i1.ColumnString(
      'shippingCity',
      this,
    );
    shippingCountry = _i1.ColumnString(
      'shippingCountry',
      this,
    );
    shippingState = _i1.ColumnString(
      'shippingState',
      this,
    );
    phone1 = _i1.ColumnString(
      'phone1',
      this,
    );
    phone2 = _i1.ColumnString(
      'phone2',
      this,
    );
    fax = _i1.ColumnString(
      'fax',
      this,
    );
    email = _i1.ColumnString(
      'email',
      this,
    );
    website = _i1.ColumnString(
      'website',
      this,
    );
    isMigrated = _i1.ColumnBool(
      'isMigrated',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    createdById = _i1.ColumnInt(
      'createdById',
      this,
    );
    lastModifiedAt = _i1.ColumnDateTime(
      'lastModifiedAt',
      this,
    );
    lastModifiedById = _i1.ColumnInt(
      'lastModifiedById',
      this,
    );
    deletedAt = _i1.ColumnDateTime(
      'deletedAt',
      this,
    );
    deletedById = _i1.ColumnInt(
      'deletedById',
      this,
    );
    editingById = _i1.ColumnInt(
      'editingById',
      this,
    );
    editingSince = _i1.ColumnDateTime(
      'editingSince',
      this,
    );
    isDraft = _i1.ColumnBool(
      'isDraft',
      this,
    );
    editingSession = _i1.ColumnString(
      'editingSession',
      this,
    );
  }

  late final _i1.ColumnString idAccount;

  late final _i1.ColumnString account;

  late final _i1.ColumnString account2;

  late final _i1.ColumnString idAramis;

  late final _i1.ColumnString idStaff;

  late final _i1.ColumnString idAvVerantw;

  late final _i1.ColumnString standort;

  late final _i1.ColumnString shippingStreet1;

  late final _i1.ColumnString shippingStreet2;

  late final _i1.ColumnString shippingPostalCode;

  late final _i1.ColumnString shippingCity;

  late final _i1.ColumnString shippingCountry;

  late final _i1.ColumnString shippingState;

  late final _i1.ColumnString phone1;

  late final _i1.ColumnString phone2;

  late final _i1.ColumnString fax;

  late final _i1.ColumnString email;

  late final _i1.ColumnString website;

  late final _i1.ColumnBool isMigrated;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnInt createdById;

  late final _i1.ColumnDateTime lastModifiedAt;

  late final _i1.ColumnInt lastModifiedById;

  late final _i1.ColumnDateTime deletedAt;

  late final _i1.ColumnInt deletedById;

  late final _i1.ColumnInt editingById;

  late final _i1.ColumnDateTime editingSince;

  late final _i1.ColumnBool isDraft;

  late final _i1.ColumnString editingSession;

  @override
  List<_i1.Column> get columns => [
        id,
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
        createdById,
        lastModifiedAt,
        lastModifiedById,
        deletedAt,
        deletedById,
        editingById,
        editingSince,
        isDraft,
        editingSession,
      ];
}

class MigrationMatsCompanyDTOInclude extends _i1.IncludeObject {
  MigrationMatsCompanyDTOInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => MigrationMatsCompanyDTO.t;
}

class MigrationMatsCompanyDTOIncludeList extends _i1.IncludeList {
  MigrationMatsCompanyDTOIncludeList._({
    _i1.WhereExpressionBuilder<MigrationMatsCompanyDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(MigrationMatsCompanyDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => MigrationMatsCompanyDTO.t;
}

class MigrationMatsCompanyDTORepository {
  const MigrationMatsCompanyDTORepository._();

  /// Returns a list of [MigrationMatsCompanyDTO]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<MigrationMatsCompanyDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MigrationMatsCompanyDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MigrationMatsCompanyDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MigrationMatsCompanyDTOTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<MigrationMatsCompanyDTO>(
      where: where?.call(MigrationMatsCompanyDTO.t),
      orderBy: orderBy?.call(MigrationMatsCompanyDTO.t),
      orderByList: orderByList?.call(MigrationMatsCompanyDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [MigrationMatsCompanyDTO] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<MigrationMatsCompanyDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MigrationMatsCompanyDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<MigrationMatsCompanyDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MigrationMatsCompanyDTOTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<MigrationMatsCompanyDTO>(
      where: where?.call(MigrationMatsCompanyDTO.t),
      orderBy: orderBy?.call(MigrationMatsCompanyDTO.t),
      orderByList: orderByList?.call(MigrationMatsCompanyDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [MigrationMatsCompanyDTO] by its [id] or null if no such row exists.
  Future<MigrationMatsCompanyDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<MigrationMatsCompanyDTO>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [MigrationMatsCompanyDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [MigrationMatsCompanyDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<MigrationMatsCompanyDTO>> insert(
    _i1.Session session,
    List<MigrationMatsCompanyDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<MigrationMatsCompanyDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [MigrationMatsCompanyDTO] and returns the inserted row.
  ///
  /// The returned [MigrationMatsCompanyDTO] will have its `id` field set.
  Future<MigrationMatsCompanyDTO> insertRow(
    _i1.Session session,
    MigrationMatsCompanyDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<MigrationMatsCompanyDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [MigrationMatsCompanyDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<MigrationMatsCompanyDTO>> update(
    _i1.Session session,
    List<MigrationMatsCompanyDTO> rows, {
    _i1.ColumnSelections<MigrationMatsCompanyDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<MigrationMatsCompanyDTO>(
      rows,
      columns: columns?.call(MigrationMatsCompanyDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [MigrationMatsCompanyDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<MigrationMatsCompanyDTO> updateRow(
    _i1.Session session,
    MigrationMatsCompanyDTO row, {
    _i1.ColumnSelections<MigrationMatsCompanyDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<MigrationMatsCompanyDTO>(
      row,
      columns: columns?.call(MigrationMatsCompanyDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [MigrationMatsCompanyDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<MigrationMatsCompanyDTO>> delete(
    _i1.Session session,
    List<MigrationMatsCompanyDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<MigrationMatsCompanyDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [MigrationMatsCompanyDTO].
  Future<MigrationMatsCompanyDTO> deleteRow(
    _i1.Session session,
    MigrationMatsCompanyDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<MigrationMatsCompanyDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<MigrationMatsCompanyDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<MigrationMatsCompanyDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<MigrationMatsCompanyDTO>(
      where: where(MigrationMatsCompanyDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MigrationMatsCompanyDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<MigrationMatsCompanyDTO>(
      where: where?.call(MigrationMatsCompanyDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
