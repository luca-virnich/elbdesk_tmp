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

abstract class RecentWindowDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  RecentWindowDTO._({
    this.id,
    required this.type,
    this.entityId,
    required this.label,
    this.timestamp,
    this.additionalData,
    this.userId,
  });

  factory RecentWindowDTO({
    int? id,
    required String type,
    int? entityId,
    required String label,
    DateTime? timestamp,
    String? additionalData,
    int? userId,
  }) = _RecentWindowDTOImpl;

  factory RecentWindowDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return RecentWindowDTO(
      id: jsonSerialization['id'] as int?,
      type: jsonSerialization['type'] as String,
      entityId: jsonSerialization['entityId'] as int?,
      label: jsonSerialization['label'] as String,
      timestamp: jsonSerialization['timestamp'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['timestamp']),
      additionalData: jsonSerialization['additionalData'] as String?,
      userId: jsonSerialization['userId'] as int?,
    );
  }

  static final t = RecentWindowDTOTable();

  static const db = RecentWindowDTORepository._();

  @override
  int? id;

  String type;

  int? entityId;

  String label;

  DateTime? timestamp;

  String? additionalData;

  int? userId;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [RecentWindowDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RecentWindowDTO copyWith({
    int? id,
    String? type,
    int? entityId,
    String? label,
    DateTime? timestamp,
    String? additionalData,
    int? userId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'type': type,
      if (entityId != null) 'entityId': entityId,
      'label': label,
      if (timestamp != null) 'timestamp': timestamp?.toJson(),
      if (additionalData != null) 'additionalData': additionalData,
      if (userId != null) 'userId': userId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'type': type,
      if (entityId != null) 'entityId': entityId,
      'label': label,
      if (timestamp != null) 'timestamp': timestamp?.toJson(),
      if (additionalData != null) 'additionalData': additionalData,
      if (userId != null) 'userId': userId,
    };
  }

  static RecentWindowDTOInclude include() {
    return RecentWindowDTOInclude._();
  }

  static RecentWindowDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<RecentWindowDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RecentWindowDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RecentWindowDTOTable>? orderByList,
    RecentWindowDTOInclude? include,
  }) {
    return RecentWindowDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RecentWindowDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(RecentWindowDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RecentWindowDTOImpl extends RecentWindowDTO {
  _RecentWindowDTOImpl({
    int? id,
    required String type,
    int? entityId,
    required String label,
    DateTime? timestamp,
    String? additionalData,
    int? userId,
  }) : super._(
          id: id,
          type: type,
          entityId: entityId,
          label: label,
          timestamp: timestamp,
          additionalData: additionalData,
          userId: userId,
        );

  /// Returns a shallow copy of this [RecentWindowDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RecentWindowDTO copyWith({
    Object? id = _Undefined,
    String? type,
    Object? entityId = _Undefined,
    String? label,
    Object? timestamp = _Undefined,
    Object? additionalData = _Undefined,
    Object? userId = _Undefined,
  }) {
    return RecentWindowDTO(
      id: id is int? ? id : this.id,
      type: type ?? this.type,
      entityId: entityId is int? ? entityId : this.entityId,
      label: label ?? this.label,
      timestamp: timestamp is DateTime? ? timestamp : this.timestamp,
      additionalData:
          additionalData is String? ? additionalData : this.additionalData,
      userId: userId is int? ? userId : this.userId,
    );
  }
}

class RecentWindowDTOTable extends _i1.Table<int?> {
  RecentWindowDTOTable({super.tableRelation})
      : super(tableName: 'ed_core_recent_window') {
    type = _i1.ColumnString(
      'type',
      this,
    );
    entityId = _i1.ColumnInt(
      'entityId',
      this,
    );
    label = _i1.ColumnString(
      'label',
      this,
    );
    timestamp = _i1.ColumnDateTime(
      'timestamp',
      this,
    );
    additionalData = _i1.ColumnString(
      'additionalData',
      this,
    );
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
  }

  late final _i1.ColumnString type;

  late final _i1.ColumnInt entityId;

  late final _i1.ColumnString label;

  late final _i1.ColumnDateTime timestamp;

  late final _i1.ColumnString additionalData;

  late final _i1.ColumnInt userId;

  @override
  List<_i1.Column> get columns => [
        id,
        type,
        entityId,
        label,
        timestamp,
        additionalData,
        userId,
      ];
}

class RecentWindowDTOInclude extends _i1.IncludeObject {
  RecentWindowDTOInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => RecentWindowDTO.t;
}

class RecentWindowDTOIncludeList extends _i1.IncludeList {
  RecentWindowDTOIncludeList._({
    _i1.WhereExpressionBuilder<RecentWindowDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(RecentWindowDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => RecentWindowDTO.t;
}

class RecentWindowDTORepository {
  const RecentWindowDTORepository._();

  /// Returns a list of [RecentWindowDTO]s matching the given query parameters.
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
  Future<List<RecentWindowDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RecentWindowDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RecentWindowDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RecentWindowDTOTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<RecentWindowDTO>(
      where: where?.call(RecentWindowDTO.t),
      orderBy: orderBy?.call(RecentWindowDTO.t),
      orderByList: orderByList?.call(RecentWindowDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [RecentWindowDTO] matching the given query parameters.
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
  Future<RecentWindowDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RecentWindowDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<RecentWindowDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RecentWindowDTOTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<RecentWindowDTO>(
      where: where?.call(RecentWindowDTO.t),
      orderBy: orderBy?.call(RecentWindowDTO.t),
      orderByList: orderByList?.call(RecentWindowDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [RecentWindowDTO] by its [id] or null if no such row exists.
  Future<RecentWindowDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<RecentWindowDTO>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [RecentWindowDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [RecentWindowDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<RecentWindowDTO>> insert(
    _i1.Session session,
    List<RecentWindowDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<RecentWindowDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [RecentWindowDTO] and returns the inserted row.
  ///
  /// The returned [RecentWindowDTO] will have its `id` field set.
  Future<RecentWindowDTO> insertRow(
    _i1.Session session,
    RecentWindowDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<RecentWindowDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [RecentWindowDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<RecentWindowDTO>> update(
    _i1.Session session,
    List<RecentWindowDTO> rows, {
    _i1.ColumnSelections<RecentWindowDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<RecentWindowDTO>(
      rows,
      columns: columns?.call(RecentWindowDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [RecentWindowDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<RecentWindowDTO> updateRow(
    _i1.Session session,
    RecentWindowDTO row, {
    _i1.ColumnSelections<RecentWindowDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<RecentWindowDTO>(
      row,
      columns: columns?.call(RecentWindowDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [RecentWindowDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<RecentWindowDTO>> delete(
    _i1.Session session,
    List<RecentWindowDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<RecentWindowDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [RecentWindowDTO].
  Future<RecentWindowDTO> deleteRow(
    _i1.Session session,
    RecentWindowDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<RecentWindowDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<RecentWindowDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<RecentWindowDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<RecentWindowDTO>(
      where: where(RecentWindowDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RecentWindowDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<RecentWindowDTO>(
      where: where?.call(RecentWindowDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
