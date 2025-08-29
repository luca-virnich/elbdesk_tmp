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
import '../../../../modules/crm/country_code/models/country_code_address_format.dart'
    as _i2;
import '../../../../modules/crm/country_code/models/country_code_contact_address_format.dart'
    as _i3;

abstract class CountryCodeDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  CountryCodeDTO._({
    this.id,
    required this.code,
    required this.countryRegionName,
    required this.isoCode,
    required this.numericCode,
    required this.addressFormat,
    required this.contactAddressFormat,
    this.federalRegion,
    this.euCode,
    this.intrastatCode,
    this.taxScheme,
    required this.showState,
    required this.isPrimary,
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

  factory CountryCodeDTO({
    int? id,
    required String code,
    required String countryRegionName,
    required String isoCode,
    required int numericCode,
    required _i2.CountryCodeAddressFormat addressFormat,
    required _i3.CountryCodeContactAddressFormat contactAddressFormat,
    String? federalRegion,
    String? euCode,
    String? intrastatCode,
    String? taxScheme,
    required bool showState,
    required bool isPrimary,
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
  }) = _CountryCodeDTOImpl;

  factory CountryCodeDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return CountryCodeDTO(
      id: jsonSerialization['id'] as int?,
      code: jsonSerialization['code'] as String,
      countryRegionName: jsonSerialization['countryRegionName'] as String,
      isoCode: jsonSerialization['isoCode'] as String,
      numericCode: jsonSerialization['numericCode'] as int,
      addressFormat: _i2.CountryCodeAddressFormat.fromJson(
          (jsonSerialization['addressFormat'] as String)),
      contactAddressFormat: _i3.CountryCodeContactAddressFormat.fromJson(
          (jsonSerialization['contactAddressFormat'] as String)),
      federalRegion: jsonSerialization['federalRegion'] as String?,
      euCode: jsonSerialization['euCode'] as String?,
      intrastatCode: jsonSerialization['intrastatCode'] as String?,
      taxScheme: jsonSerialization['taxScheme'] as String?,
      showState: jsonSerialization['showState'] as bool,
      isPrimary: jsonSerialization['isPrimary'] as bool,
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

  static final t = CountryCodeDTOTable();

  static const db = CountryCodeDTORepository._();

  @override
  int? id;

  String code;

  String countryRegionName;

  String isoCode;

  int numericCode;

  _i2.CountryCodeAddressFormat addressFormat;

  _i3.CountryCodeContactAddressFormat contactAddressFormat;

  String? federalRegion;

  String? euCode;

  String? intrastatCode;

  String? taxScheme;

  bool showState;

  bool isPrimary;

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

  /// Returns a shallow copy of this [CountryCodeDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CountryCodeDTO copyWith({
    int? id,
    String? code,
    String? countryRegionName,
    String? isoCode,
    int? numericCode,
    _i2.CountryCodeAddressFormat? addressFormat,
    _i3.CountryCodeContactAddressFormat? contactAddressFormat,
    String? federalRegion,
    String? euCode,
    String? intrastatCode,
    String? taxScheme,
    bool? showState,
    bool? isPrimary,
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
      'code': code,
      'countryRegionName': countryRegionName,
      'isoCode': isoCode,
      'numericCode': numericCode,
      'addressFormat': addressFormat.toJson(),
      'contactAddressFormat': contactAddressFormat.toJson(),
      if (federalRegion != null) 'federalRegion': federalRegion,
      if (euCode != null) 'euCode': euCode,
      if (intrastatCode != null) 'intrastatCode': intrastatCode,
      if (taxScheme != null) 'taxScheme': taxScheme,
      'showState': showState,
      'isPrimary': isPrimary,
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
      'code': code,
      'countryRegionName': countryRegionName,
      'isoCode': isoCode,
      'numericCode': numericCode,
      'addressFormat': addressFormat.toJson(),
      'contactAddressFormat': contactAddressFormat.toJson(),
      if (federalRegion != null) 'federalRegion': federalRegion,
      if (euCode != null) 'euCode': euCode,
      if (intrastatCode != null) 'intrastatCode': intrastatCode,
      if (taxScheme != null) 'taxScheme': taxScheme,
      'showState': showState,
      'isPrimary': isPrimary,
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

  static CountryCodeDTOInclude include() {
    return CountryCodeDTOInclude._();
  }

  static CountryCodeDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<CountryCodeDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CountryCodeDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CountryCodeDTOTable>? orderByList,
    CountryCodeDTOInclude? include,
  }) {
    return CountryCodeDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CountryCodeDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(CountryCodeDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CountryCodeDTOImpl extends CountryCodeDTO {
  _CountryCodeDTOImpl({
    int? id,
    required String code,
    required String countryRegionName,
    required String isoCode,
    required int numericCode,
    required _i2.CountryCodeAddressFormat addressFormat,
    required _i3.CountryCodeContactAddressFormat contactAddressFormat,
    String? federalRegion,
    String? euCode,
    String? intrastatCode,
    String? taxScheme,
    required bool showState,
    required bool isPrimary,
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
          code: code,
          countryRegionName: countryRegionName,
          isoCode: isoCode,
          numericCode: numericCode,
          addressFormat: addressFormat,
          contactAddressFormat: contactAddressFormat,
          federalRegion: federalRegion,
          euCode: euCode,
          intrastatCode: intrastatCode,
          taxScheme: taxScheme,
          showState: showState,
          isPrimary: isPrimary,
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

  /// Returns a shallow copy of this [CountryCodeDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CountryCodeDTO copyWith({
    Object? id = _Undefined,
    String? code,
    String? countryRegionName,
    String? isoCode,
    int? numericCode,
    _i2.CountryCodeAddressFormat? addressFormat,
    _i3.CountryCodeContactAddressFormat? contactAddressFormat,
    Object? federalRegion = _Undefined,
    Object? euCode = _Undefined,
    Object? intrastatCode = _Undefined,
    Object? taxScheme = _Undefined,
    bool? showState,
    bool? isPrimary,
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
    return CountryCodeDTO(
      id: id is int? ? id : this.id,
      code: code ?? this.code,
      countryRegionName: countryRegionName ?? this.countryRegionName,
      isoCode: isoCode ?? this.isoCode,
      numericCode: numericCode ?? this.numericCode,
      addressFormat: addressFormat ?? this.addressFormat,
      contactAddressFormat: contactAddressFormat ?? this.contactAddressFormat,
      federalRegion:
          federalRegion is String? ? federalRegion : this.federalRegion,
      euCode: euCode is String? ? euCode : this.euCode,
      intrastatCode:
          intrastatCode is String? ? intrastatCode : this.intrastatCode,
      taxScheme: taxScheme is String? ? taxScheme : this.taxScheme,
      showState: showState ?? this.showState,
      isPrimary: isPrimary ?? this.isPrimary,
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

class CountryCodeDTOTable extends _i1.Table<int?> {
  CountryCodeDTOTable({super.tableRelation})
      : super(tableName: 'ed_crm_country_code') {
    code = _i1.ColumnString(
      'code',
      this,
    );
    countryRegionName = _i1.ColumnString(
      'countryRegionName',
      this,
    );
    isoCode = _i1.ColumnString(
      'isoCode',
      this,
    );
    numericCode = _i1.ColumnInt(
      'numericCode',
      this,
    );
    addressFormat = _i1.ColumnEnum(
      'addressFormat',
      this,
      _i1.EnumSerialization.byName,
    );
    contactAddressFormat = _i1.ColumnEnum(
      'contactAddressFormat',
      this,
      _i1.EnumSerialization.byName,
    );
    federalRegion = _i1.ColumnString(
      'federalRegion',
      this,
    );
    euCode = _i1.ColumnString(
      'euCode',
      this,
    );
    intrastatCode = _i1.ColumnString(
      'intrastatCode',
      this,
    );
    taxScheme = _i1.ColumnString(
      'taxScheme',
      this,
    );
    showState = _i1.ColumnBool(
      'showState',
      this,
    );
    isPrimary = _i1.ColumnBool(
      'isPrimary',
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

  late final _i1.ColumnString code;

  late final _i1.ColumnString countryRegionName;

  late final _i1.ColumnString isoCode;

  late final _i1.ColumnInt numericCode;

  late final _i1.ColumnEnum<_i2.CountryCodeAddressFormat> addressFormat;

  late final _i1.ColumnEnum<_i3.CountryCodeContactAddressFormat>
      contactAddressFormat;

  late final _i1.ColumnString federalRegion;

  late final _i1.ColumnString euCode;

  late final _i1.ColumnString intrastatCode;

  late final _i1.ColumnString taxScheme;

  late final _i1.ColumnBool showState;

  late final _i1.ColumnBool isPrimary;

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

class CountryCodeDTOInclude extends _i1.IncludeObject {
  CountryCodeDTOInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => CountryCodeDTO.t;
}

class CountryCodeDTOIncludeList extends _i1.IncludeList {
  CountryCodeDTOIncludeList._({
    _i1.WhereExpressionBuilder<CountryCodeDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CountryCodeDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => CountryCodeDTO.t;
}

class CountryCodeDTORepository {
  const CountryCodeDTORepository._();

  /// Returns a list of [CountryCodeDTO]s matching the given query parameters.
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
  Future<List<CountryCodeDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CountryCodeDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CountryCodeDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CountryCodeDTOTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<CountryCodeDTO>(
      where: where?.call(CountryCodeDTO.t),
      orderBy: orderBy?.call(CountryCodeDTO.t),
      orderByList: orderByList?.call(CountryCodeDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [CountryCodeDTO] matching the given query parameters.
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
  Future<CountryCodeDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CountryCodeDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<CountryCodeDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CountryCodeDTOTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<CountryCodeDTO>(
      where: where?.call(CountryCodeDTO.t),
      orderBy: orderBy?.call(CountryCodeDTO.t),
      orderByList: orderByList?.call(CountryCodeDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [CountryCodeDTO] by its [id] or null if no such row exists.
  Future<CountryCodeDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<CountryCodeDTO>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [CountryCodeDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [CountryCodeDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<CountryCodeDTO>> insert(
    _i1.Session session,
    List<CountryCodeDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<CountryCodeDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [CountryCodeDTO] and returns the inserted row.
  ///
  /// The returned [CountryCodeDTO] will have its `id` field set.
  Future<CountryCodeDTO> insertRow(
    _i1.Session session,
    CountryCodeDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<CountryCodeDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [CountryCodeDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<CountryCodeDTO>> update(
    _i1.Session session,
    List<CountryCodeDTO> rows, {
    _i1.ColumnSelections<CountryCodeDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<CountryCodeDTO>(
      rows,
      columns: columns?.call(CountryCodeDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CountryCodeDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CountryCodeDTO> updateRow(
    _i1.Session session,
    CountryCodeDTO row, {
    _i1.ColumnSelections<CountryCodeDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<CountryCodeDTO>(
      row,
      columns: columns?.call(CountryCodeDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [CountryCodeDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<CountryCodeDTO>> delete(
    _i1.Session session,
    List<CountryCodeDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<CountryCodeDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [CountryCodeDTO].
  Future<CountryCodeDTO> deleteRow(
    _i1.Session session,
    CountryCodeDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CountryCodeDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<CountryCodeDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CountryCodeDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<CountryCodeDTO>(
      where: where(CountryCodeDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CountryCodeDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<CountryCodeDTO>(
      where: where?.call(CountryCodeDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
