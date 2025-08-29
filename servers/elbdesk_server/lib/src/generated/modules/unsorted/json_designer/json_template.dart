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
import '../../../modules/unsorted/json_designer/json_template_type.dart' as _i2;
import '../../../modules/unsorted/json_designer/json_dto.dart' as _i3;

abstract class JsonTemplateDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  JsonTemplateDTO._({
    this.id,
    required this.name,
    required this.type,
    required this.json,
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

  factory JsonTemplateDTO({
    int? id,
    required String name,
    required _i2.JsonTemplateType type,
    required _i3.JsonDTO json,
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
  }) = _JsonTemplateDTOImpl;

  factory JsonTemplateDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return JsonTemplateDTO(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      type:
          _i2.JsonTemplateType.fromJson((jsonSerialization['type'] as String)),
      json: _i3.JsonDTO.fromJson(
          (jsonSerialization['json'] as Map<String, dynamic>)),
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

  static final t = JsonTemplateDTOTable();

  static const db = JsonTemplateDTORepository._();

  @override
  int? id;

  String name;

  _i2.JsonTemplateType type;

  _i3.JsonDTO json;

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

  /// Returns a shallow copy of this [JsonTemplateDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  JsonTemplateDTO copyWith({
    int? id,
    String? name,
    _i2.JsonTemplateType? type,
    _i3.JsonDTO? json,
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
      'type': type.toJson(),
      'json': json.toJson(),
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
      'type': type.toJson(),
      'json': json.toJsonForProtocol(),
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

  static JsonTemplateDTOInclude include() {
    return JsonTemplateDTOInclude._();
  }

  static JsonTemplateDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<JsonTemplateDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<JsonTemplateDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<JsonTemplateDTOTable>? orderByList,
    JsonTemplateDTOInclude? include,
  }) {
    return JsonTemplateDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(JsonTemplateDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(JsonTemplateDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _JsonTemplateDTOImpl extends JsonTemplateDTO {
  _JsonTemplateDTOImpl({
    int? id,
    required String name,
    required _i2.JsonTemplateType type,
    required _i3.JsonDTO json,
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
          type: type,
          json: json,
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

  /// Returns a shallow copy of this [JsonTemplateDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  JsonTemplateDTO copyWith({
    Object? id = _Undefined,
    String? name,
    _i2.JsonTemplateType? type,
    _i3.JsonDTO? json,
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
    return JsonTemplateDTO(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      json: json ?? this.json.copyWith(),
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

class JsonTemplateDTOTable extends _i1.Table<int?> {
  JsonTemplateDTOTable({super.tableRelation})
      : super(tableName: 'elb_json_template') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    type = _i1.ColumnEnum(
      'type',
      this,
      _i1.EnumSerialization.byName,
    );
    json = _i1.ColumnSerializable(
      'json',
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

  late final _i1.ColumnEnum<_i2.JsonTemplateType> type;

  late final _i1.ColumnSerializable json;

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
        name,
        type,
        json,
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

class JsonTemplateDTOInclude extends _i1.IncludeObject {
  JsonTemplateDTOInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => JsonTemplateDTO.t;
}

class JsonTemplateDTOIncludeList extends _i1.IncludeList {
  JsonTemplateDTOIncludeList._({
    _i1.WhereExpressionBuilder<JsonTemplateDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(JsonTemplateDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => JsonTemplateDTO.t;
}

class JsonTemplateDTORepository {
  const JsonTemplateDTORepository._();

  /// Returns a list of [JsonTemplateDTO]s matching the given query parameters.
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
  Future<List<JsonTemplateDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<JsonTemplateDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<JsonTemplateDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<JsonTemplateDTOTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<JsonTemplateDTO>(
      where: where?.call(JsonTemplateDTO.t),
      orderBy: orderBy?.call(JsonTemplateDTO.t),
      orderByList: orderByList?.call(JsonTemplateDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [JsonTemplateDTO] matching the given query parameters.
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
  Future<JsonTemplateDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<JsonTemplateDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<JsonTemplateDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<JsonTemplateDTOTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<JsonTemplateDTO>(
      where: where?.call(JsonTemplateDTO.t),
      orderBy: orderBy?.call(JsonTemplateDTO.t),
      orderByList: orderByList?.call(JsonTemplateDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [JsonTemplateDTO] by its [id] or null if no such row exists.
  Future<JsonTemplateDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<JsonTemplateDTO>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [JsonTemplateDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [JsonTemplateDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<JsonTemplateDTO>> insert(
    _i1.Session session,
    List<JsonTemplateDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<JsonTemplateDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [JsonTemplateDTO] and returns the inserted row.
  ///
  /// The returned [JsonTemplateDTO] will have its `id` field set.
  Future<JsonTemplateDTO> insertRow(
    _i1.Session session,
    JsonTemplateDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<JsonTemplateDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [JsonTemplateDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<JsonTemplateDTO>> update(
    _i1.Session session,
    List<JsonTemplateDTO> rows, {
    _i1.ColumnSelections<JsonTemplateDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<JsonTemplateDTO>(
      rows,
      columns: columns?.call(JsonTemplateDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [JsonTemplateDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<JsonTemplateDTO> updateRow(
    _i1.Session session,
    JsonTemplateDTO row, {
    _i1.ColumnSelections<JsonTemplateDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<JsonTemplateDTO>(
      row,
      columns: columns?.call(JsonTemplateDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [JsonTemplateDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<JsonTemplateDTO>> delete(
    _i1.Session session,
    List<JsonTemplateDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<JsonTemplateDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [JsonTemplateDTO].
  Future<JsonTemplateDTO> deleteRow(
    _i1.Session session,
    JsonTemplateDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<JsonTemplateDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<JsonTemplateDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<JsonTemplateDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<JsonTemplateDTO>(
      where: where(JsonTemplateDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<JsonTemplateDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<JsonTemplateDTO>(
      where: where?.call(JsonTemplateDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
