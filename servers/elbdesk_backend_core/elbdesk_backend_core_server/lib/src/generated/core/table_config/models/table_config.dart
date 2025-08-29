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
import '../../../core/table_config/models/table_field_config.dart' as _i2;
import '../../../core/table_filter/models/filter.dart' as _i3;
import '../../../core/table_filter/models/sort.dart' as _i4;

abstract class TableConfig
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  TableConfig._({
    this.id,
    required this.componentIdentifier,
    required this.tableId,
    this.userId,
    required this.tableFieldConfig,
    this.filter,
    required this.isPrimary,
    required this.name,
    this.sort,
  });

  factory TableConfig({
    int? id,
    required String componentIdentifier,
    required String tableId,
    int? userId,
    required List<_i2.TableFieldConfig> tableFieldConfig,
    _i3.Filter? filter,
    required bool isPrimary,
    required String name,
    _i4.Sort? sort,
  }) = _TableConfigImpl;

  factory TableConfig.fromJson(Map<String, dynamic> jsonSerialization) {
    return TableConfig(
      id: jsonSerialization['id'] as int?,
      componentIdentifier: jsonSerialization['componentIdentifier'] as String,
      tableId: jsonSerialization['tableId'] as String,
      userId: jsonSerialization['userId'] as int?,
      tableFieldConfig: (jsonSerialization['tableFieldConfig'] as List)
          .map(
              (e) => _i2.TableFieldConfig.fromJson((e as Map<String, dynamic>)))
          .toList(),
      filter: jsonSerialization['filter'] == null
          ? null
          : _i3.Filter.fromJson(
              (jsonSerialization['filter'] as Map<String, dynamic>)),
      isPrimary: jsonSerialization['isPrimary'] as bool,
      name: jsonSerialization['name'] as String,
      sort: jsonSerialization['sort'] == null
          ? null
          : _i4.Sort.fromJson(
              (jsonSerialization['sort'] as Map<String, dynamic>)),
    );
  }

  static final t = TableConfigTable();

  static const db = TableConfigRepository._();

  @override
  int? id;

  String componentIdentifier;

  String tableId;

  int? userId;

  List<_i2.TableFieldConfig> tableFieldConfig;

  _i3.Filter? filter;

  bool isPrimary;

  String name;

  _i4.Sort? sort;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [TableConfig]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TableConfig copyWith({
    int? id,
    String? componentIdentifier,
    String? tableId,
    int? userId,
    List<_i2.TableFieldConfig>? tableFieldConfig,
    _i3.Filter? filter,
    bool? isPrimary,
    String? name,
    _i4.Sort? sort,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'componentIdentifier': componentIdentifier,
      'tableId': tableId,
      if (userId != null) 'userId': userId,
      'tableFieldConfig':
          tableFieldConfig.toJson(valueToJson: (v) => v.toJson()),
      if (filter != null) 'filter': filter?.toJson(),
      'isPrimary': isPrimary,
      'name': name,
      if (sort != null) 'sort': sort?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'componentIdentifier': componentIdentifier,
      'tableId': tableId,
      'tableFieldConfig':
          tableFieldConfig.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (filter != null) 'filter': filter?.toJsonForProtocol(),
      'isPrimary': isPrimary,
      'name': name,
      if (sort != null) 'sort': sort?.toJsonForProtocol(),
    };
  }

  static TableConfigInclude include() {
    return TableConfigInclude._();
  }

  static TableConfigIncludeList includeList({
    _i1.WhereExpressionBuilder<TableConfigTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TableConfigTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TableConfigTable>? orderByList,
    TableConfigInclude? include,
  }) {
    return TableConfigIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TableConfig.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(TableConfig.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TableConfigImpl extends TableConfig {
  _TableConfigImpl({
    int? id,
    required String componentIdentifier,
    required String tableId,
    int? userId,
    required List<_i2.TableFieldConfig> tableFieldConfig,
    _i3.Filter? filter,
    required bool isPrimary,
    required String name,
    _i4.Sort? sort,
  }) : super._(
          id: id,
          componentIdentifier: componentIdentifier,
          tableId: tableId,
          userId: userId,
          tableFieldConfig: tableFieldConfig,
          filter: filter,
          isPrimary: isPrimary,
          name: name,
          sort: sort,
        );

  /// Returns a shallow copy of this [TableConfig]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TableConfig copyWith({
    Object? id = _Undefined,
    String? componentIdentifier,
    String? tableId,
    Object? userId = _Undefined,
    List<_i2.TableFieldConfig>? tableFieldConfig,
    Object? filter = _Undefined,
    bool? isPrimary,
    String? name,
    Object? sort = _Undefined,
  }) {
    return TableConfig(
      id: id is int? ? id : this.id,
      componentIdentifier: componentIdentifier ?? this.componentIdentifier,
      tableId: tableId ?? this.tableId,
      userId: userId is int? ? userId : this.userId,
      tableFieldConfig: tableFieldConfig ??
          this.tableFieldConfig.map((e0) => e0.copyWith()).toList(),
      filter: filter is _i3.Filter? ? filter : this.filter?.copyWith(),
      isPrimary: isPrimary ?? this.isPrimary,
      name: name ?? this.name,
      sort: sort is _i4.Sort? ? sort : this.sort?.copyWith(),
    );
  }
}

