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
import '../../../modules/core/table/table_type.dart' as _i2;

abstract class CustomEntityIntKeys
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  CustomEntityIntKeys._({
    this.id,
    required this.tableType,
    required this.latestNumber,
  });

  factory CustomEntityIntKeys({
    int? id,
    required _i2.TableType tableType,
    required int latestNumber,
  }) = _CustomEntityIntKeysImpl;

  factory CustomEntityIntKeys.fromJson(Map<String, dynamic> jsonSerialization) {
    return CustomEntityIntKeys(
      id: jsonSerialization['id'] as int?,
      tableType:
          _i2.TableType.fromJson((jsonSerialization['tableType'] as String)),
      latestNumber: jsonSerialization['latestNumber'] as int,
    );
  }

  static final t = CustomEntityIntKeysTable();

  static const db = CustomEntityIntKeysRepository._();

  @override
  int? id;

  _i2.TableType tableType;

  int latestNumber;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [CustomEntityIntKeys]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CustomEntityIntKeys copyWith({
    int? id,
    _i2.TableType? tableType,
    int? latestNumber,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'tableType': tableType.toJson(),
      'latestNumber': latestNumber,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'tableType': tableType.toJson(),
      'latestNumber': latestNumber,
    };
  }

  static CustomEntityIntKeysInclude include() {
    return CustomEntityIntKeysInclude._();
  }

  static CustomEntityIntKeysIncludeList includeList({
    _i1.WhereExpressionBuilder<CustomEntityIntKeysTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CustomEntityIntKeysTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CustomEntityIntKeysTable>? orderByList,
    CustomEntityIntKeysInclude? include,
  }) {
    return CustomEntityIntKeysIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CustomEntityIntKeys.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(CustomEntityIntKeys.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CustomEntityIntKeysImpl extends CustomEntityIntKeys {
  _CustomEntityIntKeysImpl({
    int? id,
    required _i2.TableType tableType,
    required int latestNumber,
  }) : super._(
          id: id,
          tableType: tableType,
          latestNumber: latestNumber,
        );

  /// Returns a shallow copy of this [CustomEntityIntKeys]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CustomEntityIntKeys copyWith({
    Object? id = _Undefined,
    _i2.TableType? tableType,
    int? latestNumber,
  }) {
    return CustomEntityIntKeys(
      id: id is int? ? id : this.id,
      tableType: tableType ?? this.tableType,
      latestNumber: latestNumber ?? this.latestNumber,
    );
  }
}

class CustomEntityIntKeysTable extends _i1.Table<int?> {
  CustomEntityIntKeysTable({super.tableRelation})
      : super(tableName: 'ed_core_custom_entity_int_keys') {
    tableType = _i1.ColumnEnum(
      'tableType',
      this,
      _i1.EnumSerialization.byName,
    );
    latestNumber = _i1.ColumnInt(
      'latestNumber',
      this,
    );
  }

  late final _i1.ColumnEnum<_i2.TableType> tableType;

  late final _i1.ColumnInt latestNumber;

  @override
  List<_i1.Column> get columns => [
        id,
        tableType,
        latestNumber,
      ];
}

class CustomEntityIntKeysInclude extends _i1.IncludeObject {
  CustomEntityIntKeysInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => CustomEntityIntKeys.t;
}

class CustomEntityIntKeysIncludeList extends _i1.IncludeList {
  CustomEntityIntKeysIncludeList._({
    _i1.WhereExpressionBuilder<CustomEntityIntKeysTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CustomEntityIntKeys.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => CustomEntityIntKeys.t;
}

class CustomEntityIntKeysRepository {
  const CustomEntityIntKeysRepository._();

  /// Returns a list of [CustomEntityIntKeys]s matching the given query parameters.
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
  Future<List<CustomEntityIntKeys>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CustomEntityIntKeysTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CustomEntityIntKeysTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CustomEntityIntKeysTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<CustomEntityIntKeys>(
      where: where?.call(CustomEntityIntKeys.t),
      orderBy: orderBy?.call(CustomEntityIntKeys.t),
      orderByList: orderByList?.call(CustomEntityIntKeys.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [CustomEntityIntKeys] matching the given query parameters.
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
  Future<CustomEntityIntKeys?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CustomEntityIntKeysTable>? where,
    int? offset,
    _i1.OrderByBuilder<CustomEntityIntKeysTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CustomEntityIntKeysTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<CustomEntityIntKeys>(
      where: where?.call(CustomEntityIntKeys.t),
      orderBy: orderBy?.call(CustomEntityIntKeys.t),
      orderByList: orderByList?.call(CustomEntityIntKeys.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [CustomEntityIntKeys] by its [id] or null if no such row exists.
  Future<CustomEntityIntKeys?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<CustomEntityIntKeys>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [CustomEntityIntKeys]s in the list and returns the inserted rows.
  ///
  /// The returned [CustomEntityIntKeys]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<CustomEntityIntKeys>> insert(
    _i1.Session session,
    List<CustomEntityIntKeys> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<CustomEntityIntKeys>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [CustomEntityIntKeys] and returns the inserted row.
  ///
  /// The returned [CustomEntityIntKeys] will have its `id` field set.
  Future<CustomEntityIntKeys> insertRow(
    _i1.Session session,
    CustomEntityIntKeys row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<CustomEntityIntKeys>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [CustomEntityIntKeys]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<CustomEntityIntKeys>> update(
    _i1.Session session,
    List<CustomEntityIntKeys> rows, {
    _i1.ColumnSelections<CustomEntityIntKeysTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<CustomEntityIntKeys>(
      rows,
      columns: columns?.call(CustomEntityIntKeys.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CustomEntityIntKeys]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CustomEntityIntKeys> updateRow(
    _i1.Session session,
    CustomEntityIntKeys row, {
    _i1.ColumnSelections<CustomEntityIntKeysTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<CustomEntityIntKeys>(
      row,
      columns: columns?.call(CustomEntityIntKeys.t),
      transaction: transaction,
    );
  }

  /// Deletes all [CustomEntityIntKeys]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<CustomEntityIntKeys>> delete(
    _i1.Session session,
    List<CustomEntityIntKeys> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<CustomEntityIntKeys>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [CustomEntityIntKeys].
  Future<CustomEntityIntKeys> deleteRow(
    _i1.Session session,
    CustomEntityIntKeys row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CustomEntityIntKeys>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<CustomEntityIntKeys>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CustomEntityIntKeysTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<CustomEntityIntKeys>(
      where: where(CustomEntityIntKeys.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CustomEntityIntKeysTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<CustomEntityIntKeys>(
      where: where?.call(CustomEntityIntKeys.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
