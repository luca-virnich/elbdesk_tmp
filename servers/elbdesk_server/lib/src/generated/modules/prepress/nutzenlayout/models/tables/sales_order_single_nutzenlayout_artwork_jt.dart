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
import '../../../../../modules/prepress/nutzenlayout/models/tables/sales_order_single_nutzenlayout_dto.dart'
    as _i2;
import '../../../../../modules/prepress/artwork/models/artwork.dart' as _i3;

abstract class SalesOrderSingleNutzenlayoutArtworkJT
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  SalesOrderSingleNutzenlayoutArtworkJT._({
    this.id,
    required this.salesOrderSingleNutzenlayoutId,
    this.salesOrderSingleNutzenlayout,
    required this.artworkId,
    this.artwork,
  });

  factory SalesOrderSingleNutzenlayoutArtworkJT({
    int? id,
    required int salesOrderSingleNutzenlayoutId,
    _i2.SalesOrderSingleNutzenlayoutDTO? salesOrderSingleNutzenlayout,
    required int artworkId,
    _i3.ArtworkDTO? artwork,
  }) = _SalesOrderSingleNutzenlayoutArtworkJTImpl;

  factory SalesOrderSingleNutzenlayoutArtworkJT.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return SalesOrderSingleNutzenlayoutArtworkJT(
      id: jsonSerialization['id'] as int?,
      salesOrderSingleNutzenlayoutId:
          jsonSerialization['salesOrderSingleNutzenlayoutId'] as int,
      salesOrderSingleNutzenlayout:
          jsonSerialization['salesOrderSingleNutzenlayout'] == null
              ? null
              : _i2.SalesOrderSingleNutzenlayoutDTO.fromJson(
                  (jsonSerialization['salesOrderSingleNutzenlayout']
                      as Map<String, dynamic>)),
      artworkId: jsonSerialization['artworkId'] as int,
      artwork: jsonSerialization['artwork'] == null
          ? null
          : _i3.ArtworkDTO.fromJson(
              (jsonSerialization['artwork'] as Map<String, dynamic>)),
    );
  }

  static final t = SalesOrderSingleNutzenlayoutArtworkJTTable();

  static const db = SalesOrderSingleNutzenlayoutArtworkJTRepository._();

  @override
  int? id;

  int salesOrderSingleNutzenlayoutId;

  _i2.SalesOrderSingleNutzenlayoutDTO? salesOrderSingleNutzenlayout;

  int artworkId;

  _i3.ArtworkDTO? artwork;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [SalesOrderSingleNutzenlayoutArtworkJT]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SalesOrderSingleNutzenlayoutArtworkJT copyWith({
    int? id,
    int? salesOrderSingleNutzenlayoutId,
    _i2.SalesOrderSingleNutzenlayoutDTO? salesOrderSingleNutzenlayout,
    int? artworkId,
    _i3.ArtworkDTO? artwork,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'salesOrderSingleNutzenlayoutId': salesOrderSingleNutzenlayoutId,
      if (salesOrderSingleNutzenlayout != null)
        'salesOrderSingleNutzenlayout': salesOrderSingleNutzenlayout?.toJson(),
      'artworkId': artworkId,
      if (artwork != null) 'artwork': artwork?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'salesOrderSingleNutzenlayoutId': salesOrderSingleNutzenlayoutId,
      if (salesOrderSingleNutzenlayout != null)
        'salesOrderSingleNutzenlayout':
            salesOrderSingleNutzenlayout?.toJsonForProtocol(),
      'artworkId': artworkId,
      if (artwork != null) 'artwork': artwork?.toJsonForProtocol(),
    };
  }

  static SalesOrderSingleNutzenlayoutArtworkJTInclude include({
    _i2.SalesOrderSingleNutzenlayoutDTOInclude? salesOrderSingleNutzenlayout,
    _i3.ArtworkDTOInclude? artwork,
  }) {
    return SalesOrderSingleNutzenlayoutArtworkJTInclude._(
      salesOrderSingleNutzenlayout: salesOrderSingleNutzenlayout,
      artwork: artwork,
    );
  }

  static SalesOrderSingleNutzenlayoutArtworkJTIncludeList includeList({
    _i1.WhereExpressionBuilder<SalesOrderSingleNutzenlayoutArtworkJTTable>?
        where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SalesOrderSingleNutzenlayoutArtworkJTTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SalesOrderSingleNutzenlayoutArtworkJTTable>?
        orderByList,
    SalesOrderSingleNutzenlayoutArtworkJTInclude? include,
  }) {
    return SalesOrderSingleNutzenlayoutArtworkJTIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SalesOrderSingleNutzenlayoutArtworkJT.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(SalesOrderSingleNutzenlayoutArtworkJT.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SalesOrderSingleNutzenlayoutArtworkJTImpl
    extends SalesOrderSingleNutzenlayoutArtworkJT {
  _SalesOrderSingleNutzenlayoutArtworkJTImpl({
    int? id,
    required int salesOrderSingleNutzenlayoutId,
    _i2.SalesOrderSingleNutzenlayoutDTO? salesOrderSingleNutzenlayout,
    required int artworkId,
    _i3.ArtworkDTO? artwork,
  }) : super._(
          id: id,
          salesOrderSingleNutzenlayoutId: salesOrderSingleNutzenlayoutId,
          salesOrderSingleNutzenlayout: salesOrderSingleNutzenlayout,
          artworkId: artworkId,
          artwork: artwork,
        );

  /// Returns a shallow copy of this [SalesOrderSingleNutzenlayoutArtworkJT]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SalesOrderSingleNutzenlayoutArtworkJT copyWith({
    Object? id = _Undefined,
    int? salesOrderSingleNutzenlayoutId,
    Object? salesOrderSingleNutzenlayout = _Undefined,
    int? artworkId,
    Object? artwork = _Undefined,
  }) {
    return SalesOrderSingleNutzenlayoutArtworkJT(
      id: id is int? ? id : this.id,
      salesOrderSingleNutzenlayoutId:
          salesOrderSingleNutzenlayoutId ?? this.salesOrderSingleNutzenlayoutId,
      salesOrderSingleNutzenlayout:
          salesOrderSingleNutzenlayout is _i2.SalesOrderSingleNutzenlayoutDTO?
              ? salesOrderSingleNutzenlayout
              : this.salesOrderSingleNutzenlayout?.copyWith(),
      artworkId: artworkId ?? this.artworkId,
      artwork: artwork is _i3.ArtworkDTO? ? artwork : this.artwork?.copyWith(),
    );
  }
}

