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
import '../../../modules/prepress/bearer/models/bearer.dart' as _i2;
import '../../../modules/crm/customer/models/customer.dart' as _i3;

abstract class BearerCustomerRelation
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  BearerCustomerRelation._({
    this.id,
    required this.bearerId,
    this.bearer,
    required this.customerId,
    this.customer,
  });

  factory BearerCustomerRelation({
    int? id,
    required int bearerId,
    _i2.BearerDTO? bearer,
    required int customerId,
    _i3.CustomerDTO? customer,
  }) = _BearerCustomerRelationImpl;

  factory BearerCustomerRelation.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return BearerCustomerRelation(
      id: jsonSerialization['id'] as int?,
      bearerId: jsonSerialization['bearerId'] as int,
      bearer: jsonSerialization['bearer'] == null
          ? null
          : _i2.BearerDTO.fromJson(
              (jsonSerialization['bearer'] as Map<String, dynamic>)),
      customerId: jsonSerialization['customerId'] as int,
      customer: jsonSerialization['customer'] == null
          ? null
          : _i3.CustomerDTO.fromJson(
              (jsonSerialization['customer'] as Map<String, dynamic>)),
    );
  }

  static final t = BearerCustomerRelationTable();

  static const db = BearerCustomerRelationRepository._();

  @override
  int? id;

  int bearerId;

  _i2.BearerDTO? bearer;

  int customerId;

  _i3.CustomerDTO? customer;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [BearerCustomerRelation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  BearerCustomerRelation copyWith({
    int? id,
    int? bearerId,
    _i2.BearerDTO? bearer,
    int? customerId,
    _i3.CustomerDTO? customer,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'bearerId': bearerId,
      if (bearer != null) 'bearer': bearer?.toJson(),
      'customerId': customerId,
      if (customer != null) 'customer': customer?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'bearerId': bearerId,
      if (bearer != null) 'bearer': bearer?.toJsonForProtocol(),
      'customerId': customerId,
      if (customer != null) 'customer': customer?.toJsonForProtocol(),
    };
  }

  static BearerCustomerRelationInclude include({
    _i2.BearerDTOInclude? bearer,
    _i3.CustomerDTOInclude? customer,
  }) {
    return BearerCustomerRelationInclude._(
      bearer: bearer,
      customer: customer,
    );
  }

  static BearerCustomerRelationIncludeList includeList({
    _i1.WhereExpressionBuilder<BearerCustomerRelationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BearerCustomerRelationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BearerCustomerRelationTable>? orderByList,
    BearerCustomerRelationInclude? include,
  }) {
    return BearerCustomerRelationIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(BearerCustomerRelation.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(BearerCustomerRelation.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BearerCustomerRelationImpl extends BearerCustomerRelation {
  _BearerCustomerRelationImpl({
    int? id,
    required int bearerId,
    _i2.BearerDTO? bearer,
    required int customerId,
    _i3.CustomerDTO? customer,
  }) : super._(
          id: id,
          bearerId: bearerId,
          bearer: bearer,
          customerId: customerId,
          customer: customer,
        );

  /// Returns a shallow copy of this [BearerCustomerRelation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  BearerCustomerRelation copyWith({
    Object? id = _Undefined,
    int? bearerId,
    Object? bearer = _Undefined,
    int? customerId,
    Object? customer = _Undefined,
  }) {
    return BearerCustomerRelation(
      id: id is int? ? id : this.id,
      bearerId: bearerId ?? this.bearerId,
      bearer: bearer is _i2.BearerDTO? ? bearer : this.bearer?.copyWith(),
      customerId: customerId ?? this.customerId,
      customer:
          customer is _i3.CustomerDTO? ? customer : this.customer?.copyWith(),
    );
  }
}

class BearerCustomerRelationTable extends _i1.Table<int?> {
  BearerCustomerRelationTable({super.tableRelation})
      : super(tableName: 'prepress_bearer_customer_relation') {
    bearerId = _i1.ColumnInt(
      'bearerId',
      this,
    );
    customerId = _i1.ColumnInt(
      'customerId',
      this,
    );
  }

  late final _i1.ColumnInt bearerId;

  _i2.BearerDTOTable? _bearer;

  late final _i1.ColumnInt customerId;

  _i3.CustomerDTOTable? _customer;

  _i2.BearerDTOTable get bearer {
    if (_bearer != null) return _bearer!;
    _bearer = _i1.createRelationTable(
      relationFieldName: 'bearer',
      field: BearerCustomerRelation.t.bearerId,
      foreignField: _i2.BearerDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.BearerDTOTable(tableRelation: foreignTableRelation),
    );
    return _bearer!;
  }

  _i3.CustomerDTOTable get customer {
    if (_customer != null) return _customer!;
    _customer = _i1.createRelationTable(
      relationFieldName: 'customer',
      field: BearerCustomerRelation.t.customerId,
      foreignField: _i3.CustomerDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.CustomerDTOTable(tableRelation: foreignTableRelation),
    );
    return _customer!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        bearerId,
        customerId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'bearer') {
      return bearer;
    }
    if (relationField == 'customer') {
      return customer;
    }
    return null;
  }
}

class BearerCustomerRelationInclude extends _i1.IncludeObject {
  BearerCustomerRelationInclude._({
    _i2.BearerDTOInclude? bearer,
    _i3.CustomerDTOInclude? customer,
  }) {
    _bearer = bearer;
    _customer = customer;
  }

  _i2.BearerDTOInclude? _bearer;

  _i3.CustomerDTOInclude? _customer;

  @override
  Map<String, _i1.Include?> get includes => {
        'bearer': _bearer,
        'customer': _customer,
      };

  @override
  _i1.Table<int?> get table => BearerCustomerRelation.t;
}

class BearerCustomerRelationIncludeList extends _i1.IncludeList {
  BearerCustomerRelationIncludeList._({
    _i1.WhereExpressionBuilder<BearerCustomerRelationTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(BearerCustomerRelation.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => BearerCustomerRelation.t;
}

class BearerCustomerRelationRepository {
  const BearerCustomerRelationRepository._();

  final attachRow = const BearerCustomerRelationAttachRowRepository._();

  /// Returns a list of [BearerCustomerRelation]s matching the given query parameters.
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
  Future<List<BearerCustomerRelation>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BearerCustomerRelationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BearerCustomerRelationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BearerCustomerRelationTable>? orderByList,
    _i1.Transaction? transaction,
    BearerCustomerRelationInclude? include,
  }) async {
    return session.db.find<BearerCustomerRelation>(
      where: where?.call(BearerCustomerRelation.t),
      orderBy: orderBy?.call(BearerCustomerRelation.t),
      orderByList: orderByList?.call(BearerCustomerRelation.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [BearerCustomerRelation] matching the given query parameters.
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
  Future<BearerCustomerRelation?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BearerCustomerRelationTable>? where,
    int? offset,
    _i1.OrderByBuilder<BearerCustomerRelationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BearerCustomerRelationTable>? orderByList,
    _i1.Transaction? transaction,
    BearerCustomerRelationInclude? include,
  }) async {
    return session.db.findFirstRow<BearerCustomerRelation>(
      where: where?.call(BearerCustomerRelation.t),
      orderBy: orderBy?.call(BearerCustomerRelation.t),
      orderByList: orderByList?.call(BearerCustomerRelation.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [BearerCustomerRelation] by its [id] or null if no such row exists.
  Future<BearerCustomerRelation?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    BearerCustomerRelationInclude? include,
  }) async {
    return session.db.findById<BearerCustomerRelation>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [BearerCustomerRelation]s in the list and returns the inserted rows.
  ///
  /// The returned [BearerCustomerRelation]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<BearerCustomerRelation>> insert(
    _i1.Session session,
    List<BearerCustomerRelation> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<BearerCustomerRelation>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [BearerCustomerRelation] and returns the inserted row.
  ///
  /// The returned [BearerCustomerRelation] will have its `id` field set.
  Future<BearerCustomerRelation> insertRow(
    _i1.Session session,
    BearerCustomerRelation row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<BearerCustomerRelation>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [BearerCustomerRelation]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<BearerCustomerRelation>> update(
    _i1.Session session,
    List<BearerCustomerRelation> rows, {
    _i1.ColumnSelections<BearerCustomerRelationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<BearerCustomerRelation>(
      rows,
      columns: columns?.call(BearerCustomerRelation.t),
      transaction: transaction,
    );
  }

  /// Updates a single [BearerCustomerRelation]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<BearerCustomerRelation> updateRow(
    _i1.Session session,
    BearerCustomerRelation row, {
    _i1.ColumnSelections<BearerCustomerRelationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<BearerCustomerRelation>(
      row,
      columns: columns?.call(BearerCustomerRelation.t),
      transaction: transaction,
    );
  }

  /// Deletes all [BearerCustomerRelation]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<BearerCustomerRelation>> delete(
    _i1.Session session,
    List<BearerCustomerRelation> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<BearerCustomerRelation>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [BearerCustomerRelation].
  Future<BearerCustomerRelation> deleteRow(
    _i1.Session session,
    BearerCustomerRelation row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<BearerCustomerRelation>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<BearerCustomerRelation>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<BearerCustomerRelationTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<BearerCustomerRelation>(
      where: where(BearerCustomerRelation.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BearerCustomerRelationTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<BearerCustomerRelation>(
      where: where?.call(BearerCustomerRelation.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class BearerCustomerRelationAttachRowRepository {
  const BearerCustomerRelationAttachRowRepository._();

  /// Creates a relation between the given [BearerCustomerRelation] and [BearerDTO]
  /// by setting the [BearerCustomerRelation]'s foreign key `bearerId` to refer to the [BearerDTO].
  Future<void> bearer(
    _i1.Session session,
    BearerCustomerRelation bearerCustomerRelation,
    _i2.BearerDTO bearer, {
    _i1.Transaction? transaction,
  }) async {
    if (bearerCustomerRelation.id == null) {
      throw ArgumentError.notNull('bearerCustomerRelation.id');
    }
    if (bearer.id == null) {
      throw ArgumentError.notNull('bearer.id');
    }

    var $bearerCustomerRelation =
        bearerCustomerRelation.copyWith(bearerId: bearer.id);
    await session.db.updateRow<BearerCustomerRelation>(
      $bearerCustomerRelation,
      columns: [BearerCustomerRelation.t.bearerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [BearerCustomerRelation] and [CustomerDTO]
  /// by setting the [BearerCustomerRelation]'s foreign key `customerId` to refer to the [CustomerDTO].
  Future<void> customer(
    _i1.Session session,
    BearerCustomerRelation bearerCustomerRelation,
    _i3.CustomerDTO customer, {
    _i1.Transaction? transaction,
  }) async {
    if (bearerCustomerRelation.id == null) {
      throw ArgumentError.notNull('bearerCustomerRelation.id');
    }
    if (customer.id == null) {
      throw ArgumentError.notNull('customer.id');
    }

    var $bearerCustomerRelation =
        bearerCustomerRelation.copyWith(customerId: customer.id);
    await session.db.updateRow<BearerCustomerRelation>(
      $bearerCustomerRelation,
      columns: [BearerCustomerRelation.t.customerId],
      transaction: transaction,
    );
  }
}
