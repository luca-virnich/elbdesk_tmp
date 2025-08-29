/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i2;

abstract class ServiceUserTokenDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ServiceUserTokenDTO._({
    this.id,
    this.authKeyId,
    this.authKey,
    required this.tokenDescription,
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
  }) : _edUserServiceUserTokensEdUserServiceUserId = null;

  factory ServiceUserTokenDTO({
    int? id,
    int? authKeyId,
    _i2.AuthKey? authKey,
    required String tokenDescription,
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
  }) = _ServiceUserTokenDTOImpl;

  factory ServiceUserTokenDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return ServiceUserTokenDTOImplicit._(
      id: jsonSerialization['id'] as int?,
      authKeyId: jsonSerialization['authKeyId'] as int?,
      authKey: jsonSerialization['authKey'] == null
          ? null
          : _i2.AuthKey.fromJson(
              (jsonSerialization['authKey'] as Map<String, dynamic>)),
      tokenDescription: jsonSerialization['tokenDescription'] as String,
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
      $_edUserServiceUserTokensEdUserServiceUserId:
          jsonSerialization['_edUserServiceUserTokensEdUserServiceUserId']
              as int?,
    );
  }

  static final t = ServiceUserTokenDTOTable();

  static const db = ServiceUserTokenDTORepository._();

  @override
  int? id;

  int? authKeyId;

  _i2.AuthKey? authKey;

  String tokenDescription;

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

  final int? _edUserServiceUserTokensEdUserServiceUserId;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [ServiceUserTokenDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ServiceUserTokenDTO copyWith({
    int? id,
    int? authKeyId,
    _i2.AuthKey? authKey,
    String? tokenDescription,
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
      if (authKeyId != null) 'authKeyId': authKeyId,
      if (authKey != null) 'authKey': authKey?.toJson(),
      'tokenDescription': tokenDescription,
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
      if (_edUserServiceUserTokensEdUserServiceUserId != null)
        '_edUserServiceUserTokensEdUserServiceUserId':
            _edUserServiceUserTokensEdUserServiceUserId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      if (authKeyId != null) 'authKeyId': authKeyId,
      if (authKey != null) 'authKey': authKey?.toJsonForProtocol(),
      'tokenDescription': tokenDescription,
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

  static ServiceUserTokenDTOInclude include({_i2.AuthKeyInclude? authKey}) {
    return ServiceUserTokenDTOInclude._(authKey: authKey);
  }

  static ServiceUserTokenDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<ServiceUserTokenDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ServiceUserTokenDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ServiceUserTokenDTOTable>? orderByList,
    ServiceUserTokenDTOInclude? include,
  }) {
    return ServiceUserTokenDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ServiceUserTokenDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ServiceUserTokenDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ServiceUserTokenDTOImpl extends ServiceUserTokenDTO {
  _ServiceUserTokenDTOImpl({
    int? id,
    int? authKeyId,
    _i2.AuthKey? authKey,
    required String tokenDescription,
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
          authKeyId: authKeyId,
          authKey: authKey,
          tokenDescription: tokenDescription,
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

  /// Returns a shallow copy of this [ServiceUserTokenDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ServiceUserTokenDTO copyWith({
    Object? id = _Undefined,
    Object? authKeyId = _Undefined,
    Object? authKey = _Undefined,
    String? tokenDescription,
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
    return ServiceUserTokenDTOImplicit._(
      id: id is int? ? id : this.id,
      authKeyId: authKeyId is int? ? authKeyId : this.authKeyId,
      authKey: authKey is _i2.AuthKey? ? authKey : this.authKey?.copyWith(),
      tokenDescription: tokenDescription ?? this.tokenDescription,
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
      $_edUserServiceUserTokensEdUserServiceUserId:
          this._edUserServiceUserTokensEdUserServiceUserId,
    );
  }
}

class ServiceUserTokenDTOImplicit extends _ServiceUserTokenDTOImpl {
  ServiceUserTokenDTOImplicit._({
    int? id,
    int? authKeyId,
    _i2.AuthKey? authKey,
    required String tokenDescription,
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
    int? $_edUserServiceUserTokensEdUserServiceUserId,
  })  : _edUserServiceUserTokensEdUserServiceUserId =
            $_edUserServiceUserTokensEdUserServiceUserId,
        super(
          id: id,
          authKeyId: authKeyId,
          authKey: authKey,
          tokenDescription: tokenDescription,
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

  factory ServiceUserTokenDTOImplicit(
    ServiceUserTokenDTO serviceUserTokenDTO, {
    int? $_edUserServiceUserTokensEdUserServiceUserId,
  }) {
    return ServiceUserTokenDTOImplicit._(
      id: serviceUserTokenDTO.id,
      authKeyId: serviceUserTokenDTO.authKeyId,
      authKey: serviceUserTokenDTO.authKey,
      tokenDescription: serviceUserTokenDTO.tokenDescription,
      createdAt: serviceUserTokenDTO.createdAt,
      createdById: serviceUserTokenDTO.createdById,
      lastModifiedAt: serviceUserTokenDTO.lastModifiedAt,
      lastModifiedById: serviceUserTokenDTO.lastModifiedById,
      deletedAt: serviceUserTokenDTO.deletedAt,
      deletedById: serviceUserTokenDTO.deletedById,
      editingById: serviceUserTokenDTO.editingById,
      editingSince: serviceUserTokenDTO.editingSince,
      isDraft: serviceUserTokenDTO.isDraft,
      editingSession: serviceUserTokenDTO.editingSession,
      $_edUserServiceUserTokensEdUserServiceUserId:
          $_edUserServiceUserTokensEdUserServiceUserId,
    );
  }

  @override
  final int? _edUserServiceUserTokensEdUserServiceUserId;
}

class ServiceUserTokenDTOTable extends _i1.Table<int?> {
  ServiceUserTokenDTOTable({super.tableRelation})
      : super(tableName: 'ed_user_service_user_token') {
    authKeyId = _i1.ColumnInt(
      'authKeyId',
      this,
    );
    tokenDescription = _i1.ColumnString(
      'tokenDescription',
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
    $_edUserServiceUserTokensEdUserServiceUserId = _i1.ColumnInt(
      '_edUserServiceUserTokensEdUserServiceUserId',
      this,
    );
  }

  late final _i1.ColumnInt authKeyId;

  _i2.AuthKeyTable? _authKey;

  late final _i1.ColumnString tokenDescription;

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

  late final _i1.ColumnInt $_edUserServiceUserTokensEdUserServiceUserId;

  _i2.AuthKeyTable get authKey {
    if (_authKey != null) return _authKey!;
    _authKey = _i1.createRelationTable(
      relationFieldName: 'authKey',
      field: ServiceUserTokenDTO.t.authKeyId,
      foreignField: _i2.AuthKey.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.AuthKeyTable(tableRelation: foreignTableRelation),
    );
    return _authKey!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        authKeyId,
        tokenDescription,
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
        $_edUserServiceUserTokensEdUserServiceUserId,
      ];

  @override
  List<_i1.Column> get managedColumns => [
        id,
        authKeyId,
        tokenDescription,
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

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'authKey') {
      return authKey;
    }
    return null;
  }
}

class ServiceUserTokenDTOInclude extends _i1.IncludeObject {
  ServiceUserTokenDTOInclude._({_i2.AuthKeyInclude? authKey}) {
    _authKey = authKey;
  }

  _i2.AuthKeyInclude? _authKey;

  @override
  Map<String, _i1.Include?> get includes => {'authKey': _authKey};

  @override
  _i1.Table<int?> get table => ServiceUserTokenDTO.t;
}

class ServiceUserTokenDTOIncludeList extends _i1.IncludeList {
  ServiceUserTokenDTOIncludeList._({
    _i1.WhereExpressionBuilder<ServiceUserTokenDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ServiceUserTokenDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ServiceUserTokenDTO.t;
}

class ServiceUserTokenDTORepository {
  const ServiceUserTokenDTORepository._();

  final attachRow = const ServiceUserTokenDTOAttachRowRepository._();

  final detachRow = const ServiceUserTokenDTODetachRowRepository._();

  /// Returns a list of [ServiceUserTokenDTO]s matching the given query parameters.
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
  Future<List<ServiceUserTokenDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ServiceUserTokenDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ServiceUserTokenDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ServiceUserTokenDTOTable>? orderByList,
    _i1.Transaction? transaction,
    ServiceUserTokenDTOInclude? include,
  }) async {
    return session.db.find<ServiceUserTokenDTO>(
      where: where?.call(ServiceUserTokenDTO.t),
      orderBy: orderBy?.call(ServiceUserTokenDTO.t),
      orderByList: orderByList?.call(ServiceUserTokenDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [ServiceUserTokenDTO] matching the given query parameters.
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
  Future<ServiceUserTokenDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ServiceUserTokenDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<ServiceUserTokenDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ServiceUserTokenDTOTable>? orderByList,
    _i1.Transaction? transaction,
    ServiceUserTokenDTOInclude? include,
  }) async {
    return session.db.findFirstRow<ServiceUserTokenDTO>(
      where: where?.call(ServiceUserTokenDTO.t),
      orderBy: orderBy?.call(ServiceUserTokenDTO.t),
      orderByList: orderByList?.call(ServiceUserTokenDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [ServiceUserTokenDTO] by its [id] or null if no such row exists.
  Future<ServiceUserTokenDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ServiceUserTokenDTOInclude? include,
  }) async {
    return session.db.findById<ServiceUserTokenDTO>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [ServiceUserTokenDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [ServiceUserTokenDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ServiceUserTokenDTO>> insert(
    _i1.Session session,
    List<ServiceUserTokenDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ServiceUserTokenDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ServiceUserTokenDTO] and returns the inserted row.
  ///
  /// The returned [ServiceUserTokenDTO] will have its `id` field set.
  Future<ServiceUserTokenDTO> insertRow(
    _i1.Session session,
    ServiceUserTokenDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ServiceUserTokenDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ServiceUserTokenDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ServiceUserTokenDTO>> update(
    _i1.Session session,
    List<ServiceUserTokenDTO> rows, {
    _i1.ColumnSelections<ServiceUserTokenDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ServiceUserTokenDTO>(
      rows,
      columns: columns?.call(ServiceUserTokenDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ServiceUserTokenDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ServiceUserTokenDTO> updateRow(
    _i1.Session session,
    ServiceUserTokenDTO row, {
    _i1.ColumnSelections<ServiceUserTokenDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ServiceUserTokenDTO>(
      row,
      columns: columns?.call(ServiceUserTokenDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [ServiceUserTokenDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ServiceUserTokenDTO>> delete(
    _i1.Session session,
    List<ServiceUserTokenDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ServiceUserTokenDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ServiceUserTokenDTO].
  Future<ServiceUserTokenDTO> deleteRow(
    _i1.Session session,
    ServiceUserTokenDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ServiceUserTokenDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ServiceUserTokenDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ServiceUserTokenDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ServiceUserTokenDTO>(
      where: where(ServiceUserTokenDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ServiceUserTokenDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ServiceUserTokenDTO>(
      where: where?.call(ServiceUserTokenDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ServiceUserTokenDTOAttachRowRepository {
  const ServiceUserTokenDTOAttachRowRepository._();

  /// Creates a relation between the given [ServiceUserTokenDTO] and [AuthKey]
  /// by setting the [ServiceUserTokenDTO]'s foreign key `authKeyId` to refer to the [AuthKey].
  Future<void> authKey(
    _i1.Session session,
    ServiceUserTokenDTO serviceUserTokenDTO,
    _i2.AuthKey authKey, {
    _i1.Transaction? transaction,
  }) async {
    if (serviceUserTokenDTO.id == null) {
      throw ArgumentError.notNull('serviceUserTokenDTO.id');
    }
    if (authKey.id == null) {
      throw ArgumentError.notNull('authKey.id');
    }

    var $serviceUserTokenDTO =
        serviceUserTokenDTO.copyWith(authKeyId: authKey.id);
    await session.db.updateRow<ServiceUserTokenDTO>(
      $serviceUserTokenDTO,
      columns: [ServiceUserTokenDTO.t.authKeyId],
      transaction: transaction,
    );
  }
}

class ServiceUserTokenDTODetachRowRepository {
  const ServiceUserTokenDTODetachRowRepository._();

  /// Detaches the relation between this [ServiceUserTokenDTO] and the [AuthKey] set in `authKey`
  /// by setting the [ServiceUserTokenDTO]'s foreign key `authKeyId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> authKey(
    _i1.Session session,
    ServiceUserTokenDTO serviceusertokendto, {
    _i1.Transaction? transaction,
  }) async {
    if (serviceusertokendto.id == null) {
      throw ArgumentError.notNull('serviceusertokendto.id');
    }

    var $serviceusertokendto = serviceusertokendto.copyWith(authKeyId: null);
    await session.db.updateRow<ServiceUserTokenDTO>(
      $serviceusertokendto,
      columns: [ServiceUserTokenDTO.t.authKeyId],
      transaction: transaction,
    );
  }
}
