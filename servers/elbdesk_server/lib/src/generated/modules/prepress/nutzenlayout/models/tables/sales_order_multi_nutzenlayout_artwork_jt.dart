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
import '../../../../../modules/prepress/nutzenlayout/models/tables/sales_order_multi_nutzenlayout_dto.dart'
    as _i2;
import '../../../../../modules/prepress/artwork/models/artwork.dart' as _i3;

abstract class SalesOrderMultiNutzenlayoutArtworkJT
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  SalesOrderMultiNutzenlayoutArtworkJT._({
    this.id,
    required this.salesOrderMultiNutzenlayoutId,
    this.salesOrderMultiNutzenlayout,
    required this.artworkId,
    this.artwork,
  });

  factory SalesOrderMultiNutzenlayoutArtworkJT({
    int? id,
    required int salesOrderMultiNutzenlayoutId,
    _i2.SalesOrderMultiNutzenlayoutDTO? salesOrderMultiNutzenlayout,
    required int artworkId,
    _i3.ArtworkDTO? artwork,
  }) = _SalesOrderMultiNutzenlayoutArtworkJTImpl;

  factory SalesOrderMultiNutzenlayoutArtworkJT.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return SalesOrderMultiNutzenlayoutArtworkJT(
      id: jsonSerialization['id'] as int?,
      salesOrderMultiNutzenlayoutId:
          jsonSerialization['salesOrderMultiNutzenlayoutId'] as int,
      salesOrderMultiNutzenlayout:
          jsonSerialization['salesOrderMultiNutzenlayout'] == null
              ? null
              : _i2.SalesOrderMultiNutzenlayoutDTO.fromJson(
                  (jsonSerialization['salesOrderMultiNutzenlayout']
                      as Map<String, dynamic>)),
      artworkId: jsonSerialization['artworkId'] as int,
      artwork: jsonSerialization['artwork'] == null
          ? null
          : _i3.ArtworkDTO.fromJson(
              (jsonSerialization['artwork'] as Map<String, dynamic>)),
    );
  }

  static final t = SalesOrderMultiNutzenlayoutArtworkJTTable();

  static const db = SalesOrderMultiNutzenlayoutArtworkJTRepository._();

  @override
  int? id;

  int salesOrderMultiNutzenlayoutId;

  _i2.SalesOrderMultiNutzenlayoutDTO? salesOrderMultiNutzenlayout;

  int artworkId;

  _i3.ArtworkDTO? artwork;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [SalesOrderMultiNutzenlayoutArtworkJT]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SalesOrderMultiNutzenlayoutArtworkJT copyWith({
    int? id,
    int? salesOrderMultiNutzenlayoutId,
    _i2.SalesOrderMultiNutzenlayoutDTO? salesOrderMultiNutzenlayout,
    int? artworkId,
    _i3.ArtworkDTO? artwork,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'salesOrderMultiNutzenlayoutId': salesOrderMultiNutzenlayoutId,
      if (salesOrderMultiNutzenlayout != null)
        'salesOrderMultiNutzenlayout': salesOrderMultiNutzenlayout?.toJson(),
      'artworkId': artworkId,
      if (artwork != null) 'artwork': artwork?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'salesOrderMultiNutzenlayoutId': salesOrderMultiNutzenlayoutId,
      if (salesOrderMultiNutzenlayout != null)
        'salesOrderMultiNutzenlayout':
            salesOrderMultiNutzenlayout?.toJsonForProtocol(),
      'artworkId': artworkId,
      if (artwork != null) 'artwork': artwork?.toJsonForProtocol(),
    };
  }

  static SalesOrderMultiNutzenlayoutArtworkJTInclude include({
    _i2.SalesOrderMultiNutzenlayoutDTOInclude? salesOrderMultiNutzenlayout,
    _i3.ArtworkDTOInclude? artwork,
  }) {
    return SalesOrderMultiNutzenlayoutArtworkJTInclude._(
      salesOrderMultiNutzenlayout: salesOrderMultiNutzenlayout,
      artwork: artwork,
    );
  }

  static SalesOrderMultiNutzenlayoutArtworkJTIncludeList includeList({
    _i1.WhereExpressionBuilder<SalesOrderMultiNutzenlayoutArtworkJTTable>?
        where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SalesOrderMultiNutzenlayoutArtworkJTTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SalesOrderMultiNutzenlayoutArtworkJTTable>?
        orderByList,
    SalesOrderMultiNutzenlayoutArtworkJTInclude? include,
  }) {
    return SalesOrderMultiNutzenlayoutArtworkJTIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SalesOrderMultiNutzenlayoutArtworkJT.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(SalesOrderMultiNutzenlayoutArtworkJT.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SalesOrderMultiNutzenlayoutArtworkJTImpl
    extends SalesOrderMultiNutzenlayoutArtworkJT {
  _SalesOrderMultiNutzenlayoutArtworkJTImpl({
    int? id,
    required int salesOrderMultiNutzenlayoutId,
    _i2.SalesOrderMultiNutzenlayoutDTO? salesOrderMultiNutzenlayout,
    required int artworkId,
    _i3.ArtworkDTO? artwork,
  }) : super._(
          id: id,
          salesOrderMultiNutzenlayoutId: salesOrderMultiNutzenlayoutId,
          salesOrderMultiNutzenlayout: salesOrderMultiNutzenlayout,
          artworkId: artworkId,
          artwork: artwork,
        );

  /// Returns a shallow copy of this [SalesOrderMultiNutzenlayoutArtworkJT]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SalesOrderMultiNutzenlayoutArtworkJT copyWith({
    Object? id = _Undefined,
    int? salesOrderMultiNutzenlayoutId,
    Object? salesOrderMultiNutzenlayout = _Undefined,
    int? artworkId,
    Object? artwork = _Undefined,
  }) {
    return SalesOrderMultiNutzenlayoutArtworkJT(
      id: id is int? ? id : this.id,
      salesOrderMultiNutzenlayoutId:
          salesOrderMultiNutzenlayoutId ?? this.salesOrderMultiNutzenlayoutId,
      salesOrderMultiNutzenlayout:
          salesOrderMultiNutzenlayout is _i2.SalesOrderMultiNutzenlayoutDTO?
              ? salesOrderMultiNutzenlayout
              : this.salesOrderMultiNutzenlayout?.copyWith(),
      artworkId: artworkId ?? this.artworkId,
      artwork: artwork is _i3.ArtworkDTO? ? artwork : this.artwork?.copyWith(),
    );
  }
}

