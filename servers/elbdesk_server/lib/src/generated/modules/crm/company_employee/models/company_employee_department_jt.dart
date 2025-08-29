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
import '../../../../modules/crm/company_employee/models/company_employee.dart'
    as _i2;
import '../../../../modules/crm/company_department/models/company_department.dart'
    as _i3;

abstract class CompanyEmployeeDepartmentJT
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  CompanyEmployeeDepartmentJT._({
    this.id,
    required this.companyEmployeeId,
    this.companyEmployee,
    required this.companyDepartmentId,
    this.companyDepartment,
  });

  factory CompanyEmployeeDepartmentJT({
    int? id,
    required int companyEmployeeId,
    _i2.CompanyEmployeeDTO? companyEmployee,
    required int companyDepartmentId,
    _i3.CompanyDepartmentDTO? companyDepartment,
  }) = _CompanyEmployeeDepartmentJTImpl;

  factory CompanyEmployeeDepartmentJT.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return CompanyEmployeeDepartmentJT(
      id: jsonSerialization['id'] as int?,
      companyEmployeeId: jsonSerialization['companyEmployeeId'] as int,
      companyEmployee: jsonSerialization['companyEmployee'] == null
          ? null
          : _i2.CompanyEmployeeDTO.fromJson(
              (jsonSerialization['companyEmployee'] as Map<String, dynamic>)),
      companyDepartmentId: jsonSerialization['companyDepartmentId'] as int,
      companyDepartment: jsonSerialization['companyDepartment'] == null
          ? null
          : _i3.CompanyDepartmentDTO.fromJson(
              (jsonSerialization['companyDepartment'] as Map<String, dynamic>)),
    );
  }

  static final t = CompanyEmployeeDepartmentJTTable();

  static const db = CompanyEmployeeDepartmentJTRepository._();

  @override
  int? id;

  int companyEmployeeId;

  _i2.CompanyEmployeeDTO? companyEmployee;

  int companyDepartmentId;

  _i3.CompanyDepartmentDTO? companyDepartment;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [CompanyEmployeeDepartmentJT]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CompanyEmployeeDepartmentJT copyWith({
    int? id,
    int? companyEmployeeId,
    _i2.CompanyEmployeeDTO? companyEmployee,
    int? companyDepartmentId,
    _i3.CompanyDepartmentDTO? companyDepartment,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'companyEmployeeId': companyEmployeeId,
      if (companyEmployee != null) 'companyEmployee': companyEmployee?.toJson(),
      'companyDepartmentId': companyDepartmentId,
      if (companyDepartment != null)
        'companyDepartment': companyDepartment?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'companyEmployeeId': companyEmployeeId,
      if (companyEmployee != null)
        'companyEmployee': companyEmployee?.toJsonForProtocol(),
      'companyDepartmentId': companyDepartmentId,
      if (companyDepartment != null)
        'companyDepartment': companyDepartment?.toJsonForProtocol(),
    };
  }

  static CompanyEmployeeDepartmentJTInclude include({
    _i2.CompanyEmployeeDTOInclude? companyEmployee,
    _i3.CompanyDepartmentDTOInclude? companyDepartment,
  }) {
    return CompanyEmployeeDepartmentJTInclude._(
      companyEmployee: companyEmployee,
      companyDepartment: companyDepartment,
    );
  }

  static CompanyEmployeeDepartmentJTIncludeList includeList({
    _i1.WhereExpressionBuilder<CompanyEmployeeDepartmentJTTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CompanyEmployeeDepartmentJTTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CompanyEmployeeDepartmentJTTable>? orderByList,
    CompanyEmployeeDepartmentJTInclude? include,
  }) {
    return CompanyEmployeeDepartmentJTIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CompanyEmployeeDepartmentJT.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(CompanyEmployeeDepartmentJT.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CompanyEmployeeDepartmentJTImpl extends CompanyEmployeeDepartmentJT {
  _CompanyEmployeeDepartmentJTImpl({
    int? id,
    required int companyEmployeeId,
    _i2.CompanyEmployeeDTO? companyEmployee,
    required int companyDepartmentId,
    _i3.CompanyDepartmentDTO? companyDepartment,
  }) : super._(
          id: id,
          companyEmployeeId: companyEmployeeId,
          companyEmployee: companyEmployee,
          companyDepartmentId: companyDepartmentId,
          companyDepartment: companyDepartment,
        );

  /// Returns a shallow copy of this [CompanyEmployeeDepartmentJT]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CompanyEmployeeDepartmentJT copyWith({
    Object? id = _Undefined,
    int? companyEmployeeId,
    Object? companyEmployee = _Undefined,
    int? companyDepartmentId,
    Object? companyDepartment = _Undefined,
  }) {
    return CompanyEmployeeDepartmentJT(
      id: id is int? ? id : this.id,
      companyEmployeeId: companyEmployeeId ?? this.companyEmployeeId,
      companyEmployee: companyEmployee is _i2.CompanyEmployeeDTO?
          ? companyEmployee
          : this.companyEmployee?.copyWith(),
      companyDepartmentId: companyDepartmentId ?? this.companyDepartmentId,
      companyDepartment: companyDepartment is _i3.CompanyDepartmentDTO?
          ? companyDepartment
          : this.companyDepartment?.copyWith(),
    );
  }
}

