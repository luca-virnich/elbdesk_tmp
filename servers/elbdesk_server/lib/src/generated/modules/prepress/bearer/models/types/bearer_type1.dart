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

abstract class BearerType1DTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  BearerType1DTO._({
    this.id,
    required this.marginLeft,
    required this.marginRight,
  });

  factory BearerType1DTO({
    int? id,
    required double marginLeft,
    required double marginRight,
  }) = _BearerType1DTOImpl;

  factory BearerType1DTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return BearerType1DTO(
      id: jsonSerialization['id'] as int?,
      marginLeft: (jsonSerialization['marginLeft'] as num).toDouble(),
      marginRight: (jsonSerialization['marginRight'] as num).toDouble(),
    );
  }

  static final t = BearerType1DTOTable();

  static const db = BearerType1DTORepository._();

  @override
  int? id;

  double marginLeft;

  double marginRight;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [BearerType1DTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  BearerType1DTO copyWith({
    int? id,
    double? marginLeft,
    double? marginRight,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'marginLeft': marginLeft,
      'marginRight': marginRight,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'marginLeft': marginLeft,
      'marginRight': marginRight,
    };
  }

  static BearerType1DTOInclude include() {
    return BearerType1DTOInclude._();
  }

  static BearerType1DTOIncludeList includeList({
    _i1.WhereExpressionBuilder<BearerType1DTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BearerType1DTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BearerType1DTOTable>? orderByList,
    BearerType1DTOInclude? include,
  }) {
    return BearerType1DTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(BearerType1DTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(BearerType1DTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BearerType1DTOImpl extends BearerType1DTO {
  _BearerType1DTOImpl({
    int? id,
    required double marginLeft,
    required double marginRight,
  }) : super._(
          id: id,
          marginLeft: marginLeft,
          marginRight: marginRight,
        );

  /// Returns a shallow copy of this [BearerType1DTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  BearerType1DTO copyWith({
    Object? id = _Undefined,
    double? marginLeft,
    double? marginRight,
  }) {
    return BearerType1DTO(
      id: id is int? ? id : this.id,
      marginLeft: marginLeft ?? this.marginLeft,
      marginRight: marginRight ?? this.marginRight,
    );
  }
}

class BearerType1DTOTable extends _i1.Table<int?> {
  BearerType1DTOTable({super.tableRelation})
      : super(tableName: 'prepress_bearer_type1') {
    marginLeft = _i1.ColumnDouble(
      'marginLeft',
      this,
    );
    marginRight = _i1.ColumnDouble(
      'marginRight',
      this,
    );
  }

  late final _i1.ColumnDouble marginLeft;

  late final _i1.ColumnDouble marginRight;

  @override
  List<_i1.Column> get columns => [
        id,
        marginLeft,
        marginRight,
      ];
}

class BearerType1DTOInclude extends _i1.IncludeObject {
  BearerType1DTOInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => BearerType1DTO.t;
}

class BearerType1DTOIncludeList extends _i1.IncludeList {
  BearerType1DTOIncludeList._({
    _i1.WhereExpressionBuilder<BearerType1DTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(BearerType1DTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => BearerType1DTO.t;
}

class BearerType1DTORepository {
  const BearerType1DTORepository._();

  /// Returns a list of [BearerType1DTO]s matching the given query parameters.
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
  Future<List<BearerType1DTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BearerType1DTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BearerType1DTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BearerType1DTOTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<BearerType1DTO>(
      where: where?.call(BearerType1DTO.t),
      orderBy: orderBy?.call(BearerType1DTO.t),
      orderByList: orderByList?.call(BearerType1DTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [BearerType1DTO] matching the given query parameters.
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
  Future<BearerType1DTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BearerType1DTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<BearerType1DTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BearerType1DTOTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<BearerType1DTO>(
      where: where?.call(BearerType1DTO.t),
      orderBy: orderBy?.call(BearerType1DTO.t),
      orderByList: orderByList?.call(BearerType1DTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [BearerType1DTO] by its [id] or null if no such row exists.
  Future<BearerType1DTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<BearerType1DTO>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [BearerType1DTO]s in the list and returns the inserted rows.
  ///
  /// The returned [BearerType1DTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<BearerType1DTO>> insert(
    _i1.Session session,
    List<BearerType1DTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<BearerType1DTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [BearerType1DTO] and returns the inserted row.
  ///
  /// The returned [BearerType1DTO] will have its `id` field set.
  Future<BearerType1DTO> insertRow(
    _i1.Session session,
    BearerType1DTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<BearerType1DTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [BearerType1DTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<BearerType1DTO>> update(
    _i1.Session session,
    List<BearerType1DTO> rows, {
    _i1.ColumnSelections<BearerType1DTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<BearerType1DTO>(
      rows,
      columns: columns?.call(BearerType1DTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [BearerType1DTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<BearerType1DTO> updateRow(
    _i1.Session session,
    BearerType1DTO row, {
    _i1.ColumnSelections<BearerType1DTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<BearerType1DTO>(
      row,
      columns: columns?.call(BearerType1DTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [BearerType1DTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<BearerType1DTO>> delete(
    _i1.Session session,
    List<BearerType1DTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<BearerType1DTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [BearerType1DTO].
  Future<BearerType1DTO> deleteRow(
    _i1.Session session,
    BearerType1DTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<BearerType1DTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<BearerType1DTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<BearerType1DTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<BearerType1DTO>(
      where: where(BearerType1DTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BearerType1DTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<BearerType1DTO>(
      where: where?.call(BearerType1DTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
