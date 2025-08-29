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
import '../../../../modules/crm/contact/models/contact.dart' as _i2;

abstract class AppClientDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  AppClientDTO._({
    this.id,
    this.contactId,
    this.contact,
    required this.description,
    required this.automationEngine,
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

  factory AppClientDTO({
    int? id,
    int? contactId,
    _i2.ContactDTO? contact,
    required String description,
    required String automationEngine,
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
  }) = _AppClientDTOImpl;

  factory AppClientDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return AppClientDTO(
      id: jsonSerialization['id'] as int?,
      contactId: jsonSerialization['contactId'] as int?,
      contact: jsonSerialization['contact'] == null
          ? null
          : _i2.ContactDTO.fromJson(
              (jsonSerialization['contact'] as Map<String, dynamic>)),
      description: jsonSerialization['description'] as String,
      automationEngine: jsonSerialization['automationEngine'] as String,
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

  static final t = AppClientDTOTable();

  static const db = AppClientDTORepository._();

  @override
  int? id;

  int? contactId;

  _i2.ContactDTO? contact;

  String description;

  String automationEngine;

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

  /// Returns a shallow copy of this [AppClientDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AppClientDTO copyWith({
    int? id,
    int? contactId,
    _i2.ContactDTO? contact,
    String? description,
    String? automationEngine,
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
      if (contactId != null) 'contactId': contactId,
      if (contact != null) 'contact': contact?.toJson(),
      'description': description,
      'automationEngine': automationEngine,
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
      if (contactId != null) 'contactId': contactId,
      if (contact != null) 'contact': contact?.toJsonForProtocol(),
      'description': description,
      'automationEngine': automationEngine,
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

  static AppClientDTOInclude include({_i2.ContactDTOInclude? contact}) {
    return AppClientDTOInclude._(contact: contact);
  }

  static AppClientDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<AppClientDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AppClientDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AppClientDTOTable>? orderByList,
    AppClientDTOInclude? include,
  }) {
    return AppClientDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(AppClientDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(AppClientDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AppClientDTOImpl extends AppClientDTO {
  _AppClientDTOImpl({
    int? id,
    int? contactId,
    _i2.ContactDTO? contact,
    required String description,
    required String automationEngine,
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
          contactId: contactId,
          contact: contact,
          description: description,
          automationEngine: automationEngine,
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

  /// Returns a shallow copy of this [AppClientDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AppClientDTO copyWith({
    Object? id = _Undefined,
    Object? contactId = _Undefined,
    Object? contact = _Undefined,
    String? description,
    String? automationEngine,
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
    return AppClientDTO(
      id: id is int? ? id : this.id,
      contactId: contactId is int? ? contactId : this.contactId,
      contact: contact is _i2.ContactDTO? ? contact : this.contact?.copyWith(),
      description: description ?? this.description,
      automationEngine: automationEngine ?? this.automationEngine,
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

class AppClientDTOTable extends _i1.Table<int?> {
  AppClientDTOTable({super.tableRelation})
      : super(tableName: 'ed_crm_app_client') {
    contactId = _i1.ColumnInt(
      'contactId',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    automationEngine = _i1.ColumnString(
      'automationEngine',
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

  late final _i1.ColumnInt contactId;

  _i2.ContactDTOTable? _contact;

  late final _i1.ColumnString description;

  late final _i1.ColumnString automationEngine;

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

  _i2.ContactDTOTable get contact {
    if (_contact != null) return _contact!;
    _contact = _i1.createRelationTable(
      relationFieldName: 'contact',
      field: AppClientDTO.t.contactId,
      foreignField: _i2.ContactDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ContactDTOTable(tableRelation: foreignTableRelation),
    );
    return _contact!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        contactId,
        description,
        automationEngine,
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
    if (relationField == 'contact') {
      return contact;
    }
    return null;
  }
}

class AppClientDTOInclude extends _i1.IncludeObject {
  AppClientDTOInclude._({_i2.ContactDTOInclude? contact}) {
    _contact = contact;
  }

  _i2.ContactDTOInclude? _contact;

  @override
  Map<String, _i1.Include?> get includes => {'contact': _contact};

  @override
  _i1.Table<int?> get table => AppClientDTO.t;
}

class AppClientDTOIncludeList extends _i1.IncludeList {
  AppClientDTOIncludeList._({
    _i1.WhereExpressionBuilder<AppClientDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(AppClientDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => AppClientDTO.t;
}

class AppClientDTORepository {
  const AppClientDTORepository._();

  final attachRow = const AppClientDTOAttachRowRepository._();

  final detachRow = const AppClientDTODetachRowRepository._();

  /// Returns a list of [AppClientDTO]s matching the given query parameters.
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
  Future<List<AppClientDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AppClientDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AppClientDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AppClientDTOTable>? orderByList,
    _i1.Transaction? transaction,
    AppClientDTOInclude? include,
  }) async {
    return session.db.find<AppClientDTO>(
      where: where?.call(AppClientDTO.t),
      orderBy: orderBy?.call(AppClientDTO.t),
      orderByList: orderByList?.call(AppClientDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [AppClientDTO] matching the given query parameters.
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
  Future<AppClientDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AppClientDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<AppClientDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AppClientDTOTable>? orderByList,
    _i1.Transaction? transaction,
    AppClientDTOInclude? include,
  }) async {
    return session.db.findFirstRow<AppClientDTO>(
      where: where?.call(AppClientDTO.t),
      orderBy: orderBy?.call(AppClientDTO.t),
      orderByList: orderByList?.call(AppClientDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [AppClientDTO] by its [id] or null if no such row exists.
  Future<AppClientDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    AppClientDTOInclude? include,
  }) async {
    return session.db.findById<AppClientDTO>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [AppClientDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [AppClientDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<AppClientDTO>> insert(
    _i1.Session session,
    List<AppClientDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<AppClientDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [AppClientDTO] and returns the inserted row.
  ///
  /// The returned [AppClientDTO] will have its `id` field set.
  Future<AppClientDTO> insertRow(
    _i1.Session session,
    AppClientDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<AppClientDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [AppClientDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<AppClientDTO>> update(
    _i1.Session session,
    List<AppClientDTO> rows, {
    _i1.ColumnSelections<AppClientDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<AppClientDTO>(
      rows,
      columns: columns?.call(AppClientDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [AppClientDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<AppClientDTO> updateRow(
    _i1.Session session,
    AppClientDTO row, {
    _i1.ColumnSelections<AppClientDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<AppClientDTO>(
      row,
      columns: columns?.call(AppClientDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [AppClientDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<AppClientDTO>> delete(
    _i1.Session session,
    List<AppClientDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<AppClientDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [AppClientDTO].
  Future<AppClientDTO> deleteRow(
    _i1.Session session,
    AppClientDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<AppClientDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<AppClientDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<AppClientDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<AppClientDTO>(
      where: where(AppClientDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AppClientDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<AppClientDTO>(
      where: where?.call(AppClientDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class AppClientDTOAttachRowRepository {
  const AppClientDTOAttachRowRepository._();

  /// Creates a relation between the given [AppClientDTO] and [ContactDTO]
  /// by setting the [AppClientDTO]'s foreign key `contactId` to refer to the [ContactDTO].
  Future<void> contact(
    _i1.Session session,
    AppClientDTO appClientDTO,
    _i2.ContactDTO contact, {
    _i1.Transaction? transaction,
  }) async {
    if (appClientDTO.id == null) {
      throw ArgumentError.notNull('appClientDTO.id');
    }
    if (contact.id == null) {
      throw ArgumentError.notNull('contact.id');
    }

    var $appClientDTO = appClientDTO.copyWith(contactId: contact.id);
    await session.db.updateRow<AppClientDTO>(
      $appClientDTO,
      columns: [AppClientDTO.t.contactId],
      transaction: transaction,
    );
  }
}

class AppClientDTODetachRowRepository {
  const AppClientDTODetachRowRepository._();

  /// Detaches the relation between this [AppClientDTO] and the [ContactDTO] set in `contact`
  /// by setting the [AppClientDTO]'s foreign key `contactId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> contact(
    _i1.Session session,
    AppClientDTO appclientdto, {
    _i1.Transaction? transaction,
  }) async {
    if (appclientdto.id == null) {
      throw ArgumentError.notNull('appclientdto.id');
    }

    var $appclientdto = appclientdto.copyWith(contactId: null);
    await session.db.updateRow<AppClientDTO>(
      $appclientdto,
      columns: [AppClientDTO.t.contactId],
      transaction: transaction,
    );
  }
}
