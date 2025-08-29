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

abstract class ArtworkTemplateSelectionDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ArtworkTemplateSelectionDTO._({
    this.id,
    required this.artworkTemplatePreSelectionId,
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

  factory ArtworkTemplateSelectionDTO({
    int? id,
    required int artworkTemplatePreSelectionId,
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
  }) = _ArtworkTemplateSelectionDTOImpl;

  factory ArtworkTemplateSelectionDTO.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return ArtworkTemplateSelectionDTO(
      id: jsonSerialization['id'] as int?,
      artworkTemplatePreSelectionId:
          jsonSerialization['artworkTemplatePreSelectionId'] as int,
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

  static final t = ArtworkTemplateSelectionDTOTable();

  static const db = ArtworkTemplateSelectionDTORepository._();

  @override
  int? id;

  int artworkTemplatePreSelectionId;

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

  /// Returns a shallow copy of this [ArtworkTemplateSelectionDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ArtworkTemplateSelectionDTO copyWith({
    int? id,
    int? artworkTemplatePreSelectionId,
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
      'artworkTemplatePreSelectionId': artworkTemplatePreSelectionId,
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
      'artworkTemplatePreSelectionId': artworkTemplatePreSelectionId,
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

  static ArtworkTemplateSelectionDTOInclude include() {
    return ArtworkTemplateSelectionDTOInclude._();
  }

  static ArtworkTemplateSelectionDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<ArtworkTemplateSelectionDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArtworkTemplateSelectionDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkTemplateSelectionDTOTable>? orderByList,
    ArtworkTemplateSelectionDTOInclude? include,
  }) {
    return ArtworkTemplateSelectionDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ArtworkTemplateSelectionDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ArtworkTemplateSelectionDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ArtworkTemplateSelectionDTOImpl extends ArtworkTemplateSelectionDTO {
  _ArtworkTemplateSelectionDTOImpl({
    int? id,
    required int artworkTemplatePreSelectionId,
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
          artworkTemplatePreSelectionId: artworkTemplatePreSelectionId,
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

  /// Returns a shallow copy of this [ArtworkTemplateSelectionDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ArtworkTemplateSelectionDTO copyWith({
    Object? id = _Undefined,
    int? artworkTemplatePreSelectionId,
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
    return ArtworkTemplateSelectionDTO(
      id: id is int? ? id : this.id,
      artworkTemplatePreSelectionId:
          artworkTemplatePreSelectionId ?? this.artworkTemplatePreSelectionId,
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

class ArtworkTemplateSelectionDTOTable extends _i1.Table<int?> {
  ArtworkTemplateSelectionDTOTable({super.tableRelation})
      : super(tableName: 'ed_prepress_artwork_template_selection') {
    artworkTemplatePreSelectionId = _i1.ColumnInt(
      'artworkTemplatePreSelectionId',
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

  late final _i1.ColumnInt artworkTemplatePreSelectionId;

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

  @override
  List<_i1.Column> get columns => [
        id,
        artworkTemplatePreSelectionId,
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
}

class ArtworkTemplateSelectionDTOInclude extends _i1.IncludeObject {
  ArtworkTemplateSelectionDTOInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => ArtworkTemplateSelectionDTO.t;
}

class ArtworkTemplateSelectionDTOIncludeList extends _i1.IncludeList {
  ArtworkTemplateSelectionDTOIncludeList._({
    _i1.WhereExpressionBuilder<ArtworkTemplateSelectionDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ArtworkTemplateSelectionDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ArtworkTemplateSelectionDTO.t;
}

class ArtworkTemplateSelectionDTORepository {
  const ArtworkTemplateSelectionDTORepository._();

  /// Returns a list of [ArtworkTemplateSelectionDTO]s matching the given query parameters.
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
  Future<List<ArtworkTemplateSelectionDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkTemplateSelectionDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArtworkTemplateSelectionDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkTemplateSelectionDTOTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<ArtworkTemplateSelectionDTO>(
      where: where?.call(ArtworkTemplateSelectionDTO.t),
      orderBy: orderBy?.call(ArtworkTemplateSelectionDTO.t),
      orderByList: orderByList?.call(ArtworkTemplateSelectionDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [ArtworkTemplateSelectionDTO] matching the given query parameters.
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
  Future<ArtworkTemplateSelectionDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkTemplateSelectionDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<ArtworkTemplateSelectionDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkTemplateSelectionDTOTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<ArtworkTemplateSelectionDTO>(
      where: where?.call(ArtworkTemplateSelectionDTO.t),
      orderBy: orderBy?.call(ArtworkTemplateSelectionDTO.t),
      orderByList: orderByList?.call(ArtworkTemplateSelectionDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [ArtworkTemplateSelectionDTO] by its [id] or null if no such row exists.
  Future<ArtworkTemplateSelectionDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<ArtworkTemplateSelectionDTO>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [ArtworkTemplateSelectionDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [ArtworkTemplateSelectionDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ArtworkTemplateSelectionDTO>> insert(
    _i1.Session session,
    List<ArtworkTemplateSelectionDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ArtworkTemplateSelectionDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ArtworkTemplateSelectionDTO] and returns the inserted row.
  ///
  /// The returned [ArtworkTemplateSelectionDTO] will have its `id` field set.
  Future<ArtworkTemplateSelectionDTO> insertRow(
    _i1.Session session,
    ArtworkTemplateSelectionDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ArtworkTemplateSelectionDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ArtworkTemplateSelectionDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ArtworkTemplateSelectionDTO>> update(
    _i1.Session session,
    List<ArtworkTemplateSelectionDTO> rows, {
    _i1.ColumnSelections<ArtworkTemplateSelectionDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ArtworkTemplateSelectionDTO>(
      rows,
      columns: columns?.call(ArtworkTemplateSelectionDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ArtworkTemplateSelectionDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ArtworkTemplateSelectionDTO> updateRow(
    _i1.Session session,
    ArtworkTemplateSelectionDTO row, {
    _i1.ColumnSelections<ArtworkTemplateSelectionDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ArtworkTemplateSelectionDTO>(
      row,
      columns: columns?.call(ArtworkTemplateSelectionDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [ArtworkTemplateSelectionDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ArtworkTemplateSelectionDTO>> delete(
    _i1.Session session,
    List<ArtworkTemplateSelectionDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ArtworkTemplateSelectionDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ArtworkTemplateSelectionDTO].
  Future<ArtworkTemplateSelectionDTO> deleteRow(
    _i1.Session session,
    ArtworkTemplateSelectionDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ArtworkTemplateSelectionDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ArtworkTemplateSelectionDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ArtworkTemplateSelectionDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ArtworkTemplateSelectionDTO>(
      where: where(ArtworkTemplateSelectionDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkTemplateSelectionDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ArtworkTemplateSelectionDTO>(
      where: where?.call(ArtworkTemplateSelectionDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
