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
import '../../../../modules/sales/sales_order/models/sales_order.dart' as _i2;
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart'
    as _i3;

abstract class SalesOrderItemDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  SalesOrderItemDTO._({
    this.id,
    required this.salesOrderId,
    this.salesOrder,
    this.deadline,
    required this.description,
    required this.billableTime,
    required this.customerId,
    required this.status,
    required this.type,
    this.soiTypePrimaryKey,
    this.assignedUserId,
    this.assignedUser,
  });

  factory SalesOrderItemDTO({
    int? id,
    required int salesOrderId,
    _i2.SalesOrderDTO? salesOrder,
    DateTime? deadline,
    required String description,
    required int billableTime,
    required int customerId,
    required String status,
    required String type,
    int? soiTypePrimaryKey,
    int? assignedUserId,
    _i3.LightUserDTO? assignedUser,
  }) = _SalesOrderItemDTOImpl;

  factory SalesOrderItemDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return SalesOrderItemDTO(
      id: jsonSerialization['id'] as int?,
      salesOrderId: jsonSerialization['salesOrderId'] as int,
      salesOrder: jsonSerialization['salesOrder'] == null
          ? null
          : _i2.SalesOrderDTO.fromJson(
              (jsonSerialization['salesOrder'] as Map<String, dynamic>)),
      deadline: jsonSerialization['deadline'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['deadline']),
      description: jsonSerialization['description'] as String,
      billableTime: jsonSerialization['billableTime'] as int,
      customerId: jsonSerialization['customerId'] as int,
      status: jsonSerialization['status'] as String,
      type: jsonSerialization['type'] as String,
      soiTypePrimaryKey: jsonSerialization['soiTypePrimaryKey'] as int?,
      assignedUserId: jsonSerialization['assignedUserId'] as int?,
      assignedUser: jsonSerialization['assignedUser'] == null
          ? null
          : _i3.LightUserDTO.fromJson(
              (jsonSerialization['assignedUser'] as Map<String, dynamic>)),
    );
  }

  static final t = SalesOrderItemDTOTable();

  static const db = SalesOrderItemDTORepository._();

  @override
  int? id;

  int salesOrderId;

  _i2.SalesOrderDTO? salesOrder;

  DateTime? deadline;

  String description;

  int billableTime;

  int customerId;

  String status;

  String type;

  int? soiTypePrimaryKey;

  int? assignedUserId;

  _i3.LightUserDTO? assignedUser;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [SalesOrderItemDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SalesOrderItemDTO copyWith({
    int? id,
    int? salesOrderId,
    _i2.SalesOrderDTO? salesOrder,
    DateTime? deadline,
    String? description,
    int? billableTime,
    int? customerId,
    String? status,
    String? type,
    int? soiTypePrimaryKey,
    int? assignedUserId,
    _i3.LightUserDTO? assignedUser,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'salesOrderId': salesOrderId,
      if (salesOrder != null) 'salesOrder': salesOrder?.toJson(),
      if (deadline != null) 'deadline': deadline?.toJson(),
      'description': description,
      'billableTime': billableTime,
      'customerId': customerId,
      'status': status,
      'type': type,
      if (soiTypePrimaryKey != null) 'soiTypePrimaryKey': soiTypePrimaryKey,
      if (assignedUserId != null) 'assignedUserId': assignedUserId,
      if (assignedUser != null) 'assignedUser': assignedUser?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'salesOrderId': salesOrderId,
      if (salesOrder != null) 'salesOrder': salesOrder?.toJsonForProtocol(),
      if (deadline != null) 'deadline': deadline?.toJson(),
      'description': description,
      'billableTime': billableTime,
      'customerId': customerId,
      'status': status,
      'type': type,
      if (soiTypePrimaryKey != null) 'soiTypePrimaryKey': soiTypePrimaryKey,
      if (assignedUserId != null) 'assignedUserId': assignedUserId,
      if (assignedUser != null)
        'assignedUser': assignedUser?.toJsonForProtocol(),
    };
  }

  static SalesOrderItemDTOInclude include({
    _i2.SalesOrderDTOInclude? salesOrder,
    _i3.LightUserDTOInclude? assignedUser,
  }) {
    return SalesOrderItemDTOInclude._(
      salesOrder: salesOrder,
      assignedUser: assignedUser,
    );
  }

  static SalesOrderItemDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<SalesOrderItemDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SalesOrderItemDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SalesOrderItemDTOTable>? orderByList,
    SalesOrderItemDTOInclude? include,
  }) {
    return SalesOrderItemDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SalesOrderItemDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(SalesOrderItemDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SalesOrderItemDTOImpl extends SalesOrderItemDTO {
  _SalesOrderItemDTOImpl({
    int? id,
    required int salesOrderId,
    _i2.SalesOrderDTO? salesOrder,
    DateTime? deadline,
    required String description,
    required int billableTime,
    required int customerId,
    required String status,
    required String type,
    int? soiTypePrimaryKey,
    int? assignedUserId,
    _i3.LightUserDTO? assignedUser,
  }) : super._(
          id: id,
          salesOrderId: salesOrderId,
          salesOrder: salesOrder,
          deadline: deadline,
          description: description,
          billableTime: billableTime,
          customerId: customerId,
          status: status,
          type: type,
          soiTypePrimaryKey: soiTypePrimaryKey,
          assignedUserId: assignedUserId,
          assignedUser: assignedUser,
        );

  /// Returns a shallow copy of this [SalesOrderItemDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SalesOrderItemDTO copyWith({
    Object? id = _Undefined,
    int? salesOrderId,
    Object? salesOrder = _Undefined,
    Object? deadline = _Undefined,
    String? description,
    int? billableTime,
    int? customerId,
    String? status,
    String? type,
    Object? soiTypePrimaryKey = _Undefined,
    Object? assignedUserId = _Undefined,
    Object? assignedUser = _Undefined,
  }) {
    return SalesOrderItemDTO(
      id: id is int? ? id : this.id,
      salesOrderId: salesOrderId ?? this.salesOrderId,
      salesOrder: salesOrder is _i2.SalesOrderDTO?
          ? salesOrder
          : this.salesOrder?.copyWith(),
      deadline: deadline is DateTime? ? deadline : this.deadline,
      description: description ?? this.description,
      billableTime: billableTime ?? this.billableTime,
      customerId: customerId ?? this.customerId,
      status: status ?? this.status,
      type: type ?? this.type,
      soiTypePrimaryKey: soiTypePrimaryKey is int?
          ? soiTypePrimaryKey
          : this.soiTypePrimaryKey,
      assignedUserId:
          assignedUserId is int? ? assignedUserId : this.assignedUserId,
      assignedUser: assignedUser is _i3.LightUserDTO?
          ? assignedUser
          : this.assignedUser?.copyWith(),
    );
  }
}

