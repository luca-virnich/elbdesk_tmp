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

abstract class ProductLogDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ProductLogDTO._({
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

  factory ProductLogDTO({
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
  }) = _ProductLogDTOImpl;

  factory ProductLogDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return ProductLogDTO(
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

  static final t = ProductLogDTOTable();

  static const db = ProductLogDTORepository._();

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

  /// Returns a shallow copy of this [ProductLogDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ProductLogDTO copyWith({
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

  static ProductLogDTOInclude include() {
    return ProductLogDTOInclude._();
  }

  static ProductLogDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<ProductLogDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProductLogDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProductLogDTOTable>? orderByList,
    ProductLogDTOInclude? include,
  }) {
    return ProductLogDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ProductLogDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ProductLogDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ProductLogDTOImpl extends ProductLogDTO {
  _ProductLogDTOImpl({
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

  /// Returns a shallow copy of this [ProductLogDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ProductLogDTO copyWith({
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
    return ProductLogDTO(
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

class ProductLogDTOTable extends _i1.Table<int?> {
  ProductLogDTOTable({super.tableRelation})
      : super(tableName: 'ed_prepress_product_log') {
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

class ProductLogDTOInclude extends _i1.IncludeObject {
  ProductLogDTOInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => ProductLogDTO.t;
}

class ProductLogDTOIncludeList extends _i1.IncludeList {
  ProductLogDTOIncludeList._({
    _i1.WhereExpressionBuilder<ProductLogDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ProductLogDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ProductLogDTO.t;
}

class ProductLogDTORepository {
  const ProductLogDTORepository._();

  /// Returns a list of [ProductLogDTO]s matching the given query parameters.
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
  Future<List<ProductLogDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProductLogDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProductLogDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProductLogDTOTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<ProductLogDTO>(
      where: where?.call(ProductLogDTO.t),
      orderBy: orderBy?.call(ProductLogDTO.t),
      orderByList: orderByList?.call(ProductLogDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [ProductLogDTO] matching the given query parameters.
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
  Future<ProductLogDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProductLogDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<ProductLogDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProductLogDTOTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<ProductLogDTO>(
      where: where?.call(ProductLogDTO.t),
      orderBy: orderBy?.call(ProductLogDTO.t),
      orderByList: orderByList?.call(ProductLogDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [ProductLogDTO] by its [id] or null if no such row exists.
  Future<ProductLogDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<ProductLogDTO>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [ProductLogDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [ProductLogDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ProductLogDTO>> insert(
    _i1.Session session,
    List<ProductLogDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ProductLogDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ProductLogDTO] and returns the inserted row.
  ///
  /// The returned [ProductLogDTO] will have its `id` field set.
  Future<ProductLogDTO> insertRow(
    _i1.Session session,
    ProductLogDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ProductLogDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ProductLogDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ProductLogDTO>> update(
    _i1.Session session,
    List<ProductLogDTO> rows, {
    _i1.ColumnSelections<ProductLogDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ProductLogDTO>(
      rows,
      columns: columns?.call(ProductLogDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ProductLogDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ProductLogDTO> updateRow(
    _i1.Session session,
    ProductLogDTO row, {
    _i1.ColumnSelections<ProductLogDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ProductLogDTO>(
      row,
      columns: columns?.call(ProductLogDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [ProductLogDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ProductLogDTO>> delete(
    _i1.Session session,
    List<ProductLogDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ProductLogDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ProductLogDTO].
  Future<ProductLogDTO> deleteRow(
    _i1.Session session,
    ProductLogDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ProductLogDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ProductLogDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ProductLogDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ProductLogDTO>(
      where: where(ProductLogDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProductLogDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ProductLogDTO>(
      where: where?.call(ProductLogDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
