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

abstract class CompanyEmployeeDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  CompanyEmployeeDTO._({
    this.id,
    required this.companyId,
    this.company,
    required this.employeeId,
    this.employee,
    required this.position,
    required this.active,
    required this.note,
    this.departments,
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

  factory CompanyEmployeeDTO({
    int? id,
    required int companyId,
    _i2.ContactDTO? company,
    required int employeeId,
    _i2.ContactDTO? employee,
    required String position,
    required bool active,
    required String note,
    List<_i3.CompanyEmployeeDepartmentJT>? departments,
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
  }) = _CompanyEmployeeDTOImpl;

  factory CompanyEmployeeDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return CompanyEmployeeDTO(
      id: jsonSerialization['id'] as int?,
      companyId: jsonSerialization['companyId'] as int,
      company: jsonSerialization['company'] == null
          ? null
          : _i2.ContactDTO.fromJson(
              (jsonSerialization['company'] as Map<String, dynamic>)),
      employeeId: jsonSerialization['employeeId'] as int,
      employee: jsonSerialization['employee'] == null
          ? null
          : _i2.ContactDTO.fromJson(
              (jsonSerialization['employee'] as Map<String, dynamic>)),
      position: jsonSerialization['position'] as String,
      active: jsonSerialization['active'] as bool,
      note: jsonSerialization['note'] as String,
      departments: (jsonSerialization['departments'] as List?)
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

  static final t = CompanyEmployeeDTOTable();

  static const db = CompanyEmployeeDTORepository._();

  @override
  int? id;

  int companyId;

  _i2.ContactDTO? company;

  int employeeId;

  _i2.ContactDTO? employee;

  String position;

  bool active;

  String note;

  List<_i3.CompanyEmployeeDepartmentJT>? departments;

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

  /// Returns a shallow copy of this [CompanyEmployeeDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CompanyEmployeeDTO copyWith({
    int? id,
    int? companyId,
    _i2.ContactDTO? company,
    int? employeeId,
    _i2.ContactDTO? employee,
    String? position,
    bool? active,
    String? note,
    List<_i3.CompanyEmployeeDepartmentJT>? departments,
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
      'employeeId': employeeId,
      if (employee != null) 'employee': employee?.toJson(),
      'position': position,
      'active': active,
      'note': note,
      if (departments != null)
        'departments': departments?.toJson(valueToJson: (v) => v.toJson()),
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
      'employeeId': employeeId,
      if (employee != null) 'employee': employee?.toJsonForProtocol(),
      'position': position,
      'active': active,
      'note': note,
      if (departments != null)
        'departments':
            departments?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
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

  static CompanyEmployeeDTOInclude include({
    _i2.ContactDTOInclude? company,
    _i2.ContactDTOInclude? employee,
    _i3.CompanyEmployeeDepartmentJTIncludeList? departments,
  }) {
    return CompanyEmployeeDTOInclude._(
      company: company,
      employee: employee,
      departments: departments,
    );
  }

  static CompanyEmployeeDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<CompanyEmployeeDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CompanyEmployeeDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CompanyEmployeeDTOTable>? orderByList,
    CompanyEmployeeDTOInclude? include,
  }) {
    return CompanyEmployeeDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CompanyEmployeeDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(CompanyEmployeeDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CompanyEmployeeDTOImpl extends CompanyEmployeeDTO {
  _CompanyEmployeeDTOImpl({
    int? id,
    required int companyId,
    _i2.ContactDTO? company,
    required int employeeId,
    _i2.ContactDTO? employee,
    required String position,
    required bool active,
    required String note,
    List<_i3.CompanyEmployeeDepartmentJT>? departments,
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
          employeeId: employeeId,
          employee: employee,
          position: position,
          active: active,
          note: note,
          departments: departments,
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

  /// Returns a shallow copy of this [CompanyEmployeeDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CompanyEmployeeDTO copyWith({
    Object? id = _Undefined,
    int? companyId,
    Object? company = _Undefined,
    int? employeeId,
    Object? employee = _Undefined,
    String? position,
    bool? active,
    String? note,
    Object? departments = _Undefined,
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
    return CompanyEmployeeDTO(
      id: id is int? ? id : this.id,
      companyId: companyId ?? this.companyId,
      company: company is _i2.ContactDTO? ? company : this.company?.copyWith(),
      employeeId: employeeId ?? this.employeeId,
      employee:
          employee is _i2.ContactDTO? ? employee : this.employee?.copyWith(),
      position: position ?? this.position,
      active: active ?? this.active,
      note: note ?? this.note,
      departments: departments is List<_i3.CompanyEmployeeDepartmentJT>?
          ? departments
          : this.departments?.map((e0) => e0.copyWith()).toList(),
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

class CompanyEmployeeDTOTable extends _i1.Table<int?> {
  CompanyEmployeeDTOTable({super.tableRelation})
      : super(tableName: 'ed_crm_company_employee') {
    companyId = _i1.ColumnInt(
      'companyId',
      this,
    );
    employeeId = _i1.ColumnInt(
      'employeeId',
      this,
    );
    position = _i1.ColumnString(
      'position',
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

  late final _i1.ColumnInt employeeId;

  _i2.ContactDTOTable? _employee;

  late final _i1.ColumnString position;

  late final _i1.ColumnBool active;

  late final _i1.ColumnString note;

  _i3.CompanyEmployeeDepartmentJTTable? ___departments;

  _i1.ManyRelation<_i3.CompanyEmployeeDepartmentJTTable>? _departments;

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
      field: CompanyEmployeeDTO.t.companyId,
      foreignField: _i2.ContactDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ContactDTOTable(tableRelation: foreignTableRelation),
    );
    return _company!;
  }

  _i2.ContactDTOTable get employee {
    if (_employee != null) return _employee!;
    _employee = _i1.createRelationTable(
      relationFieldName: 'employee',
      field: CompanyEmployeeDTO.t.employeeId,
      foreignField: _i2.ContactDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ContactDTOTable(tableRelation: foreignTableRelation),
    );
    return _employee!;
  }

  _i3.CompanyEmployeeDepartmentJTTable get __departments {
    if (___departments != null) return ___departments!;
    ___departments = _i1.createRelationTable(
      relationFieldName: '__departments',
      field: CompanyEmployeeDTO.t.id,
      foreignField: _i3.CompanyEmployeeDepartmentJT.t.companyEmployeeId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.CompanyEmployeeDepartmentJTTable(
              tableRelation: foreignTableRelation),
    );
    return ___departments!;
  }

  _i1.ManyRelation<_i3.CompanyEmployeeDepartmentJTTable> get departments {
    if (_departments != null) return _departments!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'departments',
      field: CompanyEmployeeDTO.t.id,
      foreignField: _i3.CompanyEmployeeDepartmentJT.t.companyEmployeeId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.CompanyEmployeeDepartmentJTTable(
              tableRelation: foreignTableRelation),
    );
    _departments = _i1.ManyRelation<_i3.CompanyEmployeeDepartmentJTTable>(
      tableWithRelations: relationTable,
      table: _i3.CompanyEmployeeDepartmentJTTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _departments!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        companyId,
        employeeId,
        position,
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
    if (relationField == 'employee') {
      return employee;
    }
    if (relationField == 'departments') {
      return __departments;
    }
    return null;
  }
}

class CompanyEmployeeDTOInclude extends _i1.IncludeObject {
  CompanyEmployeeDTOInclude._({
    _i2.ContactDTOInclude? company,
    _i2.ContactDTOInclude? employee,
    _i3.CompanyEmployeeDepartmentJTIncludeList? departments,
  }) {
    _company = company;
    _employee = employee;
    _departments = departments;
  }

  _i2.ContactDTOInclude? _company;

  _i2.ContactDTOInclude? _employee;

  _i3.CompanyEmployeeDepartmentJTIncludeList? _departments;

  @override
  Map<String, _i1.Include?> get includes => {
        'company': _company,
        'employee': _employee,
        'departments': _departments,
      };

  @override
  _i1.Table<int?> get table => CompanyEmployeeDTO.t;
}

class CompanyEmployeeDTOIncludeList extends _i1.IncludeList {
  CompanyEmployeeDTOIncludeList._({
    _i1.WhereExpressionBuilder<CompanyEmployeeDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CompanyEmployeeDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => CompanyEmployeeDTO.t;
}

class CompanyEmployeeDTORepository {
  const CompanyEmployeeDTORepository._();

  final attach = const CompanyEmployeeDTOAttachRepository._();

  final attachRow = const CompanyEmployeeDTOAttachRowRepository._();

  final detach = const CompanyEmployeeDTODetachRepository._();

  final detachRow = const CompanyEmployeeDTODetachRowRepository._();

  /// Returns a list of [CompanyEmployeeDTO]s matching the given query parameters.
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
  Future<List<CompanyEmployeeDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CompanyEmployeeDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CompanyEmployeeDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CompanyEmployeeDTOTable>? orderByList,
    _i1.Transaction? transaction,
    CompanyEmployeeDTOInclude? include,
  }) async {
    return session.db.find<CompanyEmployeeDTO>(
      where: where?.call(CompanyEmployeeDTO.t),
      orderBy: orderBy?.call(CompanyEmployeeDTO.t),
      orderByList: orderByList?.call(CompanyEmployeeDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [CompanyEmployeeDTO] matching the given query parameters.
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
  Future<CompanyEmployeeDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CompanyEmployeeDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<CompanyEmployeeDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CompanyEmployeeDTOTable>? orderByList,
    _i1.Transaction? transaction,
    CompanyEmployeeDTOInclude? include,
  }) async {
    return session.db.findFirstRow<CompanyEmployeeDTO>(
      where: where?.call(CompanyEmployeeDTO.t),
      orderBy: orderBy?.call(CompanyEmployeeDTO.t),
      orderByList: orderByList?.call(CompanyEmployeeDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [CompanyEmployeeDTO] by its [id] or null if no such row exists.
  Future<CompanyEmployeeDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    CompanyEmployeeDTOInclude? include,
  }) async {
    return session.db.findById<CompanyEmployeeDTO>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [CompanyEmployeeDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [CompanyEmployeeDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<CompanyEmployeeDTO>> insert(
    _i1.Session session,
    List<CompanyEmployeeDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<CompanyEmployeeDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [CompanyEmployeeDTO] and returns the inserted row.
  ///
  /// The returned [CompanyEmployeeDTO] will have its `id` field set.
  Future<CompanyEmployeeDTO> insertRow(
    _i1.Session session,
    CompanyEmployeeDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<CompanyEmployeeDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [CompanyEmployeeDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<CompanyEmployeeDTO>> update(
    _i1.Session session,
    List<CompanyEmployeeDTO> rows, {
    _i1.ColumnSelections<CompanyEmployeeDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<CompanyEmployeeDTO>(
      rows,
      columns: columns?.call(CompanyEmployeeDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CompanyEmployeeDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CompanyEmployeeDTO> updateRow(
    _i1.Session session,
    CompanyEmployeeDTO row, {
    _i1.ColumnSelections<CompanyEmployeeDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<CompanyEmployeeDTO>(
      row,
      columns: columns?.call(CompanyEmployeeDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [CompanyEmployeeDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<CompanyEmployeeDTO>> delete(
    _i1.Session session,
    List<CompanyEmployeeDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<CompanyEmployeeDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [CompanyEmployeeDTO].
  Future<CompanyEmployeeDTO> deleteRow(
    _i1.Session session,
    CompanyEmployeeDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CompanyEmployeeDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<CompanyEmployeeDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CompanyEmployeeDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<CompanyEmployeeDTO>(
      where: where(CompanyEmployeeDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CompanyEmployeeDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<CompanyEmployeeDTO>(
      where: where?.call(CompanyEmployeeDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class CompanyEmployeeDTOAttachRepository {
  const CompanyEmployeeDTOAttachRepository._();

  /// Creates a relation between this [CompanyEmployeeDTO] and the given [CompanyEmployeeDepartmentJT]s
  /// by setting each [CompanyEmployeeDepartmentJT]'s foreign key `companyEmployeeId` to refer to this [CompanyEmployeeDTO].
  Future<void> departments(
    _i1.Session session,
    CompanyEmployeeDTO companyEmployeeDTO,
    List<_i3.CompanyEmployeeDepartmentJT> companyEmployeeDepartmentJT, {
    _i1.Transaction? transaction,
  }) async {
    if (companyEmployeeDepartmentJT.any((e) => e.id == null)) {
      throw ArgumentError.notNull('companyEmployeeDepartmentJT.id');
    }
    if (companyEmployeeDTO.id == null) {
      throw ArgumentError.notNull('companyEmployeeDTO.id');
    }

    var $companyEmployeeDepartmentJT = companyEmployeeDepartmentJT
        .map((e) => e.copyWith(companyEmployeeId: companyEmployeeDTO.id))
        .toList();
    await session.db.update<_i3.CompanyEmployeeDepartmentJT>(
      $companyEmployeeDepartmentJT,
      columns: [_i3.CompanyEmployeeDepartmentJT.t.companyEmployeeId],
      transaction: transaction,
    );
  }
}

class CompanyEmployeeDTOAttachRowRepository {
  const CompanyEmployeeDTOAttachRowRepository._();

  /// Creates a relation between the given [CompanyEmployeeDTO] and [ContactDTO]
  /// by setting the [CompanyEmployeeDTO]'s foreign key `companyId` to refer to the [ContactDTO].
  Future<void> company(
    _i1.Session session,
    CompanyEmployeeDTO companyEmployeeDTO,
    _i2.ContactDTO company, {
    _i1.Transaction? transaction,
  }) async {
    if (companyEmployeeDTO.id == null) {
      throw ArgumentError.notNull('companyEmployeeDTO.id');
    }
    if (company.id == null) {
      throw ArgumentError.notNull('company.id');
    }

    var $companyEmployeeDTO =
        companyEmployeeDTO.copyWith(companyId: company.id);
    await session.db.updateRow<CompanyEmployeeDTO>(
      $companyEmployeeDTO,
      columns: [CompanyEmployeeDTO.t.companyId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [CompanyEmployeeDTO] and [ContactDTO]
  /// by setting the [CompanyEmployeeDTO]'s foreign key `employeeId` to refer to the [ContactDTO].
  Future<void> employee(
    _i1.Session session,
    CompanyEmployeeDTO companyEmployeeDTO,
    _i2.ContactDTO employee, {
    _i1.Transaction? transaction,
  }) async {
    if (companyEmployeeDTO.id == null) {
      throw ArgumentError.notNull('companyEmployeeDTO.id');
    }
    if (employee.id == null) {
      throw ArgumentError.notNull('employee.id');
    }

    var $companyEmployeeDTO =
        companyEmployeeDTO.copyWith(employeeId: employee.id);
    await session.db.updateRow<CompanyEmployeeDTO>(
      $companyEmployeeDTO,
      columns: [CompanyEmployeeDTO.t.employeeId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [CompanyEmployeeDTO] and the given [CompanyEmployeeDepartmentJT]
  /// by setting the [CompanyEmployeeDepartmentJT]'s foreign key `companyEmployeeId` to refer to this [CompanyEmployeeDTO].
  Future<void> departments(
    _i1.Session session,
    CompanyEmployeeDTO companyEmployeeDTO,
    _i3.CompanyEmployeeDepartmentJT companyEmployeeDepartmentJT, {
    _i1.Transaction? transaction,
  }) async {
    if (companyEmployeeDepartmentJT.id == null) {
      throw ArgumentError.notNull('companyEmployeeDepartmentJT.id');
    }
    if (companyEmployeeDTO.id == null) {
      throw ArgumentError.notNull('companyEmployeeDTO.id');
    }

    var $companyEmployeeDepartmentJT = companyEmployeeDepartmentJT.copyWith(
        companyEmployeeId: companyEmployeeDTO.id);
    await session.db.updateRow<_i3.CompanyEmployeeDepartmentJT>(
      $companyEmployeeDepartmentJT,
      columns: [_i3.CompanyEmployeeDepartmentJT.t.companyEmployeeId],
      transaction: transaction,
    );
  }
}

class CompanyEmployeeDTODetachRepository {
  const CompanyEmployeeDTODetachRepository._();

  /// Detaches the relation between this [CompanyEmployeeDTO] and the given [CompanyEmployeeDepartmentJT]
  /// by setting the [CompanyEmployeeDepartmentJT]'s foreign key `companyEmployeeId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> departments(
    _i1.Session session,
    List<_i3.CompanyEmployeeDepartmentJT> companyEmployeeDepartmentJT, {
    _i1.Transaction? transaction,
  }) async {
    if (companyEmployeeDepartmentJT.any((e) => e.id == null)) {
      throw ArgumentError.notNull('companyEmployeeDepartmentJT.id');
    }

    var $companyEmployeeDepartmentJT = companyEmployeeDepartmentJT
        .map((e) => e.copyWith(companyEmployeeId: null))
        .toList();
    await session.db.update<_i3.CompanyEmployeeDepartmentJT>(
      $companyEmployeeDepartmentJT,
      columns: [_i3.CompanyEmployeeDepartmentJT.t.companyEmployeeId],
      transaction: transaction,
    );
  }
}

class CompanyEmployeeDTODetachRowRepository {
  const CompanyEmployeeDTODetachRowRepository._();

  /// Detaches the relation between this [CompanyEmployeeDTO] and the given [CompanyEmployeeDepartmentJT]
  /// by setting the [CompanyEmployeeDepartmentJT]'s foreign key `companyEmployeeId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> departments(
    _i1.Session session,
    _i3.CompanyEmployeeDepartmentJT companyEmployeeDepartmentJT, {
    _i1.Transaction? transaction,
  }) async {
    if (companyEmployeeDepartmentJT.id == null) {
      throw ArgumentError.notNull('companyEmployeeDepartmentJT.id');
    }

    var $companyEmployeeDepartmentJT =
        companyEmployeeDepartmentJT.copyWith(companyEmployeeId: null);
    await session.db.updateRow<_i3.CompanyEmployeeDepartmentJT>(
      $companyEmployeeDepartmentJT,
      columns: [_i3.CompanyEmployeeDepartmentJT.t.companyEmployeeId],
      transaction: transaction,
    );
  }
}