class SalesOrderItemDTOTable extends _i1.Table<int?> {
  SalesOrderItemDTOTable({super.tableRelation})
      : super(tableName: 'ed_sales_order_item') {
    salesOrderId = _i1.ColumnInt(
      'salesOrderId',
      this,
    );
    deadline = _i1.ColumnDateTime(
      'deadline',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    billableTime = _i1.ColumnInt(
      'billableTime',
      this,
    );
    customerId = _i1.ColumnInt(
      'customerId',
      this,
    );
    status = _i1.ColumnString(
      'status',
      this,
    );
    type = _i1.ColumnString(
      'type',
      this,
    );
    soiTypePrimaryKey = _i1.ColumnInt(
      'soiTypePrimaryKey',
      this,
    );
    assignedUserId = _i1.ColumnInt(
      'assignedUserId',
      this,
    );
  }

  late final _i1.ColumnInt salesOrderId;

  _i2.SalesOrderDTOTable? _salesOrder;

  late final _i1.ColumnDateTime deadline;

  late final _i1.ColumnString description;

  late final _i1.ColumnInt billableTime;

  late final _i1.ColumnInt customerId;

  late final _i1.ColumnString status;

  late final _i1.ColumnString type;

  late final _i1.ColumnInt soiTypePrimaryKey;

  late final _i1.ColumnInt assignedUserId;

  _i3.LightUserDTOTable? _assignedUser;

  _i2.SalesOrderDTOTable get salesOrder {
    if (_salesOrder != null) return _salesOrder!;
    _salesOrder = _i1.createRelationTable(
      relationFieldName: 'salesOrder',
      field: SalesOrderItemDTO.t.salesOrderId,
      foreignField: _i2.SalesOrderDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.SalesOrderDTOTable(tableRelation: foreignTableRelation),
    );
    return _salesOrder!;
  }

  _i3.LightUserDTOTable get assignedUser {
    if (_assignedUser != null) return _assignedUser!;
    _assignedUser = _i1.createRelationTable(
      relationFieldName: 'assignedUser',
      field: SalesOrderItemDTO.t.assignedUserId,
      foreignField: _i3.LightUserDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.LightUserDTOTable(tableRelation: foreignTableRelation),
    );
    return _assignedUser!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        salesOrderId,
        deadline,
        description,
        billableTime,
        customerId,
        status,
        type,
        soiTypePrimaryKey,
        assignedUserId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'salesOrder') {
      return salesOrder;
    }
    if (relationField == 'assignedUser') {
      return assignedUser;
    }
    return null;
  }
}