class CompanyEmployeeDepartmentJTTable extends _i1.Table<int?> {
  CompanyEmployeeDepartmentJTTable({super.tableRelation})
      : super(tableName: 'jt_company_employee_department') {
    companyEmployeeId = _i1.ColumnInt(
      'companyEmployeeId',
      this,
    );
    companyDepartmentId = _i1.ColumnInt(
      'companyDepartmentId',
      this,
    );
  }

  late final _i1.ColumnInt companyEmployeeId;

  _i2.CompanyEmployeeDTOTable? _companyEmployee;

  late final _i1.ColumnInt companyDepartmentId;

  _i3.CompanyDepartmentDTOTable? _companyDepartment;

  _i2.CompanyEmployeeDTOTable get companyEmployee {
    if (_companyEmployee != null) return _companyEmployee!;
    _companyEmployee = _i1.createRelationTable(
      relationFieldName: 'companyEmployee',
      field: CompanyEmployeeDepartmentJT.t.companyEmployeeId,
      foreignField: _i2.CompanyEmployeeDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.CompanyEmployeeDTOTable(tableRelation: foreignTableRelation),
    );
    return _companyEmployee!;
  }

  _i3.CompanyDepartmentDTOTable get companyDepartment {
    if (_companyDepartment != null) return _companyDepartment!;
    _companyDepartment = _i1.createRelationTable(
      relationFieldName: 'companyDepartment',
      field: CompanyEmployeeDepartmentJT.t.companyDepartmentId,
      foreignField: _i3.CompanyDepartmentDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.CompanyDepartmentDTOTable(tableRelation: foreignTableRelation),
    );
    return _companyDepartment!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        companyEmployeeId,
        companyDepartmentId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'companyEmployee') {
      return companyEmployee;
    }
    if (relationField == 'companyDepartment') {
      return companyDepartment;
    }
    return null;
  }
}

class CompanyEmployeeDepartmentJTInclude extends _i1.IncludeObject {
  CompanyEmployeeDepartmentJTInclude._({
    _i2.CompanyEmployeeDTOInclude? companyEmployee,
    _i3.CompanyDepartmentDTOInclude? companyDepartment,
  }) {
    _companyEmployee = companyEmployee;
    _companyDepartment = companyDepartment;
  }

  _i2.CompanyEmployeeDTOInclude? _companyEmployee;

  _i3.CompanyDepartmentDTOInclude? _companyDepartment;

  @override
  Map<String, _i1.Include?> get includes => {
        'companyEmployee': _companyEmployee,
        'companyDepartment': _companyDepartment,
      };

  @override
  _i1.Table<int?> get table => CompanyEmployeeDepartmentJT.t;
}

