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
import '../../modules/entity_notes/mention.dart' as _i2;

abstract class EntityNoteDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  EntityNoteDTO._({
    this.id,
    required this.message,
    this.hint,
    required this.entityId,
    required this.tableType,
    required this.mentions,
    this.parentId,
    this.hardcodedSender,
    this.createdAt,
    this.createdById,
    this.lastModifiedAt,
    this.deletedAt,
  });

  factory EntityNoteDTO({
    int? id,
    required String message,
    String? hint,
    required int entityId,
    required String tableType,
    required List<_i2.MentionDTO> mentions,
    int? parentId,
    String? hardcodedSender,
    DateTime? createdAt,
    int? createdById,
    DateTime? lastModifiedAt,
    DateTime? deletedAt,
  }) = _EntityNoteDTOImpl;

  factory EntityNoteDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return EntityNoteDTO(
      id: jsonSerialization['id'] as int?,
      message: jsonSerialization['message'] as String,
      hint: jsonSerialization['hint'] as String?,
      entityId: jsonSerialization['entityId'] as int,
      tableType: jsonSerialization['tableType'] as String,
      mentions: (jsonSerialization['mentions'] as List)
          .map((e) => _i2.MentionDTO.fromJson((e as Map<String, dynamic>)))
          .toList(),
      parentId: jsonSerialization['parentId'] as int?,
      hardcodedSender: jsonSerialization['hardcodedSender'] as String?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      createdById: jsonSerialization['createdById'] as int?,
      lastModifiedAt: jsonSerialization['lastModifiedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastModifiedAt']),
      deletedAt: jsonSerialization['deletedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['deletedAt']),
    );
  }

  static final t = EntityNoteDTOTable();

  static const db = EntityNoteDTORepository._();

  @override
  int? id;

  String message;

  String? hint;

  int entityId;

  String tableType;

  List<_i2.MentionDTO> mentions;

  int? parentId;

  String? hardcodedSender;

  DateTime? createdAt;

  int? createdById;

  DateTime? lastModifiedAt;

  DateTime? deletedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [EntityNoteDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  EntityNoteDTO copyWith({
    int? id,
    String? message,
    String? hint,
    int? entityId,
    String? tableType,
    List<_i2.MentionDTO>? mentions,
    int? parentId,
    String? hardcodedSender,
    DateTime? createdAt,
    int? createdById,
    DateTime? lastModifiedAt,
    DateTime? deletedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'message': message,
      if (hint != null) 'hint': hint,
      'entityId': entityId,
      'tableType': tableType,
      'mentions': mentions.toJson(valueToJson: (v) => v.toJson()),
      if (parentId != null) 'parentId': parentId,
      if (hardcodedSender != null) 'hardcodedSender': hardcodedSender,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      if (createdById != null) 'createdById': createdById,
      if (lastModifiedAt != null) 'lastModifiedAt': lastModifiedAt?.toJson(),
      if (deletedAt != null) 'deletedAt': deletedAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'message': message,
      if (hint != null) 'hint': hint,
      'entityId': entityId,
      'tableType': tableType,
      'mentions': mentions.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (parentId != null) 'parentId': parentId,
      if (hardcodedSender != null) 'hardcodedSender': hardcodedSender,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      if (createdById != null) 'createdById': createdById,
      if (lastModifiedAt != null) 'lastModifiedAt': lastModifiedAt?.toJson(),
      if (deletedAt != null) 'deletedAt': deletedAt?.toJson(),
    };
  }

  static EntityNoteDTOInclude include() {
    return EntityNoteDTOInclude._();
  }

  static EntityNoteDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<EntityNoteDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EntityNoteDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EntityNoteDTOTable>? orderByList,
    EntityNoteDTOInclude? include,
  }) {
    return EntityNoteDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(EntityNoteDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(EntityNoteDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _EntityNoteDTOImpl extends EntityNoteDTO {
  _EntityNoteDTOImpl({
    int? id,
    required String message,
    String? hint,
    required int entityId,
    required String tableType,
    required List<_i2.MentionDTO> mentions,
    int? parentId,
    String? hardcodedSender,
    DateTime? createdAt,
    int? createdById,
    DateTime? lastModifiedAt,
    DateTime? deletedAt,
  }) : super._(
          id: id,
          message: message,
          hint: hint,
          entityId: entityId,
          tableType: tableType,
          mentions: mentions,
          parentId: parentId,
          hardcodedSender: hardcodedSender,
          createdAt: createdAt,
          createdById: createdById,
          lastModifiedAt: lastModifiedAt,
          deletedAt: deletedAt,
        );

  /// Returns a shallow copy of this [EntityNoteDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  EntityNoteDTO copyWith({
    Object? id = _Undefined,
    String? message,
    Object? hint = _Undefined,
    int? entityId,
    String? tableType,
    List<_i2.MentionDTO>? mentions,
    Object? parentId = _Undefined,
    Object? hardcodedSender = _Undefined,
    Object? createdAt = _Undefined,
    Object? createdById = _Undefined,
    Object? lastModifiedAt = _Undefined,
    Object? deletedAt = _Undefined,
  }) {
    return EntityNoteDTO(
      id: id is int? ? id : this.id,
      message: message ?? this.message,
      hint: hint is String? ? hint : this.hint,
      entityId: entityId ?? this.entityId,
      tableType: tableType ?? this.tableType,
      mentions: mentions ?? this.mentions.map((e0) => e0.copyWith()).toList(),
      parentId: parentId is int? ? parentId : this.parentId,
      hardcodedSender:
          hardcodedSender is String? ? hardcodedSender : this.hardcodedSender,
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
      createdById: createdById is int? ? createdById : this.createdById,
      lastModifiedAt:
          lastModifiedAt is DateTime? ? lastModifiedAt : this.lastModifiedAt,
      deletedAt: deletedAt is DateTime? ? deletedAt : this.deletedAt,
    );
  }
}

class EntityNoteDTOTable extends _i1.Table<int?> {
  EntityNoteDTOTable({super.tableRelation})
      : super(tableName: 'ed_core_entity_note') {
    message = _i1.ColumnString(
      'message',
      this,
    );
    hint = _i1.ColumnString(
      'hint',
      this,
    );
    entityId = _i1.ColumnInt(
      'entityId',
      this,
    );
    tableType = _i1.ColumnString(
      'tableType',
      this,
    );
    mentions = _i1.ColumnSerializable(
      'mentions',
      this,
    );
    parentId = _i1.ColumnInt(
      'parentId',
      this,
    );
    hardcodedSender = _i1.ColumnString(
      'hardcodedSender',
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
    deletedAt = _i1.ColumnDateTime(
      'deletedAt',
      this,
    );
  }

  late final _i1.ColumnString message;

  late final _i1.ColumnString hint;

  late final _i1.ColumnInt entityId;

  late final _i1.ColumnString tableType;

  late final _i1.ColumnSerializable mentions;

  late final _i1.ColumnInt parentId;

  late final _i1.ColumnString hardcodedSender;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnInt createdById;

  late final _i1.ColumnDateTime lastModifiedAt;

  late final _i1.ColumnDateTime deletedAt;

  @override
  List<_i1.Column> get columns => [
        id,
        message,
        hint,
        entityId,
        tableType,
        mentions,
        parentId,
        hardcodedSender,
        createdAt,
        createdById,
        lastModifiedAt,
        deletedAt,
      ];
}

class EntityNoteDTOInclude extends _i1.IncludeObject {
  EntityNoteDTOInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => EntityNoteDTO.t;
}

class EntityNoteDTOIncludeList extends _i1.IncludeList {
  EntityNoteDTOIncludeList._({
    _i1.WhereExpressionBuilder<EntityNoteDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(EntityNoteDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => EntityNoteDTO.t;
}

class EntityNoteDTORepository {
  const EntityNoteDTORepository._();

  /// Returns a list of [EntityNoteDTO]s matching the given query parameters.
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
  Future<List<EntityNoteDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EntityNoteDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EntityNoteDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EntityNoteDTOTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<EntityNoteDTO>(
      where: where?.call(EntityNoteDTO.t),
      orderBy: orderBy?.call(EntityNoteDTO.t),
      orderByList: orderByList?.call(EntityNoteDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [EntityNoteDTO] matching the given query parameters.
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
  Future<EntityNoteDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EntityNoteDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<EntityNoteDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EntityNoteDTOTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<EntityNoteDTO>(
      where: where?.call(EntityNoteDTO.t),
      orderBy: orderBy?.call(EntityNoteDTO.t),
      orderByList: orderByList?.call(EntityNoteDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [EntityNoteDTO] by its [id] or null if no such row exists.
  Future<EntityNoteDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<EntityNoteDTO>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [EntityNoteDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [EntityNoteDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<EntityNoteDTO>> insert(
    _i1.Session session,
    List<EntityNoteDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<EntityNoteDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [EntityNoteDTO] and returns the inserted row.
  ///
  /// The returned [EntityNoteDTO] will have its `id` field set.
  Future<EntityNoteDTO> insertRow(
    _i1.Session session,
    EntityNoteDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<EntityNoteDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [EntityNoteDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<EntityNoteDTO>> update(
    _i1.Session session,
    List<EntityNoteDTO> rows, {
    _i1.ColumnSelections<EntityNoteDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<EntityNoteDTO>(
      rows,
      columns: columns?.call(EntityNoteDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [EntityNoteDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<EntityNoteDTO> updateRow(
    _i1.Session session,
    EntityNoteDTO row, {
    _i1.ColumnSelections<EntityNoteDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<EntityNoteDTO>(
      row,
      columns: columns?.call(EntityNoteDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [EntityNoteDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<EntityNoteDTO>> delete(
    _i1.Session session,
    List<EntityNoteDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<EntityNoteDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [EntityNoteDTO].
  Future<EntityNoteDTO> deleteRow(
    _i1.Session session,
    EntityNoteDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<EntityNoteDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<EntityNoteDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<EntityNoteDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<EntityNoteDTO>(
      where: where(EntityNoteDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EntityNoteDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<EntityNoteDTO>(
      where: where?.call(EntityNoteDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
