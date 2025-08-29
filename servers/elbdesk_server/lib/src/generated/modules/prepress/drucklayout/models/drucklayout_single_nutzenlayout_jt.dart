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
import '../../../../modules/prepress/nutzenlayout/models/tables/sales_order_single_nutzenlayout_dto.dart'
    as _i3;
import '../../../../modules/sales/sales_order/models/sales_order.dart' as _i4;

abstract class DrucklayoutSingleNutzenlayoutJT
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  DrucklayoutSingleNutzenlayoutJT._({
    this.id,
    required this.drucklayoutId,
    this.drucklayout,
    required this.salesOrderSingleNutzenlayoutId,
    this.salesOrderSingleNutzenlayout,
    required this.salesOrderId,
    this.salesOrder,
  });

  factory DrucklayoutSingleNutzenlayoutJT({
    int? id,
    required int drucklayoutId,
    _i2.DrucklayoutDTO? drucklayout,
    required int salesOrderSingleNutzenlayoutId,
    _i3.SalesOrderSingleNutzenlayoutDTO? salesOrderSingleNutzenlayout,
    required int salesOrderId,
    _i4.SalesOrderDTO? salesOrder,
  }) = _DrucklayoutSingleNutzenlayoutJTImpl;

  factory DrucklayoutSingleNutzenlayoutJT.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return DrucklayoutSingleNutzenlayoutJT(
      id: jsonSerialization['id'] as int?,
      drucklayoutId: jsonSerialization['drucklayoutId'] as int,
      drucklayout: jsonSerialization['drucklayout'] == null
          ? null
          : _i2.DrucklayoutDTO.fromJson(
              (jsonSerialization['drucklayout'] as Map<String, dynamic>)),
      salesOrderSingleNutzenlayoutId:
          jsonSerialization['salesOrderSingleNutzenlayoutId'] as int,
      salesOrderSingleNutzenlayout:
          jsonSerialization['salesOrderSingleNutzenlayout'] == null
              ? null
              : _i3.SalesOrderSingleNutzenlayoutDTO.fromJson(
                  (jsonSerialization['salesOrderSingleNutzenlayout']
                      as Map<String, dynamic>)),
      salesOrderId: jsonSerialization['salesOrderId'] as int,
      salesOrder: jsonSerialization['salesOrder'] == null
          ? null
          : _i4.SalesOrderDTO.fromJson(
              (jsonSerialization['salesOrder'] as Map<String, dynamic>)),
    );
  }

  static final t = DrucklayoutSingleNutzenlayoutJTTable();

  static const db = DrucklayoutSingleNutzenlayoutJTRepository._();

  @override
  int? id;

  int drucklayoutId;

  _i2.DrucklayoutDTO? drucklayout;

  int salesOrderSingleNutzenlayoutId;

  _i3.SalesOrderSingleNutzenlayoutDTO? salesOrderSingleNutzenlayout;

  int salesOrderId;

  _i4.SalesOrderDTO? salesOrder;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [DrucklayoutSingleNutzenlayoutJT]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DrucklayoutSingleNutzenlayoutJT copyWith({
    int? id,
    int? drucklayoutId,
    _i2.DrucklayoutDTO? drucklayout,
    int? salesOrderSingleNutzenlayoutId,
    _i3.SalesOrderSingleNutzenlayoutDTO? salesOrderSingleNutzenlayout,
    int? salesOrderId,
    _i4.SalesOrderDTO? salesOrder,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'drucklayoutId': drucklayoutId,
      if (drucklayout != null) 'drucklayout': drucklayout?.toJson(),
      'salesOrderSingleNutzenlayoutId': salesOrderSingleNutzenlayoutId,
      if (salesOrderSingleNutzenlayout != null)
        'salesOrderSingleNutzenlayout': salesOrderSingleNutzenlayout?.toJson(),
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
      'salesOrderSingleNutzenlayoutId': salesOrderSingleNutzenlayoutId,
      if (salesOrderSingleNutzenlayout != null)
        'salesOrderSingleNutzenlayout':
            salesOrderSingleNutzenlayout?.toJsonForProtocol(),
      'salesOrderId': salesOrderId,
      if (salesOrder != null) 'salesOrder': salesOrder?.toJsonForProtocol(),
    };
  }

  static DrucklayoutSingleNutzenlayoutJTInclude include({
    _i2.DrucklayoutDTOInclude? drucklayout,
    _i3.SalesOrderSingleNutzenlayoutDTOInclude? salesOrderSingleNutzenlayout,
    _i4.SalesOrderDTOInclude? salesOrder,
  }) {
    return DrucklayoutSingleNutzenlayoutJTInclude._(
      drucklayout: drucklayout,
      salesOrderSingleNutzenlayout: salesOrderSingleNutzenlayout,
      salesOrder: salesOrder,
    );
  }

  static DrucklayoutSingleNutzenlayoutJTIncludeList includeList({
    _i1.WhereExpressionBuilder<DrucklayoutSingleNutzenlayoutJTTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DrucklayoutSingleNutzenlayoutJTTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DrucklayoutSingleNutzenlayoutJTTable>? orderByList,
    DrucklayoutSingleNutzenlayoutJTInclude? include,
  }) {
    return DrucklayoutSingleNutzenlayoutJTIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DrucklayoutSingleNutzenlayoutJT.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(DrucklayoutSingleNutzenlayoutJT.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DrucklayoutSingleNutzenlayoutJTImpl
    extends DrucklayoutSingleNutzenlayoutJT {
  _DrucklayoutSingleNutzenlayoutJTImpl({
    int? id,
    required int drucklayoutId,
    _i2.DrucklayoutDTO? drucklayout,
    required int salesOrderSingleNutzenlayoutId,
    _i3.SalesOrderSingleNutzenlayoutDTO? salesOrderSingleNutzenlayout,
    required int salesOrderId,
    _i4.SalesOrderDTO? salesOrder,
  }) : super._(
          id: id,
          drucklayoutId: drucklayoutId,
          drucklayout: drucklayout,
          salesOrderSingleNutzenlayoutId: salesOrderSingleNutzenlayoutId,
          salesOrderSingleNutzenlayout: salesOrderSingleNutzenlayout,
          salesOrderId: salesOrderId,
          salesOrder: salesOrder,
        );

  /// Returns a shallow copy of this [DrucklayoutSingleNutzenlayoutJT]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DrucklayoutSingleNutzenlayoutJT copyWith({
    Object? id = _Undefined,
    int? drucklayoutId,
    Object? drucklayout = _Undefined,
    int? salesOrderSingleNutzenlayoutId,
    Object? salesOrderSingleNutzenlayout = _Undefined,
    int? salesOrderId,
    Object? salesOrder = _Undefined,
  }) {
    return DrucklayoutSingleNutzenlayoutJT(
      id: id is int? ? id : this.id,
      drucklayoutId: drucklayoutId ?? this.drucklayoutId,
      drucklayout: drucklayout is _i2.DrucklayoutDTO?
          ? drucklayout
          : this.drucklayout?.copyWith(),
      salesOrderSingleNutzenlayoutId:
          salesOrderSingleNutzenlayoutId ?? this.salesOrderSingleNutzenlayoutId,
      salesOrderSingleNutzenlayout:
          salesOrderSingleNutzenlayout is _i3.SalesOrderSingleNutzenlayoutDTO?
              ? salesOrderSingleNutzenlayout
              : this.salesOrderSingleNutzenlayout?.copyWith(),
      salesOrderId: salesOrderId ?? this.salesOrderId,
      salesOrder: salesOrder is _i4.SalesOrderDTO?
          ? salesOrder
          : this.salesOrder?.copyWith(),
    );
  }
}

