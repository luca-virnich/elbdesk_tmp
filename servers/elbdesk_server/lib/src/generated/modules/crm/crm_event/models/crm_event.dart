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
import '../../../../modules/crm/crm_event/models/crm_event_contact_jt.dart'
    as _i2;

abstract class CrmEventDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  CrmEventDTO._({
    this.id,
    required this.name,
    required this.description,
    required this.startDate,
    this.endDate,
    this.executionDate,
    required this.status,
    this.contacts,
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

  factory CrmEventDTO({
    int? id,
    required String name,
    required String description,
    required DateTime startDate,
    DateTime? endDate,
    DateTime? executionDate,
    required String status,
    List<_i2.CrmEventContactJT>? contacts,
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
  }) = _CrmEventDTOImpl;

  factory CrmEventDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return CrmEventDTO(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String,
      startDate:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['startDate']),
      endDate: jsonSerialization['endDate'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['endDate']),
      executionDate: jsonSerialization['executionDate'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['executionDate']),
      status: jsonSerialization['status'] as String,
      contacts: (jsonSerialization['contacts'] as List?)
          ?.map((e) =>
              _i2.CrmEventContactJT.fromJson((e as Map<String, dynamic>)))
          .toList(),
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

  static final t = CrmEventDTOTable();

  static const db = CrmEventDTORepository._();

  @override
  int? id;

  String name;

  String description;

  DateTime startDate;

  DateTime? endDate;

  DateTime? executionDate;

  String status;

  List<_i2.CrmEventContactJT>? contacts;

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

  /// Returns a shallow copy of this [CrmEventDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CrmEventDTO copyWith({
    int? id,
    String? name,
    String? description,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? executionDate,
    String? status,
    List<_i2.CrmEventContactJT>? contacts,
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
      'name': name,
      'description': description,
      'startDate': startDate.toJson(),
      if (endDate != null) 'endDate': endDate?.toJson(),
      if (executionDate != null) 'executionDate': executionDate?.toJson(),
      'status': status,
      if (contacts != null)
        'contacts': contacts?.toJson(valueToJson: (v) => v.toJson()),
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
      'name': name,
      'description': description,
      'startDate': startDate.toJson(),
      if (endDate != null) 'endDate': endDate?.toJson(),
      if (executionDate != null) 'executionDate': executionDate?.toJson(),
      'status': status,
      if (contacts != null)
        'contacts': contacts?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
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

  static CrmEventDTOInclude include(
      {_i2.CrmEventContactJTIncludeList? contacts}) {
    return CrmEventDTOInclude._(contacts: contacts);
  }

  static CrmEventDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<CrmEventDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CrmEventDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CrmEventDTOTable>? orderByList,
    CrmEventDTOInclude? include,
  }) {
    return CrmEventDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CrmEventDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(CrmEventDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CrmEventDTOImpl extends CrmEventDTO {
  _CrmEventDTOImpl({
    int? id,
    required String name,
    required String description,
    required DateTime startDate,
    DateTime? endDate,
    DateTime? executionDate,
    required String status,
    List<_i2.CrmEventContactJT>? contacts,
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
          name: name,
          description: description,
          startDate: startDate,
          endDate: endDate,
          executionDate: executionDate,
          status: status,
          contacts: contacts,
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

  /// Returns a shallow copy of this [CrmEventDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CrmEventDTO copyWith({
    Object? id = _Undefined,
    String? name,
    String? description,
    DateTime? startDate,
    Object? endDate = _Undefined,
    Object? executionDate = _Undefined,
    String? status,
    Object? contacts = _Undefined,
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
    return CrmEventDTO(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      startDate: startDate ?? this.startDate,
      endDate: endDate is DateTime? ? endDate : this.endDate,
      executionDate:
          executionDate is DateTime? ? executionDate : this.executionDate,
      status: status ?? this.status,
      contacts: contacts is List<_i2.CrmEventContactJT>?
          ? contacts
          : this.contacts?.map((e0) => e0.copyWith()).toList(),
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

class CrmEventDTOTable extends _i1.Table<int?> {
  CrmEventDTOTable({super.tableRelation}) : super(tableName: 'ed_crm_event') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    startDate = _i1.ColumnDateTime(
      'startDate',
      this,
    );
    endDate = _i1.ColumnDateTime(
      'endDate',
      this,
    );
    executionDate = _i1.ColumnDateTime(
      'executionDate',
      this,
    );
    status = _i1.ColumnString(
      'status',
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

  late final _i1.ColumnString name;

  late final _i1.ColumnString description;

  late final _i1.ColumnDateTime startDate;

  late final _i1.ColumnDateTime endDate;

  late final _i1.ColumnDateTime executionDate;

  late final _i1.ColumnString status;

  _i2.CrmEventContactJTTable? ___contacts;

  _i1.ManyRelation<_i2.CrmEventContactJTTable>? _contacts;

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

  _i2.CrmEventContactJTTable get __contacts {
    if (___contacts != null) return ___contacts!;
    ___contacts = _i1.createRelationTable(
      relationFieldName: '__contacts',
      field: CrmEventDTO.t.id,
      foreignField: _i2.CrmEventContactJT.t.crmEventId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.CrmEventContactJTTable(tableRelation: foreignTableRelation),
    );
    return ___contacts!;
  }

  _i1.ManyRelation<_i2.CrmEventContactJTTable> get contacts {
    if (_contacts != null) return _contacts!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'contacts',
      field: CrmEventDTO.t.id,
      foreignField: _i2.CrmEventContactJT.t.crmEventId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.CrmEventContactJTTable(tableRelation: foreignTableRelation),
    );
    _contacts = _i1.ManyRelation<_i2.CrmEventContactJTTable>(
      tableWithRelations: relationTable,
      table: _i2.CrmEventContactJTTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _contacts!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        description,
        startDate,
        endDate,
        executionDate,
        status,
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
    if (relationField == 'contacts') {
      return __contacts;
    }
    return null;
  }
}

class CrmEventDTOInclude extends _i1.IncludeObject {
  CrmEventDTOInclude._({_i2.CrmEventContactJTIncludeList? contacts}) {
    _contacts = contacts;
  }

  _i2.CrmEventContactJTIncludeList? _contacts;

  @override
  Map<String, _i1.Include?> get includes => {'contacts': _contacts};

  @override
  _i1.Table<int?> get table => CrmEventDTO.t;
}

class CrmEventDTOIncludeList extends _i1.IncludeList {
  CrmEventDTOIncludeList._({
    _i1.WhereExpressionBuilder<CrmEventDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CrmEventDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => CrmEventDTO.t;
}

class CrmEventDTORepository {
  const CrmEventDTORepository._();

  final attach = const CrmEventDTOAttachRepository._();

  final attachRow = const CrmEventDTOAttachRowRepository._();

  final detach = const CrmEventDTODetachRepository._();

  final detachRow = const CrmEventDTODetachRowRepository._();

  /// Returns a list of [CrmEventDTO]s matching the given query parameters.
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
  Future<List<CrmEventDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CrmEventDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CrmEventDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CrmEventDTOTable>? orderByList,
    _i1.Transaction? transaction,
    CrmEventDTOInclude? include,
  }) async {
    return session.db.find<CrmEventDTO>(
      where: where?.call(CrmEventDTO.t),
      orderBy: orderBy?.call(CrmEventDTO.t),
      orderByList: orderByList?.call(CrmEventDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [CrmEventDTO] matching the given query parameters.
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
  Future<CrmEventDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CrmEventDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<CrmEventDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CrmEventDTOTable>? orderByList,
    _i1.Transaction? transaction,
    CrmEventDTOInclude? include,
  }) async {
    return session.db.findFirstRow<CrmEventDTO>(
      where: where?.call(CrmEventDTO.t),
      orderBy: orderBy?.call(CrmEventDTO.t),
      orderByList: orderByList?.call(CrmEventDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [CrmEventDTO] by its [id] or null if no such row exists.
  Future<CrmEventDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    CrmEventDTOInclude? include,
  }) async {
    return session.db.findById<CrmEventDTO>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [CrmEventDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [CrmEventDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<CrmEventDTO>> insert(
    _i1.Session session,
    List<CrmEventDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<CrmEventDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [CrmEventDTO] and returns the inserted row.
  ///
  /// The returned [CrmEventDTO] will have its `id` field set.
  Future<CrmEventDTO> insertRow(
    _i1.Session session,
    CrmEventDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<CrmEventDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [CrmEventDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<CrmEventDTO>> update(
    _i1.Session session,
    List<CrmEventDTO> rows, {
    _i1.ColumnSelections<CrmEventDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<CrmEventDTO>(
      rows,
      columns: columns?.call(CrmEventDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CrmEventDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CrmEventDTO> updateRow(
    _i1.Session session,
    CrmEventDTO row, {
    _i1.ColumnSelections<CrmEventDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<CrmEventDTO>(
      row,
      columns: columns?.call(CrmEventDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [CrmEventDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<CrmEventDTO>> delete(
    _i1.Session session,
    List<CrmEventDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<CrmEventDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [CrmEventDTO].
  Future<CrmEventDTO> deleteRow(
    _i1.Session session,
    CrmEventDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CrmEventDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<CrmEventDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CrmEventDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<CrmEventDTO>(
      where: where(CrmEventDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CrmEventDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<CrmEventDTO>(
      where: where?.call(CrmEventDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class CrmEventDTOAttachRepository {
  const CrmEventDTOAttachRepository._();

  /// Creates a relation between this [CrmEventDTO] and the given [CrmEventContactJT]s
  /// by setting each [CrmEventContactJT]'s foreign key `crmEventId` to refer to this [CrmEventDTO].
  Future<void> contacts(
    _i1.Session session,
    CrmEventDTO crmEventDTO,
    List<_i2.CrmEventContactJT> crmEventContactJT, {
    _i1.Transaction? transaction,
  }) async {
    if (crmEventContactJT.any((e) => e.id == null)) {
      throw ArgumentError.notNull('crmEventContactJT.id');
    }
    if (crmEventDTO.id == null) {
      throw ArgumentError.notNull('crmEventDTO.id');
    }

    var $crmEventContactJT = crmEventContactJT
        .map((e) => e.copyWith(crmEventId: crmEventDTO.id))
        .toList();
    await session.db.update<_i2.CrmEventContactJT>(
      $crmEventContactJT,
      columns: [_i2.CrmEventContactJT.t.crmEventId],
      transaction: transaction,
    );
  }
}

class CrmEventDTOAttachRowRepository {
  const CrmEventDTOAttachRowRepository._();

  /// Creates a relation between this [CrmEventDTO] and the given [CrmEventContactJT]
  /// by setting the [CrmEventContactJT]'s foreign key `crmEventId` to refer to this [CrmEventDTO].
  Future<void> contacts(
    _i1.Session session,
    CrmEventDTO crmEventDTO,
    _i2.CrmEventContactJT crmEventContactJT, {
    _i1.Transaction? transaction,
  }) async {
    if (crmEventContactJT.id == null) {
      throw ArgumentError.notNull('crmEventContactJT.id');
    }
    if (crmEventDTO.id == null) {
      throw ArgumentError.notNull('crmEventDTO.id');
    }

    var $crmEventContactJT =
        crmEventContactJT.copyWith(crmEventId: crmEventDTO.id);
    await session.db.updateRow<_i2.CrmEventContactJT>(
      $crmEventContactJT,
      columns: [_i2.CrmEventContactJT.t.crmEventId],
      transaction: transaction,
    );
  }
}

class CrmEventDTODetachRepository {
  const CrmEventDTODetachRepository._();

  /// Detaches the relation between this [CrmEventDTO] and the given [CrmEventContactJT]
  /// by setting the [CrmEventContactJT]'s foreign key `crmEventId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> contacts(
    _i1.Session session,
    List<_i2.CrmEventContactJT> crmEventContactJT, {
    _i1.Transaction? transaction,
  }) async {
    if (crmEventContactJT.any((e) => e.id == null)) {
      throw ArgumentError.notNull('crmEventContactJT.id');
    }

    var $crmEventContactJT =
        crmEventContactJT.map((e) => e.copyWith(crmEventId: null)).toList();
    await session.db.update<_i2.CrmEventContactJT>(
      $crmEventContactJT,
      columns: [_i2.CrmEventContactJT.t.crmEventId],
      transaction: transaction,
    );
  }
}

class CrmEventDTODetachRowRepository {
  const CrmEventDTODetachRowRepository._();

  /// Detaches the relation between this [CrmEventDTO] and the given [CrmEventContactJT]
  /// by setting the [CrmEventContactJT]'s foreign key `crmEventId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> contacts(
    _i1.Session session,
    _i2.CrmEventContactJT crmEventContactJT, {
    _i1.Transaction? transaction,
  }) async {
    if (crmEventContactJT.id == null) {
      throw ArgumentError.notNull('crmEventContactJT.id');
    }

    var $crmEventContactJT = crmEventContactJT.copyWith(crmEventId: null);
    await session.db.updateRow<_i2.CrmEventContactJT>(
      $crmEventContactJT,
      columns: [_i2.CrmEventContactJT.t.crmEventId],
      transaction: transaction,
    );
  }
}
