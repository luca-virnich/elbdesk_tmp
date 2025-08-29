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

abstract class BearerType2DTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  BearerType2DTO._({
    this.id,
    required this.minWidth,
    required this.minHeight,
  });

  factory BearerType2DTO({
    int? id,
    required double minWidth,
    required double minHeight,
  }) = _BearerType2DTOImpl;

  factory BearerType2DTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return BearerType2DTO(
      id: jsonSerialization['id'] as int?,
      minWidth: (jsonSerialization['minWidth'] as num).toDouble(),
      minHeight: (jsonSerialization['minHeight'] as num).toDouble(),
    );
  }

  static final t = BearerType2DTOTable();

  static const db = BearerType2DTORepository._();

  @override
  int? id;

  double minWidth;

  double minHeight;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [BearerType2DTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  BearerType2DTO copyWith({
    int? id,
    double? minWidth,
    double? minHeight,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'minWidth': minWidth,
      'minHeight': minHeight,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'minWidth': minWidth,
      'minHeight': minHeight,
    };
  }

  static BearerType2DTOInclude include() {
    return BearerType2DTOInclude._();
  }

  static BearerType2DTOIncludeList includeList({
    _i1.WhereExpressionBuilder<BearerType2DTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BearerType2DTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BearerType2DTOTable>? orderByList,
    BearerType2DTOInclude? include,
  }) {
    return BearerType2DTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(BearerType2DTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(BearerType2DTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BearerType2DTOImpl extends BearerType2DTO {
  _BearerType2DTOImpl({
    int? id,
    required double minWidth,
    required double minHeight,
  }) : super._(
          id: id,
          minWidth: minWidth,
          minHeight: minHeight,
        );

  /// Returns a shallow copy of this [BearerType2DTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  BearerType2DTO copyWith({
    Object? id = _Undefined,
    double? minWidth,
    double? minHeight,
  }) {
    return BearerType2DTO(
      id: id is int? ? id : this.id,
      minWidth: minWidth ?? this.minWidth,
      minHeight: minHeight ?? this.minHeight,
    );
  }
}

class BearerType2DTOTable extends _i1.Table<int?> {
  BearerType2DTOTable({super.tableRelation})
      : super(tableName: 'prepress_bearer_type2') {
    minWidth = _i1.ColumnDouble(
      'minWidth',
      this,
    );
    minHeight = _i1.ColumnDouble(
      'minHeight',
      this,
    );
  }

  late final _i1.ColumnDouble minWidth;

  late final _i1.ColumnDouble minHeight;

  @override
  List<_i1.Column> get columns => [
        id,
        minWidth,
        minHeight,
      ];
}

class BearerType2DTOInclude extends _i1.IncludeObject {
  BearerType2DTOInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => BearerType2DTO.t;
}

class BearerType2DTOIncludeList extends _i1.IncludeList {
  BearerType2DTOIncludeList._({
    _i1.WhereExpressionBuilder<BearerType2DTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(BearerType2DTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => BearerType2DTO.t;
}

class BearerType2DTORepository {
  const BearerType2DTORepository._();

  /// Returns a list of [BearerType2DTO]s matching the given query parameters.
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
  Future<List<BearerType2DTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BearerType2DTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BearerType2DTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BearerType2DTOTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<BearerType2DTO>(
      where: where?.call(BearerType2DTO.t),
      orderBy: orderBy?.call(BearerType2DTO.t),
      orderByList: orderByList?.call(BearerType2DTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [BearerType2DTO] matching the given query parameters.
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
  Future<BearerType2DTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BearerType2DTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<BearerType2DTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BearerType2DTOTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<BearerType2DTO>(
      where: where?.call(BearerType2DTO.t),
      orderBy: orderBy?.call(BearerType2DTO.t),
      orderByList: orderByList?.call(BearerType2DTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [BearerType2DTO] by its [id] or null if no such row exists.
  Future<BearerType2DTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<BearerType2DTO>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [BearerType2DTO]s in the list and returns the inserted rows.
  ///
  /// The returned [BearerType2DTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<BearerType2DTO>> insert(
    _i1.Session session,
    List<BearerType2DTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<BearerType2DTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [BearerType2DTO] and returns the inserted row.
  ///
  /// The returned [BearerType2DTO] will have its `id` field set.
  Future<BearerType2DTO> insertRow(
    _i1.Session session,
    BearerType2DTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<BearerType2DTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [BearerType2DTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<BearerType2DTO>> update(
    _i1.Session session,
    List<BearerType2DTO> rows, {
    _i1.ColumnSelections<BearerType2DTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<BearerType2DTO>(
      rows,
      columns: columns?.call(BearerType2DTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [BearerType2DTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<BearerType2DTO> updateRow(
    _i1.Session session,
    BearerType2DTO row, {
    _i1.ColumnSelections<BearerType2DTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<BearerType2DTO>(
      row,
      columns: columns?.call(BearerType2DTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [BearerType2DTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<BearerType2DTO>> delete(
    _i1.Session session,
    List<BearerType2DTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<BearerType2DTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [BearerType2DTO].
  Future<BearerType2DTO> deleteRow(
    _i1.Session session,
    BearerType2DTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<BearerType2DTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<BearerType2DTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<BearerType2DTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<BearerType2DTO>(
      where: where(BearerType2DTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BearerType2DTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<BearerType2DTO>(
      where: where?.call(BearerType2DTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
