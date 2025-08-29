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

abstract class BearerTypeFlexoPrintMultilayerDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  BearerTypeFlexoPrintMultilayerDTO._({
    this.id,
    this.machineControlFile,
  });

  factory BearerTypeFlexoPrintMultilayerDTO({
    int? id,
    String? machineControlFile,
  }) = _BearerTypeFlexoPrintMultilayerDTOImpl;

  factory BearerTypeFlexoPrintMultilayerDTO.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return BearerTypeFlexoPrintMultilayerDTO(
      id: jsonSerialization['id'] as int?,
      machineControlFile: jsonSerialization['machineControlFile'] as String?,
    );
  }

  static final t = BearerTypeFlexoPrintMultilayerDTOTable();

  static const db = BearerTypeFlexoPrintMultilayerDTORepository._();

  @override
  int? id;

  String? machineControlFile;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [BearerTypeFlexoPrintMultilayerDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  BearerTypeFlexoPrintMultilayerDTO copyWith({
    int? id,
    String? machineControlFile,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (machineControlFile != null) 'machineControlFile': machineControlFile,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      if (machineControlFile != null) 'machineControlFile': machineControlFile,
    };
  }

  static BearerTypeFlexoPrintMultilayerDTOInclude include() {
    return BearerTypeFlexoPrintMultilayerDTOInclude._();
  }

  static BearerTypeFlexoPrintMultilayerDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<BearerTypeFlexoPrintMultilayerDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BearerTypeFlexoPrintMultilayerDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BearerTypeFlexoPrintMultilayerDTOTable>? orderByList,
    BearerTypeFlexoPrintMultilayerDTOInclude? include,
  }) {
    return BearerTypeFlexoPrintMultilayerDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(BearerTypeFlexoPrintMultilayerDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(BearerTypeFlexoPrintMultilayerDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BearerTypeFlexoPrintMultilayerDTOImpl
    extends BearerTypeFlexoPrintMultilayerDTO {
  _BearerTypeFlexoPrintMultilayerDTOImpl({
    int? id,
    String? machineControlFile,
  }) : super._(
          id: id,
          machineControlFile: machineControlFile,
        );

  /// Returns a shallow copy of this [BearerTypeFlexoPrintMultilayerDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  BearerTypeFlexoPrintMultilayerDTO copyWith({
    Object? id = _Undefined,
    Object? machineControlFile = _Undefined,
  }) {
    return BearerTypeFlexoPrintMultilayerDTO(
      id: id is int? ? id : this.id,
      machineControlFile: machineControlFile is String?
          ? machineControlFile
          : this.machineControlFile,
    );
  }
}

class BearerTypeFlexoPrintMultilayerDTOTable extends _i1.Table<int?> {
  BearerTypeFlexoPrintMultilayerDTOTable({super.tableRelation})
      : super(tableName: 'bearer_type_prepress_flexo_print_multilayer') {
    machineControlFile = _i1.ColumnString(
      'machineControlFile',
      this,
    );
  }

  late final _i1.ColumnString machineControlFile;

  @override
  List<_i1.Column> get columns => [
        id,
        machineControlFile,
      ];
}

class BearerTypeFlexoPrintMultilayerDTOInclude extends _i1.IncludeObject {
  BearerTypeFlexoPrintMultilayerDTOInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => BearerTypeFlexoPrintMultilayerDTO.t;
}

class BearerTypeFlexoPrintMultilayerDTOIncludeList extends _i1.IncludeList {
  BearerTypeFlexoPrintMultilayerDTOIncludeList._({
    _i1.WhereExpressionBuilder<BearerTypeFlexoPrintMultilayerDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(BearerTypeFlexoPrintMultilayerDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => BearerTypeFlexoPrintMultilayerDTO.t;
}

class BearerTypeFlexoPrintMultilayerDTORepository {
  const BearerTypeFlexoPrintMultilayerDTORepository._();

  /// Returns a list of [BearerTypeFlexoPrintMultilayerDTO]s matching the given query parameters.
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
  Future<List<BearerTypeFlexoPrintMultilayerDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BearerTypeFlexoPrintMultilayerDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BearerTypeFlexoPrintMultilayerDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BearerTypeFlexoPrintMultilayerDTOTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<BearerTypeFlexoPrintMultilayerDTO>(
      where: where?.call(BearerTypeFlexoPrintMultilayerDTO.t),
      orderBy: orderBy?.call(BearerTypeFlexoPrintMultilayerDTO.t),
      orderByList: orderByList?.call(BearerTypeFlexoPrintMultilayerDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [BearerTypeFlexoPrintMultilayerDTO] matching the given query parameters.
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
  Future<BearerTypeFlexoPrintMultilayerDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BearerTypeFlexoPrintMultilayerDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<BearerTypeFlexoPrintMultilayerDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BearerTypeFlexoPrintMultilayerDTOTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<BearerTypeFlexoPrintMultilayerDTO>(
      where: where?.call(BearerTypeFlexoPrintMultilayerDTO.t),
      orderBy: orderBy?.call(BearerTypeFlexoPrintMultilayerDTO.t),
      orderByList: orderByList?.call(BearerTypeFlexoPrintMultilayerDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [BearerTypeFlexoPrintMultilayerDTO] by its [id] or null if no such row exists.
  Future<BearerTypeFlexoPrintMultilayerDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<BearerTypeFlexoPrintMultilayerDTO>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [BearerTypeFlexoPrintMultilayerDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [BearerTypeFlexoPrintMultilayerDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<BearerTypeFlexoPrintMultilayerDTO>> insert(
    _i1.Session session,
    List<BearerTypeFlexoPrintMultilayerDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<BearerTypeFlexoPrintMultilayerDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [BearerTypeFlexoPrintMultilayerDTO] and returns the inserted row.
  ///
  /// The returned [BearerTypeFlexoPrintMultilayerDTO] will have its `id` field set.
  Future<BearerTypeFlexoPrintMultilayerDTO> insertRow(
    _i1.Session session,
    BearerTypeFlexoPrintMultilayerDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<BearerTypeFlexoPrintMultilayerDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [BearerTypeFlexoPrintMultilayerDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<BearerTypeFlexoPrintMultilayerDTO>> update(
    _i1.Session session,
    List<BearerTypeFlexoPrintMultilayerDTO> rows, {
    _i1.ColumnSelections<BearerTypeFlexoPrintMultilayerDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<BearerTypeFlexoPrintMultilayerDTO>(
      rows,
      columns: columns?.call(BearerTypeFlexoPrintMultilayerDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [BearerTypeFlexoPrintMultilayerDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<BearerTypeFlexoPrintMultilayerDTO> updateRow(
    _i1.Session session,
    BearerTypeFlexoPrintMultilayerDTO row, {
    _i1.ColumnSelections<BearerTypeFlexoPrintMultilayerDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<BearerTypeFlexoPrintMultilayerDTO>(
      row,
      columns: columns?.call(BearerTypeFlexoPrintMultilayerDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [BearerTypeFlexoPrintMultilayerDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<BearerTypeFlexoPrintMultilayerDTO>> delete(
    _i1.Session session,
    List<BearerTypeFlexoPrintMultilayerDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<BearerTypeFlexoPrintMultilayerDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [BearerTypeFlexoPrintMultilayerDTO].
  Future<BearerTypeFlexoPrintMultilayerDTO> deleteRow(
    _i1.Session session,
    BearerTypeFlexoPrintMultilayerDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<BearerTypeFlexoPrintMultilayerDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<BearerTypeFlexoPrintMultilayerDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<BearerTypeFlexoPrintMultilayerDTOTable>
        where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<BearerTypeFlexoPrintMultilayerDTO>(
      where: where(BearerTypeFlexoPrintMultilayerDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BearerTypeFlexoPrintMultilayerDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<BearerTypeFlexoPrintMultilayerDTO>(
      where: where?.call(BearerTypeFlexoPrintMultilayerDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