class TableConfigTable extends _i1.Table<int?> {
  TableConfigTable({super.tableRelation})
      : super(tableName: 'ed_core_table_config') {
    componentIdentifier = _i1.ColumnString(
      'componentIdentifier',
      this,
    );
    tableId = _i1.ColumnString(
      'tableId',
      this,
    );
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    tableFieldConfig = _i1.ColumnSerializable(
      'tableFieldConfig',
      this,
    );
    filter = _i1.ColumnSerializable(
      'filter',
      this,
    );
    isPrimary = _i1.ColumnBool(
      'isPrimary',
      this,
    );
    name = _i1.ColumnString(
      'name',
      this,
    );
    sort = _i1.ColumnSerializable(
      'sort',
      this,
    );
  }

  late final _i1.ColumnString componentIdentifier;

  late final _i1.ColumnString tableId;

  late final _i1.ColumnInt userId;

  late final _i1.ColumnSerializable tableFieldConfig;

  late final _i1.ColumnSerializable filter;

  late final _i1.ColumnBool isPrimary;

  late final _i1.ColumnString name;

  late final _i1.ColumnSerializable sort;

  @override
  List<_i1.Column> get columns => [
        id,
        componentIdentifier,
        tableId,
        userId,
        tableFieldConfig,
        filter,
        isPrimary,
        name,
        sort,
      ];
}

class TableConfigInclude extends _i1.IncludeObject {
  TableConfigInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => TableConfig.t;
}

class TableConfigIncludeList extends _i1.IncludeList {
  TableConfigIncludeList._({
    _i1.WhereExpressionBuilder<TableConfigTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(TableConfig.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => TableConfig.t;
}

class TableConfigRepository {
  const TableConfigRepository._();

  /// Returns a list of [TableConfig]s matching the given query parameters.
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
  Future<List<TableConfig>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TableConfigTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TableConfigTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TableConfigTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<TableConfig>(
      where: where?.call(TableConfig.t),
      orderBy: orderBy?.call(TableConfig.t),
      orderByList: orderByList?.call(TableConfig.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [TableConfig] matching the given query parameters.
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
  Future<TableConfig?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TableConfigTable>? where,
    int? offset,
    _i1.OrderByBuilder<TableConfigTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TableConfigTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<TableConfig>(
      where: where?.call(TableConfig.t),
      orderBy: orderBy?.call(TableConfig.t),
      orderByList: orderByList?.call(TableConfig.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [TableConfig] by its [id] or null if no such row exists.
  Future<TableConfig?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<TableConfig>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [TableConfig]s in the list and returns the inserted rows.
  ///
  /// The returned [TableConfig]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<TableConfig>> insert(
    _i1.Session session,
    List<TableConfig> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<TableConfig>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [TableConfig] and returns the inserted row.
  ///
  /// The returned [TableConfig] will have its `id` field set.
  Future<TableConfig> insertRow(
    _i1.Session session,
    TableConfig row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<TableConfig>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [TableConfig]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<TableConfig>> update(
    _i1.Session session,
    List<TableConfig> rows, {
    _i1.ColumnSelections<TableConfigTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<TableConfig>(
      rows,
      columns: columns?.call(TableConfig.t),
      transaction: transaction,
    );
  }

  /// Updates a single [TableConfig]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<TableConfig> updateRow(
    _i1.Session session,
    TableConfig row, {
    _i1.ColumnSelections<TableConfigTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<TableConfig>(
      row,
      columns: columns?.call(TableConfig.t),
      transaction: transaction,
    );
  }

  /// Deletes all [TableConfig]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<TableConfig>> delete(
    _i1.Session session,
    List<TableConfig> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<TableConfig>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [TableConfig].
  Future<TableConfig> deleteRow(
    _i1.Session session,
    TableConfig row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<TableConfig>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<TableConfig>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<TableConfigTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<TableConfig>(
      where: where(TableConfig.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TableConfigTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<TableConfig>(
      where: where?.call(TableConfig.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
