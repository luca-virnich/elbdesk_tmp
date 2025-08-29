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
import '../../../../../modules/prepress/artwork/models/artwork.dart' as _i2;
import '../../../../../modules/sales/sales_order/models/sales_order.dart'
    as _i3;

abstract class SoiStepAndRepeatDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  SoiStepAndRepeatDTO._({
    this.id,
    required this.artworkId,
    this.artwork,
    required this.salesOrderId,
    this.salesOrder,
    required this.status,
    required this.description,
    required this.soiId,
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

  factory SoiStepAndRepeatDTO({
    int? id,
    required int artworkId,
    _i2.ArtworkDTO? artwork,
    required int salesOrderId,
    _i3.SalesOrderDTO? salesOrder,
    required String status,
    required String description,
    required int soiId,
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
  }) = _SoiStepAndRepeatDTOImpl;

  factory SoiStepAndRepeatDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return SoiStepAndRepeatDTO(
      id: jsonSerialization['id'] as int?,
      artworkId: jsonSerialization['artworkId'] as int,
      artwork: jsonSerialization['artwork'] == null
          ? null
          : _i2.ArtworkDTO.fromJson(
              (jsonSerialization['artwork'] as Map<String, dynamic>)),
      salesOrderId: jsonSerialization['salesOrderId'] as int,
      salesOrder: jsonSerialization['salesOrder'] == null
          ? null
          : _i3.SalesOrderDTO.fromJson(
              (jsonSerialization['salesOrder'] as Map<String, dynamic>)),
      status: jsonSerialization['status'] as String,
      description: jsonSerialization['description'] as String,
      soiId: jsonSerialization['soiId'] as int,
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

  static final t = SoiStepAndRepeatDTOTable();

  static const db = SoiStepAndRepeatDTORepository._();

  @override
  int? id;

  int artworkId;

  _i2.ArtworkDTO? artwork;

  int salesOrderId;

  _i3.SalesOrderDTO? salesOrder;

  String status;

  String description;

  int soiId;

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

  /// Returns a shallow copy of this [SoiStepAndRepeatDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SoiStepAndRepeatDTO copyWith({
    int? id,
    int? artworkId,
    _i2.ArtworkDTO? artwork,
    int? salesOrderId,
    _i3.SalesOrderDTO? salesOrder,
    String? status,
    String? description,
    int? soiId,
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
      'artworkId': artworkId,
      if (artwork != null) 'artwork': artwork?.toJson(),
      'salesOrderId': salesOrderId,
      if (salesOrder != null) 'salesOrder': salesOrder?.toJson(),
      'status': status,
      'description': description,
      'soiId': soiId,
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
      'artworkId': artworkId,
      if (artwork != null) 'artwork': artwork?.toJsonForProtocol(),
      'salesOrderId': salesOrderId,
      if (salesOrder != null) 'salesOrder': salesOrder?.toJsonForProtocol(),
      'status': status,
      'description': description,
      'soiId': soiId,
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

  static SoiStepAndRepeatDTOInclude include({
    _i2.ArtworkDTOInclude? artwork,
    _i3.SalesOrderDTOInclude? salesOrder,
  }) {
    return SoiStepAndRepeatDTOInclude._(
      artwork: artwork,
      salesOrder: salesOrder,
    );
  }

  static SoiStepAndRepeatDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<SoiStepAndRepeatDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SoiStepAndRepeatDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SoiStepAndRepeatDTOTable>? orderByList,
    SoiStepAndRepeatDTOInclude? include,
  }) {
    return SoiStepAndRepeatDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SoiStepAndRepeatDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(SoiStepAndRepeatDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SoiStepAndRepeatDTOImpl extends SoiStepAndRepeatDTO {
  _SoiStepAndRepeatDTOImpl({
    int? id,
    required int artworkId,
    _i2.ArtworkDTO? artwork,
    required int salesOrderId,
    _i3.SalesOrderDTO? salesOrder,
    required String status,
    required String description,
    required int soiId,
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
          artworkId: artworkId,
          artwork: artwork,
          salesOrderId: salesOrderId,
          salesOrder: salesOrder,
          status: status,
          description: description,
          soiId: soiId,
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

  /// Returns a shallow copy of this [SoiStepAndRepeatDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SoiStepAndRepeatDTO copyWith({
    Object? id = _Undefined,
    int? artworkId,
    Object? artwork = _Undefined,
    int? salesOrderId,
    Object? salesOrder = _Undefined,
    String? status,
    String? description,
    int? soiId,
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
    return SoiStepAndRepeatDTO(
      id: id is int? ? id : this.id,
      artworkId: artworkId ?? this.artworkId,
      artwork: artwork is _i2.ArtworkDTO? ? artwork : this.artwork?.copyWith(),
      salesOrderId: salesOrderId ?? this.salesOrderId,
      salesOrder: salesOrder is _i3.SalesOrderDTO?
          ? salesOrder
          : this.salesOrder?.copyWith(),
      status: status ?? this.status,
      description: description ?? this.description,
      soiId: soiId ?? this.soiId,
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

class SoiStepAndRepeatDTOTable extends _i1.Table<int?> {
  SoiStepAndRepeatDTOTable({super.tableRelation})
      : super(tableName: 'ed_prepress_soi_step_and_repeat') {
    artworkId = _i1.ColumnInt(
      'artworkId',
      this,
    );
    salesOrderId = _i1.ColumnInt(
      'salesOrderId',
      this,
    );
    status = _i1.ColumnString(
      'status',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    soiId = _i1.ColumnInt(
      'soiId',
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

  late final _i1.ColumnInt artworkId;

  _i2.ArtworkDTOTable? _artwork;

  late final _i1.ColumnInt salesOrderId;

  _i3.SalesOrderDTOTable? _salesOrder;

  late final _i1.ColumnString status;

  late final _i1.ColumnString description;

  late final _i1.ColumnInt soiId;

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

  _i2.ArtworkDTOTable get artwork {
    if (_artwork != null) return _artwork!;
    _artwork = _i1.createRelationTable(
      relationFieldName: 'artwork',
      field: SoiStepAndRepeatDTO.t.artworkId,
      foreignField: _i2.ArtworkDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ArtworkDTOTable(tableRelation: foreignTableRelation),
    );
    return _artwork!;
  }

  _i3.SalesOrderDTOTable get salesOrder {
    if (_salesOrder != null) return _salesOrder!;
    _salesOrder = _i1.createRelationTable(
      relationFieldName: 'salesOrder',
      field: SoiStepAndRepeatDTO.t.salesOrderId,
      foreignField: _i3.SalesOrderDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.SalesOrderDTOTable(tableRelation: foreignTableRelation),
    );
    return _salesOrder!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        artworkId,
        salesOrderId,
        status,
        description,
        soiId,
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

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'artwork') {
      return artwork;
    }
    if (relationField == 'salesOrder') {
      return salesOrder;
    }
    return null;
  }
}

class SoiStepAndRepeatDTOInclude extends _i1.IncludeObject {
  SoiStepAndRepeatDTOInclude._({
    _i2.ArtworkDTOInclude? artwork,
    _i3.SalesOrderDTOInclude? salesOrder,
  }) {
    _artwork = artwork;
    _salesOrder = salesOrder;
  }

  _i2.ArtworkDTOInclude? _artwork;

  _i3.SalesOrderDTOInclude? _salesOrder;

  @override
  Map<String, _i1.Include?> get includes => {
        'artwork': _artwork,
        'salesOrder': _salesOrder,
      };

  @override
  _i1.Table<int?> get table => SoiStepAndRepeatDTO.t;
}

class SoiStepAndRepeatDTOIncludeList extends _i1.IncludeList {
  SoiStepAndRepeatDTOIncludeList._({
    _i1.WhereExpressionBuilder<SoiStepAndRepeatDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(SoiStepAndRepeatDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => SoiStepAndRepeatDTO.t;
}

class SoiStepAndRepeatDTORepository {
  const SoiStepAndRepeatDTORepository._();

  final attachRow = const SoiStepAndRepeatDTOAttachRowRepository._();

  /// Returns a list of [SoiStepAndRepeatDTO]s matching the given query parameters.
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
  Future<List<SoiStepAndRepeatDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SoiStepAndRepeatDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SoiStepAndRepeatDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SoiStepAndRepeatDTOTable>? orderByList,
    _i1.Transaction? transaction,
    SoiStepAndRepeatDTOInclude? include,
  }) async {
    return session.db.find<SoiStepAndRepeatDTO>(
      where: where?.call(SoiStepAndRepeatDTO.t),
      orderBy: orderBy?.call(SoiStepAndRepeatDTO.t),
      orderByList: orderByList?.call(SoiStepAndRepeatDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [SoiStepAndRepeatDTO] matching the given query parameters.
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
  Future<SoiStepAndRepeatDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SoiStepAndRepeatDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<SoiStepAndRepeatDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SoiStepAndRepeatDTOTable>? orderByList,
    _i1.Transaction? transaction,
    SoiStepAndRepeatDTOInclude? include,
  }) async {
    return session.db.findFirstRow<SoiStepAndRepeatDTO>(
      where: where?.call(SoiStepAndRepeatDTO.t),
      orderBy: orderBy?.call(SoiStepAndRepeatDTO.t),
      orderByList: orderByList?.call(SoiStepAndRepeatDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [SoiStepAndRepeatDTO] by its [id] or null if no such row exists.
  Future<SoiStepAndRepeatDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    SoiStepAndRepeatDTOInclude? include,
  }) async {
    return session.db.findById<SoiStepAndRepeatDTO>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [SoiStepAndRepeatDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [SoiStepAndRepeatDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<SoiStepAndRepeatDTO>> insert(
    _i1.Session session,
    List<SoiStepAndRepeatDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<SoiStepAndRepeatDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [SoiStepAndRepeatDTO] and returns the inserted row.
  ///
  /// The returned [SoiStepAndRepeatDTO] will have its `id` field set.
  Future<SoiStepAndRepeatDTO> insertRow(
    _i1.Session session,
    SoiStepAndRepeatDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<SoiStepAndRepeatDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [SoiStepAndRepeatDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<SoiStepAndRepeatDTO>> update(
    _i1.Session session,
    List<SoiStepAndRepeatDTO> rows, {
    _i1.ColumnSelections<SoiStepAndRepeatDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<SoiStepAndRepeatDTO>(
      rows,
      columns: columns?.call(SoiStepAndRepeatDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [SoiStepAndRepeatDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<SoiStepAndRepeatDTO> updateRow(
    _i1.Session session,
    SoiStepAndRepeatDTO row, {
    _i1.ColumnSelections<SoiStepAndRepeatDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<SoiStepAndRepeatDTO>(
      row,
      columns: columns?.call(SoiStepAndRepeatDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [SoiStepAndRepeatDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<SoiStepAndRepeatDTO>> delete(
    _i1.Session session,
    List<SoiStepAndRepeatDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<SoiStepAndRepeatDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [SoiStepAndRepeatDTO].
  Future<SoiStepAndRepeatDTO> deleteRow(
    _i1.Session session,
    SoiStepAndRepeatDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<SoiStepAndRepeatDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<SoiStepAndRepeatDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<SoiStepAndRepeatDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<SoiStepAndRepeatDTO>(
      where: where(SoiStepAndRepeatDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SoiStepAndRepeatDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<SoiStepAndRepeatDTO>(
      where: where?.call(SoiStepAndRepeatDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class SoiStepAndRepeatDTOAttachRowRepository {
  const SoiStepAndRepeatDTOAttachRowRepository._();

  /// Creates a relation between the given [SoiStepAndRepeatDTO] and [ArtworkDTO]
  /// by setting the [SoiStepAndRepeatDTO]'s foreign key `artworkId` to refer to the [ArtworkDTO].
  Future<void> artwork(
    _i1.Session session,
    SoiStepAndRepeatDTO soiStepAndRepeatDTO,
    _i2.ArtworkDTO artwork, {
    _i1.Transaction? transaction,
  }) async {
    if (soiStepAndRepeatDTO.id == null) {
      throw ArgumentError.notNull('soiStepAndRepeatDTO.id');
    }
    if (artwork.id == null) {
      throw ArgumentError.notNull('artwork.id');
    }

    var $soiStepAndRepeatDTO =
        soiStepAndRepeatDTO.copyWith(artworkId: artwork.id);
    await session.db.updateRow<SoiStepAndRepeatDTO>(
      $soiStepAndRepeatDTO,
      columns: [SoiStepAndRepeatDTO.t.artworkId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [SoiStepAndRepeatDTO] and [SalesOrderDTO]
  /// by setting the [SoiStepAndRepeatDTO]'s foreign key `salesOrderId` to refer to the [SalesOrderDTO].
  Future<void> salesOrder(
    _i1.Session session,
    SoiStepAndRepeatDTO soiStepAndRepeatDTO,
    _i3.SalesOrderDTO salesOrder, {
    _i1.Transaction? transaction,
  }) async {
    if (soiStepAndRepeatDTO.id == null) {
      throw ArgumentError.notNull('soiStepAndRepeatDTO.id');
    }
    if (salesOrder.id == null) {
      throw ArgumentError.notNull('salesOrder.id');
    }

    var $soiStepAndRepeatDTO =
        soiStepAndRepeatDTO.copyWith(salesOrderId: salesOrder.id);
    await session.db.updateRow<SoiStepAndRepeatDTO>(
      $soiStepAndRepeatDTO,
      columns: [SoiStepAndRepeatDTO.t.salesOrderId],
      transaction: transaction,
    );
  }
}
