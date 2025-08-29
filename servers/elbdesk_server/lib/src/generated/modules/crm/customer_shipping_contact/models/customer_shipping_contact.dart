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
import '../../../../modules/crm/contact/models/contact.dart' as _i3;

abstract class CustomerShippingContactDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  CustomerShippingContactDTO._({
    this.id,
    required this.customerId,
    this.customer,
    required this.shippingContactId,
    this.shippingContact,
    required this.isPrimary,
  });

  factory CustomerShippingContactDTO({
    int? id,
    required int customerId,
    _i2.CustomerDTO? customer,
    required int shippingContactId,
    _i3.ContactDTO? shippingContact,
    required bool isPrimary,
  }) = _CustomerShippingContactDTOImpl;

  factory CustomerShippingContactDTO.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return CustomerShippingContactDTO(
      id: jsonSerialization['id'] as int?,
      customerId: jsonSerialization['customerId'] as int,
      customer: jsonSerialization['customer'] == null
          ? null
          : _i2.CustomerDTO.fromJson(
              (jsonSerialization['customer'] as Map<String, dynamic>)),
      shippingContactId: jsonSerialization['shippingContactId'] as int,
      shippingContact: jsonSerialization['shippingContact'] == null
          ? null
          : _i3.ContactDTO.fromJson(
              (jsonSerialization['shippingContact'] as Map<String, dynamic>)),
      isPrimary: jsonSerialization['isPrimary'] as bool,
    );
  }

  static final t = CustomerShippingContactDTOTable();

  static const db = CustomerShippingContactDTORepository._();

  @override
  int? id;

  int customerId;

  _i2.CustomerDTO? customer;

  int shippingContactId;

  _i3.ContactDTO? shippingContact;

  bool isPrimary;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [CustomerShippingContactDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CustomerShippingContactDTO copyWith({
    int? id,
    int? customerId,
    _i2.CustomerDTO? customer,
    int? shippingContactId,
    _i3.ContactDTO? shippingContact,
    bool? isPrimary,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'customerId': customerId,
      if (customer != null) 'customer': customer?.toJson(),
      'shippingContactId': shippingContactId,
      if (shippingContact != null) 'shippingContact': shippingContact?.toJson(),
      'isPrimary': isPrimary,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'customerId': customerId,
      if (customer != null) 'customer': customer?.toJsonForProtocol(),
      'shippingContactId': shippingContactId,
      if (shippingContact != null)
        'shippingContact': shippingContact?.toJsonForProtocol(),
      'isPrimary': isPrimary,
    };
  }

  static CustomerShippingContactDTOInclude include({
    _i2.CustomerDTOInclude? customer,
    _i3.ContactDTOInclude? shippingContact,
  }) {
    return CustomerShippingContactDTOInclude._(
      customer: customer,
      shippingContact: shippingContact,
    );
  }

  static CustomerShippingContactDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<CustomerShippingContactDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CustomerShippingContactDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CustomerShippingContactDTOTable>? orderByList,
    CustomerShippingContactDTOInclude? include,
  }) {
    return CustomerShippingContactDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CustomerShippingContactDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(CustomerShippingContactDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CustomerShippingContactDTOImpl extends CustomerShippingContactDTO {
  _CustomerShippingContactDTOImpl({
    int? id,
    required int customerId,
    _i2.CustomerDTO? customer,
    required int shippingContactId,
    _i3.ContactDTO? shippingContact,
    required bool isPrimary,
  }) : super._(
          id: id,
          customerId: customerId,
          customer: customer,
          shippingContactId: shippingContactId,
          shippingContact: shippingContact,
          isPrimary: isPrimary,
        );

  /// Returns a shallow copy of this [CustomerShippingContactDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CustomerShippingContactDTO copyWith({
    Object? id = _Undefined,
    int? customerId,
    Object? customer = _Undefined,
    int? shippingContactId,
    Object? shippingContact = _Undefined,
    bool? isPrimary,
  }) {
    return CustomerShippingContactDTO(
      id: id is int? ? id : this.id,
      customerId: customerId ?? this.customerId,
      customer:
          customer is _i2.CustomerDTO? ? customer : this.customer?.copyWith(),
      shippingContactId: shippingContactId ?? this.shippingContactId,
      shippingContact: shippingContact is _i3.ContactDTO?
          ? shippingContact
          : this.shippingContact?.copyWith(),
      isPrimary: isPrimary ?? this.isPrimary,
    );
  }
}

