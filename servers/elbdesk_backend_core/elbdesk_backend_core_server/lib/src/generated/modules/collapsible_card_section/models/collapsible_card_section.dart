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

abstract class CollapsibleCardSectionConfig
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  CollapsibleCardSectionConfig._({
    this.id,
    this.userId,
    required this.configs,
  });

  factory CollapsibleCardSectionConfig({
    int? id,
    int? userId,
    required Map<String, bool> configs,
  }) = _CollapsibleCardSectionConfigImpl;

  factory CollapsibleCardSectionConfig.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return CollapsibleCardSectionConfig(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int?,
      configs: (jsonSerialization['configs'] as Map).map((k, v) => MapEntry(
            k as String,
            v as bool,
          )),
    );
  }

  static final t = CollapsibleCardSectionConfigTable();

  static const db = CollapsibleCardSectionConfigRepository._();

  @override
  int? id;

  int? userId;

  Map<String, bool> configs;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [CollapsibleCardSectionConfig]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CollapsibleCardSectionConfig copyWith({
    int? id,
    int? userId,
    Map<String, bool>? configs,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (userId != null) 'userId': userId,
      'configs': configs.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'configs': configs.toJson(),
    };
  }

  static CollapsibleCardSectionConfigInclude include() {
    return CollapsibleCardSectionConfigInclude._();
  }

  static CollapsibleCardSectionConfigIncludeList includeList({
    _i1.WhereExpressionBuilder<CollapsibleCardSectionConfigTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CollapsibleCardSectionConfigTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CollapsibleCardSectionConfigTable>? orderByList,
    CollapsibleCardSectionConfigInclude? include,
  }) {
    return CollapsibleCardSectionConfigIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CollapsibleCardSectionConfig.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(CollapsibleCardSectionConfig.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CollapsibleCardSectionConfigImpl extends CollapsibleCardSectionConfig {
  _CollapsibleCardSectionConfigImpl({
    int? id,
    int? userId,
    required Map<String, bool> configs,
  }) : super._(
          id: id,
          userId: userId,
          configs: configs,
        );

  /// Returns a shallow copy of this [CollapsibleCardSectionConfig]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CollapsibleCardSectionConfig copyWith({
    Object? id = _Undefined,
    Object? userId = _Undefined,
    Map<String, bool>? configs,
  }) {
    return CollapsibleCardSectionConfig(
      id: id is int? ? id : this.id,
      userId: userId is int? ? userId : this.userId,
      configs: configs ??
          this.configs.map((
                key0,
                value0,
              ) =>
                  MapEntry(
                    key0,
                    value0,
                  )),
    );
  }
}

class CollapsibleCardSectionConfigTable extends _i1.Table<int?> {
  CollapsibleCardSectionConfigTable({super.tableRelation})
      : super(tableName: 'ed_core_collapsible_card_section_config') {
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    configs = _i1.ColumnSerializable(
      'configs',
      this,
    );
  }

  late final _i1.ColumnInt userId;

  late final _i1.ColumnSerializable configs;

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        configs,
      ];
}

class CollapsibleCardSectionConfigInclude extends _i1.IncludeObject {
  CollapsibleCardSectionConfigInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => CollapsibleCardSectionConfig.t;
}

class CollapsibleCardSectionConfigIncludeList extends _i1.IncludeList {
  CollapsibleCardSectionConfigIncludeList._({
    _i1.WhereExpressionBuilder<CollapsibleCardSectionConfigTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CollapsibleCardSectionConfig.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => CollapsibleCardSectionConfig.t;
}

class CollapsibleCardSectionConfigRepository {
  const CollapsibleCardSectionConfigRepository._();

  /// Returns a list of [CollapsibleCardSectionConfig]s matching the given query parameters.
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
  Future<List<CollapsibleCardSectionConfig>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CollapsibleCardSectionConfigTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CollapsibleCardSectionConfigTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CollapsibleCardSectionConfigTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<CollapsibleCardSectionConfig>(
      where: where?.call(CollapsibleCardSectionConfig.t),
      orderBy: orderBy?.call(CollapsibleCardSectionConfig.t),
      orderByList: orderByList?.call(CollapsibleCardSectionConfig.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [CollapsibleCardSectionConfig] matching the given query parameters.
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
  Future<CollapsibleCardSectionConfig?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CollapsibleCardSectionConfigTable>? where,
    int? offset,
    _i1.OrderByBuilder<CollapsibleCardSectionConfigTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CollapsibleCardSectionConfigTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<CollapsibleCardSectionConfig>(
      where: where?.call(CollapsibleCardSectionConfig.t),
      orderBy: orderBy?.call(CollapsibleCardSectionConfig.t),
      orderByList: orderByList?.call(CollapsibleCardSectionConfig.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [CollapsibleCardSectionConfig] by its [id] or null if no such row exists.
  Future<CollapsibleCardSectionConfig?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<CollapsibleCardSectionConfig>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [CollapsibleCardSectionConfig]s in the list and returns the inserted rows.
  ///
  /// The returned [CollapsibleCardSectionConfig]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<CollapsibleCardSectionConfig>> insert(
    _i1.Session session,
    List<CollapsibleCardSectionConfig> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<CollapsibleCardSectionConfig>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [CollapsibleCardSectionConfig] and returns the inserted row.
  ///
  /// The returned [CollapsibleCardSectionConfig] will have its `id` field set.
  Future<CollapsibleCardSectionConfig> insertRow(
    _i1.Session session,
    CollapsibleCardSectionConfig row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<CollapsibleCardSectionConfig>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [CollapsibleCardSectionConfig]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<CollapsibleCardSectionConfig>> update(
    _i1.Session session,
    List<CollapsibleCardSectionConfig> rows, {
    _i1.ColumnSelections<CollapsibleCardSectionConfigTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<CollapsibleCardSectionConfig>(
      rows,
      columns: columns?.call(CollapsibleCardSectionConfig.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CollapsibleCardSectionConfig]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CollapsibleCardSectionConfig> updateRow(
    _i1.Session session,
    CollapsibleCardSectionConfig row, {
    _i1.ColumnSelections<CollapsibleCardSectionConfigTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<CollapsibleCardSectionConfig>(
      row,
      columns: columns?.call(CollapsibleCardSectionConfig.t),
      transaction: transaction,
    );
  }

  /// Deletes all [CollapsibleCardSectionConfig]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<CollapsibleCardSectionConfig>> delete(
    _i1.Session session,
    List<CollapsibleCardSectionConfig> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<CollapsibleCardSectionConfig>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [CollapsibleCardSectionConfig].
  Future<CollapsibleCardSectionConfig> deleteRow(
    _i1.Session session,
    CollapsibleCardSectionConfig row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CollapsibleCardSectionConfig>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<CollapsibleCardSectionConfig>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CollapsibleCardSectionConfigTable>
        where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<CollapsibleCardSectionConfig>(
      where: where(CollapsibleCardSectionConfig.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CollapsibleCardSectionConfigTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<CollapsibleCardSectionConfig>(
      where: where?.call(CollapsibleCardSectionConfig.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
