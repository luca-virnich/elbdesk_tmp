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

abstract class CustomerCustomerDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  CustomerCustomerDTO._({
    this.id,
    required this.customerId,
    this.customer,
    required this.customerCustomerContactId,
    this.customerCustomerContact,
    required this.createdAt,
    this.createdById,
    this.lastModifiedAt,
    this.lastModifiedById,
    this.deletedAt,
    this.deletedById,
    this.editingById,
    this.editingSince,
    required this.isDraft,
    this.editingSession,
  });

  factory CustomerCustomerDTO({
    int? id,
    required int customerId,
    _i2.CustomerDTO? customer,
    required int customerCustomerContactId,
    _i3.ContactDTO? customerCustomerContact,
    required DateTime createdAt,
    int? createdById,
    DateTime? lastModifiedAt,
    int? lastModifiedById,
    DateTime? deletedAt,
    int? deletedById,
    int? editingById,
    DateTime? editingSince,
    required bool isDraft,
    String? editingSession,
  }) = _CustomerCustomerDTOImpl;

  factory CustomerCustomerDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return CustomerCustomerDTO(
      id: jsonSerialization['id'] as int?,
      customerId: jsonSerialization['customerId'] as int,
      customer: jsonSerialization['customer'] == null
          ? null
          : _i2.CustomerDTO.fromJson(
              (jsonSerialization['customer'] as Map<String, dynamic>)),
      customerCustomerContactId:
          jsonSerialization['customerCustomerContactId'] as int,
      customerCustomerContact:
          jsonSerialization['customerCustomerContact'] == null
              ? null
              : _i3.ContactDTO.fromJson(
                  (jsonSerialization['customerCustomerContact']
                      as Map<String, dynamic>)),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      createdById: jsonSerialization['createdById'] as int?,
      lastModifiedAt: jsonSerialization['lastModifiedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastModifiedAt']),
      lastModifiedById: jsonSerialization['lastModifiedById'] as int?,
      deletedAt: jsonSerialization['deletedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['deletedAt']),
      deletedById: jsonSerialization['deletedById'] as int?,
      editingById: jsonSerialization['editingById'] as int?,
      editingSince: jsonSerialization['editingSince'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['editingSince']),
      isDraft: jsonSerialization['isDraft'] as bool,
      editingSession: jsonSerialization['editingSession'] as String?,
    );
  }

  static final t = CustomerCustomerDTOTable();

  static const db = CustomerCustomerDTORepository._();

  @override
  int? id;

  int customerId;

  _i2.CustomerDTO? customer;

  int customerCustomerContactId;

  _i3.ContactDTO? customerCustomerContact;

  DateTime createdAt;

  int? createdById;

  DateTime? lastModifiedAt;

  int? lastModifiedById;

  DateTime? deletedAt;

  int? deletedById;

  int? editingById;

  DateTime? editingSince;

  bool isDraft;

  String? editingSession;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [CustomerCustomerDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CustomerCustomerDTO copyWith({
    int? id,
    int? customerId,
    _i2.CustomerDTO? customer,
    int? customerCustomerContactId,
    _i3.ContactDTO? customerCustomerContact,
    DateTime? createdAt,
    int? createdById,
    DateTime? lastModifiedAt,
    int? lastModifiedById,
    DateTime? deletedAt,
    int? deletedById,
    int? editingById,
    DateTime? editingSince,
    bool? isDraft,
    String? editingSession,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'customerId': customerId,
      if (customer != null) 'customer': customer?.toJson(),
      'customerCustomerContactId': customerCustomerContactId,
      if (customerCustomerContact != null)
        'customerCustomerContact': customerCustomerContact?.toJson(),
      'createdAt': createdAt.toJson(),
      if (createdById != null) 'createdById': createdById,
      if (lastModifiedAt != null) 'lastModifiedAt': lastModifiedAt?.toJson(),
      if (lastModifiedById != null) 'lastModifiedById': lastModifiedById,
      if (deletedAt != null) 'deletedAt': deletedAt?.toJson(),
      if (deletedById != null) 'deletedById': deletedById,
      if (editingById != null) 'editingById': editingById,
      if (editingSince != null) 'editingSince': editingSince?.toJson(),
      'isDraft': isDraft,
      if (editingSession != null) 'editingSession': editingSession,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'customerId': customerId,
      if (customer != null) 'customer': customer?.toJsonForProtocol(),
      'customerCustomerContactId': customerCustomerContactId,
      if (customerCustomerContact != null)
        'customerCustomerContact': customerCustomerContact?.toJsonForProtocol(),
      'createdAt': createdAt.toJson(),
      if (createdById != null) 'createdById': createdById,
      if (lastModifiedAt != null) 'lastModifiedAt': lastModifiedAt?.toJson(),
      if (lastModifiedById != null) 'lastModifiedById': lastModifiedById,
      if (deletedAt != null) 'deletedAt': deletedAt?.toJson(),
      if (deletedById != null) 'deletedById': deletedById,
      if (editingById != null) 'editingById': editingById,
      if (editingSince != null) 'editingSince': editingSince?.toJson(),
      'isDraft': isDraft,
      if (editingSession != null) 'editingSession': editingSession,
    };
  }

  static CustomerCustomerDTOInclude include({
    _i2.CustomerDTOInclude? customer,
    _i3.ContactDTOInclude? customerCustomerContact,
  }) {
    return CustomerCustomerDTOInclude._(
      customer: customer,
      customerCustomerContact: customerCustomerContact,
    );
  }

  static CustomerCustomerDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<CustomerCustomerDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CustomerCustomerDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CustomerCustomerDTOTable>? orderByList,
    CustomerCustomerDTOInclude? include,
  }) {
    return CustomerCustomerDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CustomerCustomerDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(CustomerCustomerDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CustomerCustomerDTOImpl extends CustomerCustomerDTO {
  _CustomerCustomerDTOImpl({
    int? id,
    required int customerId,
    _i2.CustomerDTO? customer,
    required int customerCustomerContactId,
    _i3.ContactDTO? customerCustomerContact,
    required DateTime createdAt,
    int? createdById,
    DateTime? lastModifiedAt,
    int? lastModifiedById,
    DateTime? deletedAt,
    int? deletedById,
    int? editingById,
    DateTime? editingSince,
    required bool isDraft,
    String? editingSession,
  }) : super._(
          id: id,
          customerId: customerId,
          customer: customer,
          customerCustomerContactId: customerCustomerContactId,
          customerCustomerContact: customerCustomerContact,
          createdAt: createdAt,
          createdById: createdById,
          lastModifiedAt: lastModifiedAt,
          lastModifiedById: lastModifiedById,
          deletedAt: deletedAt,
          deletedById: deletedById,
          editingById: editingById,
          editingSince: editingSince,
          isDraft: isDraft,
          editingSession: editingSession,
        );

  /// Returns a shallow copy of this [CustomerCustomerDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CustomerCustomerDTO copyWith({
    Object? id = _Undefined,
    int? customerId,
    Object? customer = _Undefined,
    int? customerCustomerContactId,
    Object? customerCustomerContact = _Undefined,
    DateTime? createdAt,
    Object? createdById = _Undefined,
    Object? lastModifiedAt = _Undefined,
    Object? lastModifiedById = _Undefined,
    Object? deletedAt = _Undefined,
    Object? deletedById = _Undefined,
    Object? editingById = _Undefined,
    Object? editingSince = _Undefined,
    bool? isDraft,
    Object? editingSession = _Undefined,
  }) {
    return CustomerCustomerDTO(
      id: id is int? ? id : this.id,
      customerId: customerId ?? this.customerId,
      customer:
          customer is _i2.CustomerDTO? ? customer : this.customer?.copyWith(),
      customerCustomerContactId:
          customerCustomerContactId ?? this.customerCustomerContactId,
      customerCustomerContact: customerCustomerContact is _i3.ContactDTO?
          ? customerCustomerContact
          : this.customerCustomerContact?.copyWith(),
      createdAt: createdAt ?? this.createdAt,
      createdById: createdById is int? ? createdById : this.createdById,
      lastModifiedAt:
          lastModifiedAt is DateTime? ? lastModifiedAt : this.lastModifiedAt,
      lastModifiedById:
          lastModifiedById is int? ? lastModifiedById : this.lastModifiedById,
      deletedAt: deletedAt is DateTime? ? deletedAt : this.deletedAt,
      deletedById: deletedById is int? ? deletedById : this.deletedById,
      editingById: editingById is int? ? editingById : this.editingById,
      editingSince:
          editingSince is DateTime? ? editingSince : this.editingSince,
      isDraft: isDraft ?? this.isDraft,
      editingSession:
          editingSession is String? ? editingSession : this.editingSession,
    );
  }
}

