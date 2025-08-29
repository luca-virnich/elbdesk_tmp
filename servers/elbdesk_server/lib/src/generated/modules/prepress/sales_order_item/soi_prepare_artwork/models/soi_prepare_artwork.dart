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

abstract class SoiPrepareArtworkDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  SoiPrepareArtworkDTO._({
    this.id,
    required this.artworkId,
    this.artwork,
    required this.artworkMasterId,
    required this.eyeCStatus,
    required this.difficultyLevel,
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

  factory SoiPrepareArtworkDTO({
    int? id,
    required int artworkId,
    _i2.ArtworkDTO? artwork,
    required int artworkMasterId,
    required String eyeCStatus,
    required String difficultyLevel,
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
  }) = _SoiPrepareArtworkDTOImpl;

  factory SoiPrepareArtworkDTO.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return SoiPrepareArtworkDTO(
      id: jsonSerialization['id'] as int?,
      artworkId: jsonSerialization['artworkId'] as int,
      artwork: jsonSerialization['artwork'] == null
          ? null
          : _i2.ArtworkDTO.fromJson(
              (jsonSerialization['artwork'] as Map<String, dynamic>)),
      artworkMasterId: jsonSerialization['artworkMasterId'] as int,
      eyeCStatus: jsonSerialization['eyeCStatus'] as String,
      difficultyLevel: jsonSerialization['difficultyLevel'] as String,
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

  static final t = SoiPrepareArtworkDTOTable();

  static const db = SoiPrepareArtworkDTORepository._();

  @override
  int? id;

  int artworkId;

  _i2.ArtworkDTO? artwork;

  int artworkMasterId;

  String eyeCStatus;

  String difficultyLevel;

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

  /// Returns a shallow copy of this [SoiPrepareArtworkDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SoiPrepareArtworkDTO copyWith({
    int? id,
    int? artworkId,
    _i2.ArtworkDTO? artwork,
    int? artworkMasterId,
    String? eyeCStatus,
    String? difficultyLevel,
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
      'eyeCStatus': eyeCStatus,
      'difficultyLevel': difficultyLevel,
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
      'eyeCStatus': eyeCStatus,
      'difficultyLevel': difficultyLevel,
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

  static SoiPrepareArtworkDTOInclude include({
    _i2.ArtworkDTOInclude? artwork,
    _i3.SalesOrderItemDTOInclude? salesOrderItem,
  }) {
    return SoiPrepareArtworkDTOInclude._(
      artwork: artwork,
      salesOrderItem: salesOrderItem,
    );
  }

  static SoiPrepareArtworkDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<SoiPrepareArtworkDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SoiPrepareArtworkDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SoiPrepareArtworkDTOTable>? orderByList,
    SoiPrepareArtworkDTOInclude? include,
  }) {
    return SoiPrepareArtworkDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SoiPrepareArtworkDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(SoiPrepareArtworkDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SoiPrepareArtworkDTOImpl extends SoiPrepareArtworkDTO {
  _SoiPrepareArtworkDTOImpl({
    int? id,
    required int artworkId,
    _i2.ArtworkDTO? artwork,
    required int artworkMasterId,
    required String eyeCStatus,
    required String difficultyLevel,
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
          eyeCStatus: eyeCStatus,
          difficultyLevel: difficultyLevel,
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

  /// Returns a shallow copy of this [SoiPrepareArtworkDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SoiPrepareArtworkDTO copyWith({
    Object? id = _Undefined,
    int? artworkId,
    Object? artwork = _Undefined,
    int? artworkMasterId,
    String? eyeCStatus,
    String? difficultyLevel,
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
    return SoiPrepareArtworkDTO(
      id: id is int? ? id : this.id,
      artworkId: artworkId ?? this.artworkId,
      artwork: artwork is _i2.ArtworkDTO? ? artwork : this.artwork?.copyWith(),
      artworkMasterId: artworkMasterId ?? this.artworkMasterId,
      eyeCStatus: eyeCStatus ?? this.eyeCStatus,
      difficultyLevel: difficultyLevel ?? this.difficultyLevel,
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

class SoiPrepareArtworkDTOTable extends _i1.Table<int?> {
  SoiPrepareArtworkDTOTable({super.tableRelation})
      : super(tableName: 'ed_prepress_soi_prepare_artwork') {
    artworkId = _i1.ColumnInt(
      'artworkId',
      this,
    );
    artworkMasterId = _i1.ColumnInt(
      'artworkMasterId',
      this,
    );
    eyeCStatus = _i1.ColumnString(
      'eyeCStatus',
      this,
    );
    difficultyLevel = _i1.ColumnString(
      'difficultyLevel',
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

  late final _i1.ColumnString eyeCStatus;

  late final _i1.ColumnString difficultyLevel;

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
      field: SoiPrepareArtworkDTO.t.artworkId,
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
      field: SoiPrepareArtworkDTO.t.salesOrderItemId,
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
        eyeCStatus,
        difficultyLevel,
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

class SoiPrepareArtworkDTOInclude extends _i1.IncludeObject {
  SoiPrepareArtworkDTOInclude._({
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
  _i1.Table<int?> get table => SoiPrepareArtworkDTO.t;
}

class SoiPrepareArtworkDTOIncludeList extends _i1.IncludeList {
  SoiPrepareArtworkDTOIncludeList._({
    _i1.WhereExpressionBuilder<SoiPrepareArtworkDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(SoiPrepareArtworkDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => SoiPrepareArtworkDTO.t;
}

class SoiPrepareArtworkDTORepository {
  const SoiPrepareArtworkDTORepository._();

  final attachRow = const SoiPrepareArtworkDTOAttachRowRepository._();

  /// Returns a list of [SoiPrepareArtworkDTO]s matching the given query parameters.
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
  Future<List<SoiPrepareArtworkDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SoiPrepareArtworkDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SoiPrepareArtworkDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SoiPrepareArtworkDTOTable>? orderByList,
    _i1.Transaction? transaction,
    SoiPrepareArtworkDTOInclude? include,
  }) async {
    return session.db.find<SoiPrepareArtworkDTO>(
      where: where?.call(SoiPrepareArtworkDTO.t),
      orderBy: orderBy?.call(SoiPrepareArtworkDTO.t),
      orderByList: orderByList?.call(SoiPrepareArtworkDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [SoiPrepareArtworkDTO] matching the given query parameters.
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
  Future<SoiPrepareArtworkDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SoiPrepareArtworkDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<SoiPrepareArtworkDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SoiPrepareArtworkDTOTable>? orderByList,
    _i1.Transaction? transaction,
    SoiPrepareArtworkDTOInclude? include,
  }) async {
    return session.db.findFirstRow<SoiPrepareArtworkDTO>(
      where: where?.call(SoiPrepareArtworkDTO.t),
      orderBy: orderBy?.call(SoiPrepareArtworkDTO.t),
      orderByList: orderByList?.call(SoiPrepareArtworkDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [SoiPrepareArtworkDTO] by its [id] or null if no such row exists.
  Future<SoiPrepareArtworkDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    SoiPrepareArtworkDTOInclude? include,
  }) async {
    return session.db.findById<SoiPrepareArtworkDTO>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [SoiPrepareArtworkDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [SoiPrepareArtworkDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<SoiPrepareArtworkDTO>> insert(
    _i1.Session session,
    List<SoiPrepareArtworkDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<SoiPrepareArtworkDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [SoiPrepareArtworkDTO] and returns the inserted row.
  ///
  /// The returned [SoiPrepareArtworkDTO] will have its `id` field set.
  Future<SoiPrepareArtworkDTO> insertRow(
    _i1.Session session,
    SoiPrepareArtworkDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<SoiPrepareArtworkDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [SoiPrepareArtworkDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<SoiPrepareArtworkDTO>> update(
    _i1.Session session,
    List<SoiPrepareArtworkDTO> rows, {
    _i1.ColumnSelections<SoiPrepareArtworkDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<SoiPrepareArtworkDTO>(
      rows,
      columns: columns?.call(SoiPrepareArtworkDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [SoiPrepareArtworkDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<SoiPrepareArtworkDTO> updateRow(
    _i1.Session session,
    SoiPrepareArtworkDTO row, {
    _i1.ColumnSelections<SoiPrepareArtworkDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<SoiPrepareArtworkDTO>(
      row,
      columns: columns?.call(SoiPrepareArtworkDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [SoiPrepareArtworkDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<SoiPrepareArtworkDTO>> delete(
    _i1.Session session,
    List<SoiPrepareArtworkDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<SoiPrepareArtworkDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [SoiPrepareArtworkDTO].
  Future<SoiPrepareArtworkDTO> deleteRow(
    _i1.Session session,
    SoiPrepareArtworkDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<SoiPrepareArtworkDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<SoiPrepareArtworkDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<SoiPrepareArtworkDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<SoiPrepareArtworkDTO>(
      where: where(SoiPrepareArtworkDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SoiPrepareArtworkDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<SoiPrepareArtworkDTO>(
      where: where?.call(SoiPrepareArtworkDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class SoiPrepareArtworkDTOAttachRowRepository {
  const SoiPrepareArtworkDTOAttachRowRepository._();

  /// Creates a relation between the given [SoiPrepareArtworkDTO] and [ArtworkDTO]
  /// by setting the [SoiPrepareArtworkDTO]'s foreign key `artworkId` to refer to the [ArtworkDTO].
  Future<void> artwork(
    _i1.Session session,
    SoiPrepareArtworkDTO soiPrepareArtworkDTO,
    _i2.ArtworkDTO artwork, {
    _i1.Transaction? transaction,
  }) async {
    if (soiPrepareArtworkDTO.id == null) {
      throw ArgumentError.notNull('soiPrepareArtworkDTO.id');
    }
    if (artwork.id == null) {
      throw ArgumentError.notNull('artwork.id');
    }

    var $soiPrepareArtworkDTO =
        soiPrepareArtworkDTO.copyWith(artworkId: artwork.id);
    await session.db.updateRow<SoiPrepareArtworkDTO>(
      $soiPrepareArtworkDTO,
      columns: [SoiPrepareArtworkDTO.t.artworkId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [SoiPrepareArtworkDTO] and [SalesOrderItemDTO]
  /// by setting the [SoiPrepareArtworkDTO]'s foreign key `salesOrderItemId` to refer to the [SalesOrderItemDTO].
  Future<void> salesOrderItem(
    _i1.Session session,
    SoiPrepareArtworkDTO soiPrepareArtworkDTO,
    _i3.SalesOrderItemDTO salesOrderItem, {
    _i1.Transaction? transaction,
  }) async {
    if (soiPrepareArtworkDTO.id == null) {
      throw ArgumentError.notNull('soiPrepareArtworkDTO.id');
    }
    if (salesOrderItem.id == null) {
      throw ArgumentError.notNull('salesOrderItem.id');
    }

    var $soiPrepareArtworkDTO =
        soiPrepareArtworkDTO.copyWith(salesOrderItemId: salesOrderItem.id);
    await session.db.updateRow<SoiPrepareArtworkDTO>(
      $soiPrepareArtworkDTO,
      columns: [SoiPrepareArtworkDTO.t.salesOrderItemId],
      transaction: transaction,
    );
  }
}
