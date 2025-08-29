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
import '../../../../modules/prepress/drucklayout/models/drucklayout.dart'
    as _i2;
import '../../../../modules/sales/sales_order/models/sales_order.dart' as _i3;

abstract class DrucklayoutSalesOrderJT
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  DrucklayoutSalesOrderJT._({
    this.id,
    required this.drucklayoutId,
    this.drucklayout,
    required this.salesOrderId,
    this.salesOrder,
  });

  factory DrucklayoutSalesOrderJT({
    int? id,
    required int drucklayoutId,
    _i2.DrucklayoutDTO? drucklayout,
    required int salesOrderId,
    _i3.SalesOrderDTO? salesOrder,
  }) = _DrucklayoutSalesOrderJTImpl;

  factory DrucklayoutSalesOrderJT.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return DrucklayoutSalesOrderJT(
      id: jsonSerialization['id'] as int?,
      drucklayoutId: jsonSerialization['drucklayoutId'] as int,
      drucklayout: jsonSerialization['drucklayout'] == null
          ? null
          : _i2.DrucklayoutDTO.fromJson(
              (jsonSerialization['drucklayout'] as Map<String, dynamic>)),
      salesOrderId: jsonSerialization['salesOrderId'] as int,
      salesOrder: jsonSerialization['salesOrder'] == null
          ? null
          : _i3.SalesOrderDTO.fromJson(
              (jsonSerialization['salesOrder'] as Map<String, dynamic>)),
    );
  }

  static final t = DrucklayoutSalesOrderJTTable();

  static const db = DrucklayoutSalesOrderJTRepository._();

  @override
  int? id;

  int drucklayoutId;

  _i2.DrucklayoutDTO? drucklayout;

  int salesOrderId;

  _i3.SalesOrderDTO? salesOrder;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [DrucklayoutSalesOrderJT]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DrucklayoutSalesOrderJT copyWith({
    int? id,
    int? drucklayoutId,
    _i2.DrucklayoutDTO? drucklayout,
    int? salesOrderId,
    _i3.SalesOrderDTO? salesOrder,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'drucklayoutId': drucklayoutId,
      if (drucklayout != null) 'drucklayout': drucklayout?.toJson(),
      'salesOrderId': salesOrderId,
      if (salesOrder != null) 'salesOrder': salesOrder?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'drucklayoutId': drucklayoutId,
      if (drucklayout != null) 'drucklayout': drucklayout?.toJsonForProtocol(),
      'salesOrderId': salesOrderId,
      if (salesOrder != null) 'salesOrder': salesOrder?.toJsonForProtocol(),
    };
  }

  static DrucklayoutSalesOrderJTInclude include({
    _i2.DrucklayoutDTOInclude? drucklayout,
    _i3.SalesOrderDTOInclude? salesOrder,
  }) {
    return DrucklayoutSalesOrderJTInclude._(
      drucklayout: drucklayout,
      salesOrder: salesOrder,
    );
  }

  static DrucklayoutSalesOrderJTIncludeList includeList({
    _i1.WhereExpressionBuilder<DrucklayoutSalesOrderJTTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DrucklayoutSalesOrderJTTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DrucklayoutSalesOrderJTTable>? orderByList,
    DrucklayoutSalesOrderJTInclude? include,
  }) {
    return DrucklayoutSalesOrderJTIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DrucklayoutSalesOrderJT.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(DrucklayoutSalesOrderJT.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DrucklayoutSalesOrderJTImpl extends DrucklayoutSalesOrderJT {
  _DrucklayoutSalesOrderJTImpl({
    int? id,
    required int drucklayoutId,
    _i2.DrucklayoutDTO? drucklayout,
    required int salesOrderId,
    _i3.SalesOrderDTO? salesOrder,
  }) : super._(
          id: id,
          drucklayoutId: drucklayoutId,
          drucklayout: drucklayout,
          salesOrderId: salesOrderId,
          salesOrder: salesOrder,
        );

  /// Returns a shallow copy of this [DrucklayoutSalesOrderJT]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DrucklayoutSalesOrderJT copyWith({
    Object? id = _Undefined,
    int? drucklayoutId,
    Object? drucklayout = _Undefined,
    int? salesOrderId,
    Object? salesOrder = _Undefined,
  }) {
    return DrucklayoutSalesOrderJT(
      id: id is int? ? id : this.id,
      drucklayoutId: drucklayoutId ?? this.drucklayoutId,
      drucklayout: drucklayout is _i2.DrucklayoutDTO?
          ? drucklayout
          : this.drucklayout?.copyWith(),
      salesOrderId: salesOrderId ?? this.salesOrderId,
      salesOrder: salesOrder is _i3.SalesOrderDTO?
          ? salesOrder
          : this.salesOrder?.copyWith(),
    );
  }
}

