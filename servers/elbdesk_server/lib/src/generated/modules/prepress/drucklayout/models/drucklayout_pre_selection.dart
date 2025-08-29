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

abstract class DrucklayoutPreSelectionDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  DrucklayoutPreSelectionDTO._({
    this.id,
    this.customerId,
    this.customer,
    required this.description,
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

  factory DrucklayoutPreSelectionDTO({
    int? id,
    int? customerId,
    _i2.CustomerDTO? customer,
    required String description,
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
  }) = _DrucklayoutPreSelectionDTOImpl;

  factory DrucklayoutPreSelectionDTO.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return DrucklayoutPreSelectionDTO(
      id: jsonSerialization['id'] as int?,
      customerId: jsonSerialization['customerId'] as int?,
      customer: jsonSerialization['customer'] == null
          ? null
          : _i2.CustomerDTO.fromJson(
              (jsonSerialization['customer'] as Map<String, dynamic>)),
      description: jsonSerialization['description'] as String,
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

  static final t = DrucklayoutPreSelectionDTOTable();

  static const db = DrucklayoutPreSelectionDTORepository._();

  @override
  int? id;

  int? customerId;

  _i2.CustomerDTO? customer;

  String description;

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

  /// Returns a shallow copy of this [DrucklayoutPreSelectionDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DrucklayoutPreSelectionDTO copyWith({
    int? id,
    int? customerId,
    _i2.CustomerDTO? customer,
    String? description,
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
      if (customerId != null) 'customerId': customerId,
      if (customer != null) 'customer': customer?.toJson(),
      'description': description,
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
      if (customerId != null) 'customerId': customerId,
      if (customer != null) 'customer': customer?.toJsonForProtocol(),
      'description': description,
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

  static DrucklayoutPreSelectionDTOInclude include(
      {_i2.CustomerDTOInclude? customer}) {
    return DrucklayoutPreSelectionDTOInclude._(customer: customer);
  }

  static DrucklayoutPreSelectionDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<DrucklayoutPreSelectionDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DrucklayoutPreSelectionDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DrucklayoutPreSelectionDTOTable>? orderByList,
    DrucklayoutPreSelectionDTOInclude? include,
  }) {
    return DrucklayoutPreSelectionDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DrucklayoutPreSelectionDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(DrucklayoutPreSelectionDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DrucklayoutPreSelectionDTOImpl extends DrucklayoutPreSelectionDTO {
  _DrucklayoutPreSelectionDTOImpl({
    int? id,
    int? customerId,
    _i2.CustomerDTO? customer,
    required String description,
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
          description: description,
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

  /// Returns a shallow copy of this [DrucklayoutPreSelectionDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DrucklayoutPreSelectionDTO copyWith({
    Object? id = _Undefined,
    Object? customerId = _Undefined,
    Object? customer = _Undefined,
    String? description,
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
    return DrucklayoutPreSelectionDTO(
      id: id is int? ? id : this.id,
      customerId: customerId is int? ? customerId : this.customerId,
      customer:
          customer is _i2.CustomerDTO? ? customer : this.customer?.copyWith(),
      description: description ?? this.description,
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

class DrucklayoutPreSelectionDTOTable extends _i1.Table<int?> {
  DrucklayoutPreSelectionDTOTable({super.tableRelation})
      : super(tableName: 'ed_prepress_drucklayout_pre_selection') {
    customerId = _i1.ColumnInt(
      'customerId',
      this,
    );
    description = _i1.ColumnString(
      'description',
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

  late final _i1.ColumnString description;

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
      field: DrucklayoutPreSelectionDTO.t.customerId,
      foreignField: _i2.CustomerDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.CustomerDTOTable(tableRelation: foreignTableRelation),
    );
    return _customer!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        customerId,
        description,
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
    return null;
  }
}

class DrucklayoutPreSelectionDTOInclude extends _i1.IncludeObject {
  DrucklayoutPreSelectionDTOInclude._({_i2.CustomerDTOInclude? customer}) {
    _customer = customer;
  }

  _i2.CustomerDTOInclude? _customer;

  @override
  Map<String, _i1.Include?> get includes => {'customer': _customer};

  @override
  _i1.Table<int?> get table => DrucklayoutPreSelectionDTO.t;
}

class DrucklayoutPreSelectionDTOIncludeList extends _i1.IncludeList {
  DrucklayoutPreSelectionDTOIncludeList._({
    _i1.WhereExpressionBuilder<DrucklayoutPreSelectionDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(DrucklayoutPreSelectionDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => DrucklayoutPreSelectionDTO.t;
}

class DrucklayoutPreSelectionDTORepository {
  const DrucklayoutPreSelectionDTORepository._();

  final attachRow = const DrucklayoutPreSelectionDTOAttachRowRepository._();

  final detachRow = const DrucklayoutPreSelectionDTODetachRowRepository._();

  /// Returns a list of [DrucklayoutPreSelectionDTO]s matching the given query parameters.
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
  Future<List<DrucklayoutPreSelectionDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DrucklayoutPreSelectionDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DrucklayoutPreSelectionDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DrucklayoutPreSelectionDTOTable>? orderByList,
    _i1.Transaction? transaction,
    DrucklayoutPreSelectionDTOInclude? include,
  }) async {
    return session.db.find<DrucklayoutPreSelectionDTO>(
      where: where?.call(DrucklayoutPreSelectionDTO.t),
      orderBy: orderBy?.call(DrucklayoutPreSelectionDTO.t),
      orderByList: orderByList?.call(DrucklayoutPreSelectionDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [DrucklayoutPreSelectionDTO] matching the given query parameters.
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
  Future<DrucklayoutPreSelectionDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DrucklayoutPreSelectionDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<DrucklayoutPreSelectionDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DrucklayoutPreSelectionDTOTable>? orderByList,
    _i1.Transaction? transaction,
    DrucklayoutPreSelectionDTOInclude? include,
  }) async {
    return session.db.findFirstRow<DrucklayoutPreSelectionDTO>(
      where: where?.call(DrucklayoutPreSelectionDTO.t),
      orderBy: orderBy?.call(DrucklayoutPreSelectionDTO.t),
      orderByList: orderByList?.call(DrucklayoutPreSelectionDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [DrucklayoutPreSelectionDTO] by its [id] or null if no such row exists.
  Future<DrucklayoutPreSelectionDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    DrucklayoutPreSelectionDTOInclude? include,
  }) async {
    return session.db.findById<DrucklayoutPreSelectionDTO>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [DrucklayoutPreSelectionDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [DrucklayoutPreSelectionDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<DrucklayoutPreSelectionDTO>> insert(
    _i1.Session session,
    List<DrucklayoutPreSelectionDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<DrucklayoutPreSelectionDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [DrucklayoutPreSelectionDTO] and returns the inserted row.
  ///
  /// The returned [DrucklayoutPreSelectionDTO] will have its `id` field set.
  Future<DrucklayoutPreSelectionDTO> insertRow(
    _i1.Session session,
    DrucklayoutPreSelectionDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<DrucklayoutPreSelectionDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [DrucklayoutPreSelectionDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<DrucklayoutPreSelectionDTO>> update(
    _i1.Session session,
    List<DrucklayoutPreSelectionDTO> rows, {
    _i1.ColumnSelections<DrucklayoutPreSelectionDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<DrucklayoutPreSelectionDTO>(
      rows,
      columns: columns?.call(DrucklayoutPreSelectionDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [DrucklayoutPreSelectionDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<DrucklayoutPreSelectionDTO> updateRow(
    _i1.Session session,
    DrucklayoutPreSelectionDTO row, {
    _i1.ColumnSelections<DrucklayoutPreSelectionDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<DrucklayoutPreSelectionDTO>(
      row,
      columns: columns?.call(DrucklayoutPreSelectionDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [DrucklayoutPreSelectionDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<DrucklayoutPreSelectionDTO>> delete(
    _i1.Session session,
    List<DrucklayoutPreSelectionDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<DrucklayoutPreSelectionDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [DrucklayoutPreSelectionDTO].
  Future<DrucklayoutPreSelectionDTO> deleteRow(
    _i1.Session session,
    DrucklayoutPreSelectionDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<DrucklayoutPreSelectionDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<DrucklayoutPreSelectionDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<DrucklayoutPreSelectionDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<DrucklayoutPreSelectionDTO>(
      where: where(DrucklayoutPreSelectionDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DrucklayoutPreSelectionDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<DrucklayoutPreSelectionDTO>(
      where: where?.call(DrucklayoutPreSelectionDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class DrucklayoutPreSelectionDTOAttachRowRepository {
  const DrucklayoutPreSelectionDTOAttachRowRepository._();

  /// Creates a relation between the given [DrucklayoutPreSelectionDTO] and [CustomerDTO]
  /// by setting the [DrucklayoutPreSelectionDTO]'s foreign key `customerId` to refer to the [CustomerDTO].
  Future<void> customer(
    _i1.Session session,
    DrucklayoutPreSelectionDTO drucklayoutPreSelectionDTO,
    _i2.CustomerDTO customer, {
    _i1.Transaction? transaction,
  }) async {
    if (drucklayoutPreSelectionDTO.id == null) {
      throw ArgumentError.notNull('drucklayoutPreSelectionDTO.id');
    }
    if (customer.id == null) {
      throw ArgumentError.notNull('customer.id');
    }

    var $drucklayoutPreSelectionDTO =
        drucklayoutPreSelectionDTO.copyWith(customerId: customer.id);
    await session.db.updateRow<DrucklayoutPreSelectionDTO>(
      $drucklayoutPreSelectionDTO,
      columns: [DrucklayoutPreSelectionDTO.t.customerId],
      transaction: transaction,
    );
  }
}

class DrucklayoutPreSelectionDTODetachRowRepository {
  const DrucklayoutPreSelectionDTODetachRowRepository._();

  /// Detaches the relation between this [DrucklayoutPreSelectionDTO] and the [CustomerDTO] set in `customer`
  /// by setting the [DrucklayoutPreSelectionDTO]'s foreign key `customerId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> customer(
    _i1.Session session,
    DrucklayoutPreSelectionDTO drucklayoutpreselectiondto, {
    _i1.Transaction? transaction,
  }) async {
    if (drucklayoutpreselectiondto.id == null) {
      throw ArgumentError.notNull('drucklayoutpreselectiondto.id');
    }

    var $drucklayoutpreselectiondto =
        drucklayoutpreselectiondto.copyWith(customerId: null);
    await session.db.updateRow<DrucklayoutPreSelectionDTO>(
      $drucklayoutpreselectiondto,
      columns: [DrucklayoutPreSelectionDTO.t.customerId],
      transaction: transaction,
    );
  }
}
