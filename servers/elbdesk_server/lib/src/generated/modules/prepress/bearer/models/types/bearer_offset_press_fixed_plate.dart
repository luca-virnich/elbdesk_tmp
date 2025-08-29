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

abstract class BearerTypeOffsetPressFixedPlateDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  BearerTypeOffsetPressFixedPlateDTO._({
    this.id,
    this.machineControlFile,
    this.rasterFieldType,
    this.registrationMarkType,
  });

  factory BearerTypeOffsetPressFixedPlateDTO({
    int? id,
    String? machineControlFile,
    String? rasterFieldType,
    String? registrationMarkType,
  }) = _BearerTypeOffsetPressFixedPlateDTOImpl;

  factory BearerTypeOffsetPressFixedPlateDTO.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return BearerTypeOffsetPressFixedPlateDTO(
      id: jsonSerialization['id'] as int?,
      machineControlFile: jsonSerialization['machineControlFile'] as String?,
      rasterFieldType: jsonSerialization['rasterFieldType'] as String?,
      registrationMarkType:
          jsonSerialization['registrationMarkType'] as String?,
    );
  }

  static final t = BearerTypeOffsetPressFixedPlateDTOTable();

  static const db = BearerTypeOffsetPressFixedPlateDTORepository._();

  @override
  int? id;

  String? machineControlFile;

  String? rasterFieldType;

  String? registrationMarkType;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [BearerTypeOffsetPressFixedPlateDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  BearerTypeOffsetPressFixedPlateDTO copyWith({
    int? id,
    String? machineControlFile,
    String? rasterFieldType,
    String? registrationMarkType,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (machineControlFile != null) 'machineControlFile': machineControlFile,
      if (rasterFieldType != null) 'rasterFieldType': rasterFieldType,
      if (registrationMarkType != null)
        'registrationMarkType': registrationMarkType,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      if (machineControlFile != null) 'machineControlFile': machineControlFile,
      if (rasterFieldType != null) 'rasterFieldType': rasterFieldType,
      if (registrationMarkType != null)
        'registrationMarkType': registrationMarkType,
    };
  }

  static BearerTypeOffsetPressFixedPlateDTOInclude include() {
    return BearerTypeOffsetPressFixedPlateDTOInclude._();
  }

  static BearerTypeOffsetPressFixedPlateDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<BearerTypeOffsetPressFixedPlateDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BearerTypeOffsetPressFixedPlateDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BearerTypeOffsetPressFixedPlateDTOTable>?
        orderByList,
    BearerTypeOffsetPressFixedPlateDTOInclude? include,
  }) {
    return BearerTypeOffsetPressFixedPlateDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(BearerTypeOffsetPressFixedPlateDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(BearerTypeOffsetPressFixedPlateDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BearerTypeOffsetPressFixedPlateDTOImpl
    extends BearerTypeOffsetPressFixedPlateDTO {
  _BearerTypeOffsetPressFixedPlateDTOImpl({
    int? id,
    String? machineControlFile,
    String? rasterFieldType,
    String? registrationMarkType,
  }) : super._(
          id: id,
          machineControlFile: machineControlFile,
          rasterFieldType: rasterFieldType,
          registrationMarkType: registrationMarkType,
        );

  /// Returns a shallow copy of this [BearerTypeOffsetPressFixedPlateDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  BearerTypeOffsetPressFixedPlateDTO copyWith({
    Object? id = _Undefined,
    Object? machineControlFile = _Undefined,
    Object? rasterFieldType = _Undefined,
    Object? registrationMarkType = _Undefined,
  }) {
    return BearerTypeOffsetPressFixedPlateDTO(
      id: id is int? ? id : this.id,
      machineControlFile: machineControlFile is String?
          ? machineControlFile
          : this.machineControlFile,
      rasterFieldType:
          rasterFieldType is String? ? rasterFieldType : this.rasterFieldType,
      registrationMarkType: registrationMarkType is String?
          ? registrationMarkType
          : this.registrationMarkType,
    );
  }
}

class BearerTypeOffsetPressFixedPlateDTOTable extends _i1.Table<int?> {
  BearerTypeOffsetPressFixedPlateDTOTable({super.tableRelation})
      : super(tableName: 'prepress_bearer_type_offset_press_fixed_plate') {
    machineControlFile = _i1.ColumnString(
      'machineControlFile',
      this,
    );
    rasterFieldType = _i1.ColumnString(
      'rasterFieldType',
      this,
    );
    registrationMarkType = _i1.ColumnString(
      'registrationMarkType',
      this,
    );
  }

  late final _i1.ColumnString machineControlFile;

  late final _i1.ColumnString rasterFieldType;

  late final _i1.ColumnString registrationMarkType;

  @override
  List<_i1.Column> get columns => [
        id,
        machineControlFile,
        rasterFieldType,
        registrationMarkType,
      ];
}

class BearerTypeOffsetPressFixedPlateDTOInclude extends _i1.IncludeObject {
  BearerTypeOffsetPressFixedPlateDTOInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => BearerTypeOffsetPressFixedPlateDTO.t;
}

class BearerTypeOffsetPressFixedPlateDTOIncludeList extends _i1.IncludeList {
  BearerTypeOffsetPressFixedPlateDTOIncludeList._({
    _i1.WhereExpressionBuilder<BearerTypeOffsetPressFixedPlateDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(BearerTypeOffsetPressFixedPlateDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => BearerTypeOffsetPressFixedPlateDTO.t;
}

class BearerTypeOffsetPressFixedPlateDTORepository {
  const BearerTypeOffsetPressFixedPlateDTORepository._();

  /// Returns a list of [BearerTypeOffsetPressFixedPlateDTO]s matching the given query parameters.
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
  Future<List<BearerTypeOffsetPressFixedPlateDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BearerTypeOffsetPressFixedPlateDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BearerTypeOffsetPressFixedPlateDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BearerTypeOffsetPressFixedPlateDTOTable>?
        orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<BearerTypeOffsetPressFixedPlateDTO>(
      where: where?.call(BearerTypeOffsetPressFixedPlateDTO.t),
      orderBy: orderBy?.call(BearerTypeOffsetPressFixedPlateDTO.t),
      orderByList: orderByList?.call(BearerTypeOffsetPressFixedPlateDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [BearerTypeOffsetPressFixedPlateDTO] matching the given query parameters.
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
  Future<BearerTypeOffsetPressFixedPlateDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BearerTypeOffsetPressFixedPlateDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<BearerTypeOffsetPressFixedPlateDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BearerTypeOffsetPressFixedPlateDTOTable>?
        orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<BearerTypeOffsetPressFixedPlateDTO>(
      where: where?.call(BearerTypeOffsetPressFixedPlateDTO.t),
      orderBy: orderBy?.call(BearerTypeOffsetPressFixedPlateDTO.t),
      orderByList: orderByList?.call(BearerTypeOffsetPressFixedPlateDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [BearerTypeOffsetPressFixedPlateDTO] by its [id] or null if no such row exists.
  Future<BearerTypeOffsetPressFixedPlateDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<BearerTypeOffsetPressFixedPlateDTO>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [BearerTypeOffsetPressFixedPlateDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [BearerTypeOffsetPressFixedPlateDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<BearerTypeOffsetPressFixedPlateDTO>> insert(
    _i1.Session session,
    List<BearerTypeOffsetPressFixedPlateDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<BearerTypeOffsetPressFixedPlateDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [BearerTypeOffsetPressFixedPlateDTO] and returns the inserted row.
  ///
  /// The returned [BearerTypeOffsetPressFixedPlateDTO] will have its `id` field set.
  Future<BearerTypeOffsetPressFixedPlateDTO> insertRow(
    _i1.Session session,
    BearerTypeOffsetPressFixedPlateDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<BearerTypeOffsetPressFixedPlateDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [BearerTypeOffsetPressFixedPlateDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<BearerTypeOffsetPressFixedPlateDTO>> update(
    _i1.Session session,
    List<BearerTypeOffsetPressFixedPlateDTO> rows, {
    _i1.ColumnSelections<BearerTypeOffsetPressFixedPlateDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<BearerTypeOffsetPressFixedPlateDTO>(
      rows,
      columns: columns?.call(BearerTypeOffsetPressFixedPlateDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [BearerTypeOffsetPressFixedPlateDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<BearerTypeOffsetPressFixedPlateDTO> updateRow(
    _i1.Session session,
    BearerTypeOffsetPressFixedPlateDTO row, {
    _i1.ColumnSelections<BearerTypeOffsetPressFixedPlateDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<BearerTypeOffsetPressFixedPlateDTO>(
      row,
      columns: columns?.call(BearerTypeOffsetPressFixedPlateDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [BearerTypeOffsetPressFixedPlateDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<BearerTypeOffsetPressFixedPlateDTO>> delete(
    _i1.Session session,
    List<BearerTypeOffsetPressFixedPlateDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<BearerTypeOffsetPressFixedPlateDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [BearerTypeOffsetPressFixedPlateDTO].
  Future<BearerTypeOffsetPressFixedPlateDTO> deleteRow(
    _i1.Session session,
    BearerTypeOffsetPressFixedPlateDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<BearerTypeOffsetPressFixedPlateDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<BearerTypeOffsetPressFixedPlateDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<BearerTypeOffsetPressFixedPlateDTOTable>
        where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<BearerTypeOffsetPressFixedPlateDTO>(
      where: where(BearerTypeOffsetPressFixedPlateDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BearerTypeOffsetPressFixedPlateDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<BearerTypeOffsetPressFixedPlateDTO>(
      where: where?.call(BearerTypeOffsetPressFixedPlateDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