class DrucklayoutSalesOrderJTTable extends _i1.Table<int?> {
  DrucklayoutSalesOrderJTTable({super.tableRelation})
      : super(tableName: 'jt_drucklayout_sales_order') {
    drucklayoutId = _i1.ColumnInt(
      'drucklayoutId',
      this,
    );
    salesOrderId = _i1.ColumnInt(
      'salesOrderId',
      this,
    );
  }

  late final _i1.ColumnInt drucklayoutId;

  _i2.DrucklayoutDTOTable? _drucklayout;

  late final _i1.ColumnInt salesOrderId;

  _i3.SalesOrderDTOTable? _salesOrder;

  _i2.DrucklayoutDTOTable get drucklayout {
    if (_drucklayout != null) return _drucklayout!;
    _drucklayout = _i1.createRelationTable(
      relationFieldName: 'drucklayout',
      field: DrucklayoutSalesOrderJT.t.drucklayoutId,
      foreignField: _i2.DrucklayoutDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.DrucklayoutDTOTable(tableRelation: foreignTableRelation),
    );
    return _drucklayout!;
  }

  _i3.SalesOrderDTOTable get salesOrder {
    if (_salesOrder != null) return _salesOrder!;
    _salesOrder = _i1.createRelationTable(
      relationFieldName: 'salesOrder',
      field: DrucklayoutSalesOrderJT.t.salesOrderId,
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
        drucklayoutId,
        salesOrderId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'drucklayout') {
      return drucklayout;
    }
    if (relationField == 'salesOrder') {
      return salesOrder;
    }
    return null;
  }
}

class DrucklayoutSalesOrderJTInclude extends _i1.IncludeObject {
  DrucklayoutSalesOrderJTInclude._({
    _i2.DrucklayoutDTOInclude? drucklayout,
    _i3.SalesOrderDTOInclude? salesOrder,
  }) {
    _drucklayout = drucklayout;
    _salesOrder = salesOrder;
  }

  _i2.DrucklayoutDTOInclude? _drucklayout;

  _i3.SalesOrderDTOInclude? _salesOrder;

  @override
  Map<String, _i1.Include?> get includes => {
        'drucklayout': _drucklayout,
        'salesOrder': _salesOrder,
      };

  @override
  _i1.Table<int?> get table => DrucklayoutSalesOrderJT.t;
}

