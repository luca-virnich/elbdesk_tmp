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

abstract class LightUserDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  LightUserDTO._({
    this.id,
    required this.email,
    required this.fullName,
    required this.initials,
    required this.isActive,
    required this.imageUrl,
    this.userInfoId,
    this.userInfo,
  });

  factory LightUserDTO({
    int? id,
    required String email,
    required String fullName,
    required String initials,
    required bool isActive,
    required String imageUrl,
    int? userInfoId,
    _i2.UserInfo? userInfo,
  }) = _LightUserDTOImpl;

  factory LightUserDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return LightUserDTO(
      id: jsonSerialization['id'] as int?,
      email: jsonSerialization['email'] as String,
      fullName: jsonSerialization['fullName'] as String,
      initials: jsonSerialization['initials'] as String,
      isActive: jsonSerialization['isActive'] as bool,
      imageUrl: jsonSerialization['imageUrl'] as String,
      userInfoId: jsonSerialization['userInfoId'] as int?,
      userInfo: jsonSerialization['userInfo'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['userInfo'] as Map<String, dynamic>)),
    );
  }

  static final t = LightUserDTOTable();

  static const db = LightUserDTORepository._();

  @override
  int? id;

  String email;

  String fullName;

  String initials;

  bool isActive;

  String imageUrl;

  int? userInfoId;

  _i2.UserInfo? userInfo;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [LightUserDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  LightUserDTO copyWith({
    int? id,
    String? email,
    String? fullName,
    String? initials,
    bool? isActive,
    String? imageUrl,
    int? userInfoId,
    _i2.UserInfo? userInfo,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'email': email,
      'fullName': fullName,
      'initials': initials,
      'isActive': isActive,
      'imageUrl': imageUrl,
      if (userInfoId != null) 'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'email': email,
      'fullName': fullName,
      'initials': initials,
      'isActive': isActive,
      'imageUrl': imageUrl,
      if (userInfoId != null) 'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJsonForProtocol(),
    };
  }

  static LightUserDTOInclude include({_i2.UserInfoInclude? userInfo}) {
    return LightUserDTOInclude._(userInfo: userInfo);
  }

  static LightUserDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<LightUserDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LightUserDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LightUserDTOTable>? orderByList,
    LightUserDTOInclude? include,
  }) {
    return LightUserDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(LightUserDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(LightUserDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LightUserDTOImpl extends LightUserDTO {
  _LightUserDTOImpl({
    int? id,
    required String email,
    required String fullName,
    required String initials,
    required bool isActive,
    required String imageUrl,
    int? userInfoId,
    _i2.UserInfo? userInfo,
  }) : super._(
          id: id,
          email: email,
          fullName: fullName,
          initials: initials,
          isActive: isActive,
          imageUrl: imageUrl,
          userInfoId: userInfoId,
          userInfo: userInfo,
        );

  /// Returns a shallow copy of this [LightUserDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  LightUserDTO copyWith({
    Object? id = _Undefined,
    String? email,
    String? fullName,
    String? initials,
    bool? isActive,
    String? imageUrl,
    Object? userInfoId = _Undefined,
    Object? userInfo = _Undefined,
  }) {
    return LightUserDTO(
      id: id is int? ? id : this.id,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      initials: initials ?? this.initials,
      isActive: isActive ?? this.isActive,
      imageUrl: imageUrl ?? this.imageUrl,
      userInfoId: userInfoId is int? ? userInfoId : this.userInfoId,
      userInfo:
          userInfo is _i2.UserInfo? ? userInfo : this.userInfo?.copyWith(),
    );
  }
}

class LightUserDTOTable extends _i1.Table<int?> {
  LightUserDTOTable({super.tableRelation})
      : super(tableName: 'ed_user_light_user') {
    email = _i1.ColumnString(
      'email',
      this,
    );
    fullName = _i1.ColumnString(
      'fullName',
      this,
    );
    initials = _i1.ColumnString(
      'initials',
      this,
    );
    isActive = _i1.ColumnBool(
      'isActive',
      this,
    );
    imageUrl = _i1.ColumnString(
      'imageUrl',
      this,
    );
    userInfoId = _i1.ColumnInt(
      'userInfoId',
      this,
    );
  }

  late final _i1.ColumnString email;

  late final _i1.ColumnString fullName;

  late final _i1.ColumnString initials;

  late final _i1.ColumnBool isActive;

  late final _i1.ColumnString imageUrl;

  late final _i1.ColumnInt userInfoId;

  _i2.UserInfoTable? _userInfo;

  _i2.UserInfoTable get userInfo {
    if (_userInfo != null) return _userInfo!;
    _userInfo = _i1.createRelationTable(
      relationFieldName: 'userInfo',
      field: LightUserDTO.t.userInfoId,
      foreignField: _i2.UserInfo.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserInfoTable(tableRelation: foreignTableRelation),
    );
    return _userInfo!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        email,
        fullName,
        initials,
        isActive,
        imageUrl,
        userInfoId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'userInfo') {
      return userInfo;
    }
    return null;
  }
}