class DrucklayoutSingleNutzenlayoutJTTable extends _i1.Table<int?> {
  DrucklayoutSingleNutzenlayoutJTTable({super.tableRelation})
      : super(tableName: 'jt_drucklayout_single_nutzenlayout') {
    drucklayoutId = _i1.ColumnInt(
      'drucklayoutId',
      this,
    );
    salesOrderSingleNutzenlayoutId = _i1.ColumnInt(
      'salesOrderSingleNutzenlayoutId',
      this,
    );
    salesOrderId = _i1.ColumnInt(
      'salesOrderId',
      this,
    );
  }

  late final _i1.ColumnInt drucklayoutId;

  _i2.DrucklayoutDTOTable? _drucklayout;

  late final _i1.ColumnInt salesOrderSingleNutzenlayoutId;

  _i3.SalesOrderSingleNutzenlayoutDTOTable? _salesOrderSingleNutzenlayout;

  late final _i1.ColumnInt salesOrderId;

  _i4.SalesOrderDTOTable? _salesOrder;

  _i2.DrucklayoutDTOTable get drucklayout {
    if (_drucklayout != null) return _drucklayout!;
    _drucklayout = _i1.createRelationTable(
      relationFieldName: 'drucklayout',
      field: DrucklayoutSingleNutzenlayoutJT.t.drucklayoutId,
      foreignField: _i2.DrucklayoutDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.DrucklayoutDTOTable(tableRelation: foreignTableRelation),
    );
    return _drucklayout!;
  }

