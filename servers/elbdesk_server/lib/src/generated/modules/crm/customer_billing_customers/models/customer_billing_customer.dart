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
import '../../../../modules/crm/customer/models/customer.dart' as _i2;

abstract class CustomerBillingCustomerDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  CustomerBillingCustomerDTO._({
    this.id,
    required this.customerId,
    this.customer,
    required this.billingCustomerId,
    this.billingCustomer,
    required this.isPrimary,
  });

  factory CustomerBillingCustomerDTO({
    int? id,
    required int customerId,
    _i2.CustomerDTO? customer,
    required int billingCustomerId,
    _i2.CustomerDTO? billingCustomer,
    required bool isPrimary,
  }) = _CustomerBillingCustomerDTOImpl;

  factory CustomerBillingCustomerDTO.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return CustomerBillingCustomerDTO(
      id: jsonSerialization['id'] as int?,
      customerId: jsonSerialization['customerId'] as int,
      customer: jsonSerialization['customer'] == null
          ? null
          : _i2.CustomerDTO.fromJson(
              (jsonSerialization['customer'] as Map<String, dynamic>)),
      billingCustomerId: jsonSerialization['billingCustomerId'] as int,
      billingCustomer: jsonSerialization['billingCustomer'] == null
          ? null
          : _i2.CustomerDTO.fromJson(
              (jsonSerialization['billingCustomer'] as Map<String, dynamic>)),
      isPrimary: jsonSerialization['isPrimary'] as bool,
    );
  }

  static final t = CustomerBillingCustomerDTOTable();

  static const db = CustomerBillingCustomerDTORepository._();

  @override
  int? id;

  int customerId;

  _i2.CustomerDTO? customer;

  int billingCustomerId;

  _i2.CustomerDTO? billingCustomer;

  bool isPrimary;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [CustomerBillingCustomerDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CustomerBillingCustomerDTO copyWith({
    int? id,
    int? customerId,
    _i2.CustomerDTO? customer,
    int? billingCustomerId,
    _i2.CustomerDTO? billingCustomer,
    bool? isPrimary,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'customerId': customerId,
      if (customer != null) 'customer': customer?.toJson(),
      'billingCustomerId': billingCustomerId,
      if (billingCustomer != null) 'billingCustomer': billingCustomer?.toJson(),
      'isPrimary': isPrimary,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'customerId': customerId,
      if (customer != null) 'customer': customer?.toJsonForProtocol(),
      'billingCustomerId': billingCustomerId,
      if (billingCustomer != null)
        'billingCustomer': billingCustomer?.toJsonForProtocol(),
      'isPrimary': isPrimary,
    };
  }

  static CustomerBillingCustomerDTOInclude include({
    _i2.CustomerDTOInclude? customer,
    _i2.CustomerDTOInclude? billingCustomer,
  }) {
    return CustomerBillingCustomerDTOInclude._(
      customer: customer,
      billingCustomer: billingCustomer,
    );
  }

  static CustomerBillingCustomerDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<CustomerBillingCustomerDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CustomerBillingCustomerDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CustomerBillingCustomerDTOTable>? orderByList,
    CustomerBillingCustomerDTOInclude? include,
  }) {
    return CustomerBillingCustomerDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CustomerBillingCustomerDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(CustomerBillingCustomerDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CustomerBillingCustomerDTOImpl extends CustomerBillingCustomerDTO {
  _CustomerBillingCustomerDTOImpl({
    int? id,
    required int customerId,
    _i2.CustomerDTO? customer,
    required int billingCustomerId,
    _i2.CustomerDTO? billingCustomer,
    required bool isPrimary,
  }) : super._(
          id: id,
          customerId: customerId,
          customer: customer,
          billingCustomerId: billingCustomerId,
          billingCustomer: billingCustomer,
          isPrimary: isPrimary,
        );

  /// Returns a shallow copy of this [CustomerBillingCustomerDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CustomerBillingCustomerDTO copyWith({
    Object? id = _Undefined,
    int? customerId,
    Object? customer = _Undefined,
    int? billingCustomerId,
    Object? billingCustomer = _Undefined,
    bool? isPrimary,
  }) {
    return CustomerBillingCustomerDTO(
      id: id is int? ? id : this.id,
      customerId: customerId ?? this.customerId,
      customer:
          customer is _i2.CustomerDTO? ? customer : this.customer?.copyWith(),
      billingCustomerId: billingCustomerId ?? this.billingCustomerId,
      billingCustomer: billingCustomer is _i2.CustomerDTO?
          ? billingCustomer
          : this.billingCustomer?.copyWith(),
      isPrimary: isPrimary ?? this.isPrimary,
    );
  }
}