class SalesOrderSingleNutzenlayoutArtworkJTTable extends _i1.Table<int?> {
  SalesOrderSingleNutzenlayoutArtworkJTTable({super.tableRelation})
      : super(tableName: 'jt_sales_order_single_nutzenlayout_artworks') {
    salesOrderSingleNutzenlayoutId = _i1.ColumnInt(
      'salesOrderSingleNutzenlayoutId',
      this,
    );
    artworkId = _i1.ColumnInt(
      'artworkId',
      this,
    );
  }

  late final _i1.ColumnInt salesOrderSingleNutzenlayoutId;

  _i2.SalesOrderSingleNutzenlayoutDTOTable? _salesOrderSingleNutzenlayout;

  late final _i1.ColumnInt artworkId;

  _i3.ArtworkDTOTable? _artwork;

  _i2.SalesOrderSingleNutzenlayoutDTOTable get salesOrderSingleNutzenlayout {
    if (_salesOrderSingleNutzenlayout != null)
      return _salesOrderSingleNutzenlayout!;
    _salesOrderSingleNutzenlayout = _i1.createRelationTable(
      relationFieldName: 'salesOrderSingleNutzenlayout',
      field: SalesOrderSingleNutzenlayoutArtworkJT
          .t.salesOrderSingleNutzenlayoutId,
      foreignField: _i2.SalesOrderSingleNutzenlayoutDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.SalesOrderSingleNutzenlayoutDTOTable(
              tableRelation: foreignTableRelation),
    );
    return _salesOrderSingleNutzenlayout!;
  }

  _i3.ArtworkDTOTable get artwork {
    if (_artwork != null) return _artwork!;
    _artwork = _i1.createRelationTable(
      relationFieldName: 'artwork',
      field: SalesOrderSingleNutzenlayoutArtworkJT.t.artworkId,
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
        salesOrderSingleNutzenlayoutId,
        artworkId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'salesOrderSingleNutzenlayout') {
      return salesOrderSingleNutzenlayout;
    }
    if (relationField == 'artwork') {
      return artwork;
    }
    return null;
  }
}

class SalesOrderSingleNutzenlayoutArtworkJTInclude extends _i1.IncludeObject {
  SalesOrderSingleNutzenlayoutArtworkJTInclude._({
    _i2.SalesOrderSingleNutzenlayoutDTOInclude? salesOrderSingleNutzenlayout,
    _i3.ArtworkDTOInclude? artwork,
  }) {
    _salesOrderSingleNutzenlayout = salesOrderSingleNutzenlayout;
    _artwork = artwork;
  }

  _i2.SalesOrderSingleNutzenlayoutDTOInclude? _salesOrderSingleNutzenlayout;

  _i3.ArtworkDTOInclude? _artwork;

  @override
  Map<String, _i1.Include?> get includes => {
        'salesOrderSingleNutzenlayout': _salesOrderSingleNutzenlayout,
        'artwork': _artwork,
      };

