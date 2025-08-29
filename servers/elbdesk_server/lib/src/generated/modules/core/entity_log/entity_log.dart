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
import '../../../modules/core/table/table_type.dart' as _i2;

abstract class EntityLogDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  EntityLogDTO._({
    this.id,
    required this.entityId,
    required this.oldValue,
    required this.newValue,
    required this.field,
    required this.tableType,
    required this.editedAt,
    this.editedById,
  });

  factory EntityLogDTO({
    int? id,
    required int entityId,
    required String oldValue,
    required String newValue,
    required String field,
    required _i2.TableType tableType,
    required DateTime editedAt,
    int? editedById,
  }) = _EntityLogDTOImpl;

  factory EntityLogDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return EntityLogDTO(
      id: jsonSerialization['id'] as int?,
      entityId: jsonSerialization['entityId'] as int,
      oldValue: jsonSerialization['oldValue'] as String,
      newValue: jsonSerialization['newValue'] as String,
      field: jsonSerialization['field'] as String,
      tableType:
          _i2.TableType.fromJson((jsonSerialization['tableType'] as String)),
      editedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['editedAt']),
      editedById: jsonSerialization['editedById'] as int?,
    );
  }

  static final t = EntityLogDTOTable();

  static const db = EntityLogDTORepository._();

  @override
  int? id;

  int entityId;

  String oldValue;

  String newValue;

  String field;

  _i2.TableType tableType;

  DateTime editedAt;

  int? editedById;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [EntityLogDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  EntityLogDTO copyWith({
    int? id,
    int? entityId,
    String? oldValue,
    String? newValue,
    String? field,
    _i2.TableType? tableType,
    DateTime? editedAt,
    int? editedById,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'entityId': entityId,
      'oldValue': oldValue,
      'newValue': newValue,
      'field': field,
      'tableType': tableType.toJson(),
      'editedAt': editedAt.toJson(),
      if (editedById != null) 'editedById': editedById,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'entityId': entityId,
      'oldValue': oldValue,
      'newValue': newValue,
      'field': field,
      'tableType': tableType.toJson(),
      'editedAt': editedAt.toJson(),
      if (editedById != null) 'editedById': editedById,
    };
  }

  static EntityLogDTOInclude include() {
    return EntityLogDTOInclude._();
  }

  static EntityLogDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<EntityLogDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EntityLogDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EntityLogDTOTable>? orderByList,
    EntityLogDTOInclude? include,
  }) {
    return EntityLogDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(EntityLogDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(EntityLogDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _EntityLogDTOImpl extends EntityLogDTO {
  _EntityLogDTOImpl({
    int? id,
    required int entityId,
    required String oldValue,
    required String newValue,
    required String field,
    required _i2.TableType tableType,
    required DateTime editedAt,
    int? editedById,
  }) : super._(
          id: id,
          entityId: entityId,
          oldValue: oldValue,
          newValue: newValue,
          field: field,
          tableType: tableType,
          editedAt: editedAt,
          editedById: editedById,
        );

  /// Returns a shallow copy of this [EntityLogDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  EntityLogDTO copyWith({
    Object? id = _Undefined,
    int? entityId,
    String? oldValue,
    String? newValue,
    String? field,
    _i2.TableType? tableType,
    DateTime? editedAt,
    Object? editedById = _Undefined,
  }) {
    return EntityLogDTO(
      id: id is int? ? id : this.id,
      entityId: entityId ?? this.entityId,
      oldValue: oldValue ?? this.oldValue,
      newValue: newValue ?? this.newValue,
      field: field ?? this.field,
      tableType: tableType ?? this.tableType,
      editedAt: editedAt ?? this.editedAt,
      editedById: editedById is int? ? editedById : this.editedById,
    );
  }
}

class EntityLogDTOTable extends _i1.Table<int?> {
  EntityLogDTOTable({super.tableRelation})
      : super(tableName: 'ed_core_entity_log') {
    entityId = _i1.ColumnInt(
      'entityId',
      this,
    );
    oldValue = _i1.ColumnString(
      'oldValue',
      this,
    );
    newValue = _i1.ColumnString(
      'newValue',
      this,
    );
    field = _i1.ColumnString(
      'field',
      this,
    );
    tableType = _i1.ColumnEnum(
      'tableType',
      this,
      _i1.EnumSerialization.byName,
    );
    editedAt = _i1.ColumnDateTime(
      'editedAt',
      this,
    );
    editedById = _i1.ColumnInt(
      'editedById',
      this,
    );
  }

  late final _i1.ColumnInt entityId;

  late final _i1.ColumnString oldValue;

  late final _i1.ColumnString newValue;

  late final _i1.ColumnString field;

  late final _i1.ColumnEnum<_i2.TableType> tableType;

  late final _i1.ColumnDateTime editedAt;

  late final _i1.ColumnInt editedById;

  @override
  List<_i1.Column> get columns => [
        id,
        entityId,
        oldValue,
        newValue,
        field,
        tableType,
        editedAt,
        editedById,
      ];
}

class EntityLogDTOInclude extends _i1.IncludeObject {
  EntityLogDTOInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => EntityLogDTO.t;
}

class EntityLogDTOIncludeList extends _i1.IncludeList {
  EntityLogDTOIncludeList._({
    _i1.WhereExpressionBuilder<EntityLogDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(EntityLogDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => EntityLogDTO.t;
}

class EntityLogDTORepository {
  const EntityLogDTORepository._();

  /// Returns a list of [EntityLogDTO]s matching the given query parameters.
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
  Future<List<EntityLogDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EntityLogDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EntityLogDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EntityLogDTOTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<EntityLogDTO>(
      where: where?.call(EntityLogDTO.t),
      orderBy: orderBy?.call(EntityLogDTO.t),
      orderByList: orderByList?.call(EntityLogDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [EntityLogDTO] matching the given query parameters.
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
  Future<EntityLogDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EntityLogDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<EntityLogDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EntityLogDTOTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<EntityLogDTO>(
      where: where?.call(EntityLogDTO.t),
      orderBy: orderBy?.call(EntityLogDTO.t),
      orderByList: orderByList?.call(EntityLogDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [EntityLogDTO] by its [id] or null if no such row exists.
  Future<EntityLogDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<EntityLogDTO>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [EntityLogDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [EntityLogDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<EntityLogDTO>> insert(
    _i1.Session session,
    List<EntityLogDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<EntityLogDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [EntityLogDTO] and returns the inserted row.
  ///
  /// The returned [EntityLogDTO] will have its `id` field set.
  Future<EntityLogDTO> insertRow(
    _i1.Session session,
    EntityLogDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<EntityLogDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [EntityLogDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<EntityLogDTO>> update(
    _i1.Session session,
    List<EntityLogDTO> rows, {
    _i1.ColumnSelections<EntityLogDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<EntityLogDTO>(
      rows,
      columns: columns?.call(EntityLogDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [EntityLogDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<EntityLogDTO> updateRow(
    _i1.Session session,
    EntityLogDTO row, {
    _i1.ColumnSelections<EntityLogDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<EntityLogDTO>(
      row,
      columns: columns?.call(EntityLogDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [EntityLogDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<EntityLogDTO>> delete(
    _i1.Session session,
    List<EntityLogDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<EntityLogDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [EntityLogDTO].
  Future<EntityLogDTO> deleteRow(
    _i1.Session session,
    EntityLogDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<EntityLogDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<EntityLogDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<EntityLogDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<EntityLogDTO>(
      where: where(EntityLogDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EntityLogDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<EntityLogDTO>(
      where: where?.call(EntityLogDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