class CustomerShippingContactDTOTable extends _i1.Table<int?> {
  CustomerShippingContactDTOTable({super.tableRelation})
      : super(tableName: 'ed_crm_customer_shipping_contact') {
    customerId = _i1.ColumnInt(
      'customerId',
      this,
    );
    shippingContactId = _i1.ColumnInt(
      'shippingContactId',
      this,
    );
    isPrimary = _i1.ColumnBool(
      'isPrimary',
      this,
    );
  }

  late final _i1.ColumnInt customerId;

  _i2.CustomerDTOTable? _customer;

  late final _i1.ColumnInt shippingContactId;

  _i3.ContactDTOTable? _shippingContact;

  late final _i1.ColumnBool isPrimary;

  _i2.CustomerDTOTable get customer {
    if (_customer != null) return _customer!;
    _customer = _i1.createRelationTable(
      relationFieldName: 'customer',
      field: CustomerShippingContactDTO.t.customerId,
      foreignField: _i2.CustomerDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.CustomerDTOTable(tableRelation: foreignTableRelation),
    );
    return _customer!;
  }

  _i3.ContactDTOTable get shippingContact {
    if (_shippingContact != null) return _shippingContact!;
    _shippingContact = _i1.createRelationTable(
      relationFieldName: 'shippingContact',
      field: CustomerShippingContactDTO.t.shippingContactId,
      foreignField: _i3.ContactDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.ContactDTOTable(tableRelation: foreignTableRelation),
    );
    return _shippingContact!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        customerId,
        shippingContactId,
        isPrimary,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'customer') {
      return customer;
    }
    if (relationField == 'shippingContact') {
      return shippingContact;
    }
    return null;
  }
}

class CustomerShippingContactDTOInclude extends _i1.IncludeObject {
  CustomerShippingContactDTOInclude._({
    _i2.CustomerDTOInclude? customer,
    _i3.ContactDTOInclude? shippingContact,
  }) {
    _customer = customer;
    _shippingContact = shippingContact;
  }

  _i2.CustomerDTOInclude? _customer;

  _i3.ContactDTOInclude? _shippingContact;

  @override
  Map<String, _i1.Include?> get includes => {
        'customer': _customer,
        'shippingContact': _shippingContact,
      };

  @override
  _i1.Table<int?> get table => CustomerShippingContactDTO.t;
}