  @override
  _i1.Table<int?> get table => SalesOrderSingleNutzenlayoutArtworkJT.t;
}

class SalesOrderSingleNutzenlayoutArtworkJTIncludeList extends _i1.IncludeList {
  SalesOrderSingleNutzenlayoutArtworkJTIncludeList._({
    _i1.WhereExpressionBuilder<SalesOrderSingleNutzenlayoutArtworkJTTable>?
        where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(SalesOrderSingleNutzenlayoutArtworkJT.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => SalesOrderSingleNutzenlayoutArtworkJT.t;
}

class SalesOrderSingleNutzenlayoutArtworkJTRepository {
  const SalesOrderSingleNutzenlayoutArtworkJTRepository._();

  final attachRow =
      const SalesOrderSingleNutzenlayoutArtworkJTAttachRowRepository._();

  /// Returns a list of [SalesOrderSingleNutzenlayoutArtworkJT]s matching the given query parameters.
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
  Future<List<SalesOrderSingleNutzenlayoutArtworkJT>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SalesOrderSingleNutzenlayoutArtworkJTTable>?
        where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SalesOrderSingleNutzenlayoutArtworkJTTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SalesOrderSingleNutzenlayoutArtworkJTTable>?
        orderByList,
    _i1.Transaction? transaction,
    SalesOrderSingleNutzenlayoutArtworkJTInclude? include,
  }) async {
    return session.db.find<SalesOrderSingleNutzenlayoutArtworkJT>(
      where: where?.call(SalesOrderSingleNutzenlayoutArtworkJT.t),
      orderBy: orderBy?.call(SalesOrderSingleNutzenlayoutArtworkJT.t),
      orderByList: orderByList?.call(SalesOrderSingleNutzenlayoutArtworkJT.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [SalesOrderSingleNutzenlayoutArtworkJT] matching the given query parameters.
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
  Future<SalesOrderSingleNutzenlayoutArtworkJT?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SalesOrderSingleNutzenlayoutArtworkJTTable>?
        where,
    int? offset,
    _i1.OrderByBuilder<SalesOrderSingleNutzenlayoutArtworkJTTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SalesOrderSingleNutzenlayoutArtworkJTTable>?
        orderByList,
    _i1.Transaction? transaction,
    SalesOrderSingleNutzenlayoutArtworkJTInclude? include,
  }) async {
    return session.db.findFirstRow<SalesOrderSingleNutzenlayoutArtworkJT>(
      where: where?.call(SalesOrderSingleNutzenlayoutArtworkJT.t),
      orderBy: orderBy?.call(SalesOrderSingleNutzenlayoutArtworkJT.t),
      orderByList: orderByList?.call(SalesOrderSingleNutzenlayoutArtworkJT.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [SalesOrderSingleNutzenlayoutArtworkJT] by its [id] or null if no such row exists.
  Future<SalesOrderSingleNutzenlayoutArtworkJT?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    SalesOrderSingleNutzenlayoutArtworkJTInclude? include,
  }) async {
    return session.db.findById<SalesOrderSingleNutzenlayoutArtworkJT>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [SalesOrderSingleNutzenlayoutArtworkJT]s in the list and returns the inserted rows.
  ///
  /// The returned [SalesOrderSingleNutzenlayoutArtworkJT]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<SalesOrderSingleNutzenlayoutArtworkJT>> insert(
    _i1.Session session,
    List<SalesOrderSingleNutzenlayoutArtworkJT> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<SalesOrderSingleNutzenlayoutArtworkJT>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [SalesOrderSingleNutzenlayoutArtworkJT] and returns the inserted row.
  ///
  /// The returned [SalesOrderSingleNutzenlayoutArtworkJT] will have its `id` field set.
  Future<SalesOrderSingleNutzenlayoutArtworkJT> insertRow(
    _i1.Session session,
    SalesOrderSingleNutzenlayoutArtworkJT row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<SalesOrderSingleNutzenlayoutArtworkJT>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [SalesOrderSingleNutzenlayoutArtworkJT]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<SalesOrderSingleNutzenlayoutArtworkJT>> update(
    _i1.Session session,
    List<SalesOrderSingleNutzenlayoutArtworkJT> rows, {
    _i1.ColumnSelections<SalesOrderSingleNutzenlayoutArtworkJTTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<SalesOrderSingleNutzenlayoutArtworkJT>(
      rows,
      columns: columns?.call(SalesOrderSingleNutzenlayoutArtworkJT.t),
      transaction: transaction,
    );
  }

  /// Updates a single [SalesOrderSingleNutzenlayoutArtworkJT]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<SalesOrderSingleNutzenlayoutArtworkJT> updateRow(
    _i1.Session session,
    SalesOrderSingleNutzenlayoutArtworkJT row, {
    _i1.ColumnSelections<SalesOrderSingleNutzenlayoutArtworkJTTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<SalesOrderSingleNutzenlayoutArtworkJT>(
      row,
      columns: columns?.call(SalesOrderSingleNutzenlayoutArtworkJT.t),
      transaction: transaction,
    );
  }

  /// Deletes all [SalesOrderSingleNutzenlayoutArtworkJT]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<SalesOrderSingleNutzenlayoutArtworkJT>> delete(
    _i1.Session session,
    List<SalesOrderSingleNutzenlayoutArtworkJT> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<SalesOrderSingleNutzenlayoutArtworkJT>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [SalesOrderSingleNutzenlayoutArtworkJT].
  Future<SalesOrderSingleNutzenlayoutArtworkJT> deleteRow(
    _i1.Session session,
    SalesOrderSingleNutzenlayoutArtworkJT row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<SalesOrderSingleNutzenlayoutArtworkJT>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<SalesOrderSingleNutzenlayoutArtworkJT>> deleteWhere(
    _i1.Session session, {
    required _i1
        .WhereExpressionBuilder<SalesOrderSingleNutzenlayoutArtworkJTTable>
        where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<SalesOrderSingleNutzenlayoutArtworkJT>(
      where: where(SalesOrderSingleNutzenlayoutArtworkJT.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SalesOrderSingleNutzenlayoutArtworkJTTable>?
        where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<SalesOrderSingleNutzenlayoutArtworkJT>(
      where: where?.call(SalesOrderSingleNutzenlayoutArtworkJT.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class SalesOrderSingleNutzenlayoutArtworkJTAttachRowRepository {
  const SalesOrderSingleNutzenlayoutArtworkJTAttachRowRepository._();

  /// Creates a relation between the given [SalesOrderSingleNutzenlayoutArtworkJT] and [SalesOrderSingleNutzenlayoutDTO]
  /// by setting the [SalesOrderSingleNutzenlayoutArtworkJT]'s foreign key `salesOrderSingleNutzenlayoutId` to refer to the [SalesOrderSingleNutzenlayoutDTO].
  Future<void> salesOrderSingleNutzenlayout(
    _i1.Session session,
    SalesOrderSingleNutzenlayoutArtworkJT salesOrderSingleNutzenlayoutArtworkJT,
    _i2.SalesOrderSingleNutzenlayoutDTO salesOrderSingleNutzenlayout, {
    _i1.Transaction? transaction,
  }) async {
    if (salesOrderSingleNutzenlayoutArtworkJT.id == null) {
      throw ArgumentError.notNull('salesOrderSingleNutzenlayoutArtworkJT.id');
    }
    if (salesOrderSingleNutzenlayout.id == null) {
      throw ArgumentError.notNull('salesOrderSingleNutzenlayout.id');
    }

    var $salesOrderSingleNutzenlayoutArtworkJT =
        salesOrderSingleNutzenlayoutArtworkJT.copyWith(
            salesOrderSingleNutzenlayoutId: salesOrderSingleNutzenlayout.id);
    await session.db.updateRow<SalesOrderSingleNutzenlayoutArtworkJT>(
      $salesOrderSingleNutzenlayoutArtworkJT,
      columns: [
        SalesOrderSingleNutzenlayoutArtworkJT.t.salesOrderSingleNutzenlayoutId
      ],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [SalesOrderSingleNutzenlayoutArtworkJT] and [ArtworkDTO]
  /// by setting the [SalesOrderSingleNutzenlayoutArtworkJT]'s foreign key `artworkId` to refer to the [ArtworkDTO].
  Future<void> artwork(
    _i1.Session session,
    SalesOrderSingleNutzenlayoutArtworkJT salesOrderSingleNutzenlayoutArtworkJT,
    _i3.ArtworkDTO artwork, {
    _i1.Transaction? transaction,
  }) async {
    if (salesOrderSingleNutzenlayoutArtworkJT.id == null) {
      throw ArgumentError.notNull('salesOrderSingleNutzenlayoutArtworkJT.id');
    }
    if (artwork.id == null) {
      throw ArgumentError.notNull('artwork.id');
    }

    var $salesOrderSingleNutzenlayoutArtworkJT =
        salesOrderSingleNutzenlayoutArtworkJT.copyWith(artworkId: artwork.id);
    await session.db.updateRow<SalesOrderSingleNutzenlayoutArtworkJT>(
      $salesOrderSingleNutzenlayoutArtworkJT,
      columns: [SalesOrderSingleNutzenlayoutArtworkJT.t.artworkId],
      transaction: transaction,
    );
  }
}