class LightUserDTOInclude extends _i1.IncludeObject {
  LightUserDTOInclude._({_i2.UserInfoInclude? userInfo}) {
    _userInfo = userInfo;
  }

  _i2.UserInfoInclude? _userInfo;

  @override
  Map<String, _i1.Include?> get includes => {'userInfo': _userInfo};

  @override
  _i1.Table<int?> get table => LightUserDTO.t;
}

class LightUserDTOIncludeList extends _i1.IncludeList {
  LightUserDTOIncludeList._({
    _i1.WhereExpressionBuilder<LightUserDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(LightUserDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => LightUserDTO.t;
}

class LightUserDTORepository {
  const LightUserDTORepository._();

  final attachRow = const LightUserDTOAttachRowRepository._();

  final detachRow = const LightUserDTODetachRowRepository._();

  /// Returns a list of [LightUserDTO]s matching the given query parameters.
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
  Future<List<LightUserDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LightUserDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LightUserDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LightUserDTOTable>? orderByList,
    _i1.Transaction? transaction,
    LightUserDTOInclude? include,
  }) async {
    return session.db.find<LightUserDTO>(
      where: where?.call(LightUserDTO.t),
      orderBy: orderBy?.call(LightUserDTO.t),
      orderByList: orderByList?.call(LightUserDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [LightUserDTO] matching the given query parameters.
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
  Future<LightUserDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LightUserDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<LightUserDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LightUserDTOTable>? orderByList,
    _i1.Transaction? transaction,
    LightUserDTOInclude? include,
  }) async {
    return session.db.findFirstRow<LightUserDTO>(
      where: where?.call(LightUserDTO.t),
      orderBy: orderBy?.call(LightUserDTO.t),
      orderByList: orderByList?.call(LightUserDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [LightUserDTO] by its [id] or null if no such row exists.
  Future<LightUserDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    LightUserDTOInclude? include,
  }) async {
    return session.db.findById<LightUserDTO>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [LightUserDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [LightUserDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<LightUserDTO>> insert(
    _i1.Session session,
    List<LightUserDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<LightUserDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [LightUserDTO] and returns the inserted row.
  ///
  /// The returned [LightUserDTO] will have its `id` field set.
  Future<LightUserDTO> insertRow(
    _i1.Session session,
    LightUserDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<LightUserDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [LightUserDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<LightUserDTO>> update(
    _i1.Session session,
    List<LightUserDTO> rows, {
    _i1.ColumnSelections<LightUserDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<LightUserDTO>(
      rows,
      columns: columns?.call(LightUserDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [LightUserDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<LightUserDTO> updateRow(
    _i1.Session session,
    LightUserDTO row, {
    _i1.ColumnSelections<LightUserDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<LightUserDTO>(
      row,
      columns: columns?.call(LightUserDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [LightUserDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<LightUserDTO>> delete(
    _i1.Session session,
    List<LightUserDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<LightUserDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [LightUserDTO].
  Future<LightUserDTO> deleteRow(
    _i1.Session session,
    LightUserDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<LightUserDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<LightUserDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<LightUserDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<LightUserDTO>(
      where: where(LightUserDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LightUserDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<LightUserDTO>(
      where: where?.call(LightUserDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class LightUserDTOAttachRowRepository {
  const LightUserDTOAttachRowRepository._();

  /// Creates a relation between the given [LightUserDTO] and [UserInfo]
  /// by setting the [LightUserDTO]'s foreign key `userInfoId` to refer to the [UserInfo].
  Future<void> userInfo(
    _i1.Session session,
    LightUserDTO lightUserDTO,
    _i2.UserInfo userInfo, {
    _i1.Transaction? transaction,
  }) async {
    if (lightUserDTO.id == null) {
      throw ArgumentError.notNull('lightUserDTO.id');
    }
    if (userInfo.id == null) {
      throw ArgumentError.notNull('userInfo.id');
    }

    var $lightUserDTO = lightUserDTO.copyWith(userInfoId: userInfo.id);
    await session.db.updateRow<LightUserDTO>(
      $lightUserDTO,
      columns: [LightUserDTO.t.userInfoId],
      transaction: transaction,
    );
  }
}

class LightUserDTODetachRowRepository {
  const LightUserDTODetachRowRepository._();

  /// Detaches the relation between this [LightUserDTO] and the [UserInfo] set in `userInfo`
  /// by setting the [LightUserDTO]'s foreign key `userInfoId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> userInfo(
    _i1.Session session,
    LightUserDTO lightuserdto, {
    _i1.Transaction? transaction,
  }) async {
    if (lightuserdto.id == null) {
      throw ArgumentError.notNull('lightuserdto.id');
    }

    var $lightuserdto = lightuserdto.copyWith(userInfoId: null);
    await session.db.updateRow<LightUserDTO>(
      $lightuserdto,
      columns: [LightUserDTO.t.userInfoId],
      transaction: transaction,
    );
  }
}