class DrucklayoutSalesOrderJTIncludeList extends _i1.IncludeList {
  DrucklayoutSalesOrderJTIncludeList._({
    _i1.WhereExpressionBuilder<DrucklayoutSalesOrderJTTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(DrucklayoutSalesOrderJT.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => DrucklayoutSalesOrderJT.t;
}

class DrucklayoutSalesOrderJTRepository {
  const DrucklayoutSalesOrderJTRepository._();

  final attachRow = const DrucklayoutSalesOrderJTAttachRowRepository._();

  /// Returns a list of [DrucklayoutSalesOrderJT]s matching the given query parameters.
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
  Future<List<DrucklayoutSalesOrderJT>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DrucklayoutSalesOrderJTTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DrucklayoutSalesOrderJTTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DrucklayoutSalesOrderJTTable>? orderByList,
    _i1.Transaction? transaction,
    DrucklayoutSalesOrderJTInclude? include,
  }) async {
    return session.db.find<DrucklayoutSalesOrderJT>(
      where: where?.call(DrucklayoutSalesOrderJT.t),
      orderBy: orderBy?.call(DrucklayoutSalesOrderJT.t),
      orderByList: orderByList?.call(DrucklayoutSalesOrderJT.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [DrucklayoutSalesOrderJT] matching the given query parameters.
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
  Future<DrucklayoutSalesOrderJT?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DrucklayoutSalesOrderJTTable>? where,
    int? offset,
    _i1.OrderByBuilder<DrucklayoutSalesOrderJTTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DrucklayoutSalesOrderJTTable>? orderByList,
    _i1.Transaction? transaction,
    DrucklayoutSalesOrderJTInclude? include,
  }) async {
    return session.db.findFirstRow<DrucklayoutSalesOrderJT>(
      where: where?.call(DrucklayoutSalesOrderJT.t),
      orderBy: orderBy?.call(DrucklayoutSalesOrderJT.t),
      orderByList: orderByList?.call(DrucklayoutSalesOrderJT.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [DrucklayoutSalesOrderJT] by its [id] or null if no such row exists.
  Future<DrucklayoutSalesOrderJT?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    DrucklayoutSalesOrderJTInclude? include,
  }) async {
    return session.db.findById<DrucklayoutSalesOrderJT>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [DrucklayoutSalesOrderJT]s in the list and returns the inserted rows.
  ///
  /// The returned [DrucklayoutSalesOrderJT]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<DrucklayoutSalesOrderJT>> insert(
    _i1.Session session,
    List<DrucklayoutSalesOrderJT> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<DrucklayoutSalesOrderJT>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [DrucklayoutSalesOrderJT] and returns the inserted row.
  ///
  /// The returned [DrucklayoutSalesOrderJT] will have its `id` field set.
  Future<DrucklayoutSalesOrderJT> insertRow(
    _i1.Session session,
    DrucklayoutSalesOrderJT row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<DrucklayoutSalesOrderJT>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [DrucklayoutSalesOrderJT]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<DrucklayoutSalesOrderJT>> update(
    _i1.Session session,
    List<DrucklayoutSalesOrderJT> rows, {
    _i1.ColumnSelections<DrucklayoutSalesOrderJTTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<DrucklayoutSalesOrderJT>(
      rows,
      columns: columns?.call(DrucklayoutSalesOrderJT.t),
      transaction: transaction,
    );
  }

  /// Updates a single [DrucklayoutSalesOrderJT]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<DrucklayoutSalesOrderJT> updateRow(
    _i1.Session session,
    DrucklayoutSalesOrderJT row, {
    _i1.ColumnSelections<DrucklayoutSalesOrderJTTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<DrucklayoutSalesOrderJT>(
      row,
      columns: columns?.call(DrucklayoutSalesOrderJT.t),
      transaction: transaction,
    );
  }

  /// Deletes all [DrucklayoutSalesOrderJT]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<DrucklayoutSalesOrderJT>> delete(
    _i1.Session session,
    List<DrucklayoutSalesOrderJT> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<DrucklayoutSalesOrderJT>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [DrucklayoutSalesOrderJT].
  Future<DrucklayoutSalesOrderJT> deleteRow(
    _i1.Session session,
    DrucklayoutSalesOrderJT row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<DrucklayoutSalesOrderJT>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<DrucklayoutSalesOrderJT>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<DrucklayoutSalesOrderJTTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<DrucklayoutSalesOrderJT>(
      where: where(DrucklayoutSalesOrderJT.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DrucklayoutSalesOrderJTTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<DrucklayoutSalesOrderJT>(
      where: where?.call(DrucklayoutSalesOrderJT.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class DrucklayoutSalesOrderJTAttachRowRepository {
  const DrucklayoutSalesOrderJTAttachRowRepository._();

  /// Creates a relation between the given [DrucklayoutSalesOrderJT] and [DrucklayoutDTO]
  /// by setting the [DrucklayoutSalesOrderJT]'s foreign key `drucklayoutId` to refer to the [DrucklayoutDTO].
  Future<void> drucklayout(
    _i1.Session session,
    DrucklayoutSalesOrderJT drucklayoutSalesOrderJT,
    _i2.DrucklayoutDTO drucklayout, {
    _i1.Transaction? transaction,
  }) async {
    if (drucklayoutSalesOrderJT.id == null) {
      throw ArgumentError.notNull('drucklayoutSalesOrderJT.id');
    }
    if (drucklayout.id == null) {
      throw ArgumentError.notNull('drucklayout.id');
    }

    var $drucklayoutSalesOrderJT =
        drucklayoutSalesOrderJT.copyWith(drucklayoutId: drucklayout.id);
    await session.db.updateRow<DrucklayoutSalesOrderJT>(
      $drucklayoutSalesOrderJT,
      columns: [DrucklayoutSalesOrderJT.t.drucklayoutId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [DrucklayoutSalesOrderJT] and [SalesOrderDTO]
  /// by setting the [DrucklayoutSalesOrderJT]'s foreign key `salesOrderId` to refer to the [SalesOrderDTO].
  Future<void> salesOrder(
    _i1.Session session,
    DrucklayoutSalesOrderJT drucklayoutSalesOrderJT,
    _i3.SalesOrderDTO salesOrder, {
    _i1.Transaction? transaction,
  }) async {
    if (drucklayoutSalesOrderJT.id == null) {
      throw ArgumentError.notNull('drucklayoutSalesOrderJT.id');
    }
    if (salesOrder.id == null) {
      throw ArgumentError.notNull('salesOrder.id');
    }

    var $drucklayoutSalesOrderJT =
        drucklayoutSalesOrderJT.copyWith(salesOrderId: salesOrder.id);
    await session.db.updateRow<DrucklayoutSalesOrderJT>(
      $drucklayoutSalesOrderJT,
      columns: [DrucklayoutSalesOrderJT.t.salesOrderId],
      transaction: transaction,
    );
  }
}
