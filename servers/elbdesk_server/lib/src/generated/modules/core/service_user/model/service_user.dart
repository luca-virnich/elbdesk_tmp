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
import '../../../../modules/core/service_user/model/service_user_token.dart'
    as _i3;

abstract class ServiceUserDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ServiceUserDTO._({
    this.id,
    this.userInfoId,
    this.userInfo,
    required this.serviceName,
    required this.serviceDescription,
    required this.isActive,
    this.tokens,
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

  factory ServiceUserDTO({
    int? id,
    int? userInfoId,
    _i2.UserInfo? userInfo,
    required String serviceName,
    required String serviceDescription,
    required bool isActive,
    List<_i3.ServiceUserTokenDTO>? tokens,
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
  }) = _ServiceUserDTOImpl;

  factory ServiceUserDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return ServiceUserDTO(
      id: jsonSerialization['id'] as int?,
      userInfoId: jsonSerialization['userInfoId'] as int?,
      userInfo: jsonSerialization['userInfo'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['userInfo'] as Map<String, dynamic>)),
      serviceName: jsonSerialization['serviceName'] as String,
      serviceDescription: jsonSerialization['serviceDescription'] as String,
      isActive: jsonSerialization['isActive'] as bool,
      tokens: (jsonSerialization['tokens'] as List?)
          ?.map((e) =>
              _i3.ServiceUserTokenDTO.fromJson((e as Map<String, dynamic>)))
          .toList(),
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

  static final t = ServiceUserDTOTable();

  static const db = ServiceUserDTORepository._();

  @override
  int? id;

  int? userInfoId;

  _i2.UserInfo? userInfo;

  String serviceName;

  String serviceDescription;

  bool isActive;

  List<_i3.ServiceUserTokenDTO>? tokens;

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

  /// Returns a shallow copy of this [ServiceUserDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ServiceUserDTO copyWith({
    int? id,
    int? userInfoId,
    _i2.UserInfo? userInfo,
    String? serviceName,
    String? serviceDescription,
    bool? isActive,
    List<_i3.ServiceUserTokenDTO>? tokens,
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
      if (userInfoId != null) 'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJson(),
      'serviceName': serviceName,
      'serviceDescription': serviceDescription,
      'isActive': isActive,
      if (tokens != null)
        'tokens': tokens?.toJson(valueToJson: (v) => v.toJson()),
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
      if (userInfoId != null) 'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJsonForProtocol(),
      'serviceName': serviceName,
      'serviceDescription': serviceDescription,
      'isActive': isActive,
      if (tokens != null)
        'tokens': tokens?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
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

  static ServiceUserDTOInclude include({
    _i2.UserInfoInclude? userInfo,
    _i3.ServiceUserTokenDTOIncludeList? tokens,
  }) {
    return ServiceUserDTOInclude._(
      userInfo: userInfo,
      tokens: tokens,
    );
  }

  static ServiceUserDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<ServiceUserDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ServiceUserDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ServiceUserDTOTable>? orderByList,
    ServiceUserDTOInclude? include,
  }) {
    return ServiceUserDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ServiceUserDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ServiceUserDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ServiceUserDTOImpl extends ServiceUserDTO {
  _ServiceUserDTOImpl({
    int? id,
    int? userInfoId,
    _i2.UserInfo? userInfo,
    required String serviceName,
    required String serviceDescription,
    required bool isActive,
    List<_i3.ServiceUserTokenDTO>? tokens,
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
          userInfoId: userInfoId,
          userInfo: userInfo,
          serviceName: serviceName,
          serviceDescription: serviceDescription,
          isActive: isActive,
          tokens: tokens,
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

  /// Returns a shallow copy of this [ServiceUserDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ServiceUserDTO copyWith({
    Object? id = _Undefined,
    Object? userInfoId = _Undefined,
    Object? userInfo = _Undefined,
    String? serviceName,
    String? serviceDescription,
    bool? isActive,
    Object? tokens = _Undefined,
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
    return ServiceUserDTO(
      id: id is int? ? id : this.id,
      userInfoId: userInfoId is int? ? userInfoId : this.userInfoId,
      userInfo:
          userInfo is _i2.UserInfo? ? userInfo : this.userInfo?.copyWith(),
      serviceName: serviceName ?? this.serviceName,
      serviceDescription: serviceDescription ?? this.serviceDescription,
      isActive: isActive ?? this.isActive,
      tokens: tokens is List<_i3.ServiceUserTokenDTO>?
          ? tokens
          : this.tokens?.map((e0) => e0.copyWith()).toList(),
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

class ServiceUserDTOTable extends _i1.Table<int?> {
  ServiceUserDTOTable({super.tableRelation})
      : super(tableName: 'ed_user_service_user') {
    userInfoId = _i1.ColumnInt(
      'userInfoId',
      this,
    );
    serviceName = _i1.ColumnString(
      'serviceName',
      this,
    );
    serviceDescription = _i1.ColumnString(
      'serviceDescription',
      this,
    );
    isActive = _i1.ColumnBool(
      'isActive',
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

  late final _i1.ColumnInt userInfoId;

  _i2.UserInfoTable? _userInfo;

  late final _i1.ColumnString serviceName;

  late final _i1.ColumnString serviceDescription;

  late final _i1.ColumnBool isActive;

  _i3.ServiceUserTokenDTOTable? ___tokens;

  _i1.ManyRelation<_i3.ServiceUserTokenDTOTable>? _tokens;

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

  _i2.UserInfoTable get userInfo {
    if (_userInfo != null) return _userInfo!;
    _userInfo = _i1.createRelationTable(
      relationFieldName: 'userInfo',
      field: ServiceUserDTO.t.userInfoId,
      foreignField: _i2.UserInfo.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserInfoTable(tableRelation: foreignTableRelation),
    );
    return _userInfo!;
  }

  _i3.ServiceUserTokenDTOTable get __tokens {
    if (___tokens != null) return ___tokens!;
    ___tokens = _i1.createRelationTable(
      relationFieldName: '__tokens',
      field: ServiceUserDTO.t.id,
      foreignField: _i3
          .ServiceUserTokenDTO.t.$_edUserServiceUserTokensEdUserServiceUserId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.ServiceUserTokenDTOTable(tableRelation: foreignTableRelation),
    );
    return ___tokens!;
  }

  _i1.ManyRelation<_i3.ServiceUserTokenDTOTable> get tokens {
    if (_tokens != null) return _tokens!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'tokens',
      field: ServiceUserDTO.t.id,
      foreignField: _i3
          .ServiceUserTokenDTO.t.$_edUserServiceUserTokensEdUserServiceUserId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.ServiceUserTokenDTOTable(tableRelation: foreignTableRelation),
    );
    _tokens = _i1.ManyRelation<_i3.ServiceUserTokenDTOTable>(
      tableWithRelations: relationTable,
      table: _i3.ServiceUserTokenDTOTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _tokens!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        userInfoId,
        serviceName,
        serviceDescription,
        isActive,
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
    if (relationField == 'userInfo') {
      return userInfo;
    }
    if (relationField == 'tokens') {
      return __tokens;
    }
    return null;
  }
}

class ServiceUserDTOInclude extends _i1.IncludeObject {
  ServiceUserDTOInclude._({
    _i2.UserInfoInclude? userInfo,
    _i3.ServiceUserTokenDTOIncludeList? tokens,
  }) {
    _userInfo = userInfo;
    _tokens = tokens;
  }

  _i2.UserInfoInclude? _userInfo;

  _i3.ServiceUserTokenDTOIncludeList? _tokens;

  @override
  Map<String, _i1.Include?> get includes => {
        'userInfo': _userInfo,
        'tokens': _tokens,
      };

  @override
  _i1.Table<int?> get table => ServiceUserDTO.t;
}

class ServiceUserDTOIncludeList extends _i1.IncludeList {
  ServiceUserDTOIncludeList._({
    _i1.WhereExpressionBuilder<ServiceUserDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ServiceUserDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ServiceUserDTO.t;
}

class ServiceUserDTORepository {
  const ServiceUserDTORepository._();

  final attach = const ServiceUserDTOAttachRepository._();

  final attachRow = const ServiceUserDTOAttachRowRepository._();

  final detach = const ServiceUserDTODetachRepository._();

  final detachRow = const ServiceUserDTODetachRowRepository._();

  /// Returns a list of [ServiceUserDTO]s matching the given query parameters.
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
  Future<List<ServiceUserDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ServiceUserDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ServiceUserDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ServiceUserDTOTable>? orderByList,
    _i1.Transaction? transaction,
    ServiceUserDTOInclude? include,
  }) async {
    return session.db.find<ServiceUserDTO>(
      where: where?.call(ServiceUserDTO.t),
      orderBy: orderBy?.call(ServiceUserDTO.t),
      orderByList: orderByList?.call(ServiceUserDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [ServiceUserDTO] matching the given query parameters.
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
  Future<ServiceUserDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ServiceUserDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<ServiceUserDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ServiceUserDTOTable>? orderByList,
    _i1.Transaction? transaction,
    ServiceUserDTOInclude? include,
  }) async {
    return session.db.findFirstRow<ServiceUserDTO>(
      where: where?.call(ServiceUserDTO.t),
      orderBy: orderBy?.call(ServiceUserDTO.t),
      orderByList: orderByList?.call(ServiceUserDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [ServiceUserDTO] by its [id] or null if no such row exists.
  Future<ServiceUserDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ServiceUserDTOInclude? include,
  }) async {
    return session.db.findById<ServiceUserDTO>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [ServiceUserDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [ServiceUserDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ServiceUserDTO>> insert(
    _i1.Session session,
    List<ServiceUserDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ServiceUserDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ServiceUserDTO] and returns the inserted row.
  ///
  /// The returned [ServiceUserDTO] will have its `id` field set.
  Future<ServiceUserDTO> insertRow(
    _i1.Session session,
    ServiceUserDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ServiceUserDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ServiceUserDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ServiceUserDTO>> update(
    _i1.Session session,
    List<ServiceUserDTO> rows, {
    _i1.ColumnSelections<ServiceUserDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ServiceUserDTO>(
      rows,
      columns: columns?.call(ServiceUserDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ServiceUserDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ServiceUserDTO> updateRow(
    _i1.Session session,
    ServiceUserDTO row, {
    _i1.ColumnSelections<ServiceUserDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ServiceUserDTO>(
      row,
      columns: columns?.call(ServiceUserDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [ServiceUserDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ServiceUserDTO>> delete(
    _i1.Session session,
    List<ServiceUserDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ServiceUserDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ServiceUserDTO].
  Future<ServiceUserDTO> deleteRow(
    _i1.Session session,
    ServiceUserDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ServiceUserDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ServiceUserDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ServiceUserDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ServiceUserDTO>(
      where: where(ServiceUserDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ServiceUserDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ServiceUserDTO>(
      where: where?.call(ServiceUserDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ServiceUserDTOAttachRepository {
  const ServiceUserDTOAttachRepository._();

  /// Creates a relation between this [ServiceUserDTO] and the given [ServiceUserTokenDTO]s
  /// by setting each [ServiceUserTokenDTO]'s foreign key `_edUserServiceUserTokensEdUserServiceUserId` to refer to this [ServiceUserDTO].
  Future<void> tokens(
    _i1.Session session,
    ServiceUserDTO serviceUserDTO,
    List<_i3.ServiceUserTokenDTO> serviceUserTokenDTO, {
    _i1.Transaction? transaction,
  }) async {
    if (serviceUserTokenDTO.any((e) => e.id == null)) {
      throw ArgumentError.notNull('serviceUserTokenDTO.id');
    }
    if (serviceUserDTO.id == null) {
      throw ArgumentError.notNull('serviceUserDTO.id');
    }

    var $serviceUserTokenDTO = serviceUserTokenDTO
        .map((e) => _i3.ServiceUserTokenDTOImplicit(
              e,
              $_edUserServiceUserTokensEdUserServiceUserId: serviceUserDTO.id,
            ))
        .toList();
    await session.db.update<_i3.ServiceUserTokenDTO>(
      $serviceUserTokenDTO,
      columns: [
        _i3.ServiceUserTokenDTO.t.$_edUserServiceUserTokensEdUserServiceUserId
      ],
      transaction: transaction,
    );
  }
}

class ServiceUserDTOAttachRowRepository {
  const ServiceUserDTOAttachRowRepository._();

  /// Creates a relation between the given [ServiceUserDTO] and [UserInfo]
  /// by setting the [ServiceUserDTO]'s foreign key `userInfoId` to refer to the [UserInfo].
  Future<void> userInfo(
    _i1.Session session,
    ServiceUserDTO serviceUserDTO,
    _i2.UserInfo userInfo, {
    _i1.Transaction? transaction,
  }) async {
    if (serviceUserDTO.id == null) {
      throw ArgumentError.notNull('serviceUserDTO.id');
    }
    if (userInfo.id == null) {
      throw ArgumentError.notNull('userInfo.id');
    }

    var $serviceUserDTO = serviceUserDTO.copyWith(userInfoId: userInfo.id);
    await session.db.updateRow<ServiceUserDTO>(
      $serviceUserDTO,
      columns: [ServiceUserDTO.t.userInfoId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [ServiceUserDTO] and the given [ServiceUserTokenDTO]
  /// by setting the [ServiceUserTokenDTO]'s foreign key `_edUserServiceUserTokensEdUserServiceUserId` to refer to this [ServiceUserDTO].
  Future<void> tokens(
    _i1.Session session,
    ServiceUserDTO serviceUserDTO,
    _i3.ServiceUserTokenDTO serviceUserTokenDTO, {
    _i1.Transaction? transaction,
  }) async {
    if (serviceUserTokenDTO.id == null) {
      throw ArgumentError.notNull('serviceUserTokenDTO.id');
    }
    if (serviceUserDTO.id == null) {
      throw ArgumentError.notNull('serviceUserDTO.id');
    }

    var $serviceUserTokenDTO = _i3.ServiceUserTokenDTOImplicit(
      serviceUserTokenDTO,
      $_edUserServiceUserTokensEdUserServiceUserId: serviceUserDTO.id,
    );
    await session.db.updateRow<_i3.ServiceUserTokenDTO>(
      $serviceUserTokenDTO,
      columns: [
        _i3.ServiceUserTokenDTO.t.$_edUserServiceUserTokensEdUserServiceUserId
      ],
      transaction: transaction,
    );
  }
}

class ServiceUserDTODetachRepository {
  const ServiceUserDTODetachRepository._();

  /// Detaches the relation between this [ServiceUserDTO] and the given [ServiceUserTokenDTO]
  /// by setting the [ServiceUserTokenDTO]'s foreign key `_edUserServiceUserTokensEdUserServiceUserId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> tokens(
    _i1.Session session,
    List<_i3.ServiceUserTokenDTO> serviceUserTokenDTO, {
    _i1.Transaction? transaction,
  }) async {
    if (serviceUserTokenDTO.any((e) => e.id == null)) {
      throw ArgumentError.notNull('serviceUserTokenDTO.id');
    }

    var $serviceUserTokenDTO = serviceUserTokenDTO
        .map((e) => _i3.ServiceUserTokenDTOImplicit(
              e,
              $_edUserServiceUserTokensEdUserServiceUserId: null,
            ))
        .toList();
    await session.db.update<_i3.ServiceUserTokenDTO>(
      $serviceUserTokenDTO,
      columns: [
        _i3.ServiceUserTokenDTO.t.$_edUserServiceUserTokensEdUserServiceUserId
      ],
      transaction: transaction,
    );
  }
}

class ServiceUserDTODetachRowRepository {
  const ServiceUserDTODetachRowRepository._();

  /// Detaches the relation between this [ServiceUserDTO] and the [UserInfo] set in `userInfo`
  /// by setting the [ServiceUserDTO]'s foreign key `userInfoId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> userInfo(
    _i1.Session session,
    ServiceUserDTO serviceuserdto, {
    _i1.Transaction? transaction,
  }) async {
    if (serviceuserdto.id == null) {
      throw ArgumentError.notNull('serviceuserdto.id');
    }

    var $serviceuserdto = serviceuserdto.copyWith(userInfoId: null);
    await session.db.updateRow<ServiceUserDTO>(
      $serviceuserdto,
      columns: [ServiceUserDTO.t.userInfoId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [ServiceUserDTO] and the given [ServiceUserTokenDTO]
  /// by setting the [ServiceUserTokenDTO]'s foreign key `_edUserServiceUserTokensEdUserServiceUserId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> tokens(
    _i1.Session session,
    _i3.ServiceUserTokenDTO serviceUserTokenDTO, {
    _i1.Transaction? transaction,
  }) async {
    if (serviceUserTokenDTO.id == null) {
      throw ArgumentError.notNull('serviceUserTokenDTO.id');
    }

    var $serviceUserTokenDTO = _i3.ServiceUserTokenDTOImplicit(
      serviceUserTokenDTO,
      $_edUserServiceUserTokensEdUserServiceUserId: null,
    );
    await session.db.updateRow<_i3.ServiceUserTokenDTO>(
      $serviceUserTokenDTO,
      columns: [
        _i3.ServiceUserTokenDTO.t.$_edUserServiceUserTokensEdUserServiceUserId
      ],
      transaction: transaction,
    );
  }
}
