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
import '../../../../modules/prepress/nutzenlayout/models/tables/sales_order_multi_nutzenlayout_dto.dart'
    as _i3;
import '../../../../modules/sales/sales_order/models/sales_order.dart' as _i4;

abstract class DrucklayoutMultiNutzenlayoutJT
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  DrucklayoutMultiNutzenlayoutJT._({
    this.id,
    required this.drucklayoutId,
    this.drucklayout,
    required this.salesOrderMultiNutzenlayoutId,
    this.salesOrderMultiNutzenlayout,
    required this.salesOrderId,
    this.salesOrder,
  });

  factory DrucklayoutMultiNutzenlayoutJT({
    int? id,
    required int drucklayoutId,
    _i2.DrucklayoutDTO? drucklayout,
    required int salesOrderMultiNutzenlayoutId,
    _i3.SalesOrderMultiNutzenlayoutDTO? salesOrderMultiNutzenlayout,
    required int salesOrderId,
    _i4.SalesOrderDTO? salesOrder,
  }) = _DrucklayoutMultiNutzenlayoutJTImpl;

  factory DrucklayoutMultiNutzenlayoutJT.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return DrucklayoutMultiNutzenlayoutJT(
      id: jsonSerialization['id'] as int?,
      drucklayoutId: jsonSerialization['drucklayoutId'] as int,
      drucklayout: jsonSerialization['drucklayout'] == null
          ? null
          : _i2.DrucklayoutDTO.fromJson(
              (jsonSerialization['drucklayout'] as Map<String, dynamic>)),
      salesOrderMultiNutzenlayoutId:
          jsonSerialization['salesOrderMultiNutzenlayoutId'] as int,
      salesOrderMultiNutzenlayout:
          jsonSerialization['salesOrderMultiNutzenlayout'] == null
              ? null
              : _i3.SalesOrderMultiNutzenlayoutDTO.fromJson(
                  (jsonSerialization['salesOrderMultiNutzenlayout']
                      as Map<String, dynamic>)),
      salesOrderId: jsonSerialization['salesOrderId'] as int,
      salesOrder: jsonSerialization['salesOrder'] == null
          ? null
          : _i4.SalesOrderDTO.fromJson(
              (jsonSerialization['salesOrder'] as Map<String, dynamic>)),
    );
  }

  static final t = DrucklayoutMultiNutzenlayoutJTTable();

  static const db = DrucklayoutMultiNutzenlayoutJTRepository._();

  @override
  int? id;

  int drucklayoutId;

  _i2.DrucklayoutDTO? drucklayout;

  int salesOrderMultiNutzenlayoutId;

  _i3.SalesOrderMultiNutzenlayoutDTO? salesOrderMultiNutzenlayout;

  int salesOrderId;

  _i4.SalesOrderDTO? salesOrder;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [DrucklayoutMultiNutzenlayoutJT]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DrucklayoutMultiNutzenlayoutJT copyWith({
    int? id,
    int? drucklayoutId,
    _i2.DrucklayoutDTO? drucklayout,
    int? salesOrderMultiNutzenlayoutId,
    _i3.SalesOrderMultiNutzenlayoutDTO? salesOrderMultiNutzenlayout,
    int? salesOrderId,
    _i4.SalesOrderDTO? salesOrder,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'drucklayoutId': drucklayoutId,
      if (drucklayout != null) 'drucklayout': drucklayout?.toJson(),
      'salesOrderMultiNutzenlayoutId': salesOrderMultiNutzenlayoutId,
      if (salesOrderMultiNutzenlayout != null)
        'salesOrderMultiNutzenlayout': salesOrderMultiNutzenlayout?.toJson(),
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
      'salesOrderMultiNutzenlayoutId': salesOrderMultiNutzenlayoutId,
      if (salesOrderMultiNutzenlayout != null)
        'salesOrderMultiNutzenlayout':
            salesOrderMultiNutzenlayout?.toJsonForProtocol(),
      'salesOrderId': salesOrderId,
      if (salesOrder != null) 'salesOrder': salesOrder?.toJsonForProtocol(),
    };
  }

  static DrucklayoutMultiNutzenlayoutJTInclude include({
    _i2.DrucklayoutDTOInclude? drucklayout,
    _i3.SalesOrderMultiNutzenlayoutDTOInclude? salesOrderMultiNutzenlayout,
    _i4.SalesOrderDTOInclude? salesOrder,
  }) {
    return DrucklayoutMultiNutzenlayoutJTInclude._(
      drucklayout: drucklayout,
      salesOrderMultiNutzenlayout: salesOrderMultiNutzenlayout,
      salesOrder: salesOrder,
    );
  }

  static DrucklayoutMultiNutzenlayoutJTIncludeList includeList({
    _i1.WhereExpressionBuilder<DrucklayoutMultiNutzenlayoutJTTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DrucklayoutMultiNutzenlayoutJTTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DrucklayoutMultiNutzenlayoutJTTable>? orderByList,
    DrucklayoutMultiNutzenlayoutJTInclude? include,
  }) {
    return DrucklayoutMultiNutzenlayoutJTIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DrucklayoutMultiNutzenlayoutJT.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(DrucklayoutMultiNutzenlayoutJT.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DrucklayoutMultiNutzenlayoutJTImpl
    extends DrucklayoutMultiNutzenlayoutJT {
  _DrucklayoutMultiNutzenlayoutJTImpl({
    int? id,
    required int drucklayoutId,
    _i2.DrucklayoutDTO? drucklayout,
    required int salesOrderMultiNutzenlayoutId,
    _i3.SalesOrderMultiNutzenlayoutDTO? salesOrderMultiNutzenlayout,
    required int salesOrderId,
    _i4.SalesOrderDTO? salesOrder,
  }) : super._(
          id: id,
          drucklayoutId: drucklayoutId,
          drucklayout: drucklayout,
          salesOrderMultiNutzenlayoutId: salesOrderMultiNutzenlayoutId,
          salesOrderMultiNutzenlayout: salesOrderMultiNutzenlayout,
          salesOrderId: salesOrderId,
          salesOrder: salesOrder,
        );

  /// Returns a shallow copy of this [DrucklayoutMultiNutzenlayoutJT]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DrucklayoutMultiNutzenlayoutJT copyWith({
    Object? id = _Undefined,
    int? drucklayoutId,
    Object? drucklayout = _Undefined,
    int? salesOrderMultiNutzenlayoutId,
    Object? salesOrderMultiNutzenlayout = _Undefined,
    int? salesOrderId,
    Object? salesOrder = _Undefined,
  }) {
    return DrucklayoutMultiNutzenlayoutJT(
      id: id is int? ? id : this.id,
      drucklayoutId: drucklayoutId ?? this.drucklayoutId,
      drucklayout: drucklayout is _i2.DrucklayoutDTO?
          ? drucklayout
          : this.drucklayout?.copyWith(),
      salesOrderMultiNutzenlayoutId:
          salesOrderMultiNutzenlayoutId ?? this.salesOrderMultiNutzenlayoutId,
      salesOrderMultiNutzenlayout:
          salesOrderMultiNutzenlayout is _i3.SalesOrderMultiNutzenlayoutDTO?
              ? salesOrderMultiNutzenlayout
              : this.salesOrderMultiNutzenlayout?.copyWith(),
      salesOrderId: salesOrderId ?? this.salesOrderId,
      salesOrder: salesOrder is _i4.SalesOrderDTO?
          ? salesOrder
          : this.salesOrder?.copyWith(),
    );
  }
}

