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
import '../../../../modules/crm/customer/models/customer.dart' as _i2;
import '../../../../modules/prepress/color/models/artwork_color.dart' as _i3;

abstract class PrepressColorPaletteDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  PrepressColorPaletteDTO._({
    this.id,
    required this.paletteName,
    required this.description,
    this.customerId,
    this.customer,
    this.colors,
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

  factory PrepressColorPaletteDTO({
    int? id,
    required String paletteName,
    required String description,
    int? customerId,
    _i2.CustomerDTO? customer,
    List<_i3.ArtworkColorDTO>? colors,
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
  }) = _PrepressColorPaletteDTOImpl;

  factory PrepressColorPaletteDTO.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return PrepressColorPaletteDTO(
      id: jsonSerialization['id'] as int?,
      paletteName: jsonSerialization['paletteName'] as String,
      description: jsonSerialization['description'] as String,
      customerId: jsonSerialization['customerId'] as int?,
      customer: jsonSerialization['customer'] == null
          ? null
          : _i2.CustomerDTO.fromJson(
              (jsonSerialization['customer'] as Map<String, dynamic>)),
      colors: (jsonSerialization['colors'] as List?)
          ?.map(
              (e) => _i3.ArtworkColorDTO.fromJson((e as Map<String, dynamic>)))
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

  static final t = PrepressColorPaletteDTOTable();

  static const db = PrepressColorPaletteDTORepository._();

  @override
  int? id;

  String paletteName;

  String description;

  int? customerId;

  _i2.CustomerDTO? customer;

  List<_i3.ArtworkColorDTO>? colors;

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

  /// Returns a shallow copy of this [PrepressColorPaletteDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PrepressColorPaletteDTO copyWith({
    int? id,
    String? paletteName,
    String? description,
    int? customerId,
    _i2.CustomerDTO? customer,
    List<_i3.ArtworkColorDTO>? colors,
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
      'paletteName': paletteName,
      'description': description,
      if (customerId != null) 'customerId': customerId,
      if (customer != null) 'customer': customer?.toJson(),
      if (colors != null)
        'colors': colors?.toJson(valueToJson: (v) => v.toJson()),
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
      'paletteName': paletteName,
      'description': description,
      if (customerId != null) 'customerId': customerId,
      if (customer != null) 'customer': customer?.toJsonForProtocol(),
      if (colors != null)
        'colors': colors?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
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

  static PrepressColorPaletteDTOInclude include({
    _i2.CustomerDTOInclude? customer,
    _i3.ArtworkColorDTOIncludeList? colors,
  }) {
    return PrepressColorPaletteDTOInclude._(
      customer: customer,
      colors: colors,
    );
  }

  static PrepressColorPaletteDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<PrepressColorPaletteDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PrepressColorPaletteDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PrepressColorPaletteDTOTable>? orderByList,
    PrepressColorPaletteDTOInclude? include,
  }) {
    return PrepressColorPaletteDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PrepressColorPaletteDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PrepressColorPaletteDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PrepressColorPaletteDTOImpl extends PrepressColorPaletteDTO {
  _PrepressColorPaletteDTOImpl({
    int? id,
    required String paletteName,
    required String description,
    int? customerId,
    _i2.CustomerDTO? customer,
    List<_i3.ArtworkColorDTO>? colors,
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
          paletteName: paletteName,
          description: description,
          customerId: customerId,
          customer: customer,
          colors: colors,
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

  /// Returns a shallow copy of this [PrepressColorPaletteDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PrepressColorPaletteDTO copyWith({
    Object? id = _Undefined,
    String? paletteName,
    String? description,
    Object? customerId = _Undefined,
    Object? customer = _Undefined,
    Object? colors = _Undefined,
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
    return PrepressColorPaletteDTO(
      id: id is int? ? id : this.id,
      paletteName: paletteName ?? this.paletteName,
      description: description ?? this.description,
      customerId: customerId is int? ? customerId : this.customerId,
      customer:
          customer is _i2.CustomerDTO? ? customer : this.customer?.copyWith(),
      colors: colors is List<_i3.ArtworkColorDTO>?
          ? colors
          : this.colors?.map((e0) => e0.copyWith()).toList(),
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

class PrepressColorPaletteDTOTable extends _i1.Table<int?> {
  PrepressColorPaletteDTOTable({super.tableRelation})
      : super(tableName: 'ed_prepress_color_palette') {
    paletteName = _i1.ColumnString(
      'paletteName',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    customerId = _i1.ColumnInt(
      'customerId',
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

  late final _i1.ColumnString paletteName;

  late final _i1.ColumnString description;

  late final _i1.ColumnInt customerId;

  _i2.CustomerDTOTable? _customer;

  _i3.ArtworkColorDTOTable? ___colors;

  _i1.ManyRelation<_i3.ArtworkColorDTOTable>? _colors;

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

  _i2.CustomerDTOTable get customer {
    if (_customer != null) return _customer!;
    _customer = _i1.createRelationTable(
      relationFieldName: 'customer',
      field: PrepressColorPaletteDTO.t.customerId,
      foreignField: _i2.CustomerDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.CustomerDTOTable(tableRelation: foreignTableRelation),
    );
    return _customer!;
  }

  _i3.ArtworkColorDTOTable get __colors {
    if (___colors != null) return ___colors!;
    ___colors = _i1.createRelationTable(
      relationFieldName: '__colors',
      field: PrepressColorPaletteDTO.t.id,
      foreignField: _i3.ArtworkColorDTO.t.colorPaletteId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.ArtworkColorDTOTable(tableRelation: foreignTableRelation),
    );
    return ___colors!;
  }

  _i1.ManyRelation<_i3.ArtworkColorDTOTable> get colors {
    if (_colors != null) return _colors!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'colors',
      field: PrepressColorPaletteDTO.t.id,
      foreignField: _i3.ArtworkColorDTO.t.colorPaletteId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.ArtworkColorDTOTable(tableRelation: foreignTableRelation),
    );
    _colors = _i1.ManyRelation<_i3.ArtworkColorDTOTable>(
      tableWithRelations: relationTable,
      table: _i3.ArtworkColorDTOTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _colors!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        paletteName,
        description,
        customerId,
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
    if (relationField == 'customer') {
      return customer;
    }
    if (relationField == 'colors') {
      return __colors;
    }
    return null;
  }
}

class PrepressColorPaletteDTOInclude extends _i1.IncludeObject {
  PrepressColorPaletteDTOInclude._({
    _i2.CustomerDTOInclude? customer,
    _i3.ArtworkColorDTOIncludeList? colors,
  }) {
    _customer = customer;
    _colors = colors;
  }

  _i2.CustomerDTOInclude? _customer;

  _i3.ArtworkColorDTOIncludeList? _colors;

  @override
  Map<String, _i1.Include?> get includes => {
        'customer': _customer,
        'colors': _colors,
      };

  @override
  _i1.Table<int?> get table => PrepressColorPaletteDTO.t;
}

class PrepressColorPaletteDTOIncludeList extends _i1.IncludeList {
  PrepressColorPaletteDTOIncludeList._({
    _i1.WhereExpressionBuilder<PrepressColorPaletteDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PrepressColorPaletteDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => PrepressColorPaletteDTO.t;
}

class PrepressColorPaletteDTORepository {
  const PrepressColorPaletteDTORepository._();

  final attach = const PrepressColorPaletteDTOAttachRepository._();

  final attachRow = const PrepressColorPaletteDTOAttachRowRepository._();

  final detach = const PrepressColorPaletteDTODetachRepository._();

  final detachRow = const PrepressColorPaletteDTODetachRowRepository._();

  /// Returns a list of [PrepressColorPaletteDTO]s matching the given query parameters.
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
  Future<List<PrepressColorPaletteDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PrepressColorPaletteDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PrepressColorPaletteDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PrepressColorPaletteDTOTable>? orderByList,
    _i1.Transaction? transaction,
    PrepressColorPaletteDTOInclude? include,
  }) async {
    return session.db.find<PrepressColorPaletteDTO>(
      where: where?.call(PrepressColorPaletteDTO.t),
      orderBy: orderBy?.call(PrepressColorPaletteDTO.t),
      orderByList: orderByList?.call(PrepressColorPaletteDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [PrepressColorPaletteDTO] matching the given query parameters.
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
  Future<PrepressColorPaletteDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PrepressColorPaletteDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<PrepressColorPaletteDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PrepressColorPaletteDTOTable>? orderByList,
    _i1.Transaction? transaction,
    PrepressColorPaletteDTOInclude? include,
  }) async {
    return session.db.findFirstRow<PrepressColorPaletteDTO>(
      where: where?.call(PrepressColorPaletteDTO.t),
      orderBy: orderBy?.call(PrepressColorPaletteDTO.t),
      orderByList: orderByList?.call(PrepressColorPaletteDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [PrepressColorPaletteDTO] by its [id] or null if no such row exists.
  Future<PrepressColorPaletteDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PrepressColorPaletteDTOInclude? include,
  }) async {
    return session.db.findById<PrepressColorPaletteDTO>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [PrepressColorPaletteDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [PrepressColorPaletteDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<PrepressColorPaletteDTO>> insert(
    _i1.Session session,
    List<PrepressColorPaletteDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<PrepressColorPaletteDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [PrepressColorPaletteDTO] and returns the inserted row.
  ///
  /// The returned [PrepressColorPaletteDTO] will have its `id` field set.
  Future<PrepressColorPaletteDTO> insertRow(
    _i1.Session session,
    PrepressColorPaletteDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PrepressColorPaletteDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [PrepressColorPaletteDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<PrepressColorPaletteDTO>> update(
    _i1.Session session,
    List<PrepressColorPaletteDTO> rows, {
    _i1.ColumnSelections<PrepressColorPaletteDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PrepressColorPaletteDTO>(
      rows,
      columns: columns?.call(PrepressColorPaletteDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PrepressColorPaletteDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<PrepressColorPaletteDTO> updateRow(
    _i1.Session session,
    PrepressColorPaletteDTO row, {
    _i1.ColumnSelections<PrepressColorPaletteDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PrepressColorPaletteDTO>(
      row,
      columns: columns?.call(PrepressColorPaletteDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [PrepressColorPaletteDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<PrepressColorPaletteDTO>> delete(
    _i1.Session session,
    List<PrepressColorPaletteDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PrepressColorPaletteDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [PrepressColorPaletteDTO].
  Future<PrepressColorPaletteDTO> deleteRow(
    _i1.Session session,
    PrepressColorPaletteDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PrepressColorPaletteDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<PrepressColorPaletteDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PrepressColorPaletteDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PrepressColorPaletteDTO>(
      where: where(PrepressColorPaletteDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PrepressColorPaletteDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PrepressColorPaletteDTO>(
      where: where?.call(PrepressColorPaletteDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class PrepressColorPaletteDTOAttachRepository {
  const PrepressColorPaletteDTOAttachRepository._();

  /// Creates a relation between this [PrepressColorPaletteDTO] and the given [ArtworkColorDTO]s
  /// by setting each [ArtworkColorDTO]'s foreign key `colorPaletteId` to refer to this [PrepressColorPaletteDTO].
  Future<void> colors(
    _i1.Session session,
    PrepressColorPaletteDTO prepressColorPaletteDTO,
    List<_i3.ArtworkColorDTO> artworkColorDTO, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkColorDTO.any((e) => e.id == null)) {
      throw ArgumentError.notNull('artworkColorDTO.id');
    }
    if (prepressColorPaletteDTO.id == null) {
      throw ArgumentError.notNull('prepressColorPaletteDTO.id');
    }

    var $artworkColorDTO = artworkColorDTO
        .map((e) => e.copyWith(colorPaletteId: prepressColorPaletteDTO.id))
        .toList();
    await session.db.update<_i3.ArtworkColorDTO>(
      $artworkColorDTO,
      columns: [_i3.ArtworkColorDTO.t.colorPaletteId],
      transaction: transaction,
    );
  }
}

class PrepressColorPaletteDTOAttachRowRepository {
  const PrepressColorPaletteDTOAttachRowRepository._();

  /// Creates a relation between the given [PrepressColorPaletteDTO] and [CustomerDTO]
  /// by setting the [PrepressColorPaletteDTO]'s foreign key `customerId` to refer to the [CustomerDTO].
  Future<void> customer(
    _i1.Session session,
    PrepressColorPaletteDTO prepressColorPaletteDTO,
    _i2.CustomerDTO customer, {
    _i1.Transaction? transaction,
  }) async {
    if (prepressColorPaletteDTO.id == null) {
      throw ArgumentError.notNull('prepressColorPaletteDTO.id');
    }
    if (customer.id == null) {
      throw ArgumentError.notNull('customer.id');
    }

    var $prepressColorPaletteDTO =
        prepressColorPaletteDTO.copyWith(customerId: customer.id);
    await session.db.updateRow<PrepressColorPaletteDTO>(
      $prepressColorPaletteDTO,
      columns: [PrepressColorPaletteDTO.t.customerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [PrepressColorPaletteDTO] and the given [ArtworkColorDTO]
  /// by setting the [ArtworkColorDTO]'s foreign key `colorPaletteId` to refer to this [PrepressColorPaletteDTO].
  Future<void> colors(
    _i1.Session session,
    PrepressColorPaletteDTO prepressColorPaletteDTO,
    _i3.ArtworkColorDTO artworkColorDTO, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkColorDTO.id == null) {
      throw ArgumentError.notNull('artworkColorDTO.id');
    }
    if (prepressColorPaletteDTO.id == null) {
      throw ArgumentError.notNull('prepressColorPaletteDTO.id');
    }

    var $artworkColorDTO =
        artworkColorDTO.copyWith(colorPaletteId: prepressColorPaletteDTO.id);
    await session.db.updateRow<_i3.ArtworkColorDTO>(
      $artworkColorDTO,
      columns: [_i3.ArtworkColorDTO.t.colorPaletteId],
      transaction: transaction,
    );
  }
}

class PrepressColorPaletteDTODetachRepository {
  const PrepressColorPaletteDTODetachRepository._();

  /// Detaches the relation between this [PrepressColorPaletteDTO] and the given [ArtworkColorDTO]
  /// by setting the [ArtworkColorDTO]'s foreign key `colorPaletteId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> colors(
    _i1.Session session,
    List<_i3.ArtworkColorDTO> artworkColorDTO, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkColorDTO.any((e) => e.id == null)) {
      throw ArgumentError.notNull('artworkColorDTO.id');
    }

    var $artworkColorDTO =
        artworkColorDTO.map((e) => e.copyWith(colorPaletteId: null)).toList();
    await session.db.update<_i3.ArtworkColorDTO>(
      $artworkColorDTO,
      columns: [_i3.ArtworkColorDTO.t.colorPaletteId],
      transaction: transaction,
    );
  }
}

class PrepressColorPaletteDTODetachRowRepository {
  const PrepressColorPaletteDTODetachRowRepository._();

  /// Detaches the relation between this [PrepressColorPaletteDTO] and the [CustomerDTO] set in `customer`
  /// by setting the [PrepressColorPaletteDTO]'s foreign key `customerId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> customer(
    _i1.Session session,
    PrepressColorPaletteDTO prepresscolorpalettedto, {
    _i1.Transaction? transaction,
  }) async {
    if (prepresscolorpalettedto.id == null) {
      throw ArgumentError.notNull('prepresscolorpalettedto.id');
    }

    var $prepresscolorpalettedto =
        prepresscolorpalettedto.copyWith(customerId: null);
    await session.db.updateRow<PrepressColorPaletteDTO>(
      $prepresscolorpalettedto,
      columns: [PrepressColorPaletteDTO.t.customerId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [PrepressColorPaletteDTO] and the given [ArtworkColorDTO]
  /// by setting the [ArtworkColorDTO]'s foreign key `colorPaletteId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> colors(
    _i1.Session session,
    _i3.ArtworkColorDTO artworkColorDTO, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkColorDTO.id == null) {
      throw ArgumentError.notNull('artworkColorDTO.id');
    }

    var $artworkColorDTO = artworkColorDTO.copyWith(colorPaletteId: null);
    await session.db.updateRow<_i3.ArtworkColorDTO>(
      $artworkColorDTO,
      columns: [_i3.ArtworkColorDTO.t.colorPaletteId],
      transaction: transaction,
    );
  }
}
