/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../../../../modules/crm/contact/models/contact.dart' as _i2;

abstract class CompanyCompanyDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  CompanyCompanyDTO._({
    this.id,
    required this.companyId,
    this.company,
    required this.companyCompanyId,
    this.companyCompany,
    required this.active,
    required this.note,
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

  factory CompanyCompanyDTO({
    int? id,
    required int companyId,
    _i2.ContactDTO? company,
    required int companyCompanyId,
    _i2.ContactDTO? companyCompany,
    required bool active,
    required String note,
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
  }) = _CompanyCompanyDTOImpl;

  factory CompanyCompanyDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return CompanyCompanyDTO(
      id: jsonSerialization['id'] as int?,
      companyId: jsonSerialization['companyId'] as int,
      company: jsonSerialization['company'] == null
          ? null
          : _i2.ContactDTO.fromJson(
              (jsonSerialization['company'] as Map<String, dynamic>)),
      companyCompanyId: jsonSerialization['companyCompanyId'] as int,
      companyCompany: jsonSerialization['companyCompany'] == null
          ? null
          : _i2.ContactDTO.fromJson(
              (jsonSerialization['companyCompany'] as Map<String, dynamic>)),
      active: jsonSerialization['active'] as bool,
      note: jsonSerialization['note'] as String,
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

  static final t = CompanyCompanyDTOTable();

  static const db = CompanyCompanyDTORepository._();

  @override
  int? id;

  int companyId;

  _i2.ContactDTO? company;

  int companyCompanyId;

  _i2.ContactDTO? companyCompany;

  bool active;

  String note;

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

  /// Returns a shallow copy of this [CompanyCompanyDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CompanyCompanyDTO copyWith({
    int? id,
    int? companyId,
    _i2.ContactDTO? company,
    int? companyCompanyId,
    _i2.ContactDTO? companyCompany,
    bool? active,
    String? note,
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
      'companyId': companyId,
      if (company != null) 'company': company?.toJson(),
      'companyCompanyId': companyCompanyId,
      if (companyCompany != null) 'companyCompany': companyCompany?.toJson(),
      'active': active,
      'note': note,
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
      'companyId': companyId,
      if (company != null) 'company': company?.toJsonForProtocol(),
      'companyCompanyId': companyCompanyId,
      if (companyCompany != null)
        'companyCompany': companyCompany?.toJsonForProtocol(),
      'active': active,
      'note': note,
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

  static CompanyCompanyDTOInclude include({
    _i2.ContactDTOInclude? company,
    _i2.ContactDTOInclude? companyCompany,
  }) {
    return CompanyCompanyDTOInclude._(
      company: company,
      companyCompany: companyCompany,
    );
  }

  static CompanyCompanyDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<CompanyCompanyDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CompanyCompanyDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CompanyCompanyDTOTable>? orderByList,
    CompanyCompanyDTOInclude? include,
  }) {
    return CompanyCompanyDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CompanyCompanyDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(CompanyCompanyDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CompanyCompanyDTOImpl extends CompanyCompanyDTO {
  _CompanyCompanyDTOImpl({
    int? id,
    required int companyId,
    _i2.ContactDTO? company,
    required int companyCompanyId,
    _i2.ContactDTO? companyCompany,
    required bool active,
    required String note,
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
          companyId: companyId,
          company: company,
          companyCompanyId: companyCompanyId,
          companyCompany: companyCompany,
          active: active,
          note: note,
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

  /// Returns a shallow copy of this [CompanyCompanyDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CompanyCompanyDTO copyWith({
    Object? id = _Undefined,
    int? companyId,
    Object? company = _Undefined,
    int? companyCompanyId,
    Object? companyCompany = _Undefined,
    bool? active,
    String? note,
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
    return CompanyCompanyDTO(
      id: id is int? ? id : this.id,
      companyId: companyId ?? this.companyId,
      company: company is _i2.ContactDTO? ? company : this.company?.copyWith(),
      companyCompanyId: companyCompanyId ?? this.companyCompanyId,
      companyCompany: companyCompany is _i2.ContactDTO?
          ? companyCompany
          : this.companyCompany?.copyWith(),
      active: active ?? this.active,
      note: note ?? this.note,
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

class CompanyCompanyDTOTable extends _i1.Table<int?> {
  CompanyCompanyDTOTable({super.tableRelation})
      : super(tableName: 'ed_crm_company_company') {
    companyId = _i1.ColumnInt(
      'companyId',
      this,
    );
    companyCompanyId = _i1.ColumnInt(
      'companyCompanyId',
      this,
    );
    active = _i1.ColumnBool(
      'active',
      this,
    );
    note = _i1.ColumnString(
      'note',
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

  late final _i1.ColumnInt companyId;

  _i2.ContactDTOTable? _company;

  late final _i1.ColumnInt companyCompanyId;

  _i2.ContactDTOTable? _companyCompany;

  late final _i1.ColumnBool active;

  late final _i1.ColumnString note;

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

  _i2.ContactDTOTable get company {
    if (_company != null) return _company!;
    _company = _i1.createRelationTable(
      relationFieldName: 'company',
      field: CompanyCompanyDTO.t.companyId,
      foreignField: _i2.ContactDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ContactDTOTable(tableRelation: foreignTableRelation),
    );
    return _company!;
  }

  _i2.ContactDTOTable get companyCompany {
    if (_companyCompany != null) return _companyCompany!;
    _companyCompany = _i1.createRelationTable(
      relationFieldName: 'companyCompany',
      field: CompanyCompanyDTO.t.companyCompanyId,
      foreignField: _i2.ContactDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ContactDTOTable(tableRelation: foreignTableRelation),
    );
    return _companyCompany!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        companyId,
        companyCompanyId,
        active,
        note,
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

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'company') {
      return company;
    }
    if (relationField == 'companyCompany') {
      return companyCompany;
    }
    return null;
  }
}

class CompanyCompanyDTOInclude extends _i1.IncludeObject {
  CompanyCompanyDTOInclude._({
    _i2.ContactDTOInclude? company,
    _i2.ContactDTOInclude? companyCompany,
  }) {
    _company = company;
    _companyCompany = companyCompany;
  }

  _i2.ContactDTOInclude? _company;

  _i2.ContactDTOInclude? _companyCompany;

  @override
  Map<String, _i1.Include?> get includes => {
        'company': _company,
        'companyCompany': _companyCompany,
      };

  @override
  _i1.Table<int?> get table => CompanyCompanyDTO.t;
}

class CompanyCompanyDTOIncludeList extends _i1.IncludeList {
  CompanyCompanyDTOIncludeList._({
    _i1.WhereExpressionBuilder<CompanyCompanyDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CompanyCompanyDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => CompanyCompanyDTO.t;
}

class CompanyCompanyDTORepository {
  const CompanyCompanyDTORepository._();

  final attachRow = const CompanyCompanyDTOAttachRowRepository._();

  /// Returns a list of [CompanyCompanyDTO]s matching the given query parameters.
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
  Future<List<CompanyCompanyDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CompanyCompanyDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CompanyCompanyDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CompanyCompanyDTOTable>? orderByList,
    _i1.Transaction? transaction,
    CompanyCompanyDTOInclude? include,
  }) async {
    return session.db.find<CompanyCompanyDTO>(
      where: where?.call(CompanyCompanyDTO.t),
      orderBy: orderBy?.call(CompanyCompanyDTO.t),
      orderByList: orderByList?.call(CompanyCompanyDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [CompanyCompanyDTO] matching the given query parameters.
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
  Future<CompanyCompanyDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CompanyCompanyDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<CompanyCompanyDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CompanyCompanyDTOTable>? orderByList,
    _i1.Transaction? transaction,
    CompanyCompanyDTOInclude? include,
  }) async {
    return session.db.findFirstRow<CompanyCompanyDTO>(
      where: where?.call(CompanyCompanyDTO.t),
      orderBy: orderBy?.call(CompanyCompanyDTO.t),
      orderByList: orderByList?.call(CompanyCompanyDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [CompanyCompanyDTO] by its [id] or null if no such row exists.
  Future<CompanyCompanyDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    CompanyCompanyDTOInclude? include,
  }) async {
    return session.db.findById<CompanyCompanyDTO>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [CompanyCompanyDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [CompanyCompanyDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<CompanyCompanyDTO>> insert(
    _i1.Session session,
    List<CompanyCompanyDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<CompanyCompanyDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [CompanyCompanyDTO] and returns the inserted row.
  ///
  /// The returned [CompanyCompanyDTO] will have its `id` field set.
  Future<CompanyCompanyDTO> insertRow(
    _i1.Session session,
    CompanyCompanyDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<CompanyCompanyDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [CompanyCompanyDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<CompanyCompanyDTO>> update(
    _i1.Session session,
    List<CompanyCompanyDTO> rows, {
    _i1.ColumnSelections<CompanyCompanyDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<CompanyCompanyDTO>(
      rows,
      columns: columns?.call(CompanyCompanyDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CompanyCompanyDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CompanyCompanyDTO> updateRow(
    _i1.Session session,
    CompanyCompanyDTO row, {
    _i1.ColumnSelections<CompanyCompanyDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<CompanyCompanyDTO>(
      row,
      columns: columns?.call(CompanyCompanyDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [CompanyCompanyDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<CompanyCompanyDTO>> delete(
    _i1.Session session,
    List<CompanyCompanyDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<CompanyCompanyDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [CompanyCompanyDTO].
  Future<CompanyCompanyDTO> deleteRow(
    _i1.Session session,
    CompanyCompanyDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CompanyCompanyDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<CompanyCompanyDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CompanyCompanyDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<CompanyCompanyDTO>(
      where: where(CompanyCompanyDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CompanyCompanyDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<CompanyCompanyDTO>(
      where: where?.call(CompanyCompanyDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class CompanyCompanyDTOAttachRowRepository {
  const CompanyCompanyDTOAttachRowRepository._();

  /// Creates a relation between the given [CompanyCompanyDTO] and [ContactDTO]
  /// by setting the [CompanyCompanyDTO]'s foreign key `companyId` to refer to the [ContactDTO].
  Future<void> company(
    _i1.Session session,
    CompanyCompanyDTO companyCompanyDTO,
    _i2.ContactDTO company, {
    _i1.Transaction? transaction,
  }) async {
    if (companyCompanyDTO.id == null) {
      throw ArgumentError.notNull('companyCompanyDTO.id');
    }
    if (company.id == null) {
      throw ArgumentError.notNull('company.id');
    }

    var $companyCompanyDTO = companyCompanyDTO.copyWith(companyId: company.id);
    await session.db.updateRow<CompanyCompanyDTO>(
      $companyCompanyDTO,
      columns: [CompanyCompanyDTO.t.companyId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [CompanyCompanyDTO] and [ContactDTO]
  /// by setting the [CompanyCompanyDTO]'s foreign key `companyCompanyId` to refer to the [ContactDTO].
  Future<void> companyCompany(
    _i1.Session session,
    CompanyCompanyDTO companyCompanyDTO,
    _i2.ContactDTO companyCompany, {
    _i1.Transaction? transaction,
  }) async {
    if (companyCompanyDTO.id == null) {
      throw ArgumentError.notNull('companyCompanyDTO.id');
    }
    if (companyCompany.id == null) {
      throw ArgumentError.notNull('companyCompany.id');
    }

    var $companyCompanyDTO =
        companyCompanyDTO.copyWith(companyCompanyId: companyCompany.id);
    await session.db.updateRow<CompanyCompanyDTO>(
      $companyCompanyDTO,
      columns: [CompanyCompanyDTO.t.companyCompanyId],
      transaction: transaction,
    );
  }
}