class DrucklayoutMultiNutzenlayoutJTTable extends _i1.Table<int?> {
  DrucklayoutMultiNutzenlayoutJTTable({super.tableRelation})
      : super(tableName: 'jt_drucklayout_multi_nutzenlayout') {
    drucklayoutId = _i1.ColumnInt(
      'drucklayoutId',
      this,
    );
    salesOrderMultiNutzenlayoutId = _i1.ColumnInt(
      'salesOrderMultiNutzenlayoutId',
      this,
    );
    salesOrderId = _i1.ColumnInt(
      'salesOrderId',
      this,
    );
  }

  late final _i1.ColumnInt drucklayoutId;

  _i2.DrucklayoutDTOTable? _drucklayout;

  late final _i1.ColumnInt salesOrderMultiNutzenlayoutId;

  _i3.SalesOrderMultiNutzenlayoutDTOTable? _salesOrderMultiNutzenlayout;

  late final _i1.ColumnInt salesOrderId;

  _i4.SalesOrderDTOTable? _salesOrder;

  _i2.DrucklayoutDTOTable get drucklayout {
    if (_drucklayout != null) return _drucklayout!;
    _drucklayout = _i1.createRelationTable(
      relationFieldName: 'drucklayout',
      field: DrucklayoutMultiNutzenlayoutJT.t.drucklayoutId,
      foreignField: _i2.DrucklayoutDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.DrucklayoutDTOTable(tableRelation: foreignTableRelation),
    );
    return _drucklayout!;
  }

