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

abstract class BearerTypeSheetFedPressPlateEqualsSubDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  BearerTypeSheetFedPressPlateEqualsSubDTO._({
    this.id,
    this.machineControlFile,
    this.rasterFieldType,
    this.registrationMarkType,
  });

  factory BearerTypeSheetFedPressPlateEqualsSubDTO({
    int? id,
    String? machineControlFile,
    String? rasterFieldType,
    String? registrationMarkType,
  }) = _BearerTypeSheetFedPressPlateEqualsSubDTOImpl;

  factory BearerTypeSheetFedPressPlateEqualsSubDTO.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return BearerTypeSheetFedPressPlateEqualsSubDTO(
      id: jsonSerialization['id'] as int?,
      machineControlFile: jsonSerialization['machineControlFile'] as String?,
      rasterFieldType: jsonSerialization['rasterFieldType'] as String?,
      registrationMarkType:
          jsonSerialization['registrationMarkType'] as String?,
    );
  }

  static final t = BearerTypeSheetFedPressPlateEqualsSubDTOTable();

  static const db = BearerTypeSheetFedPressPlateEqualsSubDTORepository._();

  @override
  int? id;

  String? machineControlFile;

  String? rasterFieldType;

  String? registrationMarkType;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [BearerTypeSheetFedPressPlateEqualsSubDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  BearerTypeSheetFedPressPlateEqualsSubDTO copyWith({
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

  static BearerTypeSheetFedPressPlateEqualsSubDTOInclude include() {
    return BearerTypeSheetFedPressPlateEqualsSubDTOInclude._();
  }

  static BearerTypeSheetFedPressPlateEqualsSubDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<BearerTypeSheetFedPressPlateEqualsSubDTOTable>?
        where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BearerTypeSheetFedPressPlateEqualsSubDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BearerTypeSheetFedPressPlateEqualsSubDTOTable>?
        orderByList,
    BearerTypeSheetFedPressPlateEqualsSubDTOInclude? include,
  }) {
    return BearerTypeSheetFedPressPlateEqualsSubDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(BearerTypeSheetFedPressPlateEqualsSubDTO.t),
      orderDescending: orderDescending,
      orderByList:
          orderByList?.call(BearerTypeSheetFedPressPlateEqualsSubDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BearerTypeSheetFedPressPlateEqualsSubDTOImpl
    extends BearerTypeSheetFedPressPlateEqualsSubDTO {
  _BearerTypeSheetFedPressPlateEqualsSubDTOImpl({
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

  /// Returns a shallow copy of this [BearerTypeSheetFedPressPlateEqualsSubDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  BearerTypeSheetFedPressPlateEqualsSubDTO copyWith({
    Object? id = _Undefined,
    Object? machineControlFile = _Undefined,
    Object? rasterFieldType = _Undefined,
    Object? registrationMarkType = _Undefined,
  }) {
    return BearerTypeSheetFedPressPlateEqualsSubDTO(
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

class BearerTypeSheetFedPressPlateEqualsSubDTOTable extends _i1.Table<int?> {
  BearerTypeSheetFedPressPlateEqualsSubDTOTable({super.tableRelation})
      : super(
            tableName:
                'prepress_bearer_type_sheet_fed_press_plate_equals_sub') {
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

class BearerTypeSheetFedPressPlateEqualsSubDTOInclude
    extends _i1.IncludeObject {
  BearerTypeSheetFedPressPlateEqualsSubDTOInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => BearerTypeSheetFedPressPlateEqualsSubDTO.t;
}

class BearerTypeSheetFedPressPlateEqualsSubDTOIncludeList
    extends _i1.IncludeList {
  BearerTypeSheetFedPressPlateEqualsSubDTOIncludeList._({
    _i1.WhereExpressionBuilder<BearerTypeSheetFedPressPlateEqualsSubDTOTable>?
        where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(BearerTypeSheetFedPressPlateEqualsSubDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => BearerTypeSheetFedPressPlateEqualsSubDTO.t;
}

class BearerTypeSheetFedPressPlateEqualsSubDTORepository {
  const BearerTypeSheetFedPressPlateEqualsSubDTORepository._();

  /// Returns a list of [BearerTypeSheetFedPressPlateEqualsSubDTO]s matching the given query parameters.
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
  Future<List<BearerTypeSheetFedPressPlateEqualsSubDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BearerTypeSheetFedPressPlateEqualsSubDTOTable>?
        where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BearerTypeSheetFedPressPlateEqualsSubDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BearerTypeSheetFedPressPlateEqualsSubDTOTable>?
        orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<BearerTypeSheetFedPressPlateEqualsSubDTO>(
      where: where?.call(BearerTypeSheetFedPressPlateEqualsSubDTO.t),
      orderBy: orderBy?.call(BearerTypeSheetFedPressPlateEqualsSubDTO.t),
      orderByList:
          orderByList?.call(BearerTypeSheetFedPressPlateEqualsSubDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [BearerTypeSheetFedPressPlateEqualsSubDTO] matching the given query parameters.
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
  Future<BearerTypeSheetFedPressPlateEqualsSubDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BearerTypeSheetFedPressPlateEqualsSubDTOTable>?
        where,
    int? offset,
    _i1.OrderByBuilder<BearerTypeSheetFedPressPlateEqualsSubDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BearerTypeSheetFedPressPlateEqualsSubDTOTable>?
        orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<BearerTypeSheetFedPressPlateEqualsSubDTO>(
      where: where?.call(BearerTypeSheetFedPressPlateEqualsSubDTO.t),
      orderBy: orderBy?.call(BearerTypeSheetFedPressPlateEqualsSubDTO.t),
      orderByList:
          orderByList?.call(BearerTypeSheetFedPressPlateEqualsSubDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [BearerTypeSheetFedPressPlateEqualsSubDTO] by its [id] or null if no such row exists.
  Future<BearerTypeSheetFedPressPlateEqualsSubDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<BearerTypeSheetFedPressPlateEqualsSubDTO>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [BearerTypeSheetFedPressPlateEqualsSubDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [BearerTypeSheetFedPressPlateEqualsSubDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<BearerTypeSheetFedPressPlateEqualsSubDTO>> insert(
    _i1.Session session,
    List<BearerTypeSheetFedPressPlateEqualsSubDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<BearerTypeSheetFedPressPlateEqualsSubDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [BearerTypeSheetFedPressPlateEqualsSubDTO] and returns the inserted row.
  ///
  /// The returned [BearerTypeSheetFedPressPlateEqualsSubDTO] will have its `id` field set.
  Future<BearerTypeSheetFedPressPlateEqualsSubDTO> insertRow(
    _i1.Session session,
    BearerTypeSheetFedPressPlateEqualsSubDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<BearerTypeSheetFedPressPlateEqualsSubDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [BearerTypeSheetFedPressPlateEqualsSubDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<BearerTypeSheetFedPressPlateEqualsSubDTO>> update(
    _i1.Session session,
    List<BearerTypeSheetFedPressPlateEqualsSubDTO> rows, {
    _i1.ColumnSelections<BearerTypeSheetFedPressPlateEqualsSubDTOTable>?
        columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<BearerTypeSheetFedPressPlateEqualsSubDTO>(
      rows,
      columns: columns?.call(BearerTypeSheetFedPressPlateEqualsSubDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [BearerTypeSheetFedPressPlateEqualsSubDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<BearerTypeSheetFedPressPlateEqualsSubDTO> updateRow(
    _i1.Session session,
    BearerTypeSheetFedPressPlateEqualsSubDTO row, {
    _i1.ColumnSelections<BearerTypeSheetFedPressPlateEqualsSubDTOTable>?
        columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<BearerTypeSheetFedPressPlateEqualsSubDTO>(
      row,
      columns: columns?.call(BearerTypeSheetFedPressPlateEqualsSubDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [BearerTypeSheetFedPressPlateEqualsSubDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<BearerTypeSheetFedPressPlateEqualsSubDTO>> delete(
    _i1.Session session,
    List<BearerTypeSheetFedPressPlateEqualsSubDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<BearerTypeSheetFedPressPlateEqualsSubDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [BearerTypeSheetFedPressPlateEqualsSubDTO].
  Future<BearerTypeSheetFedPressPlateEqualsSubDTO> deleteRow(
    _i1.Session session,
    BearerTypeSheetFedPressPlateEqualsSubDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<BearerTypeSheetFedPressPlateEqualsSubDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<BearerTypeSheetFedPressPlateEqualsSubDTO>> deleteWhere(
    _i1.Session session, {
    required _i1
        .WhereExpressionBuilder<BearerTypeSheetFedPressPlateEqualsSubDTOTable>
        where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<BearerTypeSheetFedPressPlateEqualsSubDTO>(
      where: where(BearerTypeSheetFedPressPlateEqualsSubDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BearerTypeSheetFedPressPlateEqualsSubDTOTable>?
        where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<BearerTypeSheetFedPressPlateEqualsSubDTO>(
      where: where?.call(BearerTypeSheetFedPressPlateEqualsSubDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
