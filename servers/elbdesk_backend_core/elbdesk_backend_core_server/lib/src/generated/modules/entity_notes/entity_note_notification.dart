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

abstract class EntityNoteNotificationDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  EntityNoteNotificationDTO._({
    this.id,
    required this.tableType,
    required this.entityId,
    required this.label,
    required this.message,
    required this.isUpdate,
    this.hardcodedSender,
    required this.createdAt,
    this.readAt,
    this.clearedAt,
    this.parentId,
    this.additionalData,
    this.senderId,
    this.userId,
    required this.noteId,
  });

  factory EntityNoteNotificationDTO({
    int? id,
    required String tableType,
    required int entityId,
    required String label,
    required String message,
    required bool isUpdate,
    String? hardcodedSender,
    required DateTime createdAt,
    DateTime? readAt,
    DateTime? clearedAt,
    int? parentId,
    String? additionalData,
    int? senderId,
    int? userId,
    required int noteId,
  }) = _EntityNoteNotificationDTOImpl;

  factory EntityNoteNotificationDTO.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return EntityNoteNotificationDTO(
      id: jsonSerialization['id'] as int?,
      tableType: jsonSerialization['tableType'] as String,
      entityId: jsonSerialization['entityId'] as int,
      label: jsonSerialization['label'] as String,
      message: jsonSerialization['message'] as String,
      isUpdate: jsonSerialization['isUpdate'] as bool,
      hardcodedSender: jsonSerialization['hardcodedSender'] as String?,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      readAt: jsonSerialization['readAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['readAt']),
      clearedAt: jsonSerialization['clearedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['clearedAt']),
      parentId: jsonSerialization['parentId'] as int?,
      additionalData: jsonSerialization['additionalData'] as String?,
      senderId: jsonSerialization['senderId'] as int?,
      userId: jsonSerialization['userId'] as int?,
      noteId: jsonSerialization['noteId'] as int,
    );
  }

  static final t = EntityNoteNotificationDTOTable();

  static const db = EntityNoteNotificationDTORepository._();

  @override
  int? id;

  String tableType;

  int entityId;

  String label;

  String message;

  bool isUpdate;

  String? hardcodedSender;

  DateTime createdAt;

  DateTime? readAt;

  DateTime? clearedAt;

  int? parentId;

  String? additionalData;

  int? senderId;

  int? userId;

  int noteId;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [EntityNoteNotificationDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  EntityNoteNotificationDTO copyWith({
    int? id,
    String? tableType,
    int? entityId,
    String? label,
    String? message,
    bool? isUpdate,
    String? hardcodedSender,
    DateTime? createdAt,
    DateTime? readAt,
    DateTime? clearedAt,
    int? parentId,
    String? additionalData,
    int? senderId,
    int? userId,
    int? noteId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'tableType': tableType,
      'entityId': entityId,
      'label': label,
      'message': message,
      'isUpdate': isUpdate,
      if (hardcodedSender != null) 'hardcodedSender': hardcodedSender,
      'createdAt': createdAt.toJson(),
      if (readAt != null) 'readAt': readAt?.toJson(),
      if (clearedAt != null) 'clearedAt': clearedAt?.toJson(),
      if (parentId != null) 'parentId': parentId,
      if (additionalData != null) 'additionalData': additionalData,
      if (senderId != null) 'senderId': senderId,
      if (userId != null) 'userId': userId,
      'noteId': noteId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'tableType': tableType,
      'entityId': entityId,
      'label': label,
      'message': message,
      'isUpdate': isUpdate,
      if (hardcodedSender != null) 'hardcodedSender': hardcodedSender,
      'createdAt': createdAt.toJson(),
      if (readAt != null) 'readAt': readAt?.toJson(),
      if (clearedAt != null) 'clearedAt': clearedAt?.toJson(),
      if (parentId != null) 'parentId': parentId,
      if (additionalData != null) 'additionalData': additionalData,
      if (senderId != null) 'senderId': senderId,
      if (userId != null) 'userId': userId,
      'noteId': noteId,
    };
  }

  static EntityNoteNotificationDTOInclude include() {
    return EntityNoteNotificationDTOInclude._();
  }

  static EntityNoteNotificationDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<EntityNoteNotificationDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EntityNoteNotificationDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EntityNoteNotificationDTOTable>? orderByList,
    EntityNoteNotificationDTOInclude? include,
  }) {
    return EntityNoteNotificationDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(EntityNoteNotificationDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(EntityNoteNotificationDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _EntityNoteNotificationDTOImpl extends EntityNoteNotificationDTO {
  _EntityNoteNotificationDTOImpl({
    int? id,
    required String tableType,
    required int entityId,
    required String label,
    required String message,
    required bool isUpdate,
    String? hardcodedSender,
    required DateTime createdAt,
    DateTime? readAt,
    DateTime? clearedAt,
    int? parentId,
    String? additionalData,
    int? senderId,
    int? userId,
    required int noteId,
  }) : super._(
          id: id,
          tableType: tableType,
          entityId: entityId,
          label: label,
          message: message,
          isUpdate: isUpdate,
          hardcodedSender: hardcodedSender,
          createdAt: createdAt,
          readAt: readAt,
          clearedAt: clearedAt,
          parentId: parentId,
          additionalData: additionalData,
          senderId: senderId,
          userId: userId,
          noteId: noteId,
        );

  /// Returns a shallow copy of this [EntityNoteNotificationDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  EntityNoteNotificationDTO copyWith({
    Object? id = _Undefined,
    String? tableType,
    int? entityId,
    String? label,
    String? message,
    bool? isUpdate,
    Object? hardcodedSender = _Undefined,
    DateTime? createdAt,
    Object? readAt = _Undefined,
    Object? clearedAt = _Undefined,
    Object? parentId = _Undefined,
    Object? additionalData = _Undefined,
    Object? senderId = _Undefined,
    Object? userId = _Undefined,
    int? noteId,
  }) {
    return EntityNoteNotificationDTO(
      id: id is int? ? id : this.id,
      tableType: tableType ?? this.tableType,
      entityId: entityId ?? this.entityId,
      label: label ?? this.label,
      message: message ?? this.message,
      isUpdate: isUpdate ?? this.isUpdate,
      hardcodedSender:
          hardcodedSender is String? ? hardcodedSender : this.hardcodedSender,
      createdAt: createdAt ?? this.createdAt,
      readAt: readAt is DateTime? ? readAt : this.readAt,
      clearedAt: clearedAt is DateTime? ? clearedAt : this.clearedAt,
      parentId: parentId is int? ? parentId : this.parentId,
      additionalData:
          additionalData is String? ? additionalData : this.additionalData,
      senderId: senderId is int? ? senderId : this.senderId,
      userId: userId is int? ? userId : this.userId,
      noteId: noteId ?? this.noteId,
    );
  }
}

class EntityNoteNotificationDTOTable extends _i1.Table<int?> {
  EntityNoteNotificationDTOTable({super.tableRelation})
      : super(tableName: 'ed_core_entity_note_notification') {
    tableType = _i1.ColumnString(
      'tableType',
      this,
    );
    entityId = _i1.ColumnInt(
      'entityId',
      this,
    );
    label = _i1.ColumnString(
      'label',
      this,
    );
    message = _i1.ColumnString(
      'message',
      this,
    );
    isUpdate = _i1.ColumnBool(
      'isUpdate',
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
    readAt = _i1.ColumnDateTime(
      'readAt',
      this,
    );
    clearedAt = _i1.ColumnDateTime(
      'clearedAt',
      this,
    );
    parentId = _i1.ColumnInt(
      'parentId',
      this,
    );
    additionalData = _i1.ColumnString(
      'additionalData',
      this,
    );
    senderId = _i1.ColumnInt(
      'senderId',
      this,
    );
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    noteId = _i1.ColumnInt(
      'noteId',
      this,
    );
  }

  late final _i1.ColumnString tableType;

  late final _i1.ColumnInt entityId;

  late final _i1.ColumnString label;

  late final _i1.ColumnString message;

  late final _i1.ColumnBool isUpdate;

  late final _i1.ColumnString hardcodedSender;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime readAt;

  late final _i1.ColumnDateTime clearedAt;

  late final _i1.ColumnInt parentId;

  late final _i1.ColumnString additionalData;

  late final _i1.ColumnInt senderId;

  late final _i1.ColumnInt userId;

  late final _i1.ColumnInt noteId;

  @override
  List<_i1.Column> get columns => [
        id,
        tableType,
        entityId,
        label,
        message,
        isUpdate,
        hardcodedSender,
        createdAt,
        readAt,
        clearedAt,
        parentId,
        additionalData,
        senderId,
        userId,
        noteId,
      ];
}

class EntityNoteNotificationDTOInclude extends _i1.IncludeObject {
  EntityNoteNotificationDTOInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => EntityNoteNotificationDTO.t;
}

class EntityNoteNotificationDTOIncludeList extends _i1.IncludeList {
  EntityNoteNotificationDTOIncludeList._({
    _i1.WhereExpressionBuilder<EntityNoteNotificationDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(EntityNoteNotificationDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => EntityNoteNotificationDTO.t;
}

class EntityNoteNotificationDTORepository {
  const EntityNoteNotificationDTORepository._();

  /// Returns a list of [EntityNoteNotificationDTO]s matching the given query parameters.
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
  Future<List<EntityNoteNotificationDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EntityNoteNotificationDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EntityNoteNotificationDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EntityNoteNotificationDTOTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<EntityNoteNotificationDTO>(
      where: where?.call(EntityNoteNotificationDTO.t),
      orderBy: orderBy?.call(EntityNoteNotificationDTO.t),
      orderByList: orderByList?.call(EntityNoteNotificationDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [EntityNoteNotificationDTO] matching the given query parameters.
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
  Future<EntityNoteNotificationDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EntityNoteNotificationDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<EntityNoteNotificationDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EntityNoteNotificationDTOTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<EntityNoteNotificationDTO>(
      where: where?.call(EntityNoteNotificationDTO.t),
      orderBy: orderBy?.call(EntityNoteNotificationDTO.t),
      orderByList: orderByList?.call(EntityNoteNotificationDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [EntityNoteNotificationDTO] by its [id] or null if no such row exists.
  Future<EntityNoteNotificationDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<EntityNoteNotificationDTO>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [EntityNoteNotificationDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [EntityNoteNotificationDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<EntityNoteNotificationDTO>> insert(
    _i1.Session session,
    List<EntityNoteNotificationDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<EntityNoteNotificationDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [EntityNoteNotificationDTO] and returns the inserted row.
  ///
  /// The returned [EntityNoteNotificationDTO] will have its `id` field set.
  Future<EntityNoteNotificationDTO> insertRow(
    _i1.Session session,
    EntityNoteNotificationDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<EntityNoteNotificationDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [EntityNoteNotificationDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<EntityNoteNotificationDTO>> update(
    _i1.Session session,
    List<EntityNoteNotificationDTO> rows, {
    _i1.ColumnSelections<EntityNoteNotificationDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<EntityNoteNotificationDTO>(
      rows,
      columns: columns?.call(EntityNoteNotificationDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [EntityNoteNotificationDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<EntityNoteNotificationDTO> updateRow(
    _i1.Session session,
    EntityNoteNotificationDTO row, {
    _i1.ColumnSelections<EntityNoteNotificationDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<EntityNoteNotificationDTO>(
      row,
      columns: columns?.call(EntityNoteNotificationDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [EntityNoteNotificationDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<EntityNoteNotificationDTO>> delete(
    _i1.Session session,
    List<EntityNoteNotificationDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<EntityNoteNotificationDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [EntityNoteNotificationDTO].
  Future<EntityNoteNotificationDTO> deleteRow(
    _i1.Session session,
    EntityNoteNotificationDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<EntityNoteNotificationDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<EntityNoteNotificationDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<EntityNoteNotificationDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<EntityNoteNotificationDTO>(
      where: where(EntityNoteNotificationDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EntityNoteNotificationDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<EntityNoteNotificationDTO>(
      where: where?.call(EntityNoteNotificationDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