class CustomerBillingCustomerDTOTable extends _i1.Table<int?> {
  CustomerBillingCustomerDTOTable({super.tableRelation})
      : super(tableName: 'ed_crm_customer_billing_customer') {
    customerId = _i1.ColumnInt(
      'customerId',
      this,
    );
    billingCustomerId = _i1.ColumnInt(
      'billingCustomerId',
      this,
    );
    isPrimary = _i1.ColumnBool(
      'isPrimary',
      this,
    );
  }

  late final _i1.ColumnInt customerId;

  _i2.CustomerDTOTable? _customer;

  late final _i1.ColumnInt billingCustomerId;

  _i2.CustomerDTOTable? _billingCustomer;

  late final _i1.ColumnBool isPrimary;

  _i2.CustomerDTOTable get customer {
    if (_customer != null) return _customer!;
    _customer = _i1.createRelationTable(
      relationFieldName: 'customer',
      field: CustomerBillingCustomerDTO.t.customerId,
      foreignField: _i2.CustomerDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.CustomerDTOTable(tableRelation: foreignTableRelation),
    );
    return _customer!;
  }

  _i2.CustomerDTOTable get billingCustomer {
    if (_billingCustomer != null) return _billingCustomer!;
    _billingCustomer = _i1.createRelationTable(
      relationFieldName: 'billingCustomer',
      field: CustomerBillingCustomerDTO.t.billingCustomerId,
      foreignField: _i2.CustomerDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.CustomerDTOTable(tableRelation: foreignTableRelation),
    );
    return _billingCustomer!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        customerId,
        billingCustomerId,
        isPrimary,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'customer') {
      return customer;
    }
    if (relationField == 'billingCustomer') {
      return billingCustomer;
    }
    return null;
  }
}

class CustomerBillingCustomerDTOInclude extends _i1.IncludeObject {
  CustomerBillingCustomerDTOInclude._({
    _i2.CustomerDTOInclude? customer,
    _i2.CustomerDTOInclude? billingCustomer,
  }) {
    _customer = customer;
    _billingCustomer = billingCustomer;
  }

  _i2.CustomerDTOInclude? _customer;

  _i2.CustomerDTOInclude? _billingCustomer;

  @override
  Map<String, _i1.Include?> get includes => {
        'customer': _customer,
        'billingCustomer': _billingCustomer,
      };

  @override
  _i1.Table<int?> get table => CustomerBillingCustomerDTO.t;
}

