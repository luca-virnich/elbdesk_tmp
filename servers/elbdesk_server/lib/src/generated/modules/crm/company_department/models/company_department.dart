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
import '../../../../modules/crm/company_employee/models/company_employee_department_jt.dart'
    as _i3;

abstract class CompanyDepartmentDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  CompanyDepartmentDTO._({
    this.id,
    this.name,
    this.description,
    required this.companyId,
    this.company,
    this.employees,
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

  factory CompanyDepartmentDTO({
    int? id,
    String? name,
    String? description,
    required int companyId,
    _i2.ContactDTO? company,
    List<_i3.CompanyEmployeeDepartmentJT>? employees,
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
  }) = _CompanyDepartmentDTOImpl;

  factory CompanyDepartmentDTO.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return CompanyDepartmentDTO(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String?,
      description: jsonSerialization['description'] as String?,
      companyId: jsonSerialization['companyId'] as int,
      company: jsonSerialization['company'] == null
          ? null
          : _i2.ContactDTO.fromJson(
              (jsonSerialization['company'] as Map<String, dynamic>)),
      employees: (jsonSerialization['employees'] as List?)
          ?.map((e) => _i3.CompanyEmployeeDepartmentJT.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
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

  static final t = CompanyDepartmentDTOTable();

  static const db = CompanyDepartmentDTORepository._();

  @override
  int? id;

  String? name;

  String? description;

  int companyId;

  _i2.ContactDTO? company;

  List<_i3.CompanyEmployeeDepartmentJT>? employees;

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

  /// Returns a shallow copy of this [CompanyDepartmentDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CompanyDepartmentDTO copyWith({
    int? id,
    String? name,
    String? description,
    int? companyId,
    _i2.ContactDTO? company,
    List<_i3.CompanyEmployeeDepartmentJT>? employees,
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
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      'companyId': companyId,
      if (company != null) 'company': company?.toJson(),
      if (employees != null)
        'employees': employees?.toJson(valueToJson: (v) => v.toJson()),
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
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      'companyId': companyId,
      if (company != null) 'company': company?.toJsonForProtocol(),
      if (employees != null)
        'employees':
            employees?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
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

  static CompanyDepartmentDTOInclude include({
    _i2.ContactDTOInclude? company,
    _i3.CompanyEmployeeDepartmentJTIncludeList? employees,
  }) {
    return CompanyDepartmentDTOInclude._(
      company: company,
      employees: employees,
    );
  }

  static CompanyDepartmentDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<CompanyDepartmentDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CompanyDepartmentDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CompanyDepartmentDTOTable>? orderByList,
    CompanyDepartmentDTOInclude? include,
  }) {
    return CompanyDepartmentDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CompanyDepartmentDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(CompanyDepartmentDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CompanyDepartmentDTOImpl extends CompanyDepartmentDTO {
  _CompanyDepartmentDTOImpl({
    int? id,
    String? name,
    String? description,
    required int companyId,
    _i2.ContactDTO? company,
    List<_i3.CompanyEmployeeDepartmentJT>? employees,
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
          name: name,
          description: description,
          companyId: companyId,
          company: company,
          employees: employees,
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

  /// Returns a shallow copy of this [CompanyDepartmentDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CompanyDepartmentDTO copyWith({
    Object? id = _Undefined,
    Object? name = _Undefined,
    Object? description = _Undefined,
    int? companyId,
    Object? company = _Undefined,
    Object? employees = _Undefined,
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
    return CompanyDepartmentDTO(
      id: id is int? ? id : this.id,
      name: name is String? ? name : this.name,
      description: description is String? ? description : this.description,
      companyId: companyId ?? this.companyId,
      company: company is _i2.ContactDTO? ? company : this.company?.copyWith(),
      employees: employees is List<_i3.CompanyEmployeeDepartmentJT>?
          ? employees
          : this.employees?.map((e0) => e0.copyWith()).toList(),
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

class CompanyDepartmentDTOTable extends _i1.Table<int?> {
  CompanyDepartmentDTOTable({super.tableRelation})
      : super(tableName: 'ed_crm_company_department') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    companyId = _i1.ColumnInt(
      'companyId',
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

  late final _i1.ColumnString name;

  late final _i1.ColumnString description;

  late final _i1.ColumnInt companyId;

  _i2.ContactDTOTable? _company;

  _i3.CompanyEmployeeDepartmentJTTable? ___employees;

  _i1.ManyRelation<_i3.CompanyEmployeeDepartmentJTTable>? _employees;

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
      field: CompanyDepartmentDTO.t.companyId,
      foreignField: _i2.ContactDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ContactDTOTable(tableRelation: foreignTableRelation),
    );
    return _company!;
  }

  _i3.CompanyEmployeeDepartmentJTTable get __employees {
    if (___employees != null) return ___employees!;
    ___employees = _i1.createRelationTable(
      relationFieldName: '__employees',
      field: CompanyDepartmentDTO.t.id,
      foreignField: _i3.CompanyEmployeeDepartmentJT.t.companyDepartmentId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.CompanyEmployeeDepartmentJTTable(
              tableRelation: foreignTableRelation),
    );
    return ___employees!;
  }

  _i1.ManyRelation<_i3.CompanyEmployeeDepartmentJTTable> get employees {
    if (_employees != null) return _employees!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'employees',
      field: CompanyDepartmentDTO.t.id,
      foreignField: _i3.CompanyEmployeeDepartmentJT.t.companyDepartmentId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.CompanyEmployeeDepartmentJTTable(
              tableRelation: foreignTableRelation),
    );
    _employees = _i1.ManyRelation<_i3.CompanyEmployeeDepartmentJTTable>(
      tableWithRelations: relationTable,
      table: _i3.CompanyEmployeeDepartmentJTTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _employees!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        description,
        companyId,
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
    if (relationField == 'employees') {
      return __employees;
    }
    return null;
  }
}

class CompanyDepartmentDTOInclude extends _i1.IncludeObject {
  CompanyDepartmentDTOInclude._({
    _i2.ContactDTOInclude? company,
    _i3.CompanyEmployeeDepartmentJTIncludeList? employees,
  }) {
    _company = company;
    _employees = employees;
  }

  _i2.ContactDTOInclude? _company;

  _i3.CompanyEmployeeDepartmentJTIncludeList? _employees;

  @override
  Map<String, _i1.Include?> get includes => {
        'company': _company,
        'employees': _employees,
      };

  @override
  _i1.Table<int?> get table => CompanyDepartmentDTO.t;
}

class CompanyDepartmentDTOIncludeList extends _i1.IncludeList {
  CompanyDepartmentDTOIncludeList._({
    _i1.WhereExpressionBuilder<CompanyDepartmentDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CompanyDepartmentDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => CompanyDepartmentDTO.t;
}

class CompanyDepartmentDTORepository {
  const CompanyDepartmentDTORepository._();

  final attach = const CompanyDepartmentDTOAttachRepository._();

  final attachRow = const CompanyDepartmentDTOAttachRowRepository._();

  final detach = const CompanyDepartmentDTODetachRepository._();

  final detachRow = const CompanyDepartmentDTODetachRowRepository._();

  /// Returns a list of [CompanyDepartmentDTO]s matching the given query parameters.
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
  Future<List<CompanyDepartmentDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CompanyDepartmentDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CompanyDepartmentDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CompanyDepartmentDTOTable>? orderByList,
    _i1.Transaction? transaction,
    CompanyDepartmentDTOInclude? include,
  }) async {
    return session.db.find<CompanyDepartmentDTO>(
      where: where?.call(CompanyDepartmentDTO.t),
      orderBy: orderBy?.call(CompanyDepartmentDTO.t),
      orderByList: orderByList?.call(CompanyDepartmentDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [CompanyDepartmentDTO] matching the given query parameters.
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
  Future<CompanyDepartmentDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CompanyDepartmentDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<CompanyDepartmentDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CompanyDepartmentDTOTable>? orderByList,
    _i1.Transaction? transaction,
    CompanyDepartmentDTOInclude? include,
  }) async {
    return session.db.findFirstRow<CompanyDepartmentDTO>(
      where: where?.call(CompanyDepartmentDTO.t),
      orderBy: orderBy?.call(CompanyDepartmentDTO.t),
      orderByList: orderByList?.call(CompanyDepartmentDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [CompanyDepartmentDTO] by its [id] or null if no such row exists.
  Future<CompanyDepartmentDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    CompanyDepartmentDTOInclude? include,
  }) async {
    return session.db.findById<CompanyDepartmentDTO>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [CompanyDepartmentDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [CompanyDepartmentDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<CompanyDepartmentDTO>> insert(
    _i1.Session session,
    List<CompanyDepartmentDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<CompanyDepartmentDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [CompanyDepartmentDTO] and returns the inserted row.
  ///
  /// The returned [CompanyDepartmentDTO] will have its `id` field set.
  Future<CompanyDepartmentDTO> insertRow(
    _i1.Session session,
    CompanyDepartmentDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<CompanyDepartmentDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [CompanyDepartmentDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<CompanyDepartmentDTO>> update(
    _i1.Session session,
    List<CompanyDepartmentDTO> rows, {
    _i1.ColumnSelections<CompanyDepartmentDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<CompanyDepartmentDTO>(
      rows,
      columns: columns?.call(CompanyDepartmentDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CompanyDepartmentDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CompanyDepartmentDTO> updateRow(
    _i1.Session session,
    CompanyDepartmentDTO row, {
    _i1.ColumnSelections<CompanyDepartmentDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<CompanyDepartmentDTO>(
      row,
      columns: columns?.call(CompanyDepartmentDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [CompanyDepartmentDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<CompanyDepartmentDTO>> delete(
    _i1.Session session,
    List<CompanyDepartmentDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<CompanyDepartmentDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [CompanyDepartmentDTO].
  Future<CompanyDepartmentDTO> deleteRow(
    _i1.Session session,
    CompanyDepartmentDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CompanyDepartmentDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<CompanyDepartmentDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CompanyDepartmentDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<CompanyDepartmentDTO>(
      where: where(CompanyDepartmentDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CompanyDepartmentDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<CompanyDepartmentDTO>(
      where: where?.call(CompanyDepartmentDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class CompanyDepartmentDTOAttachRepository {
  const CompanyDepartmentDTOAttachRepository._();

  /// Creates a relation between this [CompanyDepartmentDTO] and the given [CompanyEmployeeDepartmentJT]s
  /// by setting each [CompanyEmployeeDepartmentJT]'s foreign key `companyDepartmentId` to refer to this [CompanyDepartmentDTO].
  Future<void> employees(
    _i1.Session session,
    CompanyDepartmentDTO companyDepartmentDTO,
    List<_i3.CompanyEmployeeDepartmentJT> companyEmployeeDepartmentJT, {
    _i1.Transaction? transaction,
  }) async {
    if (companyEmployeeDepartmentJT.any((e) => e.id == null)) {
      throw ArgumentError.notNull('companyEmployeeDepartmentJT.id');
    }
    if (companyDepartmentDTO.id == null) {
      throw ArgumentError.notNull('companyDepartmentDTO.id');
    }

    var $companyEmployeeDepartmentJT = companyEmployeeDepartmentJT
        .map((e) => e.copyWith(companyDepartmentId: companyDepartmentDTO.id))
        .toList();
    await session.db.update<_i3.CompanyEmployeeDepartmentJT>(
      $companyEmployeeDepartmentJT,
      columns: [_i3.CompanyEmployeeDepartmentJT.t.companyDepartmentId],
      transaction: transaction,
    );
  }
}

class CompanyDepartmentDTOAttachRowRepository {
  const CompanyDepartmentDTOAttachRowRepository._();

  /// Creates a relation between the given [CompanyDepartmentDTO] and [ContactDTO]
  /// by setting the [CompanyDepartmentDTO]'s foreign key `companyId` to refer to the [ContactDTO].
  Future<void> company(
    _i1.Session session,
    CompanyDepartmentDTO companyDepartmentDTO,
    _i2.ContactDTO company, {
    _i1.Transaction? transaction,
  }) async {
    if (companyDepartmentDTO.id == null) {
      throw ArgumentError.notNull('companyDepartmentDTO.id');
    }
    if (company.id == null) {
      throw ArgumentError.notNull('company.id');
    }

    var $companyDepartmentDTO =
        companyDepartmentDTO.copyWith(companyId: company.id);
    await session.db.updateRow<CompanyDepartmentDTO>(
      $companyDepartmentDTO,
      columns: [CompanyDepartmentDTO.t.companyId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [CompanyDepartmentDTO] and the given [CompanyEmployeeDepartmentJT]
  /// by setting the [CompanyEmployeeDepartmentJT]'s foreign key `companyDepartmentId` to refer to this [CompanyDepartmentDTO].
  Future<void> employees(
    _i1.Session session,
    CompanyDepartmentDTO companyDepartmentDTO,
    _i3.CompanyEmployeeDepartmentJT companyEmployeeDepartmentJT, {
    _i1.Transaction? transaction,
  }) async {
    if (companyEmployeeDepartmentJT.id == null) {
      throw ArgumentError.notNull('companyEmployeeDepartmentJT.id');
    }
    if (companyDepartmentDTO.id == null) {
      throw ArgumentError.notNull('companyDepartmentDTO.id');
    }

    var $companyEmployeeDepartmentJT = companyEmployeeDepartmentJT.copyWith(
        companyDepartmentId: companyDepartmentDTO.id);
    await session.db.updateRow<_i3.CompanyEmployeeDepartmentJT>(
      $companyEmployeeDepartmentJT,
      columns: [_i3.CompanyEmployeeDepartmentJT.t.companyDepartmentId],
      transaction: transaction,
    );
  }
}

class CompanyDepartmentDTODetachRepository {
  const CompanyDepartmentDTODetachRepository._();

  /// Detaches the relation between this [CompanyDepartmentDTO] and the given [CompanyEmployeeDepartmentJT]
  /// by setting the [CompanyEmployeeDepartmentJT]'s foreign key `companyDepartmentId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> employees(
    _i1.Session session,
    List<_i3.CompanyEmployeeDepartmentJT> companyEmployeeDepartmentJT, {
    _i1.Transaction? transaction,
  }) async {
    if (companyEmployeeDepartmentJT.any((e) => e.id == null)) {
      throw ArgumentError.notNull('companyEmployeeDepartmentJT.id');
    }

    var $companyEmployeeDepartmentJT = companyEmployeeDepartmentJT
        .map((e) => e.copyWith(companyDepartmentId: null))
        .toList();
    await session.db.update<_i3.CompanyEmployeeDepartmentJT>(
      $companyEmployeeDepartmentJT,
      columns: [_i3.CompanyEmployeeDepartmentJT.t.companyDepartmentId],
      transaction: transaction,
    );
  }
}

class CompanyDepartmentDTODetachRowRepository {
  const CompanyDepartmentDTODetachRowRepository._();

  /// Detaches the relation between this [CompanyDepartmentDTO] and the given [CompanyEmployeeDepartmentJT]
  /// by setting the [CompanyEmployeeDepartmentJT]'s foreign key `companyDepartmentId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> employees(
    _i1.Session session,
    _i3.CompanyEmployeeDepartmentJT companyEmployeeDepartmentJT, {
    _i1.Transaction? transaction,
  }) async {
    if (companyEmployeeDepartmentJT.id == null) {
      throw ArgumentError.notNull('companyEmployeeDepartmentJT.id');
    }

    var $companyEmployeeDepartmentJT =
        companyEmployeeDepartmentJT.copyWith(companyDepartmentId: null);
    await session.db.updateRow<_i3.CompanyEmployeeDepartmentJT>(
      $companyEmployeeDepartmentJT,
      columns: [_i3.CompanyEmployeeDepartmentJT.t.companyDepartmentId],
      transaction: transaction,
    );
  }
}