class CustomerCustomerDTOTable extends _i1.Table<int?> {
  CustomerCustomerDTOTable({super.tableRelation})
      : super(tableName: 'ed_crm_customer_customer') {
    customerId = _i1.ColumnInt(
      'customerId',
      this,
    );
    customerCustomerContactId = _i1.ColumnInt(
      'customerCustomerContactId',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    createdById = _i1.ColumnInt(
      'createdById',
      this,
    );
    lastModifiedAt = _i1.ColumnDateTime(
      'lastModifiedAt',
      this,
    );
    lastModifiedById = _i1.ColumnInt(
      'lastModifiedById',
      this,
    );
    deletedAt = _i1.ColumnDateTime(
      'deletedAt',
      this,
    );
    deletedById = _i1.ColumnInt(
      'deletedById',
      this,
    );
    editingById = _i1.ColumnInt(
      'editingById',
      this,
    );
    editingSince = _i1.ColumnDateTime(
      'editingSince',
      this,
    );
    isDraft = _i1.ColumnBool(
      'isDraft',
      this,
    );
    editingSession = _i1.ColumnString(
      'editingSession',
      this,
    );
  }

  late final _i1.ColumnInt customerId;

  _i2.CustomerDTOTable? _customer;

  late final _i1.ColumnInt customerCustomerContactId;

  _i3.ContactDTOTable? _customerCustomerContact;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnInt createdById;

  late final _i1.ColumnDateTime lastModifiedAt;

  late final _i1.ColumnInt lastModifiedById;

  late final _i1.ColumnDateTime deletedAt;

  late final _i1.ColumnInt deletedById;

  late final _i1.ColumnInt editingById;

  late final _i1.ColumnDateTime editingSince;

  late final _i1.ColumnBool isDraft;

  late final _i1.ColumnString editingSession;

  _i2.CustomerDTOTable get customer {
    if (_customer != null) return _customer!;
    _customer = _i1.createRelationTable(
      relationFieldName: 'customer',
      field: CustomerCustomerDTO.t.customerId,
      foreignField: _i2.CustomerDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.CustomerDTOTable(tableRelation: foreignTableRelation),
    );
    return _customer!;
  }

  _i3.ContactDTOTable get customerCustomerContact {
    if (_customerCustomerContact != null) return _customerCustomerContact!;
    _customerCustomerContact = _i1.createRelationTable(
      relationFieldName: 'customerCustomerContact',
      field: CustomerCustomerDTO.t.customerCustomerContactId,
      foreignField: _i3.ContactDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.ContactDTOTable(tableRelation: foreignTableRelation),
    );
    return _customerCustomerContact!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        customerId,
        customerCustomerContactId,
        createdAt,
        createdById,
        lastModifiedAt,
        lastModifiedById,
        deletedAt,
        deletedById,
        editingById,
        editingSince,
        isDraft,
        editingSession,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'customer') {
      return customer;
    }
    if (relationField == 'customerCustomerContact') {
      return customerCustomerContact;
    }
    return null;
  }
}

