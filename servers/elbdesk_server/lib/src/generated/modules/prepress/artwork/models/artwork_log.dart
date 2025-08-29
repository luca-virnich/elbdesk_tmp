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
import '../../../../modules/core/table/table_type.dart' as _i2;

abstract class ArtworkLogDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ArtworkLogDTO._({
    this.id,
    required this.entityId,
    required this.salesOrderId,
    required this.salesOrderCustomId,
    required this.oldValue,
    required this.newValue,
    required this.field,
    required this.tableType,
    required this.updatedAt,
    this.updatedById,
  });

  factory ArtworkLogDTO({
    int? id,
    required int entityId,
    required int salesOrderId,
    required int salesOrderCustomId,
    required String oldValue,
    required String newValue,
    required String field,
    required _i2.TableType tableType,
    required DateTime updatedAt,
    int? updatedById,
  }) = _ArtworkLogDTOImpl;

  factory ArtworkLogDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return ArtworkLogDTO(
      id: jsonSerialization['id'] as int?,
      entityId: jsonSerialization['entityId'] as int,
      salesOrderId: jsonSerialization['salesOrderId'] as int,
      salesOrderCustomId: jsonSerialization['salesOrderCustomId'] as int,
      oldValue: jsonSerialization['oldValue'] as String,
      newValue: jsonSerialization['newValue'] as String,
      field: jsonSerialization['field'] as String,
      tableType:
          _i2.TableType.fromJson((jsonSerialization['tableType'] as String)),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      updatedById: jsonSerialization['updatedById'] as int?,
    );
  }

  static final t = ArtworkLogDTOTable();

  static const db = ArtworkLogDTORepository._();

  @override
  int? id;

  int entityId;

  int salesOrderId;

  int salesOrderCustomId;

  String oldValue;

  String newValue;

  String field;

  _i2.TableType tableType;

  DateTime updatedAt;

  int? updatedById;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [ArtworkLogDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ArtworkLogDTO copyWith({
    int? id,
    int? entityId,
    int? salesOrderId,
    int? salesOrderCustomId,
    String? oldValue,
    String? newValue,
    String? field,
    _i2.TableType? tableType,
    DateTime? updatedAt,
    int? updatedById,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'entityId': entityId,
      'salesOrderId': salesOrderId,
      'salesOrderCustomId': salesOrderCustomId,
      'oldValue': oldValue,
      'newValue': newValue,
      'field': field,
      'tableType': tableType.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (updatedById != null) 'updatedById': updatedById,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'entityId': entityId,
      'salesOrderId': salesOrderId,
      'salesOrderCustomId': salesOrderCustomId,
      'oldValue': oldValue,
      'newValue': newValue,
      'field': field,
      'tableType': tableType.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (updatedById != null) 'updatedById': updatedById,
    };
  }

  static ArtworkLogDTOInclude include() {
    return ArtworkLogDTOInclude._();
  }

  static ArtworkLogDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<ArtworkLogDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArtworkLogDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkLogDTOTable>? orderByList,
    ArtworkLogDTOInclude? include,
  }) {
    return ArtworkLogDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ArtworkLogDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ArtworkLogDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ArtworkLogDTOImpl extends ArtworkLogDTO {
  _ArtworkLogDTOImpl({
    int? id,
    required int entityId,
    required int salesOrderId,
    required int salesOrderCustomId,
    required String oldValue,
    required String newValue,
    required String field,
    required _i2.TableType tableType,
    required DateTime updatedAt,
    int? updatedById,
  }) : super._(
          id: id,
          entityId: entityId,
          salesOrderId: salesOrderId,
          salesOrderCustomId: salesOrderCustomId,
          oldValue: oldValue,
          newValue: newValue,
          field: field,
          tableType: tableType,
          updatedAt: updatedAt,
          updatedById: updatedById,
        );

  /// Returns a shallow copy of this [ArtworkLogDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ArtworkLogDTO copyWith({
    Object? id = _Undefined,
    int? entityId,
    int? salesOrderId,
    int? salesOrderCustomId,
    String? oldValue,
    String? newValue,
    String? field,
    _i2.TableType? tableType,
    DateTime? updatedAt,
    Object? updatedById = _Undefined,
  }) {
    return ArtworkLogDTO(
      id: id is int? ? id : this.id,
      entityId: entityId ?? this.entityId,
      salesOrderId: salesOrderId ?? this.salesOrderId,
      salesOrderCustomId: salesOrderCustomId ?? this.salesOrderCustomId,
      oldValue: oldValue ?? this.oldValue,
      newValue: newValue ?? this.newValue,
      field: field ?? this.field,
      tableType: tableType ?? this.tableType,
      updatedAt: updatedAt ?? this.updatedAt,
      updatedById: updatedById is int? ? updatedById : this.updatedById,
    );
  }
}