  _i3.SalesOrderSingleNutzenlayoutDTOTable get salesOrderSingleNutzenlayout {
    if (_salesOrderSingleNutzenlayout != null)
      return _salesOrderSingleNutzenlayout!;
    _salesOrderSingleNutzenlayout = _i1.createRelationTable(
      relationFieldName: 'salesOrderSingleNutzenlayout',
      field: DrucklayoutSingleNutzenlayoutJT.t.salesOrderSingleNutzenlayoutId,
      foreignField: _i3.SalesOrderSingleNutzenlayoutDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.SalesOrderSingleNutzenlayoutDTOTable(
              tableRelation: foreignTableRelation),
    );
    return _salesOrderSingleNutzenlayout!;
  }

  _i4.SalesOrderDTOTable get salesOrder {
    if (_salesOrder != null) return _salesOrder!;
    _salesOrder = _i1.createRelationTable(
      relationFieldName: 'salesOrder',
      field: DrucklayoutSingleNutzenlayoutJT.t.salesOrderId,
      foreignField: _i4.SalesOrderDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.SalesOrderDTOTable(tableRelation: foreignTableRelation),
    );
    return _salesOrder!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        drucklayoutId,
        salesOrderSingleNutzenlayoutId,
        salesOrderId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'drucklayout') {
      return drucklayout;
    }
    if (relationField == 'salesOrderSingleNutzenlayout') {
      return salesOrderSingleNutzenlayout;
    }
    if (relationField == 'salesOrder') {
      return salesOrder;
    }
    return null;
  }
}

class DrucklayoutSingleNutzenlayoutJTInclude extends _i1.IncludeObject {
  DrucklayoutSingleNutzenlayoutJTInclude._({
    _i2.DrucklayoutDTOInclude? drucklayout,
    _i3.SalesOrderSingleNutzenlayoutDTOInclude? salesOrderSingleNutzenlayout,
    _i4.SalesOrderDTOInclude? salesOrder,
  }) {
    _drucklayout = drucklayout;
    _salesOrderSingleNutzenlayout = salesOrderSingleNutzenlayout;
    _salesOrder = salesOrder;
  }

  _i2.DrucklayoutDTOInclude? _drucklayout;

  _i3.SalesOrderSingleNutzenlayoutDTOInclude? _salesOrderSingleNutzenlayout;

  _i4.SalesOrderDTOInclude? _salesOrder;

  @override
  Map<String, _i1.Include?> get includes => {
        'drucklayout': _drucklayout,
        'salesOrderSingleNutzenlayout': _salesOrderSingleNutzenlayout,
        'salesOrder': _salesOrder,
      };

  @override
  _i1.Table<int?> get table => DrucklayoutSingleNutzenlayoutJT.t;
}

