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

abstract class SalesOrderStatusDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  SalesOrderStatusDTO._({
    this.id,
    required this.description,
    required this.color,
    required this.orderId,
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

  factory SalesOrderStatusDTO({
    int? id,
    required String description,
    required String color,
    required double orderId,
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
  }) = _SalesOrderStatusDTOImpl;

  factory SalesOrderStatusDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return SalesOrderStatusDTO(
      id: jsonSerialization['id'] as int?,
      description: jsonSerialization['description'] as String,
      color: jsonSerialization['color'] as String,
      orderId: (jsonSerialization['orderId'] as num).toDouble(),
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

  static final t = SalesOrderStatusDTOTable();

  static const db = SalesOrderStatusDTORepository._();

  @override
  int? id;

  String description;

  String color;

  double orderId;

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

  /// Returns a shallow copy of this [SalesOrderStatusDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SalesOrderStatusDTO copyWith({
    int? id,
    String? description,
    String? color,
    double? orderId,
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
      'description': description,
      'color': color,
      'orderId': orderId,
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
      'description': description,
      'color': color,
      'orderId': orderId,
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

  static SalesOrderStatusDTOInclude include() {
    return SalesOrderStatusDTOInclude._();
  }

  static SalesOrderStatusDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<SalesOrderStatusDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SalesOrderStatusDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SalesOrderStatusDTOTable>? orderByList,
    SalesOrderStatusDTOInclude? include,
  }) {
    return SalesOrderStatusDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SalesOrderStatusDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(SalesOrderStatusDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SalesOrderStatusDTOImpl extends SalesOrderStatusDTO {
  _SalesOrderStatusDTOImpl({
    int? id,
    required String description,
    required String color,
    required double orderId,
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
          description: description,
          color: color,
          orderId: orderId,
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

  /// Returns a shallow copy of this [SalesOrderStatusDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SalesOrderStatusDTO copyWith({
    Object? id = _Undefined,
    String? description,
    String? color,
    double? orderId,
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
    return SalesOrderStatusDTO(
      id: id is int? ? id : this.id,
      description: description ?? this.description,
      color: color ?? this.color,
      orderId: orderId ?? this.orderId,
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

class SalesOrderStatusDTOTable extends _i1.Table<int?> {
  SalesOrderStatusDTOTable({super.tableRelation})
      : super(tableName: 'ed_sales_sales_order_status') {
    description = _i1.ColumnString(
      'description',
      this,
    );
    color = _i1.ColumnString(
      'color',
      this,
    );
    orderId = _i1.ColumnDouble(
      'orderId',
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

  late final _i1.ColumnString description;

  late final _i1.ColumnString color;

  late final _i1.ColumnDouble orderId;

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

  @override
  List<_i1.Column> get columns => [
        id,
        description,
        color,
        orderId,
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
}

class SalesOrderStatusDTOInclude extends _i1.IncludeObject {
  SalesOrderStatusDTOInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => SalesOrderStatusDTO.t;
}

class SalesOrderStatusDTOIncludeList extends _i1.IncludeList {
  SalesOrderStatusDTOIncludeList._({
    _i1.WhereExpressionBuilder<SalesOrderStatusDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(SalesOrderStatusDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => SalesOrderStatusDTO.t;
}

class SalesOrderStatusDTORepository {
  const SalesOrderStatusDTORepository._();

  /// Returns a list of [SalesOrderStatusDTO]s matching the given query parameters.
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
  Future<List<SalesOrderStatusDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SalesOrderStatusDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SalesOrderStatusDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SalesOrderStatusDTOTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<SalesOrderStatusDTO>(
      where: where?.call(SalesOrderStatusDTO.t),
      orderBy: orderBy?.call(SalesOrderStatusDTO.t),
      orderByList: orderByList?.call(SalesOrderStatusDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [SalesOrderStatusDTO] matching the given query parameters.
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
  Future<SalesOrderStatusDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SalesOrderStatusDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<SalesOrderStatusDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SalesOrderStatusDTOTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<SalesOrderStatusDTO>(
      where: where?.call(SalesOrderStatusDTO.t),
      orderBy: orderBy?.call(SalesOrderStatusDTO.t),
      orderByList: orderByList?.call(SalesOrderStatusDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [SalesOrderStatusDTO] by its [id] or null if no such row exists.
  Future<SalesOrderStatusDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<SalesOrderStatusDTO>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [SalesOrderStatusDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [SalesOrderStatusDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<SalesOrderStatusDTO>> insert(
    _i1.Session session,
    List<SalesOrderStatusDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<SalesOrderStatusDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [SalesOrderStatusDTO] and returns the inserted row.
  ///
  /// The returned [SalesOrderStatusDTO] will have its `id` field set.
  Future<SalesOrderStatusDTO> insertRow(
    _i1.Session session,
    SalesOrderStatusDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<SalesOrderStatusDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [SalesOrderStatusDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<SalesOrderStatusDTO>> update(
    _i1.Session session,
    List<SalesOrderStatusDTO> rows, {
    _i1.ColumnSelections<SalesOrderStatusDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<SalesOrderStatusDTO>(
      rows,
      columns: columns?.call(SalesOrderStatusDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [SalesOrderStatusDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<SalesOrderStatusDTO> updateRow(
    _i1.Session session,
    SalesOrderStatusDTO row, {
    _i1.ColumnSelections<SalesOrderStatusDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<SalesOrderStatusDTO>(
      row,
      columns: columns?.call(SalesOrderStatusDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [SalesOrderStatusDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<SalesOrderStatusDTO>> delete(
    _i1.Session session,
    List<SalesOrderStatusDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<SalesOrderStatusDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [SalesOrderStatusDTO].
  Future<SalesOrderStatusDTO> deleteRow(
    _i1.Session session,
    SalesOrderStatusDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<SalesOrderStatusDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<SalesOrderStatusDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<SalesOrderStatusDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<SalesOrderStatusDTO>(
      where: where(SalesOrderStatusDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SalesOrderStatusDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<SalesOrderStatusDTO>(
      where: where?.call(SalesOrderStatusDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
