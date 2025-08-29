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

abstract class FlutterLogDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  FlutterLogDTO._({
    this.id,
    this.deviceId,
    this.userId,
    this.context,
    required this.exception,
    this.flutterLibrary,
    this.stack,
    this.silent,
    this.information,
    required this.time,
    this.platform,
    this.appVersion,
    this.buildNumber,
  });

  factory FlutterLogDTO({
    int? id,
    String? deviceId,
    int? userId,
    String? context,
    required String exception,
    String? flutterLibrary,
    String? stack,
    bool? silent,
    String? information,
    required DateTime time,
    String? platform,
    String? appVersion,
    String? buildNumber,
  }) = _FlutterLogDTOImpl;

  factory FlutterLogDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return FlutterLogDTO(
      id: jsonSerialization['id'] as int?,
      deviceId: jsonSerialization['deviceId'] as String?,
      userId: jsonSerialization['userId'] as int?,
      context: jsonSerialization['context'] as String?,
      exception: jsonSerialization['exception'] as String,
      flutterLibrary: jsonSerialization['flutterLibrary'] as String?,
      stack: jsonSerialization['stack'] as String?,
      silent: jsonSerialization['silent'] as bool?,
      information: jsonSerialization['information'] as String?,
      time: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['time']),
      platform: jsonSerialization['platform'] as String?,
      appVersion: jsonSerialization['appVersion'] as String?,
      buildNumber: jsonSerialization['buildNumber'] as String?,
    );
  }

  static final t = FlutterLogDTOTable();

  static const db = FlutterLogDTORepository._();

  @override
  int? id;

  String? deviceId;

  int? userId;

  String? context;

  String exception;

  String? flutterLibrary;

  String? stack;

  bool? silent;

  String? information;

  DateTime time;

  String? platform;

  String? appVersion;

  String? buildNumber;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [FlutterLogDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  FlutterLogDTO copyWith({
    int? id,
    String? deviceId,
    int? userId,
    String? context,
    String? exception,
    String? flutterLibrary,
    String? stack,
    bool? silent,
    String? information,
    DateTime? time,
    String? platform,
    String? appVersion,
    String? buildNumber,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (deviceId != null) 'deviceId': deviceId,
      if (userId != null) 'userId': userId,
      if (context != null) 'context': context,
      'exception': exception,
      if (flutterLibrary != null) 'flutterLibrary': flutterLibrary,
      if (stack != null) 'stack': stack,
      if (silent != null) 'silent': silent,
      if (information != null) 'information': information,
      'time': time.toJson(),
      if (platform != null) 'platform': platform,
      if (appVersion != null) 'appVersion': appVersion,
      if (buildNumber != null) 'buildNumber': buildNumber,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      if (deviceId != null) 'deviceId': deviceId,
      if (userId != null) 'userId': userId,
      if (context != null) 'context': context,
      'exception': exception,
      if (flutterLibrary != null) 'flutterLibrary': flutterLibrary,
      if (stack != null) 'stack': stack,
      if (silent != null) 'silent': silent,
      if (information != null) 'information': information,
      'time': time.toJson(),
      if (platform != null) 'platform': platform,
      if (appVersion != null) 'appVersion': appVersion,
      if (buildNumber != null) 'buildNumber': buildNumber,
    };
  }

  static FlutterLogDTOInclude include() {
    return FlutterLogDTOInclude._();
  }

  static FlutterLogDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<FlutterLogDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<FlutterLogDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FlutterLogDTOTable>? orderByList,
    FlutterLogDTOInclude? include,
  }) {
    return FlutterLogDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(FlutterLogDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(FlutterLogDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _FlutterLogDTOImpl extends FlutterLogDTO {
  _FlutterLogDTOImpl({
    int? id,
    String? deviceId,
    int? userId,
    String? context,
    required String exception,
    String? flutterLibrary,
    String? stack,
    bool? silent,
    String? information,
    required DateTime time,
    String? platform,
    String? appVersion,
    String? buildNumber,
  }) : super._(
          id: id,
          deviceId: deviceId,
          userId: userId,
          context: context,
          exception: exception,
          flutterLibrary: flutterLibrary,
          stack: stack,
          silent: silent,
          information: information,
          time: time,
          platform: platform,
          appVersion: appVersion,
          buildNumber: buildNumber,
        );

  /// Returns a shallow copy of this [FlutterLogDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  FlutterLogDTO copyWith({
    Object? id = _Undefined,
    Object? deviceId = _Undefined,
    Object? userId = _Undefined,
    Object? context = _Undefined,
    String? exception,
    Object? flutterLibrary = _Undefined,
    Object? stack = _Undefined,
    Object? silent = _Undefined,
    Object? information = _Undefined,
    DateTime? time,
    Object? platform = _Undefined,
    Object? appVersion = _Undefined,
    Object? buildNumber = _Undefined,
  }) {
    return FlutterLogDTO(
      id: id is int? ? id : this.id,
      deviceId: deviceId is String? ? deviceId : this.deviceId,
      userId: userId is int? ? userId : this.userId,
      context: context is String? ? context : this.context,
      exception: exception ?? this.exception,
      flutterLibrary:
          flutterLibrary is String? ? flutterLibrary : this.flutterLibrary,
      stack: stack is String? ? stack : this.stack,
      silent: silent is bool? ? silent : this.silent,
      information: information is String? ? information : this.information,
      time: time ?? this.time,
      platform: platform is String? ? platform : this.platform,
      appVersion: appVersion is String? ? appVersion : this.appVersion,
      buildNumber: buildNumber is String? ? buildNumber : this.buildNumber,
    );
  }
}

class FlutterLogDTOTable extends _i1.Table<int?> {
  FlutterLogDTOTable({super.tableRelation})
      : super(tableName: 'ed_core_admin_flutter_log') {
    deviceId = _i1.ColumnString(
      'deviceId',
      this,
    );
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    context = _i1.ColumnString(
      'context',
      this,
    );
    exception = _i1.ColumnString(
      'exception',
      this,
    );
    flutterLibrary = _i1.ColumnString(
      'flutterLibrary',
      this,
    );
    stack = _i1.ColumnString(
      'stack',
      this,
    );
    silent = _i1.ColumnBool(
      'silent',
      this,
    );
    information = _i1.ColumnString(
      'information',
      this,
    );
    time = _i1.ColumnDateTime(
      'time',
      this,
    );
    platform = _i1.ColumnString(
      'platform',
      this,
    );
    appVersion = _i1.ColumnString(
      'appVersion',
      this,
    );
    buildNumber = _i1.ColumnString(
      'buildNumber',
      this,
    );
  }

  late final _i1.ColumnString deviceId;

  late final _i1.ColumnInt userId;

  late final _i1.ColumnString context;

  late final _i1.ColumnString exception;

  late final _i1.ColumnString flutterLibrary;

  late final _i1.ColumnString stack;

  late final _i1.ColumnBool silent;

  late final _i1.ColumnString information;

  late final _i1.ColumnDateTime time;

  late final _i1.ColumnString platform;

  late final _i1.ColumnString appVersion;

  late final _i1.ColumnString buildNumber;

  @override
  List<_i1.Column> get columns => [
        id,
        deviceId,
        userId,
        context,
        exception,
        flutterLibrary,
        stack,
        silent,
        information,
        time,
        platform,
        appVersion,
        buildNumber,
      ];
}

class FlutterLogDTOInclude extends _i1.IncludeObject {
  FlutterLogDTOInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => FlutterLogDTO.t;
}

class FlutterLogDTOIncludeList extends _i1.IncludeList {
  FlutterLogDTOIncludeList._({
    _i1.WhereExpressionBuilder<FlutterLogDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(FlutterLogDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => FlutterLogDTO.t;
}

class FlutterLogDTORepository {
  const FlutterLogDTORepository._();

  /// Returns a list of [FlutterLogDTO]s matching the given query parameters.
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
  Future<List<FlutterLogDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FlutterLogDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<FlutterLogDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FlutterLogDTOTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<FlutterLogDTO>(
      where: where?.call(FlutterLogDTO.t),
      orderBy: orderBy?.call(FlutterLogDTO.t),
      orderByList: orderByList?.call(FlutterLogDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [FlutterLogDTO] matching the given query parameters.
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
  Future<FlutterLogDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FlutterLogDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<FlutterLogDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FlutterLogDTOTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<FlutterLogDTO>(
      where: where?.call(FlutterLogDTO.t),
      orderBy: orderBy?.call(FlutterLogDTO.t),
      orderByList: orderByList?.call(FlutterLogDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [FlutterLogDTO] by its [id] or null if no such row exists.
  Future<FlutterLogDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<FlutterLogDTO>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [FlutterLogDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [FlutterLogDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<FlutterLogDTO>> insert(
    _i1.Session session,
    List<FlutterLogDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<FlutterLogDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [FlutterLogDTO] and returns the inserted row.
  ///
  /// The returned [FlutterLogDTO] will have its `id` field set.
  Future<FlutterLogDTO> insertRow(
    _i1.Session session,
    FlutterLogDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<FlutterLogDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [FlutterLogDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<FlutterLogDTO>> update(
    _i1.Session session,
    List<FlutterLogDTO> rows, {
    _i1.ColumnSelections<FlutterLogDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<FlutterLogDTO>(
      rows,
      columns: columns?.call(FlutterLogDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [FlutterLogDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<FlutterLogDTO> updateRow(
    _i1.Session session,
    FlutterLogDTO row, {
    _i1.ColumnSelections<FlutterLogDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<FlutterLogDTO>(
      row,
      columns: columns?.call(FlutterLogDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [FlutterLogDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<FlutterLogDTO>> delete(
    _i1.Session session,
    List<FlutterLogDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<FlutterLogDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [FlutterLogDTO].
  Future<FlutterLogDTO> deleteRow(
    _i1.Session session,
    FlutterLogDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<FlutterLogDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<FlutterLogDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<FlutterLogDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<FlutterLogDTO>(
      where: where(FlutterLogDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FlutterLogDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<FlutterLogDTO>(
      where: where?.call(FlutterLogDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