class SalesOrderMultiNutzenlayoutArtworkJTTable extends _i1.Table<int?> {
  SalesOrderMultiNutzenlayoutArtworkJTTable({super.tableRelation})
      : super(tableName: 'jt_sales_order_multi_nutzenlayout_artworks') {
    salesOrderMultiNutzenlayoutId = _i1.ColumnInt(
      'salesOrderMultiNutzenlayoutId',
      this,
    );
    artworkId = _i1.ColumnInt(
      'artworkId',
      this,
    );
  }

  late final _i1.ColumnInt salesOrderMultiNutzenlayoutId;

  _i2.SalesOrderMultiNutzenlayoutDTOTable? _salesOrderMultiNutzenlayout;

  late final _i1.ColumnInt artworkId;

  _i3.ArtworkDTOTable? _artwork;

  _i2.SalesOrderMultiNutzenlayoutDTOTable get salesOrderMultiNutzenlayout {
    if (_salesOrderMultiNutzenlayout != null)
      return _salesOrderMultiNutzenlayout!;
    _salesOrderMultiNutzenlayout = _i1.createRelationTable(
      relationFieldName: 'salesOrderMultiNutzenlayout',
      field:
          SalesOrderMultiNutzenlayoutArtworkJT.t.salesOrderMultiNutzenlayoutId,
      foreignField: _i2.SalesOrderMultiNutzenlayoutDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.SalesOrderMultiNutzenlayoutDTOTable(
              tableRelation: foreignTableRelation),
    );
    return _salesOrderMultiNutzenlayout!;
  }

  _i3.ArtworkDTOTable get artwork {
    if (_artwork != null) return _artwork!;
    _artwork = _i1.createRelationTable(
      relationFieldName: 'artwork',
      field: SalesOrderMultiNutzenlayoutArtworkJT.t.artworkId,
      foreignField: _i3.ArtworkDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.ArtworkDTOTable(tableRelation: foreignTableRelation),
    );
    return _artwork!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        salesOrderMultiNutzenlayoutId,
        artworkId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'salesOrderMultiNutzenlayout') {
      return salesOrderMultiNutzenlayout;
    }
    if (relationField == 'artwork') {
      return artwork;
    }
    return null;
  }
}

class SalesOrderMultiNutzenlayoutArtworkJTInclude extends _i1.IncludeObject {
  SalesOrderMultiNutzenlayoutArtworkJTInclude._({
    _i2.SalesOrderMultiNutzenlayoutDTOInclude? salesOrderMultiNutzenlayout,
    _i3.ArtworkDTOInclude? artwork,
  }) {
    _salesOrderMultiNutzenlayout = salesOrderMultiNutzenlayout;
    _artwork = artwork;
  }

  _i2.SalesOrderMultiNutzenlayoutDTOInclude? _salesOrderMultiNutzenlayout;

  _i3.ArtworkDTOInclude? _artwork;