class SalesOrderItemDTOInclude extends _i1.IncludeObject {
  SalesOrderItemDTOInclude._({
    _i2.SalesOrderDTOInclude? salesOrder,
    _i3.LightUserDTOInclude? assignedUser,
  }) {
    _salesOrder = salesOrder;
    _assignedUser = assignedUser;
  }

  _i2.SalesOrderDTOInclude? _salesOrder;

  _i3.LightUserDTOInclude? _assignedUser;

  @override
  Map<String, _i1.Include?> get includes => {
        'salesOrder': _salesOrder,
        'assignedUser': _assignedUser,
      };

  @override
  _i1.Table<int?> get table => SalesOrderItemDTO.t;
}

class SalesOrderItemDTOIncludeList extends _i1.IncludeList {
  SalesOrderItemDTOIncludeList._({
    _i1.WhereExpressionBuilder<SalesOrderItemDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(SalesOrderItemDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => SalesOrderItemDTO.t;
}

class SalesOrderItemDTORepository {
  const SalesOrderItemDTORepository._();

  final attachRow = const SalesOrderItemDTOAttachRowRepository._();

  final detachRow = const SalesOrderItemDTODetachRowRepository._();

  /// Returns a list of [SalesOrderItemDTO]s matching the given query parameters.
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
  Future<List<SalesOrderItemDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SalesOrderItemDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SalesOrderItemDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SalesOrderItemDTOTable>? orderByList,
    _i1.Transaction? transaction,
    SalesOrderItemDTOInclude? include,
  }) async {
    return session.db.find<SalesOrderItemDTO>(
      where: where?.call(SalesOrderItemDTO.t),
      orderBy: orderBy?.call(SalesOrderItemDTO.t),
      orderByList: orderByList?.call(SalesOrderItemDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [SalesOrderItemDTO] matching the given query parameters.
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
  Future<SalesOrderItemDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SalesOrderItemDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<SalesOrderItemDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SalesOrderItemDTOTable>? orderByList,
    _i1.Transaction? transaction,
    SalesOrderItemDTOInclude? include,
  }) async {
    return session.db.findFirstRow<SalesOrderItemDTO>(
      where: where?.call(SalesOrderItemDTO.t),
      orderBy: orderBy?.call(SalesOrderItemDTO.t),
      orderByList: orderByList?.call(SalesOrderItemDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [SalesOrderItemDTO] by its [id] or null if no such row exists.
  Future<SalesOrderItemDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    SalesOrderItemDTOInclude? include,
  }) async {
    return session.db.findById<SalesOrderItemDTO>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [SalesOrderItemDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [SalesOrderItemDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<SalesOrderItemDTO>> insert(
    _i1.Session session,
    List<SalesOrderItemDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<SalesOrderItemDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [SalesOrderItemDTO] and returns the inserted row.
  ///
  /// The returned [SalesOrderItemDTO] will have its `id` field set.
  Future<SalesOrderItemDTO> insertRow(
    _i1.Session session,
    SalesOrderItemDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<SalesOrderItemDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [SalesOrderItemDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<SalesOrderItemDTO>> update(
    _i1.Session session,
    List<SalesOrderItemDTO> rows, {
    _i1.ColumnSelections<SalesOrderItemDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<SalesOrderItemDTO>(
      rows,
      columns: columns?.call(SalesOrderItemDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [SalesOrderItemDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<SalesOrderItemDTO> updateRow(
    _i1.Session session,
    SalesOrderItemDTO row, {
    _i1.ColumnSelections<SalesOrderItemDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<SalesOrderItemDTO>(
      row,
      columns: columns?.call(SalesOrderItemDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [SalesOrderItemDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<SalesOrderItemDTO>> delete(
    _i1.Session session,
    List<SalesOrderItemDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<SalesOrderItemDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [SalesOrderItemDTO].
  Future<SalesOrderItemDTO> deleteRow(
    _i1.Session session,
    SalesOrderItemDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<SalesOrderItemDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<SalesOrderItemDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<SalesOrderItemDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<SalesOrderItemDTO>(
      where: where(SalesOrderItemDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SalesOrderItemDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<SalesOrderItemDTO>(
      where: where?.call(SalesOrderItemDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class SalesOrderItemDTOAttachRowRepository {
  const SalesOrderItemDTOAttachRowRepository._();

  /// Creates a relation between the given [SalesOrderItemDTO] and [SalesOrderDTO]
  /// by setting the [SalesOrderItemDTO]'s foreign key `salesOrderId` to refer to the [SalesOrderDTO].
  Future<void> salesOrder(
    _i1.Session session,
    SalesOrderItemDTO salesOrderItemDTO,
    _i2.SalesOrderDTO salesOrder, {
    _i1.Transaction? transaction,
  }) async {
    if (salesOrderItemDTO.id == null) {
      throw ArgumentError.notNull('salesOrderItemDTO.id');
    }
    if (salesOrder.id == null) {
      throw ArgumentError.notNull('salesOrder.id');
    }

    var $salesOrderItemDTO =
        salesOrderItemDTO.copyWith(salesOrderId: salesOrder.id);
    await session.db.updateRow<SalesOrderItemDTO>(
      $salesOrderItemDTO,
      columns: [SalesOrderItemDTO.t.salesOrderId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [SalesOrderItemDTO] and [LightUserDTO]
  /// by setting the [SalesOrderItemDTO]'s foreign key `assignedUserId` to refer to the [LightUserDTO].
  Future<void> assignedUser(
    _i1.Session session,
    SalesOrderItemDTO salesOrderItemDTO,
    _i3.LightUserDTO assignedUser, {
    _i1.Transaction? transaction,
  }) async {
    if (salesOrderItemDTO.id == null) {
      throw ArgumentError.notNull('salesOrderItemDTO.id');
    }
    if (assignedUser.id == null) {
      throw ArgumentError.notNull('assignedUser.id');
    }

    var $salesOrderItemDTO =
        salesOrderItemDTO.copyWith(assignedUserId: assignedUser.id);
    await session.db.updateRow<SalesOrderItemDTO>(
      $salesOrderItemDTO,
      columns: [SalesOrderItemDTO.t.assignedUserId],
      transaction: transaction,
    );
  }
}

class SalesOrderItemDTODetachRowRepository {
  const SalesOrderItemDTODetachRowRepository._();

  /// Detaches the relation between this [SalesOrderItemDTO] and the [LightUserDTO] set in `assignedUser`
  /// by setting the [SalesOrderItemDTO]'s foreign key `assignedUserId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> assignedUser(
    _i1.Session session,
    SalesOrderItemDTO salesorderitemdto, {
    _i1.Transaction? transaction,
  }) async {
    if (salesorderitemdto.id == null) {
      throw ArgumentError.notNull('salesorderitemdto.id');
    }

    var $salesorderitemdto = salesorderitemdto.copyWith(assignedUserId: null);
    await session.db.updateRow<SalesOrderItemDTO>(
      $salesorderitemdto,
      columns: [SalesOrderItemDTO.t.assignedUserId],
      transaction: transaction,
    );
  }
}