  _i3.SalesOrderMultiNutzenlayoutDTOTable get salesOrderMultiNutzenlayout {
    if (_salesOrderMultiNutzenlayout != null)
      return _salesOrderMultiNutzenlayout!;
    _salesOrderMultiNutzenlayout = _i1.createRelationTable(
      relationFieldName: 'salesOrderMultiNutzenlayout',
      field: DrucklayoutMultiNutzenlayoutJT.t.salesOrderMultiNutzenlayoutId,
      foreignField: _i3.SalesOrderMultiNutzenlayoutDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.SalesOrderMultiNutzenlayoutDTOTable(
              tableRelation: foreignTableRelation),
    );
    return _salesOrderMultiNutzenlayout!;
  }

  _i4.SalesOrderDTOTable get salesOrder {
    if (_salesOrder != null) return _salesOrder!;
    _salesOrder = _i1.createRelationTable(
      relationFieldName: 'salesOrder',
      field: DrucklayoutMultiNutzenlayoutJT.t.salesOrderId,
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
        salesOrderMultiNutzenlayoutId,
        salesOrderId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'drucklayout') {
      return drucklayout;
    }
    if (relationField == 'salesOrderMultiNutzenlayout') {
      return salesOrderMultiNutzenlayout;
    }
    if (relationField == 'salesOrder') {
      return salesOrder;
    }
    return null;
  }
}

class DrucklayoutMultiNutzenlayoutJTInclude extends _i1.IncludeObject {
  DrucklayoutMultiNutzenlayoutJTInclude._({
    _i2.DrucklayoutDTOInclude? drucklayout,
    _i3.SalesOrderMultiNutzenlayoutDTOInclude? salesOrderMultiNutzenlayout,
    _i4.SalesOrderDTOInclude? salesOrder,
  }) {
    _drucklayout = drucklayout;
    _salesOrderMultiNutzenlayout = salesOrderMultiNutzenlayout;
    _salesOrder = salesOrder;
  }

  _i2.DrucklayoutDTOInclude? _drucklayout;

  _i3.SalesOrderMultiNutzenlayoutDTOInclude? _salesOrderMultiNutzenlayout;

  _i4.SalesOrderDTOInclude? _salesOrder;

  @override
  Map<String, _i1.Include?> get includes => {
        'drucklayout': _drucklayout,
        'salesOrderMultiNutzenlayout': _salesOrderMultiNutzenlayout,
        'salesOrder': _salesOrder,
      };

  @override
  _i1.Table<int?> get table => DrucklayoutMultiNutzenlayoutJT.t;
}

