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

abstract class ArtworkTemplatePreSelectionDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ArtworkTemplatePreSelectionDTO._({
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

  factory ArtworkTemplatePreSelectionDTO({
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
  }) = _ArtworkTemplatePreSelectionDTOImpl;

  factory ArtworkTemplatePreSelectionDTO.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return ArtworkTemplatePreSelectionDTO(
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

  static final t = ArtworkTemplatePreSelectionDTOTable();

  static const db = ArtworkTemplatePreSelectionDTORepository._();

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

  /// Returns a shallow copy of this [ArtworkTemplatePreSelectionDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ArtworkTemplatePreSelectionDTO copyWith({
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

  static ArtworkTemplatePreSelectionDTOInclude include(
      {_i2.CustomerDTOInclude? customer}) {
    return ArtworkTemplatePreSelectionDTOInclude._(customer: customer);
  }

  static ArtworkTemplatePreSelectionDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<ArtworkTemplatePreSelectionDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArtworkTemplatePreSelectionDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkTemplatePreSelectionDTOTable>? orderByList,
    ArtworkTemplatePreSelectionDTOInclude? include,
  }) {
    return ArtworkTemplatePreSelectionDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ArtworkTemplatePreSelectionDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ArtworkTemplatePreSelectionDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ArtworkTemplatePreSelectionDTOImpl
    extends ArtworkTemplatePreSelectionDTO {
  _ArtworkTemplatePreSelectionDTOImpl({
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

  /// Returns a shallow copy of this [ArtworkTemplatePreSelectionDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ArtworkTemplatePreSelectionDTO copyWith({
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
    return ArtworkTemplatePreSelectionDTO(
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

class ArtworkTemplatePreSelectionDTOTable extends _i1.Table<int?> {
  ArtworkTemplatePreSelectionDTOTable({super.tableRelation})
      : super(tableName: 'ed_prepress_artwork_template_pre_selection') {
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
      field: ArtworkTemplatePreSelectionDTO.t.customerId,
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

class ArtworkTemplatePreSelectionDTOInclude extends _i1.IncludeObject {
  ArtworkTemplatePreSelectionDTOInclude._({_i2.CustomerDTOInclude? customer}) {
    _customer = customer;
  }

  _i2.CustomerDTOInclude? _customer;

  @override
  Map<String, _i1.Include?> get includes => {'customer': _customer};

  @override
  _i1.Table<int?> get table => ArtworkTemplatePreSelectionDTO.t;
}

class ArtworkTemplatePreSelectionDTOIncludeList extends _i1.IncludeList {
  ArtworkTemplatePreSelectionDTOIncludeList._({
    _i1.WhereExpressionBuilder<ArtworkTemplatePreSelectionDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ArtworkTemplatePreSelectionDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ArtworkTemplatePreSelectionDTO.t;
}

class ArtworkTemplatePreSelectionDTORepository {
  const ArtworkTemplatePreSelectionDTORepository._();

  final attachRow = const ArtworkTemplatePreSelectionDTOAttachRowRepository._();

  final detachRow = const ArtworkTemplatePreSelectionDTODetachRowRepository._();

  /// Returns a list of [ArtworkTemplatePreSelectionDTO]s matching the given query parameters.
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
  Future<List<ArtworkTemplatePreSelectionDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkTemplatePreSelectionDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArtworkTemplatePreSelectionDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkTemplatePreSelectionDTOTable>? orderByList,
    _i1.Transaction? transaction,
    ArtworkTemplatePreSelectionDTOInclude? include,
  }) async {
    return session.db.find<ArtworkTemplatePreSelectionDTO>(
      where: where?.call(ArtworkTemplatePreSelectionDTO.t),
      orderBy: orderBy?.call(ArtworkTemplatePreSelectionDTO.t),
      orderByList: orderByList?.call(ArtworkTemplatePreSelectionDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [ArtworkTemplatePreSelectionDTO] matching the given query parameters.
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
  Future<ArtworkTemplatePreSelectionDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkTemplatePreSelectionDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<ArtworkTemplatePreSelectionDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkTemplatePreSelectionDTOTable>? orderByList,
    _i1.Transaction? transaction,
    ArtworkTemplatePreSelectionDTOInclude? include,
  }) async {
    return session.db.findFirstRow<ArtworkTemplatePreSelectionDTO>(
      where: where?.call(ArtworkTemplatePreSelectionDTO.t),
      orderBy: orderBy?.call(ArtworkTemplatePreSelectionDTO.t),
      orderByList: orderByList?.call(ArtworkTemplatePreSelectionDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [ArtworkTemplatePreSelectionDTO] by its [id] or null if no such row exists.
  Future<ArtworkTemplatePreSelectionDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ArtworkTemplatePreSelectionDTOInclude? include,
  }) async {
    return session.db.findById<ArtworkTemplatePreSelectionDTO>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [ArtworkTemplatePreSelectionDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [ArtworkTemplatePreSelectionDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ArtworkTemplatePreSelectionDTO>> insert(
    _i1.Session session,
    List<ArtworkTemplatePreSelectionDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ArtworkTemplatePreSelectionDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ArtworkTemplatePreSelectionDTO] and returns the inserted row.
  ///
  /// The returned [ArtworkTemplatePreSelectionDTO] will have its `id` field set.
  Future<ArtworkTemplatePreSelectionDTO> insertRow(
    _i1.Session session,
    ArtworkTemplatePreSelectionDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ArtworkTemplatePreSelectionDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ArtworkTemplatePreSelectionDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ArtworkTemplatePreSelectionDTO>> update(
    _i1.Session session,
    List<ArtworkTemplatePreSelectionDTO> rows, {
    _i1.ColumnSelections<ArtworkTemplatePreSelectionDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ArtworkTemplatePreSelectionDTO>(
      rows,
      columns: columns?.call(ArtworkTemplatePreSelectionDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ArtworkTemplatePreSelectionDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ArtworkTemplatePreSelectionDTO> updateRow(
    _i1.Session session,
    ArtworkTemplatePreSelectionDTO row, {
    _i1.ColumnSelections<ArtworkTemplatePreSelectionDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ArtworkTemplatePreSelectionDTO>(
      row,
      columns: columns?.call(ArtworkTemplatePreSelectionDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [ArtworkTemplatePreSelectionDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ArtworkTemplatePreSelectionDTO>> delete(
    _i1.Session session,
    List<ArtworkTemplatePreSelectionDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ArtworkTemplatePreSelectionDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ArtworkTemplatePreSelectionDTO].
  Future<ArtworkTemplatePreSelectionDTO> deleteRow(
    _i1.Session session,
    ArtworkTemplatePreSelectionDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ArtworkTemplatePreSelectionDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ArtworkTemplatePreSelectionDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ArtworkTemplatePreSelectionDTOTable>
        where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ArtworkTemplatePreSelectionDTO>(
      where: where(ArtworkTemplatePreSelectionDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkTemplatePreSelectionDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ArtworkTemplatePreSelectionDTO>(
      where: where?.call(ArtworkTemplatePreSelectionDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ArtworkTemplatePreSelectionDTOAttachRowRepository {
  const ArtworkTemplatePreSelectionDTOAttachRowRepository._();

  /// Creates a relation between the given [ArtworkTemplatePreSelectionDTO] and [CustomerDTO]
  /// by setting the [ArtworkTemplatePreSelectionDTO]'s foreign key `customerId` to refer to the [CustomerDTO].
  Future<void> customer(
    _i1.Session session,
    ArtworkTemplatePreSelectionDTO artworkTemplatePreSelectionDTO,
    _i2.CustomerDTO customer, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkTemplatePreSelectionDTO.id == null) {
      throw ArgumentError.notNull('artworkTemplatePreSelectionDTO.id');
    }
    if (customer.id == null) {
      throw ArgumentError.notNull('customer.id');
    }

    var $artworkTemplatePreSelectionDTO =
        artworkTemplatePreSelectionDTO.copyWith(customerId: customer.id);
    await session.db.updateRow<ArtworkTemplatePreSelectionDTO>(
      $artworkTemplatePreSelectionDTO,
      columns: [ArtworkTemplatePreSelectionDTO.t.customerId],
      transaction: transaction,
    );
  }
}

class ArtworkTemplatePreSelectionDTODetachRowRepository {
  const ArtworkTemplatePreSelectionDTODetachRowRepository._();

  /// Detaches the relation between this [ArtworkTemplatePreSelectionDTO] and the [CustomerDTO] set in `customer`
  /// by setting the [ArtworkTemplatePreSelectionDTO]'s foreign key `customerId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> customer(
    _i1.Session session,
    ArtworkTemplatePreSelectionDTO artworktemplatepreselectiondto, {
    _i1.Transaction? transaction,
  }) async {
    if (artworktemplatepreselectiondto.id == null) {
      throw ArgumentError.notNull('artworktemplatepreselectiondto.id');
    }

    var $artworktemplatepreselectiondto =
        artworktemplatepreselectiondto.copyWith(customerId: null);
    await session.db.updateRow<ArtworkTemplatePreSelectionDTO>(
      $artworktemplatepreselectiondto,
      columns: [ArtworkTemplatePreSelectionDTO.t.customerId],
      transaction: transaction,
    );
  }
}
