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
import '../../../../modules/crm/customer_contacts/models/customer_contacts_type.dart'
    as _i4;

abstract class CustomerContactsDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  CustomerContactsDTO._({
    this.id,
    required this.customerId,
    this.customer,
    required this.contactId,
    this.contact,
    required this.type,
    required this.isPrimary,
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

  factory CustomerContactsDTO({
    int? id,
    required int customerId,
    _i2.CustomerDTO? customer,
    required int contactId,
    _i3.ContactDTO? contact,
    required _i4.CustomerContactsType type,
    required bool isPrimary,
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
  }) = _CustomerContactsDTOImpl;

  factory CustomerContactsDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return CustomerContactsDTO(
      id: jsonSerialization['id'] as int?,
      customerId: jsonSerialization['customerId'] as int,
      customer: jsonSerialization['customer'] == null
          ? null
          : _i2.CustomerDTO.fromJson(
              (jsonSerialization['customer'] as Map<String, dynamic>)),
      contactId: jsonSerialization['contactId'] as int,
      contact: jsonSerialization['contact'] == null
          ? null
          : _i3.ContactDTO.fromJson(
              (jsonSerialization['contact'] as Map<String, dynamic>)),
      type: _i4.CustomerContactsType.fromJson(
          (jsonSerialization['type'] as String)),
      isPrimary: jsonSerialization['isPrimary'] as bool,
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

  static final t = CustomerContactsDTOTable();

  static const db = CustomerContactsDTORepository._();

  @override
  int? id;

  int customerId;

  _i2.CustomerDTO? customer;

  int contactId;

  _i3.ContactDTO? contact;

  _i4.CustomerContactsType type;

  bool isPrimary;

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

  /// Returns a shallow copy of this [CustomerContactsDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CustomerContactsDTO copyWith({
    int? id,
    int? customerId,
    _i2.CustomerDTO? customer,
    int? contactId,
    _i3.ContactDTO? contact,
    _i4.CustomerContactsType? type,
    bool? isPrimary,
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
      'contactId': contactId,
      if (contact != null) 'contact': contact?.toJson(),
      'type': type.toJson(),
      'isPrimary': isPrimary,
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
      'contactId': contactId,
      if (contact != null) 'contact': contact?.toJsonForProtocol(),
      'type': type.toJson(),
      'isPrimary': isPrimary,
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

  static CustomerContactsDTOInclude include({
    _i2.CustomerDTOInclude? customer,
    _i3.ContactDTOInclude? contact,
  }) {
    return CustomerContactsDTOInclude._(
      customer: customer,
      contact: contact,
    );
  }

  static CustomerContactsDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<CustomerContactsDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CustomerContactsDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CustomerContactsDTOTable>? orderByList,
    CustomerContactsDTOInclude? include,
  }) {
    return CustomerContactsDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CustomerContactsDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(CustomerContactsDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CustomerContactsDTOImpl extends CustomerContactsDTO {
  _CustomerContactsDTOImpl({
    int? id,
    required int customerId,
    _i2.CustomerDTO? customer,
    required int contactId,
    _i3.ContactDTO? contact,
    required _i4.CustomerContactsType type,
    required bool isPrimary,
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
          contactId: contactId,
          contact: contact,
          type: type,
          isPrimary: isPrimary,
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

  /// Returns a shallow copy of this [CustomerContactsDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CustomerContactsDTO copyWith({
    Object? id = _Undefined,
    int? customerId,
    Object? customer = _Undefined,
    int? contactId,
    Object? contact = _Undefined,
    _i4.CustomerContactsType? type,
    bool? isPrimary,
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
    return CustomerContactsDTO(
      id: id is int? ? id : this.id,
      customerId: customerId ?? this.customerId,
      customer:
          customer is _i2.CustomerDTO? ? customer : this.customer?.copyWith(),
      contactId: contactId ?? this.contactId,
      contact: contact is _i3.ContactDTO? ? contact : this.contact?.copyWith(),
      type: type ?? this.type,
      isPrimary: isPrimary ?? this.isPrimary,
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

class CustomerContactsDTOTable extends _i1.Table<int?> {
  CustomerContactsDTOTable({super.tableRelation})
      : super(tableName: 'ed_crm_customer_contacts') {
    customerId = _i1.ColumnInt(
      'customerId',
      this,
    );
    contactId = _i1.ColumnInt(
      'contactId',
      this,
    );
    type = _i1.ColumnEnum(
      'type',
      this,
      _i1.EnumSerialization.byName,
    );
    isPrimary = _i1.ColumnBool(
      'isPrimary',
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

  late final _i1.ColumnInt contactId;

  _i3.ContactDTOTable? _contact;

  late final _i1.ColumnEnum<_i4.CustomerContactsType> type;

  late final _i1.ColumnBool isPrimary;

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
      field: CustomerContactsDTO.t.customerId,
      foreignField: _i2.CustomerDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.CustomerDTOTable(tableRelation: foreignTableRelation),
    );
    return _customer!;
  }

  _i3.ContactDTOTable get contact {
    if (_contact != null) return _contact!;
    _contact = _i1.createRelationTable(
      relationFieldName: 'contact',
      field: CustomerContactsDTO.t.contactId,
      foreignField: _i3.ContactDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.ContactDTOTable(tableRelation: foreignTableRelation),
    );
    return _contact!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        customerId,
        contactId,
        type,
        isPrimary,
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
    if (relationField == 'contact') {
      return contact;
    }
    return null;
  }
}

class CustomerContactsDTOInclude extends _i1.IncludeObject {
  CustomerContactsDTOInclude._({
    _i2.CustomerDTOInclude? customer,
    _i3.ContactDTOInclude? contact,
  }) {
    _customer = customer;
    _contact = contact;
  }

  _i2.CustomerDTOInclude? _customer;

  _i3.ContactDTOInclude? _contact;

  @override
  Map<String, _i1.Include?> get includes => {
        'customer': _customer,
        'contact': _contact,
      };

  @override
  _i1.Table<int?> get table => CustomerContactsDTO.t;
}

class CustomerContactsDTOIncludeList extends _i1.IncludeList {
  CustomerContactsDTOIncludeList._({
    _i1.WhereExpressionBuilder<CustomerContactsDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CustomerContactsDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => CustomerContactsDTO.t;
}

class CustomerContactsDTORepository {
  const CustomerContactsDTORepository._();

  final attachRow = const CustomerContactsDTOAttachRowRepository._();

  /// Returns a list of [CustomerContactsDTO]s matching the given query parameters.
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
  Future<List<CustomerContactsDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CustomerContactsDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CustomerContactsDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CustomerContactsDTOTable>? orderByList,
    _i1.Transaction? transaction,
    CustomerContactsDTOInclude? include,
  }) async {
    return session.db.find<CustomerContactsDTO>(
      where: where?.call(CustomerContactsDTO.t),
      orderBy: orderBy?.call(CustomerContactsDTO.t),
      orderByList: orderByList?.call(CustomerContactsDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [CustomerContactsDTO] matching the given query parameters.
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
  Future<CustomerContactsDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CustomerContactsDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<CustomerContactsDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CustomerContactsDTOTable>? orderByList,
    _i1.Transaction? transaction,
    CustomerContactsDTOInclude? include,
  }) async {
    return session.db.findFirstRow<CustomerContactsDTO>(
      where: where?.call(CustomerContactsDTO.t),
      orderBy: orderBy?.call(CustomerContactsDTO.t),
      orderByList: orderByList?.call(CustomerContactsDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [CustomerContactsDTO] by its [id] or null if no such row exists.
  Future<CustomerContactsDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    CustomerContactsDTOInclude? include,
  }) async {
    return session.db.findById<CustomerContactsDTO>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [CustomerContactsDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [CustomerContactsDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<CustomerContactsDTO>> insert(
    _i1.Session session,
    List<CustomerContactsDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<CustomerContactsDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [CustomerContactsDTO] and returns the inserted row.
  ///
  /// The returned [CustomerContactsDTO] will have its `id` field set.
  Future<CustomerContactsDTO> insertRow(
    _i1.Session session,
    CustomerContactsDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<CustomerContactsDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [CustomerContactsDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<CustomerContactsDTO>> update(
    _i1.Session session,
    List<CustomerContactsDTO> rows, {
    _i1.ColumnSelections<CustomerContactsDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<CustomerContactsDTO>(
      rows,
      columns: columns?.call(CustomerContactsDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CustomerContactsDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CustomerContactsDTO> updateRow(
    _i1.Session session,
    CustomerContactsDTO row, {
    _i1.ColumnSelections<CustomerContactsDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<CustomerContactsDTO>(
      row,
      columns: columns?.call(CustomerContactsDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [CustomerContactsDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<CustomerContactsDTO>> delete(
    _i1.Session session,
    List<CustomerContactsDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<CustomerContactsDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [CustomerContactsDTO].
  Future<CustomerContactsDTO> deleteRow(
    _i1.Session session,
    CustomerContactsDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CustomerContactsDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<CustomerContactsDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CustomerContactsDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<CustomerContactsDTO>(
      where: where(CustomerContactsDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CustomerContactsDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<CustomerContactsDTO>(
      where: where?.call(CustomerContactsDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class CustomerContactsDTOAttachRowRepository {
  const CustomerContactsDTOAttachRowRepository._();

  /// Creates a relation between the given [CustomerContactsDTO] and [CustomerDTO]
  /// by setting the [CustomerContactsDTO]'s foreign key `customerId` to refer to the [CustomerDTO].
  Future<void> customer(
    _i1.Session session,
    CustomerContactsDTO customerContactsDTO,
    _i2.CustomerDTO customer, {
    _i1.Transaction? transaction,
  }) async {
    if (customerContactsDTO.id == null) {
      throw ArgumentError.notNull('customerContactsDTO.id');
    }
    if (customer.id == null) {
      throw ArgumentError.notNull('customer.id');
    }

    var $customerContactsDTO =
        customerContactsDTO.copyWith(customerId: customer.id);
    await session.db.updateRow<CustomerContactsDTO>(
      $customerContactsDTO,
      columns: [CustomerContactsDTO.t.customerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [CustomerContactsDTO] and [ContactDTO]
  /// by setting the [CustomerContactsDTO]'s foreign key `contactId` to refer to the [ContactDTO].
  Future<void> contact(
    _i1.Session session,
    CustomerContactsDTO customerContactsDTO,
    _i3.ContactDTO contact, {
    _i1.Transaction? transaction,
  }) async {
    if (customerContactsDTO.id == null) {
      throw ArgumentError.notNull('customerContactsDTO.id');
    }
    if (contact.id == null) {
      throw ArgumentError.notNull('contact.id');
    }

    var $customerContactsDTO =
        customerContactsDTO.copyWith(contactId: contact.id);
    await session.db.updateRow<CustomerContactsDTO>(
      $customerContactsDTO,
      columns: [CustomerContactsDTO.t.contactId],
      transaction: transaction,
    );
  }
}
