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

abstract class Deeplink
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Deeplink._({
    this.id,
    required this.floatingWindowType,
    required this.primaryId,
    this.payload,
    required this.createdAt,
  });

  factory Deeplink({
    int? id,
    required String floatingWindowType,
    required int primaryId,
    String? payload,
    required DateTime createdAt,
  }) = _DeeplinkImpl;

  factory Deeplink.fromJson(Map<String, dynamic> jsonSerialization) {
    return Deeplink(
      id: jsonSerialization['id'] as int?,
      floatingWindowType: jsonSerialization['floatingWindowType'] as String,
      primaryId: jsonSerialization['primaryId'] as int,
      payload: jsonSerialization['payload'] as String?,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = DeeplinkTable();

  static const db = DeeplinkRepository._();

  @override
  int? id;

  String floatingWindowType;

  int primaryId;

  String? payload;

  DateTime createdAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Deeplink]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Deeplink copyWith({
    int? id,
    String? floatingWindowType,
    int? primaryId,
    String? payload,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'floatingWindowType': floatingWindowType,
      'primaryId': primaryId,
      if (payload != null) 'payload': payload,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'floatingWindowType': floatingWindowType,
      'primaryId': primaryId,
      if (payload != null) 'payload': payload,
      'createdAt': createdAt.toJson(),
    };
  }

  static DeeplinkInclude include() {
    return DeeplinkInclude._();
  }

  static DeeplinkIncludeList includeList({
    _i1.WhereExpressionBuilder<DeeplinkTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DeeplinkTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DeeplinkTable>? orderByList,
    DeeplinkInclude? include,
  }) {
    return DeeplinkIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Deeplink.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Deeplink.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DeeplinkImpl extends Deeplink {
  _DeeplinkImpl({
    int? id,
    required String floatingWindowType,
    required int primaryId,
    String? payload,
    required DateTime createdAt,
  }) : super._(
          id: id,
          floatingWindowType: floatingWindowType,
          primaryId: primaryId,
          payload: payload,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [Deeplink]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Deeplink copyWith({
    Object? id = _Undefined,
    String? floatingWindowType,
    int? primaryId,
    Object? payload = _Undefined,
    DateTime? createdAt,
  }) {
    return Deeplink(
      id: id is int? ? id : this.id,
      floatingWindowType: floatingWindowType ?? this.floatingWindowType,
      primaryId: primaryId ?? this.primaryId,
      payload: payload is String? ? payload : this.payload,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class DeeplinkTable extends _i1.Table<int?> {
  DeeplinkTable({super.tableRelation}) : super(tableName: 'ed_core_deeplink') {
    floatingWindowType = _i1.ColumnString(
      'floatingWindowType',
      this,
    );
    primaryId = _i1.ColumnInt(
      'primaryId',
      this,
    );
    payload = _i1.ColumnString(
      'payload',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final _i1.ColumnString floatingWindowType;

  late final _i1.ColumnInt primaryId;

  late final _i1.ColumnString payload;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
        id,
        floatingWindowType,
        primaryId,
        payload,
        createdAt,
      ];
}

class DeeplinkInclude extends _i1.IncludeObject {
  DeeplinkInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Deeplink.t;
}

class DeeplinkIncludeList extends _i1.IncludeList {
  DeeplinkIncludeList._({
    _i1.WhereExpressionBuilder<DeeplinkTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Deeplink.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Deeplink.t;
}

class DeeplinkRepository {
  const DeeplinkRepository._();

  /// Returns a list of [Deeplink]s matching the given query parameters.
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
  Future<List<Deeplink>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DeeplinkTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DeeplinkTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DeeplinkTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Deeplink>(
      where: where?.call(Deeplink.t),
      orderBy: orderBy?.call(Deeplink.t),
      orderByList: orderByList?.call(Deeplink.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Deeplink] matching the given query parameters.
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
  Future<Deeplink?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DeeplinkTable>? where,
    int? offset,
    _i1.OrderByBuilder<DeeplinkTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DeeplinkTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Deeplink>(
      where: where?.call(Deeplink.t),
      orderBy: orderBy?.call(Deeplink.t),
      orderByList: orderByList?.call(Deeplink.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Deeplink] by its [id] or null if no such row exists.
  Future<Deeplink?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Deeplink>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Deeplink]s in the list and returns the inserted rows.
  ///
  /// The returned [Deeplink]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Deeplink>> insert(
    _i1.Session session,
    List<Deeplink> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Deeplink>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Deeplink] and returns the inserted row.
  ///
  /// The returned [Deeplink] will have its `id` field set.
  Future<Deeplink> insertRow(
    _i1.Session session,
    Deeplink row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Deeplink>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Deeplink]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Deeplink>> update(
    _i1.Session session,
    List<Deeplink> rows, {
    _i1.ColumnSelections<DeeplinkTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Deeplink>(
      rows,
      columns: columns?.call(Deeplink.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Deeplink]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Deeplink> updateRow(
    _i1.Session session,
    Deeplink row, {
    _i1.ColumnSelections<DeeplinkTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Deeplink>(
      row,
      columns: columns?.call(Deeplink.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Deeplink]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Deeplink>> delete(
    _i1.Session session,
    List<Deeplink> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Deeplink>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Deeplink].
  Future<Deeplink> deleteRow(
    _i1.Session session,
    Deeplink row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Deeplink>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Deeplink>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<DeeplinkTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Deeplink>(
      where: where(Deeplink.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DeeplinkTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Deeplink>(
      where: where?.call(Deeplink.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