class DrucklayoutMultiNutzenlayoutJTIncludeList extends _i1.IncludeList {
  DrucklayoutMultiNutzenlayoutJTIncludeList._({
    _i1.WhereExpressionBuilder<DrucklayoutMultiNutzenlayoutJTTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(DrucklayoutMultiNutzenlayoutJT.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => DrucklayoutMultiNutzenlayoutJT.t;
}

class DrucklayoutMultiNutzenlayoutJTRepository {
  const DrucklayoutMultiNutzenlayoutJTRepository._();

  final attachRow = const DrucklayoutMultiNutzenlayoutJTAttachRowRepository._();

  /// Returns a list of [DrucklayoutMultiNutzenlayoutJT]s matching the given query parameters.
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
  Future<List<DrucklayoutMultiNutzenlayoutJT>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DrucklayoutMultiNutzenlayoutJTTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DrucklayoutMultiNutzenlayoutJTTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DrucklayoutMultiNutzenlayoutJTTable>? orderByList,
    _i1.Transaction? transaction,
    DrucklayoutMultiNutzenlayoutJTInclude? include,
  }) async {
    return session.db.find<DrucklayoutMultiNutzenlayoutJT>(
      where: where?.call(DrucklayoutMultiNutzenlayoutJT.t),
      orderBy: orderBy?.call(DrucklayoutMultiNutzenlayoutJT.t),
      orderByList: orderByList?.call(DrucklayoutMultiNutzenlayoutJT.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [DrucklayoutMultiNutzenlayoutJT] matching the given query parameters.
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
  Future<DrucklayoutMultiNutzenlayoutJT?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DrucklayoutMultiNutzenlayoutJTTable>? where,
    int? offset,
    _i1.OrderByBuilder<DrucklayoutMultiNutzenlayoutJTTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DrucklayoutMultiNutzenlayoutJTTable>? orderByList,
    _i1.Transaction? transaction,
    DrucklayoutMultiNutzenlayoutJTInclude? include,
  }) async {
    return session.db.findFirstRow<DrucklayoutMultiNutzenlayoutJT>(
      where: where?.call(DrucklayoutMultiNutzenlayoutJT.t),
      orderBy: orderBy?.call(DrucklayoutMultiNutzenlayoutJT.t),
      orderByList: orderByList?.call(DrucklayoutMultiNutzenlayoutJT.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [DrucklayoutMultiNutzenlayoutJT] by its [id] or null if no such row exists.
  Future<DrucklayoutMultiNutzenlayoutJT?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    DrucklayoutMultiNutzenlayoutJTInclude? include,
  }) async {
    return session.db.findById<DrucklayoutMultiNutzenlayoutJT>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [DrucklayoutMultiNutzenlayoutJT]s in the list and returns the inserted rows.
  ///
  /// The returned [DrucklayoutMultiNutzenlayoutJT]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<DrucklayoutMultiNutzenlayoutJT>> insert(
    _i1.Session session,
    List<DrucklayoutMultiNutzenlayoutJT> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<DrucklayoutMultiNutzenlayoutJT>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [DrucklayoutMultiNutzenlayoutJT] and returns the inserted row.
  ///
  /// The returned [DrucklayoutMultiNutzenlayoutJT] will have its `id` field set.
  Future<DrucklayoutMultiNutzenlayoutJT> insertRow(
    _i1.Session session,
    DrucklayoutMultiNutzenlayoutJT row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<DrucklayoutMultiNutzenlayoutJT>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [DrucklayoutMultiNutzenlayoutJT]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<DrucklayoutMultiNutzenlayoutJT>> update(
    _i1.Session session,
    List<DrucklayoutMultiNutzenlayoutJT> rows, {
    _i1.ColumnSelections<DrucklayoutMultiNutzenlayoutJTTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<DrucklayoutMultiNutzenlayoutJT>(
      rows,
      columns: columns?.call(DrucklayoutMultiNutzenlayoutJT.t),
      transaction: transaction,
    );
  }

  /// Updates a single [DrucklayoutMultiNutzenlayoutJT]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<DrucklayoutMultiNutzenlayoutJT> updateRow(
    _i1.Session session,
    DrucklayoutMultiNutzenlayoutJT row, {
    _i1.ColumnSelections<DrucklayoutMultiNutzenlayoutJTTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<DrucklayoutMultiNutzenlayoutJT>(
      row,
      columns: columns?.call(DrucklayoutMultiNutzenlayoutJT.t),
      transaction: transaction,
    );
  }

  /// Deletes all [DrucklayoutMultiNutzenlayoutJT]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<DrucklayoutMultiNutzenlayoutJT>> delete(
    _i1.Session session,
    List<DrucklayoutMultiNutzenlayoutJT> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<DrucklayoutMultiNutzenlayoutJT>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [DrucklayoutMultiNutzenlayoutJT].
  Future<DrucklayoutMultiNutzenlayoutJT> deleteRow(
    _i1.Session session,
    DrucklayoutMultiNutzenlayoutJT row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<DrucklayoutMultiNutzenlayoutJT>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<DrucklayoutMultiNutzenlayoutJT>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<DrucklayoutMultiNutzenlayoutJTTable>
        where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<DrucklayoutMultiNutzenlayoutJT>(
      where: where(DrucklayoutMultiNutzenlayoutJT.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DrucklayoutMultiNutzenlayoutJTTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<DrucklayoutMultiNutzenlayoutJT>(
      where: where?.call(DrucklayoutMultiNutzenlayoutJT.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class DrucklayoutMultiNutzenlayoutJTAttachRowRepository {
  const DrucklayoutMultiNutzenlayoutJTAttachRowRepository._();

  /// Creates a relation between the given [DrucklayoutMultiNutzenlayoutJT] and [DrucklayoutDTO]
  /// by setting the [DrucklayoutMultiNutzenlayoutJT]'s foreign key `drucklayoutId` to refer to the [DrucklayoutDTO].
  Future<void> drucklayout(
    _i1.Session session,
    DrucklayoutMultiNutzenlayoutJT drucklayoutMultiNutzenlayoutJT,
    _i2.DrucklayoutDTO drucklayout, {
    _i1.Transaction? transaction,
  }) async {
    if (drucklayoutMultiNutzenlayoutJT.id == null) {
      throw ArgumentError.notNull('drucklayoutMultiNutzenlayoutJT.id');
    }
    if (drucklayout.id == null) {
      throw ArgumentError.notNull('drucklayout.id');
    }

    var $drucklayoutMultiNutzenlayoutJT =
        drucklayoutMultiNutzenlayoutJT.copyWith(drucklayoutId: drucklayout.id);
    await session.db.updateRow<DrucklayoutMultiNutzenlayoutJT>(
      $drucklayoutMultiNutzenlayoutJT,
      columns: [DrucklayoutMultiNutzenlayoutJT.t.drucklayoutId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [DrucklayoutMultiNutzenlayoutJT] and [SalesOrderMultiNutzenlayoutDTO]
  /// by setting the [DrucklayoutMultiNutzenlayoutJT]'s foreign key `salesOrderMultiNutzenlayoutId` to refer to the [SalesOrderMultiNutzenlayoutDTO].
  Future<void> salesOrderMultiNutzenlayout(
    _i1.Session session,
    DrucklayoutMultiNutzenlayoutJT drucklayoutMultiNutzenlayoutJT,
    _i3.SalesOrderMultiNutzenlayoutDTO salesOrderMultiNutzenlayout, {
    _i1.Transaction? transaction,
  }) async {
    if (drucklayoutMultiNutzenlayoutJT.id == null) {
      throw ArgumentError.notNull('drucklayoutMultiNutzenlayoutJT.id');
    }
    if (salesOrderMultiNutzenlayout.id == null) {
      throw ArgumentError.notNull('salesOrderMultiNutzenlayout.id');
    }

    var $drucklayoutMultiNutzenlayoutJT =
        drucklayoutMultiNutzenlayoutJT.copyWith(
            salesOrderMultiNutzenlayoutId: salesOrderMultiNutzenlayout.id);
    await session.db.updateRow<DrucklayoutMultiNutzenlayoutJT>(
      $drucklayoutMultiNutzenlayoutJT,
      columns: [DrucklayoutMultiNutzenlayoutJT.t.salesOrderMultiNutzenlayoutId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [DrucklayoutMultiNutzenlayoutJT] and [SalesOrderDTO]
  /// by setting the [DrucklayoutMultiNutzenlayoutJT]'s foreign key `salesOrderId` to refer to the [SalesOrderDTO].
  Future<void> salesOrder(
    _i1.Session session,
    DrucklayoutMultiNutzenlayoutJT drucklayoutMultiNutzenlayoutJT,
    _i4.SalesOrderDTO salesOrder, {
    _i1.Transaction? transaction,
  }) async {
    if (drucklayoutMultiNutzenlayoutJT.id == null) {
      throw ArgumentError.notNull('drucklayoutMultiNutzenlayoutJT.id');
    }
    if (salesOrder.id == null) {
      throw ArgumentError.notNull('salesOrder.id');
    }

    var $drucklayoutMultiNutzenlayoutJT =
        drucklayoutMultiNutzenlayoutJT.copyWith(salesOrderId: salesOrder.id);
    await session.db.updateRow<DrucklayoutMultiNutzenlayoutJT>(
      $drucklayoutMultiNutzenlayoutJT,
      columns: [DrucklayoutMultiNutzenlayoutJT.t.salesOrderId],
      transaction: transaction,
    );
  }
}