class CompanyEmployeeDepartmentJTIncludeList extends _i1.IncludeList {
  CompanyEmployeeDepartmentJTIncludeList._({
    _i1.WhereExpressionBuilder<CompanyEmployeeDepartmentJTTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CompanyEmployeeDepartmentJT.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => CompanyEmployeeDepartmentJT.t;
}

class CompanyEmployeeDepartmentJTRepository {
  const CompanyEmployeeDepartmentJTRepository._();

  final attachRow = const CompanyEmployeeDepartmentJTAttachRowRepository._();

  /// Returns a list of [CompanyEmployeeDepartmentJT]s matching the given query parameters.
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
  Future<List<CompanyEmployeeDepartmentJT>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CompanyEmployeeDepartmentJTTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CompanyEmployeeDepartmentJTTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CompanyEmployeeDepartmentJTTable>? orderByList,
    _i1.Transaction? transaction,
    CompanyEmployeeDepartmentJTInclude? include,
  }) async {
    return session.db.find<CompanyEmployeeDepartmentJT>(
      where: where?.call(CompanyEmployeeDepartmentJT.t),
      orderBy: orderBy?.call(CompanyEmployeeDepartmentJT.t),
      orderByList: orderByList?.call(CompanyEmployeeDepartmentJT.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [CompanyEmployeeDepartmentJT] matching the given query parameters.
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
  Future<CompanyEmployeeDepartmentJT?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CompanyEmployeeDepartmentJTTable>? where,
    int? offset,
    _i1.OrderByBuilder<CompanyEmployeeDepartmentJTTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CompanyEmployeeDepartmentJTTable>? orderByList,
    _i1.Transaction? transaction,
    CompanyEmployeeDepartmentJTInclude? include,
  }) async {
    return session.db.findFirstRow<CompanyEmployeeDepartmentJT>(
      where: where?.call(CompanyEmployeeDepartmentJT.t),
      orderBy: orderBy?.call(CompanyEmployeeDepartmentJT.t),
      orderByList: orderByList?.call(CompanyEmployeeDepartmentJT.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [CompanyEmployeeDepartmentJT] by its [id] or null if no such row exists.
  Future<CompanyEmployeeDepartmentJT?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    CompanyEmployeeDepartmentJTInclude? include,
  }) async {
    return session.db.findById<CompanyEmployeeDepartmentJT>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [CompanyEmployeeDepartmentJT]s in the list and returns the inserted rows.
  ///
  /// The returned [CompanyEmployeeDepartmentJT]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<CompanyEmployeeDepartmentJT>> insert(
    _i1.Session session,
    List<CompanyEmployeeDepartmentJT> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<CompanyEmployeeDepartmentJT>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [CompanyEmployeeDepartmentJT] and returns the inserted row.
  ///
  /// The returned [CompanyEmployeeDepartmentJT] will have its `id` field set.
  Future<CompanyEmployeeDepartmentJT> insertRow(
    _i1.Session session,
    CompanyEmployeeDepartmentJT row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<CompanyEmployeeDepartmentJT>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [CompanyEmployeeDepartmentJT]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<CompanyEmployeeDepartmentJT>> update(
    _i1.Session session,
    List<CompanyEmployeeDepartmentJT> rows, {
    _i1.ColumnSelections<CompanyEmployeeDepartmentJTTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<CompanyEmployeeDepartmentJT>(
      rows,
      columns: columns?.call(CompanyEmployeeDepartmentJT.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CompanyEmployeeDepartmentJT]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CompanyEmployeeDepartmentJT> updateRow(
    _i1.Session session,
    CompanyEmployeeDepartmentJT row, {
    _i1.ColumnSelections<CompanyEmployeeDepartmentJTTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<CompanyEmployeeDepartmentJT>(
      row,
      columns: columns?.call(CompanyEmployeeDepartmentJT.t),
      transaction: transaction,
    );
  }

  /// Deletes all [CompanyEmployeeDepartmentJT]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<CompanyEmployeeDepartmentJT>> delete(
    _i1.Session session,
    List<CompanyEmployeeDepartmentJT> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<CompanyEmployeeDepartmentJT>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [CompanyEmployeeDepartmentJT].
  Future<CompanyEmployeeDepartmentJT> deleteRow(
    _i1.Session session,
    CompanyEmployeeDepartmentJT row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CompanyEmployeeDepartmentJT>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<CompanyEmployeeDepartmentJT>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CompanyEmployeeDepartmentJTTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<CompanyEmployeeDepartmentJT>(
      where: where(CompanyEmployeeDepartmentJT.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CompanyEmployeeDepartmentJTTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<CompanyEmployeeDepartmentJT>(
      where: where?.call(CompanyEmployeeDepartmentJT.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class CompanyEmployeeDepartmentJTAttachRowRepository {
  const CompanyEmployeeDepartmentJTAttachRowRepository._();

  /// Creates a relation between the given [CompanyEmployeeDepartmentJT] and [CompanyEmployeeDTO]
  /// by setting the [CompanyEmployeeDepartmentJT]'s foreign key `companyEmployeeId` to refer to the [CompanyEmployeeDTO].
  Future<void> companyEmployee(
    _i1.Session session,
    CompanyEmployeeDepartmentJT companyEmployeeDepartmentJT,
    _i2.CompanyEmployeeDTO companyEmployee, {
    _i1.Transaction? transaction,
  }) async {
    if (companyEmployeeDepartmentJT.id == null) {
      throw ArgumentError.notNull('companyEmployeeDepartmentJT.id');
    }
    if (companyEmployee.id == null) {
      throw ArgumentError.notNull('companyEmployee.id');
    }

    var $companyEmployeeDepartmentJT = companyEmployeeDepartmentJT.copyWith(
        companyEmployeeId: companyEmployee.id);
    await session.db.updateRow<CompanyEmployeeDepartmentJT>(
      $companyEmployeeDepartmentJT,
      columns: [CompanyEmployeeDepartmentJT.t.companyEmployeeId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [CompanyEmployeeDepartmentJT] and [CompanyDepartmentDTO]
  /// by setting the [CompanyEmployeeDepartmentJT]'s foreign key `companyDepartmentId` to refer to the [CompanyDepartmentDTO].
  Future<void> companyDepartment(
    _i1.Session session,
    CompanyEmployeeDepartmentJT companyEmployeeDepartmentJT,
    _i3.CompanyDepartmentDTO companyDepartment, {
    _i1.Transaction? transaction,
  }) async {
    if (companyEmployeeDepartmentJT.id == null) {
      throw ArgumentError.notNull('companyEmployeeDepartmentJT.id');
    }
    if (companyDepartment.id == null) {
      throw ArgumentError.notNull('companyDepartment.id');
    }

    var $companyEmployeeDepartmentJT = companyEmployeeDepartmentJT.copyWith(
        companyDepartmentId: companyDepartment.id);
    await session.db.updateRow<CompanyEmployeeDepartmentJT>(
      $companyEmployeeDepartmentJT,
      columns: [CompanyEmployeeDepartmentJT.t.companyDepartmentId],
      transaction: transaction,
    );
  }
}