  @override
  Map<String, _i1.Include?> get includes => {
        'salesOrderMultiNutzenlayout': _salesOrderMultiNutzenlayout,
        'artwork': _artwork,
      };

  @override
  _i1.Table<int?> get table => SalesOrderMultiNutzenlayoutArtworkJT.t;
}

class SalesOrderMultiNutzenlayoutArtworkJTIncludeList extends _i1.IncludeList {
  SalesOrderMultiNutzenlayoutArtworkJTIncludeList._({
    _i1.WhereExpressionBuilder<SalesOrderMultiNutzenlayoutArtworkJTTable>?
        where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(SalesOrderMultiNutzenlayoutArtworkJT.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => SalesOrderMultiNutzenlayoutArtworkJT.t;
}

class SalesOrderMultiNutzenlayoutArtworkJTRepository {
  const SalesOrderMultiNutzenlayoutArtworkJTRepository._();

  final attachRow =
      const SalesOrderMultiNutzenlayoutArtworkJTAttachRowRepository._();

  /// Returns a list of [SalesOrderMultiNutzenlayoutArtworkJT]s matching the given query parameters.
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
  Future<List<SalesOrderMultiNutzenlayoutArtworkJT>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SalesOrderMultiNutzenlayoutArtworkJTTable>?
        where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SalesOrderMultiNutzenlayoutArtworkJTTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SalesOrderMultiNutzenlayoutArtworkJTTable>?
        orderByList,
    _i1.Transaction? transaction,
    SalesOrderMultiNutzenlayoutArtworkJTInclude? include,
  }) async {
    return session.db.find<SalesOrderMultiNutzenlayoutArtworkJT>(
      where: where?.call(SalesOrderMultiNutzenlayoutArtworkJT.t),
      orderBy: orderBy?.call(SalesOrderMultiNutzenlayoutArtworkJT.t),
      orderByList: orderByList?.call(SalesOrderMultiNutzenlayoutArtworkJT.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [SalesOrderMultiNutzenlayoutArtworkJT] matching the given query parameters.
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
  Future<SalesOrderMultiNutzenlayoutArtworkJT?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SalesOrderMultiNutzenlayoutArtworkJTTable>?
        where,
    int? offset,
    _i1.OrderByBuilder<SalesOrderMultiNutzenlayoutArtworkJTTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SalesOrderMultiNutzenlayoutArtworkJTTable>?
        orderByList,
    _i1.Transaction? transaction,
    SalesOrderMultiNutzenlayoutArtworkJTInclude? include,
  }) async {
    return session.db.findFirstRow<SalesOrderMultiNutzenlayoutArtworkJT>(
      where: where?.call(SalesOrderMultiNutzenlayoutArtworkJT.t),
      orderBy: orderBy?.call(SalesOrderMultiNutzenlayoutArtworkJT.t),
      orderByList: orderByList?.call(SalesOrderMultiNutzenlayoutArtworkJT.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [SalesOrderMultiNutzenlayoutArtworkJT] by its [id] or null if no such row exists.
  Future<SalesOrderMultiNutzenlayoutArtworkJT?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    SalesOrderMultiNutzenlayoutArtworkJTInclude? include,
  }) async {
    return session.db.findById<SalesOrderMultiNutzenlayoutArtworkJT>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [SalesOrderMultiNutzenlayoutArtworkJT]s in the list and returns the inserted rows.
  ///
  /// The returned [SalesOrderMultiNutzenlayoutArtworkJT]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<SalesOrderMultiNutzenlayoutArtworkJT>> insert(
    _i1.Session session,
    List<SalesOrderMultiNutzenlayoutArtworkJT> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<SalesOrderMultiNutzenlayoutArtworkJT>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [SalesOrderMultiNutzenlayoutArtworkJT] and returns the inserted row.
  ///
  /// The returned [SalesOrderMultiNutzenlayoutArtworkJT] will have its `id` field set.
  Future<SalesOrderMultiNutzenlayoutArtworkJT> insertRow(
    _i1.Session session,
    SalesOrderMultiNutzenlayoutArtworkJT row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<SalesOrderMultiNutzenlayoutArtworkJT>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [SalesOrderMultiNutzenlayoutArtworkJT]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<SalesOrderMultiNutzenlayoutArtworkJT>> update(
    _i1.Session session,
    List<SalesOrderMultiNutzenlayoutArtworkJT> rows, {
    _i1.ColumnSelections<SalesOrderMultiNutzenlayoutArtworkJTTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<SalesOrderMultiNutzenlayoutArtworkJT>(
      rows,
      columns: columns?.call(SalesOrderMultiNutzenlayoutArtworkJT.t),
      transaction: transaction,
    );
  }

  /// Updates a single [SalesOrderMultiNutzenlayoutArtworkJT]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<SalesOrderMultiNutzenlayoutArtworkJT> updateRow(
    _i1.Session session,
    SalesOrderMultiNutzenlayoutArtworkJT row, {
    _i1.ColumnSelections<SalesOrderMultiNutzenlayoutArtworkJTTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<SalesOrderMultiNutzenlayoutArtworkJT>(
      row,
      columns: columns?.call(SalesOrderMultiNutzenlayoutArtworkJT.t),
      transaction: transaction,
    );
  }

  /// Deletes all [SalesOrderMultiNutzenlayoutArtworkJT]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<SalesOrderMultiNutzenlayoutArtworkJT>> delete(
    _i1.Session session,
    List<SalesOrderMultiNutzenlayoutArtworkJT> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<SalesOrderMultiNutzenlayoutArtworkJT>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [SalesOrderMultiNutzenlayoutArtworkJT].
  Future<SalesOrderMultiNutzenlayoutArtworkJT> deleteRow(
    _i1.Session session,
    SalesOrderMultiNutzenlayoutArtworkJT row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<SalesOrderMultiNutzenlayoutArtworkJT>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<SalesOrderMultiNutzenlayoutArtworkJT>> deleteWhere(
    _i1.Session session, {
    required _i1
        .WhereExpressionBuilder<SalesOrderMultiNutzenlayoutArtworkJTTable>
        where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<SalesOrderMultiNutzenlayoutArtworkJT>(
      where: where(SalesOrderMultiNutzenlayoutArtworkJT.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SalesOrderMultiNutzenlayoutArtworkJTTable>?
        where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<SalesOrderMultiNutzenlayoutArtworkJT>(
      where: where?.call(SalesOrderMultiNutzenlayoutArtworkJT.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class SalesOrderMultiNutzenlayoutArtworkJTAttachRowRepository {
  const SalesOrderMultiNutzenlayoutArtworkJTAttachRowRepository._();

  /// Creates a relation between the given [SalesOrderMultiNutzenlayoutArtworkJT] and [SalesOrderMultiNutzenlayoutDTO]
  /// by setting the [SalesOrderMultiNutzenlayoutArtworkJT]'s foreign key `salesOrderMultiNutzenlayoutId` to refer to the [SalesOrderMultiNutzenlayoutDTO].
  Future<void> salesOrderMultiNutzenlayout(
    _i1.Session session,
    SalesOrderMultiNutzenlayoutArtworkJT salesOrderMultiNutzenlayoutArtworkJT,
    _i2.SalesOrderMultiNutzenlayoutDTO salesOrderMultiNutzenlayout, {
    _i1.Transaction? transaction,
  }) async {
    if (salesOrderMultiNutzenlayoutArtworkJT.id == null) {
      throw ArgumentError.notNull('salesOrderMultiNutzenlayoutArtworkJT.id');
    }
    if (salesOrderMultiNutzenlayout.id == null) {
      throw ArgumentError.notNull('salesOrderMultiNutzenlayout.id');
    }

    var $salesOrderMultiNutzenlayoutArtworkJT =
        salesOrderMultiNutzenlayoutArtworkJT.copyWith(
            salesOrderMultiNutzenlayoutId: salesOrderMultiNutzenlayout.id);
    await session.db.updateRow<SalesOrderMultiNutzenlayoutArtworkJT>(
      $salesOrderMultiNutzenlayoutArtworkJT,
      columns: [
        SalesOrderMultiNutzenlayoutArtworkJT.t.salesOrderMultiNutzenlayoutId
      ],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [SalesOrderMultiNutzenlayoutArtworkJT] and [ArtworkDTO]
  /// by setting the [SalesOrderMultiNutzenlayoutArtworkJT]'s foreign key `artworkId` to refer to the [ArtworkDTO].
  Future<void> artwork(
    _i1.Session session,
    SalesOrderMultiNutzenlayoutArtworkJT salesOrderMultiNutzenlayoutArtworkJT,
    _i3.ArtworkDTO artwork, {
    _i1.Transaction? transaction,
  }) async {
    if (salesOrderMultiNutzenlayoutArtworkJT.id == null) {
      throw ArgumentError.notNull('salesOrderMultiNutzenlayoutArtworkJT.id');
    }
    if (artwork.id == null) {
      throw ArgumentError.notNull('artwork.id');
    }

    var $salesOrderMultiNutzenlayoutArtworkJT =
        salesOrderMultiNutzenlayoutArtworkJT.copyWith(artworkId: artwork.id);
    await session.db.updateRow<SalesOrderMultiNutzenlayoutArtworkJT>(
      $salesOrderMultiNutzenlayoutArtworkJT,
      columns: [SalesOrderMultiNutzenlayoutArtworkJT.t.artworkId],
      transaction: transaction,
    );
  }
}
