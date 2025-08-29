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
import '../../../../../modules/prepress/sales_order_item/models/sales_order_item.dart'
    as _i3;

abstract class SoiEinzelformaufbauDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  SoiEinzelformaufbauDTO._({
    this.id,
    required this.artworkId,
    this.artwork,
    required this.artworkMasterId,
    required this.version,
    required this.salesOrderItemId,
    this.salesOrderItem,
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

  factory SoiEinzelformaufbauDTO({
    int? id,
    required int artworkId,
    _i2.ArtworkDTO? artwork,
    required int artworkMasterId,
    required int version,
    required int salesOrderItemId,
    _i3.SalesOrderItemDTO? salesOrderItem,
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
  }) = _SoiEinzelformaufbauDTOImpl;

  factory SoiEinzelformaufbauDTO.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return SoiEinzelformaufbauDTO(
      id: jsonSerialization['id'] as int?,
      artworkId: jsonSerialization['artworkId'] as int,
      artwork: jsonSerialization['artwork'] == null
          ? null
          : _i2.ArtworkDTO.fromJson(
              (jsonSerialization['artwork'] as Map<String, dynamic>)),
      artworkMasterId: jsonSerialization['artworkMasterId'] as int,
      version: jsonSerialization['version'] as int,
      salesOrderItemId: jsonSerialization['salesOrderItemId'] as int,
      salesOrderItem: jsonSerialization['salesOrderItem'] == null
          ? null
          : _i3.SalesOrderItemDTO.fromJson(
              (jsonSerialization['salesOrderItem'] as Map<String, dynamic>)),
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

  static final t = SoiEinzelformaufbauDTOTable();

  static const db = SoiEinzelformaufbauDTORepository._();

  @override
  int? id;

  int artworkId;

  _i2.ArtworkDTO? artwork;

  int artworkMasterId;

  int version;

  int salesOrderItemId;

  _i3.SalesOrderItemDTO? salesOrderItem;

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

  /// Returns a shallow copy of this [SoiEinzelformaufbauDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SoiEinzelformaufbauDTO copyWith({
    int? id,
    int? artworkId,
    _i2.ArtworkDTO? artwork,
    int? artworkMasterId,
    int? version,
    int? salesOrderItemId,
    _i3.SalesOrderItemDTO? salesOrderItem,
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
      'artworkMasterId': artworkMasterId,
      'version': version,
      'salesOrderItemId': salesOrderItemId,
      if (salesOrderItem != null) 'salesOrderItem': salesOrderItem?.toJson(),
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
      'artworkMasterId': artworkMasterId,
      'version': version,
      'salesOrderItemId': salesOrderItemId,
      if (salesOrderItem != null)
        'salesOrderItem': salesOrderItem?.toJsonForProtocol(),
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

  static SoiEinzelformaufbauDTOInclude include({
    _i2.ArtworkDTOInclude? artwork,
    _i3.SalesOrderItemDTOInclude? salesOrderItem,
  }) {
    return SoiEinzelformaufbauDTOInclude._(
      artwork: artwork,
      salesOrderItem: salesOrderItem,
    );
  }

  static SoiEinzelformaufbauDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<SoiEinzelformaufbauDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SoiEinzelformaufbauDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SoiEinzelformaufbauDTOTable>? orderByList,
    SoiEinzelformaufbauDTOInclude? include,
  }) {
    return SoiEinzelformaufbauDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SoiEinzelformaufbauDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(SoiEinzelformaufbauDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SoiEinzelformaufbauDTOImpl extends SoiEinzelformaufbauDTO {
  _SoiEinzelformaufbauDTOImpl({
    int? id,
    required int artworkId,
    _i2.ArtworkDTO? artwork,
    required int artworkMasterId,
    required int version,
    required int salesOrderItemId,
    _i3.SalesOrderItemDTO? salesOrderItem,
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
          artworkMasterId: artworkMasterId,
          version: version,
          salesOrderItemId: salesOrderItemId,
          salesOrderItem: salesOrderItem,
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

  /// Returns a shallow copy of this [SoiEinzelformaufbauDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SoiEinzelformaufbauDTO copyWith({
    Object? id = _Undefined,
    int? artworkId,
    Object? artwork = _Undefined,
    int? artworkMasterId,
    int? version,
    int? salesOrderItemId,
    Object? salesOrderItem = _Undefined,
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
    return SoiEinzelformaufbauDTO(
      id: id is int? ? id : this.id,
      artworkId: artworkId ?? this.artworkId,
      artwork: artwork is _i2.ArtworkDTO? ? artwork : this.artwork?.copyWith(),
      artworkMasterId: artworkMasterId ?? this.artworkMasterId,
      version: version ?? this.version,
      salesOrderItemId: salesOrderItemId ?? this.salesOrderItemId,
      salesOrderItem: salesOrderItem is _i3.SalesOrderItemDTO?
          ? salesOrderItem
          : this.salesOrderItem?.copyWith(),
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

class SoiEinzelformaufbauDTOTable extends _i1.Table<int?> {
  SoiEinzelformaufbauDTOTable({super.tableRelation})
      : super(tableName: 'ed_prepress_soi_einzelformaufbau') {
    artworkId = _i1.ColumnInt(
      'artworkId',
      this,
    );
    artworkMasterId = _i1.ColumnInt(
      'artworkMasterId',
      this,
    );
    version = _i1.ColumnInt(
      'version',
      this,
    );
    salesOrderItemId = _i1.ColumnInt(
      'salesOrderItemId',
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

  late final _i1.ColumnInt artworkMasterId;

  late final _i1.ColumnInt version;

  late final _i1.ColumnInt salesOrderItemId;

  _i3.SalesOrderItemDTOTable? _salesOrderItem;

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
      field: SoiEinzelformaufbauDTO.t.artworkId,
      foreignField: _i2.ArtworkDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ArtworkDTOTable(tableRelation: foreignTableRelation),
    );
    return _artwork!;
  }

  _i3.SalesOrderItemDTOTable get salesOrderItem {
    if (_salesOrderItem != null) return _salesOrderItem!;
    _salesOrderItem = _i1.createRelationTable(
      relationFieldName: 'salesOrderItem',
      field: SoiEinzelformaufbauDTO.t.salesOrderItemId,
      foreignField: _i3.SalesOrderItemDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.SalesOrderItemDTOTable(tableRelation: foreignTableRelation),
    );
    return _salesOrderItem!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        artworkId,
        artworkMasterId,
        version,
        salesOrderItemId,
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
    if (relationField == 'salesOrderItem') {
      return salesOrderItem;
    }
    return null;
  }
}

class SoiEinzelformaufbauDTOInclude extends _i1.IncludeObject {
  SoiEinzelformaufbauDTOInclude._({
    _i2.ArtworkDTOInclude? artwork,
    _i3.SalesOrderItemDTOInclude? salesOrderItem,
  }) {
    _artwork = artwork;
    _salesOrderItem = salesOrderItem;
  }

  _i2.ArtworkDTOInclude? _artwork;

  _i3.SalesOrderItemDTOInclude? _salesOrderItem;

  @override
  Map<String, _i1.Include?> get includes => {
        'artwork': _artwork,
        'salesOrderItem': _salesOrderItem,
      };

  @override
  _i1.Table<int?> get table => SoiEinzelformaufbauDTO.t;
}

class SoiEinzelformaufbauDTOIncludeList extends _i1.IncludeList {
  SoiEinzelformaufbauDTOIncludeList._({
    _i1.WhereExpressionBuilder<SoiEinzelformaufbauDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(SoiEinzelformaufbauDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => SoiEinzelformaufbauDTO.t;
}

class SoiEinzelformaufbauDTORepository {
  const SoiEinzelformaufbauDTORepository._();

  final attachRow = const SoiEinzelformaufbauDTOAttachRowRepository._();

  /// Returns a list of [SoiEinzelformaufbauDTO]s matching the given query parameters.
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
  Future<List<SoiEinzelformaufbauDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SoiEinzelformaufbauDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SoiEinzelformaufbauDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SoiEinzelformaufbauDTOTable>? orderByList,
    _i1.Transaction? transaction,
    SoiEinzelformaufbauDTOInclude? include,
  }) async {
    return session.db.find<SoiEinzelformaufbauDTO>(
      where: where?.call(SoiEinzelformaufbauDTO.t),
      orderBy: orderBy?.call(SoiEinzelformaufbauDTO.t),
      orderByList: orderByList?.call(SoiEinzelformaufbauDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [SoiEinzelformaufbauDTO] matching the given query parameters.
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
  Future<SoiEinzelformaufbauDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SoiEinzelformaufbauDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<SoiEinzelformaufbauDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SoiEinzelformaufbauDTOTable>? orderByList,
    _i1.Transaction? transaction,
    SoiEinzelformaufbauDTOInclude? include,
  }) async {
    return session.db.findFirstRow<SoiEinzelformaufbauDTO>(
      where: where?.call(SoiEinzelformaufbauDTO.t),
      orderBy: orderBy?.call(SoiEinzelformaufbauDTO.t),
      orderByList: orderByList?.call(SoiEinzelformaufbauDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [SoiEinzelformaufbauDTO] by its [id] or null if no such row exists.
  Future<SoiEinzelformaufbauDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    SoiEinzelformaufbauDTOInclude? include,
  }) async {
    return session.db.findById<SoiEinzelformaufbauDTO>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [SoiEinzelformaufbauDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [SoiEinzelformaufbauDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<SoiEinzelformaufbauDTO>> insert(
    _i1.Session session,
    List<SoiEinzelformaufbauDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<SoiEinzelformaufbauDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [SoiEinzelformaufbauDTO] and returns the inserted row.
  ///
  /// The returned [SoiEinzelformaufbauDTO] will have its `id` field set.
  Future<SoiEinzelformaufbauDTO> insertRow(
    _i1.Session session,
    SoiEinzelformaufbauDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<SoiEinzelformaufbauDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [SoiEinzelformaufbauDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<SoiEinzelformaufbauDTO>> update(
    _i1.Session session,
    List<SoiEinzelformaufbauDTO> rows, {
    _i1.ColumnSelections<SoiEinzelformaufbauDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<SoiEinzelformaufbauDTO>(
      rows,
      columns: columns?.call(SoiEinzelformaufbauDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [SoiEinzelformaufbauDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<SoiEinzelformaufbauDTO> updateRow(
    _i1.Session session,
    SoiEinzelformaufbauDTO row, {
    _i1.ColumnSelections<SoiEinzelformaufbauDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<SoiEinzelformaufbauDTO>(
      row,
      columns: columns?.call(SoiEinzelformaufbauDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [SoiEinzelformaufbauDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<SoiEinzelformaufbauDTO>> delete(
    _i1.Session session,
    List<SoiEinzelformaufbauDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<SoiEinzelformaufbauDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [SoiEinzelformaufbauDTO].
  Future<SoiEinzelformaufbauDTO> deleteRow(
    _i1.Session session,
    SoiEinzelformaufbauDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<SoiEinzelformaufbauDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<SoiEinzelformaufbauDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<SoiEinzelformaufbauDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<SoiEinzelformaufbauDTO>(
      where: where(SoiEinzelformaufbauDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SoiEinzelformaufbauDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<SoiEinzelformaufbauDTO>(
      where: where?.call(SoiEinzelformaufbauDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class SoiEinzelformaufbauDTOAttachRowRepository {
  const SoiEinzelformaufbauDTOAttachRowRepository._();

  /// Creates a relation between the given [SoiEinzelformaufbauDTO] and [ArtworkDTO]
  /// by setting the [SoiEinzelformaufbauDTO]'s foreign key `artworkId` to refer to the [ArtworkDTO].
  Future<void> artwork(
    _i1.Session session,
    SoiEinzelformaufbauDTO soiEinzelformaufbauDTO,
    _i2.ArtworkDTO artwork, {
    _i1.Transaction? transaction,
  }) async {
    if (soiEinzelformaufbauDTO.id == null) {
      throw ArgumentError.notNull('soiEinzelformaufbauDTO.id');
    }
    if (artwork.id == null) {
      throw ArgumentError.notNull('artwork.id');
    }

    var $soiEinzelformaufbauDTO =
        soiEinzelformaufbauDTO.copyWith(artworkId: artwork.id);
    await session.db.updateRow<SoiEinzelformaufbauDTO>(
      $soiEinzelformaufbauDTO,
      columns: [SoiEinzelformaufbauDTO.t.artworkId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [SoiEinzelformaufbauDTO] and [SalesOrderItemDTO]
  /// by setting the [SoiEinzelformaufbauDTO]'s foreign key `salesOrderItemId` to refer to the [SalesOrderItemDTO].
  Future<void> salesOrderItem(
    _i1.Session session,
    SoiEinzelformaufbauDTO soiEinzelformaufbauDTO,
    _i3.SalesOrderItemDTO salesOrderItem, {
    _i1.Transaction? transaction,
  }) async {
    if (soiEinzelformaufbauDTO.id == null) {
      throw ArgumentError.notNull('soiEinzelformaufbauDTO.id');
    }
    if (salesOrderItem.id == null) {
      throw ArgumentError.notNull('salesOrderItem.id');
    }

    var $soiEinzelformaufbauDTO =
        soiEinzelformaufbauDTO.copyWith(salesOrderItemId: salesOrderItem.id);
    await session.db.updateRow<SoiEinzelformaufbauDTO>(
      $soiEinzelformaufbauDTO,
      columns: [SoiEinzelformaufbauDTO.t.salesOrderItemId],
      transaction: transaction,
    );
  }
}