class CustomerCustomerDTOInclude extends _i1.IncludeObject {
  CustomerCustomerDTOInclude._({
    _i2.CustomerDTOInclude? customer,
    _i3.ContactDTOInclude? customerCustomerContact,
  }) {
    _customer = customer;
    _customerCustomerContact = customerCustomerContact;
  }

  _i2.CustomerDTOInclude? _customer;

  _i3.ContactDTOInclude? _customerCustomerContact;

  @override
  Map<String, _i1.Include?> get includes => {
        'customer': _customer,
        'customerCustomerContact': _customerCustomerContact,
      };

  @override
  _i1.Table<int?> get table => CustomerCustomerDTO.t;
}

class CustomerCustomerDTOIncludeList extends _i1.IncludeList {
  CustomerCustomerDTOIncludeList._({
    _i1.WhereExpressionBuilder<CustomerCustomerDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CustomerCustomerDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => CustomerCustomerDTO.t;
}

class CustomerCustomerDTORepository {
  const CustomerCustomerDTORepository._();

  final attachRow = const CustomerCustomerDTOAttachRowRepository._();

  /// Returns a list of [CustomerCustomerDTO]s matching the given query parameters.
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
  Future<List<CustomerCustomerDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CustomerCustomerDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CustomerCustomerDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CustomerCustomerDTOTable>? orderByList,
    _i1.Transaction? transaction,
    CustomerCustomerDTOInclude? include,
  }) async {
    return session.db.find<CustomerCustomerDTO>(
      where: where?.call(CustomerCustomerDTO.t),
      orderBy: orderBy?.call(CustomerCustomerDTO.t),
      orderByList: orderByList?.call(CustomerCustomerDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [CustomerCustomerDTO] matching the given query parameters.
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
  Future<CustomerCustomerDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CustomerCustomerDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<CustomerCustomerDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CustomerCustomerDTOTable>? orderByList,
    _i1.Transaction? transaction,
    CustomerCustomerDTOInclude? include,
  }) async {
    return session.db.findFirstRow<CustomerCustomerDTO>(
      where: where?.call(CustomerCustomerDTO.t),
      orderBy: orderBy?.call(CustomerCustomerDTO.t),
      orderByList: orderByList?.call(CustomerCustomerDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [CustomerCustomerDTO] by its [id] or null if no such row exists.
  Future<CustomerCustomerDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    CustomerCustomerDTOInclude? include,
  }) async {
    return session.db.findById<CustomerCustomerDTO>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [CustomerCustomerDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [CustomerCustomerDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<CustomerCustomerDTO>> insert(
    _i1.Session session,
    List<CustomerCustomerDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<CustomerCustomerDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [CustomerCustomerDTO] and returns the inserted row.
  ///
  /// The returned [CustomerCustomerDTO] will have its `id` field set.
  Future<CustomerCustomerDTO> insertRow(
    _i1.Session session,
    CustomerCustomerDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<CustomerCustomerDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [CustomerCustomerDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<CustomerCustomerDTO>> update(
    _i1.Session session,
    List<CustomerCustomerDTO> rows, {
    _i1.ColumnSelections<CustomerCustomerDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<CustomerCustomerDTO>(
      rows,
      columns: columns?.call(CustomerCustomerDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CustomerCustomerDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CustomerCustomerDTO> updateRow(
    _i1.Session session,
    CustomerCustomerDTO row, {
    _i1.ColumnSelections<CustomerCustomerDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<CustomerCustomerDTO>(
      row,
      columns: columns?.call(CustomerCustomerDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [CustomerCustomerDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<CustomerCustomerDTO>> delete(
    _i1.Session session,
    List<CustomerCustomerDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<CustomerCustomerDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [CustomerCustomerDTO].
  Future<CustomerCustomerDTO> deleteRow(
    _i1.Session session,
    CustomerCustomerDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CustomerCustomerDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<CustomerCustomerDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CustomerCustomerDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<CustomerCustomerDTO>(
      where: where(CustomerCustomerDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CustomerCustomerDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<CustomerCustomerDTO>(
      where: where?.call(CustomerCustomerDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class CustomerCustomerDTOAttachRowRepository {
  const CustomerCustomerDTOAttachRowRepository._();

  /// Creates a relation between the given [CustomerCustomerDTO] and [CustomerDTO]
  /// by setting the [CustomerCustomerDTO]'s foreign key `customerId` to refer to the [CustomerDTO].
  Future<void> customer(
    _i1.Session session,
    CustomerCustomerDTO customerCustomerDTO,
    _i2.CustomerDTO customer, {
    _i1.Transaction? transaction,
  }) async {
    if (customerCustomerDTO.id == null) {
      throw ArgumentError.notNull('customerCustomerDTO.id');
    }
    if (customer.id == null) {
      throw ArgumentError.notNull('customer.id');
    }

    var $customerCustomerDTO =
        customerCustomerDTO.copyWith(customerId: customer.id);
    await session.db.updateRow<CustomerCustomerDTO>(
      $customerCustomerDTO,
      columns: [CustomerCustomerDTO.t.customerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [CustomerCustomerDTO] and [ContactDTO]
  /// by setting the [CustomerCustomerDTO]'s foreign key `customerCustomerContactId` to refer to the [ContactDTO].
  Future<void> customerCustomerContact(
    _i1.Session session,
    CustomerCustomerDTO customerCustomerDTO,
    _i3.ContactDTO customerCustomerContact, {
    _i1.Transaction? transaction,
  }) async {
    if (customerCustomerDTO.id == null) {
      throw ArgumentError.notNull('customerCustomerDTO.id');
    }
    if (customerCustomerContact.id == null) {
      throw ArgumentError.notNull('customerCustomerContact.id');
    }

    var $customerCustomerDTO = customerCustomerDTO.copyWith(
        customerCustomerContactId: customerCustomerContact.id);
    await session.db.updateRow<CustomerCustomerDTO>(
      $customerCustomerDTO,
      columns: [CustomerCustomerDTO.t.customerCustomerContactId],
      transaction: transaction,
    );
  }
}