class CustomerShippingContactDTOIncludeList extends _i1.IncludeList {
  CustomerShippingContactDTOIncludeList._({
    _i1.WhereExpressionBuilder<CustomerShippingContactDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CustomerShippingContactDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => CustomerShippingContactDTO.t;
}

class CustomerShippingContactDTORepository {
  const CustomerShippingContactDTORepository._();

  final attachRow = const CustomerShippingContactDTOAttachRowRepository._();

  /// Returns a list of [CustomerShippingContactDTO]s matching the given query parameters.
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
  Future<List<CustomerShippingContactDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CustomerShippingContactDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CustomerShippingContactDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CustomerShippingContactDTOTable>? orderByList,
    _i1.Transaction? transaction,
    CustomerShippingContactDTOInclude? include,
  }) async {
    return session.db.find<CustomerShippingContactDTO>(
      where: where?.call(CustomerShippingContactDTO.t),
      orderBy: orderBy?.call(CustomerShippingContactDTO.t),
      orderByList: orderByList?.call(CustomerShippingContactDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [CustomerShippingContactDTO] matching the given query parameters.
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
  Future<CustomerShippingContactDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CustomerShippingContactDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<CustomerShippingContactDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CustomerShippingContactDTOTable>? orderByList,
    _i1.Transaction? transaction,
    CustomerShippingContactDTOInclude? include,
  }) async {
    return session.db.findFirstRow<CustomerShippingContactDTO>(
      where: where?.call(CustomerShippingContactDTO.t),
      orderBy: orderBy?.call(CustomerShippingContactDTO.t),
      orderByList: orderByList?.call(CustomerShippingContactDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [CustomerShippingContactDTO] by its [id] or null if no such row exists.
  Future<CustomerShippingContactDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    CustomerShippingContactDTOInclude? include,
  }) async {
    return session.db.findById<CustomerShippingContactDTO>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [CustomerShippingContactDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [CustomerShippingContactDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<CustomerShippingContactDTO>> insert(
    _i1.Session session,
    List<CustomerShippingContactDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<CustomerShippingContactDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [CustomerShippingContactDTO] and returns the inserted row.
  ///
  /// The returned [CustomerShippingContactDTO] will have its `id` field set.
  Future<CustomerShippingContactDTO> insertRow(
    _i1.Session session,
    CustomerShippingContactDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<CustomerShippingContactDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [CustomerShippingContactDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<CustomerShippingContactDTO>> update(
    _i1.Session session,
    List<CustomerShippingContactDTO> rows, {
    _i1.ColumnSelections<CustomerShippingContactDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<CustomerShippingContactDTO>(
      rows,
      columns: columns?.call(CustomerShippingContactDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CustomerShippingContactDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CustomerShippingContactDTO> updateRow(
    _i1.Session session,
    CustomerShippingContactDTO row, {
    _i1.ColumnSelections<CustomerShippingContactDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<CustomerShippingContactDTO>(
      row,
      columns: columns?.call(CustomerShippingContactDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [CustomerShippingContactDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<CustomerShippingContactDTO>> delete(
    _i1.Session session,
    List<CustomerShippingContactDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<CustomerShippingContactDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [CustomerShippingContactDTO].
  Future<CustomerShippingContactDTO> deleteRow(
    _i1.Session session,
    CustomerShippingContactDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CustomerShippingContactDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<CustomerShippingContactDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CustomerShippingContactDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<CustomerShippingContactDTO>(
      where: where(CustomerShippingContactDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CustomerShippingContactDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<CustomerShippingContactDTO>(
      where: where?.call(CustomerShippingContactDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class CustomerShippingContactDTOAttachRowRepository {
  const CustomerShippingContactDTOAttachRowRepository._();

  /// Creates a relation between the given [CustomerShippingContactDTO] and [CustomerDTO]
  /// by setting the [CustomerShippingContactDTO]'s foreign key `customerId` to refer to the [CustomerDTO].
  Future<void> customer(
    _i1.Session session,
    CustomerShippingContactDTO customerShippingContactDTO,
    _i2.CustomerDTO customer, {
    _i1.Transaction? transaction,
  }) async {
    if (customerShippingContactDTO.id == null) {
      throw ArgumentError.notNull('customerShippingContactDTO.id');
    }
    if (customer.id == null) {
      throw ArgumentError.notNull('customer.id');
    }

    var $customerShippingContactDTO =
        customerShippingContactDTO.copyWith(customerId: customer.id);
    await session.db.updateRow<CustomerShippingContactDTO>(
      $customerShippingContactDTO,
      columns: [CustomerShippingContactDTO.t.customerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [CustomerShippingContactDTO] and [ContactDTO]
  /// by setting the [CustomerShippingContactDTO]'s foreign key `shippingContactId` to refer to the [ContactDTO].
  Future<void> shippingContact(
    _i1.Session session,
    CustomerShippingContactDTO customerShippingContactDTO,
    _i3.ContactDTO shippingContact, {
    _i1.Transaction? transaction,
  }) async {
    if (customerShippingContactDTO.id == null) {
      throw ArgumentError.notNull('customerShippingContactDTO.id');
    }
    if (shippingContact.id == null) {
      throw ArgumentError.notNull('shippingContact.id');
    }

    var $customerShippingContactDTO = customerShippingContactDTO.copyWith(
        shippingContactId: shippingContact.id);
    await session.db.updateRow<CustomerShippingContactDTO>(
      $customerShippingContactDTO,
      columns: [CustomerShippingContactDTO.t.shippingContactId],
      transaction: transaction,
    );
  }
}