class DrucklayoutSingleNutzenlayoutJTIncludeList extends _i1.IncludeList {
  DrucklayoutSingleNutzenlayoutJTIncludeList._({
    _i1.WhereExpressionBuilder<DrucklayoutSingleNutzenlayoutJTTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(DrucklayoutSingleNutzenlayoutJT.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => DrucklayoutSingleNutzenlayoutJT.t;
}

class DrucklayoutSingleNutzenlayoutJTRepository {
  const DrucklayoutSingleNutzenlayoutJTRepository._();

  final attachRow =
      const DrucklayoutSingleNutzenlayoutJTAttachRowRepository._();

  /// Returns a list of [DrucklayoutSingleNutzenlayoutJT]s matching the given query parameters.
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
  Future<List<DrucklayoutSingleNutzenlayoutJT>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DrucklayoutSingleNutzenlayoutJTTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DrucklayoutSingleNutzenlayoutJTTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DrucklayoutSingleNutzenlayoutJTTable>? orderByList,
    _i1.Transaction? transaction,
    DrucklayoutSingleNutzenlayoutJTInclude? include,
  }) async {
    return session.db.find<DrucklayoutSingleNutzenlayoutJT>(
      where: where?.call(DrucklayoutSingleNutzenlayoutJT.t),
      orderBy: orderBy?.call(DrucklayoutSingleNutzenlayoutJT.t),
      orderByList: orderByList?.call(DrucklayoutSingleNutzenlayoutJT.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [DrucklayoutSingleNutzenlayoutJT] matching the given query parameters.
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
  Future<DrucklayoutSingleNutzenlayoutJT?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DrucklayoutSingleNutzenlayoutJTTable>? where,
    int? offset,
    _i1.OrderByBuilder<DrucklayoutSingleNutzenlayoutJTTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DrucklayoutSingleNutzenlayoutJTTable>? orderByList,
    _i1.Transaction? transaction,
    DrucklayoutSingleNutzenlayoutJTInclude? include,
  }) async {
    return session.db.findFirstRow<DrucklayoutSingleNutzenlayoutJT>(
      where: where?.call(DrucklayoutSingleNutzenlayoutJT.t),
      orderBy: orderBy?.call(DrucklayoutSingleNutzenlayoutJT.t),
      orderByList: orderByList?.call(DrucklayoutSingleNutzenlayoutJT.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [DrucklayoutSingleNutzenlayoutJT] by its [id] or null if no such row exists.
  Future<DrucklayoutSingleNutzenlayoutJT?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    DrucklayoutSingleNutzenlayoutJTInclude? include,
  }) async {
    return session.db.findById<DrucklayoutSingleNutzenlayoutJT>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [DrucklayoutSingleNutzenlayoutJT]s in the list and returns the inserted rows.
  ///
  /// The returned [DrucklayoutSingleNutzenlayoutJT]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<DrucklayoutSingleNutzenlayoutJT>> insert(
    _i1.Session session,
    List<DrucklayoutSingleNutzenlayoutJT> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<DrucklayoutSingleNutzenlayoutJT>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [DrucklayoutSingleNutzenlayoutJT] and returns the inserted row.
  ///
  /// The returned [DrucklayoutSingleNutzenlayoutJT] will have its `id` field set.
  Future<DrucklayoutSingleNutzenlayoutJT> insertRow(
    _i1.Session session,
    DrucklayoutSingleNutzenlayoutJT row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<DrucklayoutSingleNutzenlayoutJT>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [DrucklayoutSingleNutzenlayoutJT]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<DrucklayoutSingleNutzenlayoutJT>> update(
    _i1.Session session,
    List<DrucklayoutSingleNutzenlayoutJT> rows, {
    _i1.ColumnSelections<DrucklayoutSingleNutzenlayoutJTTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<DrucklayoutSingleNutzenlayoutJT>(
      rows,
      columns: columns?.call(DrucklayoutSingleNutzenlayoutJT.t),
      transaction: transaction,
    );
  }

  /// Updates a single [DrucklayoutSingleNutzenlayoutJT]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<DrucklayoutSingleNutzenlayoutJT> updateRow(
    _i1.Session session,
    DrucklayoutSingleNutzenlayoutJT row, {
    _i1.ColumnSelections<DrucklayoutSingleNutzenlayoutJTTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<DrucklayoutSingleNutzenlayoutJT>(
      row,
      columns: columns?.call(DrucklayoutSingleNutzenlayoutJT.t),
      transaction: transaction,
    );
  }

  /// Deletes all [DrucklayoutSingleNutzenlayoutJT]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<DrucklayoutSingleNutzenlayoutJT>> delete(
    _i1.Session session,
    List<DrucklayoutSingleNutzenlayoutJT> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<DrucklayoutSingleNutzenlayoutJT>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [DrucklayoutSingleNutzenlayoutJT].
  Future<DrucklayoutSingleNutzenlayoutJT> deleteRow(
    _i1.Session session,
    DrucklayoutSingleNutzenlayoutJT row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<DrucklayoutSingleNutzenlayoutJT>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<DrucklayoutSingleNutzenlayoutJT>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<DrucklayoutSingleNutzenlayoutJTTable>
        where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<DrucklayoutSingleNutzenlayoutJT>(
      where: where(DrucklayoutSingleNutzenlayoutJT.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DrucklayoutSingleNutzenlayoutJTTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<DrucklayoutSingleNutzenlayoutJT>(
      where: where?.call(DrucklayoutSingleNutzenlayoutJT.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class DrucklayoutSingleNutzenlayoutJTAttachRowRepository {
  const DrucklayoutSingleNutzenlayoutJTAttachRowRepository._();

  /// Creates a relation between the given [DrucklayoutSingleNutzenlayoutJT] and [DrucklayoutDTO]
  /// by setting the [DrucklayoutSingleNutzenlayoutJT]'s foreign key `drucklayoutId` to refer to the [DrucklayoutDTO].
  Future<void> drucklayout(
    _i1.Session session,
    DrucklayoutSingleNutzenlayoutJT drucklayoutSingleNutzenlayoutJT,
    _i2.DrucklayoutDTO drucklayout, {
    _i1.Transaction? transaction,
  }) async {
    if (drucklayoutSingleNutzenlayoutJT.id == null) {
      throw ArgumentError.notNull('drucklayoutSingleNutzenlayoutJT.id');
    }
    if (drucklayout.id == null) {
      throw ArgumentError.notNull('drucklayout.id');
    }

    var $drucklayoutSingleNutzenlayoutJT =
        drucklayoutSingleNutzenlayoutJT.copyWith(drucklayoutId: drucklayout.id);
    await session.db.updateRow<DrucklayoutSingleNutzenlayoutJT>(
      $drucklayoutSingleNutzenlayoutJT,
      columns: [DrucklayoutSingleNutzenlayoutJT.t.drucklayoutId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [DrucklayoutSingleNutzenlayoutJT] and [SalesOrderSingleNutzenlayoutDTO]
  /// by setting the [DrucklayoutSingleNutzenlayoutJT]'s foreign key `salesOrderSingleNutzenlayoutId` to refer to the [SalesOrderSingleNutzenlayoutDTO].
  Future<void> salesOrderSingleNutzenlayout(
    _i1.Session session,
    DrucklayoutSingleNutzenlayoutJT drucklayoutSingleNutzenlayoutJT,
    _i3.SalesOrderSingleNutzenlayoutDTO salesOrderSingleNutzenlayout, {
    _i1.Transaction? transaction,
  }) async {
    if (drucklayoutSingleNutzenlayoutJT.id == null) {
      throw ArgumentError.notNull('drucklayoutSingleNutzenlayoutJT.id');
    }
    if (salesOrderSingleNutzenlayout.id == null) {
      throw ArgumentError.notNull('salesOrderSingleNutzenlayout.id');
    }

    var $drucklayoutSingleNutzenlayoutJT =
        drucklayoutSingleNutzenlayoutJT.copyWith(
            salesOrderSingleNutzenlayoutId: salesOrderSingleNutzenlayout.id);
    await session.db.updateRow<DrucklayoutSingleNutzenlayoutJT>(
      $drucklayoutSingleNutzenlayoutJT,
      columns: [
        DrucklayoutSingleNutzenlayoutJT.t.salesOrderSingleNutzenlayoutId
      ],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [DrucklayoutSingleNutzenlayoutJT] and [SalesOrderDTO]
  /// by setting the [DrucklayoutSingleNutzenlayoutJT]'s foreign key `salesOrderId` to refer to the [SalesOrderDTO].
  Future<void> salesOrder(
    _i1.Session session,
    DrucklayoutSingleNutzenlayoutJT drucklayoutSingleNutzenlayoutJT,
    _i4.SalesOrderDTO salesOrder, {
    _i1.Transaction? transaction,
  }) async {
    if (drucklayoutSingleNutzenlayoutJT.id == null) {
      throw ArgumentError.notNull('drucklayoutSingleNutzenlayoutJT.id');
    }
    if (salesOrder.id == null) {
      throw ArgumentError.notNull('salesOrder.id');
    }

    var $drucklayoutSingleNutzenlayoutJT =
        drucklayoutSingleNutzenlayoutJT.copyWith(salesOrderId: salesOrder.id);
    await session.db.updateRow<DrucklayoutSingleNutzenlayoutJT>(
      $drucklayoutSingleNutzenlayoutJT,
      columns: [DrucklayoutSingleNutzenlayoutJT.t.salesOrderId],
      transaction: transaction,
    );
  }
}
