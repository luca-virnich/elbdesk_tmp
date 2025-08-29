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

abstract class BearerTypeSheetFedPressMinPlateDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  BearerTypeSheetFedPressMinPlateDTO._({
    this.id,
    this.machineControlFile,
    this.rasterFieldType,
    this.registrationMarkType,
    required this.atsType,
  });

  factory BearerTypeSheetFedPressMinPlateDTO({
    int? id,
    String? machineControlFile,
    String? rasterFieldType,
    String? registrationMarkType,
    required String atsType,
  }) = _BearerTypeSheetFedPressMinPlateDTOImpl;

  factory BearerTypeSheetFedPressMinPlateDTO.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return BearerTypeSheetFedPressMinPlateDTO(
      id: jsonSerialization['id'] as int?,
      machineControlFile: jsonSerialization['machineControlFile'] as String?,
      rasterFieldType: jsonSerialization['rasterFieldType'] as String?,
      registrationMarkType:
          jsonSerialization['registrationMarkType'] as String?,
      atsType: jsonSerialization['atsType'] as String,
    );
  }

  static final t = BearerTypeSheetFedPressMinPlateDTOTable();

  static const db = BearerTypeSheetFedPressMinPlateDTORepository._();

  @override
  int? id;

  String? machineControlFile;

  String? rasterFieldType;

  String? registrationMarkType;

  String atsType;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [BearerTypeSheetFedPressMinPlateDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  BearerTypeSheetFedPressMinPlateDTO copyWith({
    int? id,
    String? machineControlFile,
    String? rasterFieldType,
    String? registrationMarkType,
    String? atsType,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (machineControlFile != null) 'machineControlFile': machineControlFile,
      if (rasterFieldType != null) 'rasterFieldType': rasterFieldType,
      if (registrationMarkType != null)
        'registrationMarkType': registrationMarkType,
      'atsType': atsType,
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
      'atsType': atsType,
    };
  }

  static BearerTypeSheetFedPressMinPlateDTOInclude include() {
    return BearerTypeSheetFedPressMinPlateDTOInclude._();
  }

  static BearerTypeSheetFedPressMinPlateDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<BearerTypeSheetFedPressMinPlateDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BearerTypeSheetFedPressMinPlateDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BearerTypeSheetFedPressMinPlateDTOTable>?
        orderByList,
    BearerTypeSheetFedPressMinPlateDTOInclude? include,
  }) {
    return BearerTypeSheetFedPressMinPlateDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(BearerTypeSheetFedPressMinPlateDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(BearerTypeSheetFedPressMinPlateDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BearerTypeSheetFedPressMinPlateDTOImpl
    extends BearerTypeSheetFedPressMinPlateDTO {
  _BearerTypeSheetFedPressMinPlateDTOImpl({
    int? id,
    String? machineControlFile,
    String? rasterFieldType,
    String? registrationMarkType,
    required String atsType,
  }) : super._(
          id: id,
          machineControlFile: machineControlFile,
          rasterFieldType: rasterFieldType,
          registrationMarkType: registrationMarkType,
          atsType: atsType,
        );

  /// Returns a shallow copy of this [BearerTypeSheetFedPressMinPlateDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  BearerTypeSheetFedPressMinPlateDTO copyWith({
    Object? id = _Undefined,
    Object? machineControlFile = _Undefined,
    Object? rasterFieldType = _Undefined,
    Object? registrationMarkType = _Undefined,
    String? atsType,
  }) {
    return BearerTypeSheetFedPressMinPlateDTO(
      id: id is int? ? id : this.id,
      machineControlFile: machineControlFile is String?
          ? machineControlFile
          : this.machineControlFile,
      rasterFieldType:
          rasterFieldType is String? ? rasterFieldType : this.rasterFieldType,
      registrationMarkType: registrationMarkType is String?
          ? registrationMarkType
          : this.registrationMarkType,
      atsType: atsType ?? this.atsType,
    );
  }
}

class BearerTypeSheetFedPressMinPlateDTOTable extends _i1.Table<int?> {
  BearerTypeSheetFedPressMinPlateDTOTable({super.tableRelation})
      : super(tableName: 'prepress_bearer_type_sheet_fed_press_min_plate') {
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
    atsType = _i1.ColumnString(
      'atsType',
      this,
    );
  }

  late final _i1.ColumnString machineControlFile;

  late final _i1.ColumnString rasterFieldType;

  late final _i1.ColumnString registrationMarkType;

  late final _i1.ColumnString atsType;

  @override
  List<_i1.Column> get columns => [
        id,
        machineControlFile,
        rasterFieldType,
        registrationMarkType,
        atsType,
      ];
}

class BearerTypeSheetFedPressMinPlateDTOInclude extends _i1.IncludeObject {
  BearerTypeSheetFedPressMinPlateDTOInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => BearerTypeSheetFedPressMinPlateDTO.t;
}

class BearerTypeSheetFedPressMinPlateDTOIncludeList extends _i1.IncludeList {
  BearerTypeSheetFedPressMinPlateDTOIncludeList._({
    _i1.WhereExpressionBuilder<BearerTypeSheetFedPressMinPlateDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(BearerTypeSheetFedPressMinPlateDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => BearerTypeSheetFedPressMinPlateDTO.t;
}

class BearerTypeSheetFedPressMinPlateDTORepository {
  const BearerTypeSheetFedPressMinPlateDTORepository._();

  /// Returns a list of [BearerTypeSheetFedPressMinPlateDTO]s matching the given query parameters.
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
  Future<List<BearerTypeSheetFedPressMinPlateDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BearerTypeSheetFedPressMinPlateDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BearerTypeSheetFedPressMinPlateDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BearerTypeSheetFedPressMinPlateDTOTable>?
        orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<BearerTypeSheetFedPressMinPlateDTO>(
      where: where?.call(BearerTypeSheetFedPressMinPlateDTO.t),
      orderBy: orderBy?.call(BearerTypeSheetFedPressMinPlateDTO.t),
      orderByList: orderByList?.call(BearerTypeSheetFedPressMinPlateDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [BearerTypeSheetFedPressMinPlateDTO] matching the given query parameters.
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
  Future<BearerTypeSheetFedPressMinPlateDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BearerTypeSheetFedPressMinPlateDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<BearerTypeSheetFedPressMinPlateDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BearerTypeSheetFedPressMinPlateDTOTable>?
        orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<BearerTypeSheetFedPressMinPlateDTO>(
      where: where?.call(BearerTypeSheetFedPressMinPlateDTO.t),
      orderBy: orderBy?.call(BearerTypeSheetFedPressMinPlateDTO.t),
      orderByList: orderByList?.call(BearerTypeSheetFedPressMinPlateDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [BearerTypeSheetFedPressMinPlateDTO] by its [id] or null if no such row exists.
  Future<BearerTypeSheetFedPressMinPlateDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<BearerTypeSheetFedPressMinPlateDTO>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [BearerTypeSheetFedPressMinPlateDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [BearerTypeSheetFedPressMinPlateDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<BearerTypeSheetFedPressMinPlateDTO>> insert(
    _i1.Session session,
    List<BearerTypeSheetFedPressMinPlateDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<BearerTypeSheetFedPressMinPlateDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [BearerTypeSheetFedPressMinPlateDTO] and returns the inserted row.
  ///
  /// The returned [BearerTypeSheetFedPressMinPlateDTO] will have its `id` field set.
  Future<BearerTypeSheetFedPressMinPlateDTO> insertRow(
    _i1.Session session,
    BearerTypeSheetFedPressMinPlateDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<BearerTypeSheetFedPressMinPlateDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [BearerTypeSheetFedPressMinPlateDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<BearerTypeSheetFedPressMinPlateDTO>> update(
    _i1.Session session,
    List<BearerTypeSheetFedPressMinPlateDTO> rows, {
    _i1.ColumnSelections<BearerTypeSheetFedPressMinPlateDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<BearerTypeSheetFedPressMinPlateDTO>(
      rows,
      columns: columns?.call(BearerTypeSheetFedPressMinPlateDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [BearerTypeSheetFedPressMinPlateDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<BearerTypeSheetFedPressMinPlateDTO> updateRow(
    _i1.Session session,
    BearerTypeSheetFedPressMinPlateDTO row, {
    _i1.ColumnSelections<BearerTypeSheetFedPressMinPlateDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<BearerTypeSheetFedPressMinPlateDTO>(
      row,
      columns: columns?.call(BearerTypeSheetFedPressMinPlateDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [BearerTypeSheetFedPressMinPlateDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<BearerTypeSheetFedPressMinPlateDTO>> delete(
    _i1.Session session,
    List<BearerTypeSheetFedPressMinPlateDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<BearerTypeSheetFedPressMinPlateDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [BearerTypeSheetFedPressMinPlateDTO].
  Future<BearerTypeSheetFedPressMinPlateDTO> deleteRow(
    _i1.Session session,
    BearerTypeSheetFedPressMinPlateDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<BearerTypeSheetFedPressMinPlateDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<BearerTypeSheetFedPressMinPlateDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<BearerTypeSheetFedPressMinPlateDTOTable>
        where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<BearerTypeSheetFedPressMinPlateDTO>(
      where: where(BearerTypeSheetFedPressMinPlateDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BearerTypeSheetFedPressMinPlateDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<BearerTypeSheetFedPressMinPlateDTO>(
      where: where?.call(BearerTypeSheetFedPressMinPlateDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