class CustomerBillingCustomerDTOIncludeList extends _i1.IncludeList {
  CustomerBillingCustomerDTOIncludeList._({
    _i1.WhereExpressionBuilder<CustomerBillingCustomerDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CustomerBillingCustomerDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => CustomerBillingCustomerDTO.t;
}

class CustomerBillingCustomerDTORepository {
  const CustomerBillingCustomerDTORepository._();

  final attachRow = const CustomerBillingCustomerDTOAttachRowRepository._();

  /// Returns a list of [CustomerBillingCustomerDTO]s matching the given query parameters.
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
  Future<List<CustomerBillingCustomerDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CustomerBillingCustomerDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CustomerBillingCustomerDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CustomerBillingCustomerDTOTable>? orderByList,
    _i1.Transaction? transaction,
    CustomerBillingCustomerDTOInclude? include,
  }) async {
    return session.db.find<CustomerBillingCustomerDTO>(
      where: where?.call(CustomerBillingCustomerDTO.t),
      orderBy: orderBy?.call(CustomerBillingCustomerDTO.t),
      orderByList: orderByList?.call(CustomerBillingCustomerDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [CustomerBillingCustomerDTO] matching the given query parameters.
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
  Future<CustomerBillingCustomerDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CustomerBillingCustomerDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<CustomerBillingCustomerDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CustomerBillingCustomerDTOTable>? orderByList,
    _i1.Transaction? transaction,
    CustomerBillingCustomerDTOInclude? include,
  }) async {
    return session.db.findFirstRow<CustomerBillingCustomerDTO>(
      where: where?.call(CustomerBillingCustomerDTO.t),
      orderBy: orderBy?.call(CustomerBillingCustomerDTO.t),
      orderByList: orderByList?.call(CustomerBillingCustomerDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [CustomerBillingCustomerDTO] by its [id] or null if no such row exists.
  Future<CustomerBillingCustomerDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    CustomerBillingCustomerDTOInclude? include,
  }) async {
    return session.db.findById<CustomerBillingCustomerDTO>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [CustomerBillingCustomerDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [CustomerBillingCustomerDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<CustomerBillingCustomerDTO>> insert(
    _i1.Session session,
    List<CustomerBillingCustomerDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<CustomerBillingCustomerDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [CustomerBillingCustomerDTO] and returns the inserted row.
  ///
  /// The returned [CustomerBillingCustomerDTO] will have its `id` field set.
  Future<CustomerBillingCustomerDTO> insertRow(
    _i1.Session session,
    CustomerBillingCustomerDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<CustomerBillingCustomerDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [CustomerBillingCustomerDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<CustomerBillingCustomerDTO>> update(
    _i1.Session session,
    List<CustomerBillingCustomerDTO> rows, {
    _i1.ColumnSelections<CustomerBillingCustomerDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<CustomerBillingCustomerDTO>(
      rows,
      columns: columns?.call(CustomerBillingCustomerDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CustomerBillingCustomerDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CustomerBillingCustomerDTO> updateRow(
    _i1.Session session,
    CustomerBillingCustomerDTO row, {
    _i1.ColumnSelections<CustomerBillingCustomerDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<CustomerBillingCustomerDTO>(
      row,
      columns: columns?.call(CustomerBillingCustomerDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [CustomerBillingCustomerDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<CustomerBillingCustomerDTO>> delete(
    _i1.Session session,
    List<CustomerBillingCustomerDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<CustomerBillingCustomerDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [CustomerBillingCustomerDTO].
  Future<CustomerBillingCustomerDTO> deleteRow(
    _i1.Session session,
    CustomerBillingCustomerDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CustomerBillingCustomerDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<CustomerBillingCustomerDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CustomerBillingCustomerDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<CustomerBillingCustomerDTO>(
      where: where(CustomerBillingCustomerDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CustomerBillingCustomerDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<CustomerBillingCustomerDTO>(
      where: where?.call(CustomerBillingCustomerDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class CustomerBillingCustomerDTOAttachRowRepository {
  const CustomerBillingCustomerDTOAttachRowRepository._();

  /// Creates a relation between the given [CustomerBillingCustomerDTO] and [CustomerDTO]
  /// by setting the [CustomerBillingCustomerDTO]'s foreign key `customerId` to refer to the [CustomerDTO].
  Future<void> customer(
    _i1.Session session,
    CustomerBillingCustomerDTO customerBillingCustomerDTO,
    _i2.CustomerDTO customer, {
    _i1.Transaction? transaction,
  }) async {
    if (customerBillingCustomerDTO.id == null) {
      throw ArgumentError.notNull('customerBillingCustomerDTO.id');
    }
    if (customer.id == null) {
      throw ArgumentError.notNull('customer.id');
    }

    var $customerBillingCustomerDTO =
        customerBillingCustomerDTO.copyWith(customerId: customer.id);
    await session.db.updateRow<CustomerBillingCustomerDTO>(
      $customerBillingCustomerDTO,
      columns: [CustomerBillingCustomerDTO.t.customerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [CustomerBillingCustomerDTO] and [CustomerDTO]
  /// by setting the [CustomerBillingCustomerDTO]'s foreign key `billingCustomerId` to refer to the [CustomerDTO].
  Future<void> billingCustomer(
    _i1.Session session,
    CustomerBillingCustomerDTO customerBillingCustomerDTO,
    _i2.CustomerDTO billingCustomer, {
    _i1.Transaction? transaction,
  }) async {
    if (customerBillingCustomerDTO.id == null) {
      throw ArgumentError.notNull('customerBillingCustomerDTO.id');
    }
    if (billingCustomer.id == null) {
      throw ArgumentError.notNull('billingCustomer.id');
    }

    var $customerBillingCustomerDTO = customerBillingCustomerDTO.copyWith(
        billingCustomerId: billingCustomer.id);
    await session.db.updateRow<CustomerBillingCustomerDTO>(
      $customerBillingCustomerDTO,
      columns: [CustomerBillingCustomerDTO.t.billingCustomerId],
      transaction: transaction,
    );
  }
}