class ArtworkLogDTOTable extends _i1.Table<int?> {
  ArtworkLogDTOTable({super.tableRelation})
      : super(tableName: 'ed_prepress_artwork_log') {
    entityId = _i1.ColumnInt(
      'entityId',
      this,
    );
    salesOrderId = _i1.ColumnInt(
      'salesOrderId',
      this,
    );
    salesOrderCustomId = _i1.ColumnInt(
      'salesOrderCustomId',
      this,
    );
    oldValue = _i1.ColumnString(
      'oldValue',
      this,
    );
    newValue = _i1.ColumnString(
      'newValue',
      this,
    );
    field = _i1.ColumnString(
      'field',
      this,
    );
    tableType = _i1.ColumnEnum(
      'tableType',
      this,
      _i1.EnumSerialization.byName,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
    );
    updatedById = _i1.ColumnInt(
      'updatedById',
      this,
    );
  }

  late final _i1.ColumnInt entityId;

  late final _i1.ColumnInt salesOrderId;

  late final _i1.ColumnInt salesOrderCustomId;

  late final _i1.ColumnString oldValue;

  late final _i1.ColumnString newValue;

  late final _i1.ColumnString field;

  late final _i1.ColumnEnum<_i2.TableType> tableType;

  late final _i1.ColumnDateTime updatedAt;

  late final _i1.ColumnInt updatedById;

  @override
  List<_i1.Column> get columns => [
        id,
        entityId,
        salesOrderId,
        salesOrderCustomId,
        oldValue,
        newValue,
        field,
        tableType,
        updatedAt,
        updatedById,
      ];
}

class ArtworkLogDTOInclude extends _i1.IncludeObject {
  ArtworkLogDTOInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => ArtworkLogDTO.t;
}

class ArtworkLogDTOIncludeList extends _i1.IncludeList {
  ArtworkLogDTOIncludeList._({
    _i1.WhereExpressionBuilder<ArtworkLogDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ArtworkLogDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ArtworkLogDTO.t;
}

class ArtworkLogDTORepository {
  const ArtworkLogDTORepository._();

  /// Returns a list of [ArtworkLogDTO]s matching the given query parameters.
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
  Future<List<ArtworkLogDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkLogDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArtworkLogDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkLogDTOTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<ArtworkLogDTO>(
      where: where?.call(ArtworkLogDTO.t),
      orderBy: orderBy?.call(ArtworkLogDTO.t),
      orderByList: orderByList?.call(ArtworkLogDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [ArtworkLogDTO] matching the given query parameters.
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
  Future<ArtworkLogDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkLogDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<ArtworkLogDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkLogDTOTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<ArtworkLogDTO>(
      where: where?.call(ArtworkLogDTO.t),
      orderBy: orderBy?.call(ArtworkLogDTO.t),
      orderByList: orderByList?.call(ArtworkLogDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [ArtworkLogDTO] by its [id] or null if no such row exists.
  Future<ArtworkLogDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<ArtworkLogDTO>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [ArtworkLogDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [ArtworkLogDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ArtworkLogDTO>> insert(
    _i1.Session session,
    List<ArtworkLogDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ArtworkLogDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ArtworkLogDTO] and returns the inserted row.
  ///
  /// The returned [ArtworkLogDTO] will have its `id` field set.
  Future<ArtworkLogDTO> insertRow(
    _i1.Session session,
    ArtworkLogDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ArtworkLogDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ArtworkLogDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ArtworkLogDTO>> update(
    _i1.Session session,
    List<ArtworkLogDTO> rows, {
    _i1.ColumnSelections<ArtworkLogDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ArtworkLogDTO>(
      rows,
      columns: columns?.call(ArtworkLogDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ArtworkLogDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ArtworkLogDTO> updateRow(
    _i1.Session session,
    ArtworkLogDTO row, {
    _i1.ColumnSelections<ArtworkLogDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ArtworkLogDTO>(
      row,
      columns: columns?.call(ArtworkLogDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [ArtworkLogDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ArtworkLogDTO>> delete(
    _i1.Session session,
    List<ArtworkLogDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ArtworkLogDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ArtworkLogDTO].
  Future<ArtworkLogDTO> deleteRow(
    _i1.Session session,
    ArtworkLogDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ArtworkLogDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ArtworkLogDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ArtworkLogDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ArtworkLogDTO>(
      where: where(ArtworkLogDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkLogDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ArtworkLogDTO>(
      where: where?.call(ArtworkLogDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
