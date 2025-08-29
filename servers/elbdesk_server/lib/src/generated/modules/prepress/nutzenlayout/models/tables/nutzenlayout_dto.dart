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
import '../../../../../modules/prepress/nutzenlayout/models/nutzenlayout_form_type.dart'
    as _i2;
import '../../../../../modules/prepress/nutzenlayout/models/nutzenlayout_column_dto.dart'
    as _i3;
import '../../../../../modules/prepress/nutzenlayout/models/nutzenlayout_artwork_dimensions.dart'
    as _i4;
import '../../../../../modules/crm/customer/models/customer.dart' as _i5;

abstract class NutzenlayoutDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  NutzenlayoutDTO._({
    this.id,
    required this.description,
    required this.drucklaenge,
    required this.formType,
    required this.nutzenlayoutColumns,
    required this.dimensions,
    required this.customerId,
    this.customer,
    required this.leadingUnitSystem,
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

  factory NutzenlayoutDTO({
    int? id,
    required String description,
    required double drucklaenge,
    required _i2.NutzenlayoutFormType formType,
    required List<_i3.NutzenlayoutColumnDTO> nutzenlayoutColumns,
    required List<_i4.NutzenlayoutArtworkDimensions> dimensions,
    required int customerId,
    _i5.CustomerDTO? customer,
    required String leadingUnitSystem,
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
  }) = _NutzenlayoutDTOImpl;

  factory NutzenlayoutDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return NutzenlayoutDTO(
      id: jsonSerialization['id'] as int?,
      description: jsonSerialization['description'] as String,
      drucklaenge: (jsonSerialization['drucklaenge'] as num).toDouble(),
      formType: _i2.NutzenlayoutFormType.fromJson(
          (jsonSerialization['formType'] as String)),
      nutzenlayoutColumns: (jsonSerialization['nutzenlayoutColumns'] as List)
          .map((e) =>
              _i3.NutzenlayoutColumnDTO.fromJson((e as Map<String, dynamic>)))
          .toList(),
      dimensions: (jsonSerialization['dimensions'] as List)
          .map((e) => _i4.NutzenlayoutArtworkDimensions.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      customerId: jsonSerialization['customerId'] as int,
      customer: jsonSerialization['customer'] == null
          ? null
          : _i5.CustomerDTO.fromJson(
              (jsonSerialization['customer'] as Map<String, dynamic>)),
      leadingUnitSystem: jsonSerialization['leadingUnitSystem'] as String,
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

  static final t = NutzenlayoutDTOTable();

  static const db = NutzenlayoutDTORepository._();

  @override
  int? id;

  String description;

  double drucklaenge;

  _i2.NutzenlayoutFormType formType;

  List<_i3.NutzenlayoutColumnDTO> nutzenlayoutColumns;

  List<_i4.NutzenlayoutArtworkDimensions> dimensions;

  int customerId;

  _i5.CustomerDTO? customer;

  String leadingUnitSystem;

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

  /// Returns a shallow copy of this [NutzenlayoutDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  NutzenlayoutDTO copyWith({
    int? id,
    String? description,
    double? drucklaenge,
    _i2.NutzenlayoutFormType? formType,
    List<_i3.NutzenlayoutColumnDTO>? nutzenlayoutColumns,
    List<_i4.NutzenlayoutArtworkDimensions>? dimensions,
    int? customerId,
    _i5.CustomerDTO? customer,
    String? leadingUnitSystem,
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
      'description': description,
      'drucklaenge': drucklaenge,
      'formType': formType.toJson(),
      'nutzenlayoutColumns':
          nutzenlayoutColumns.toJson(valueToJson: (v) => v.toJson()),
      'dimensions': dimensions.toJson(valueToJson: (v) => v.toJson()),
      'customerId': customerId,
      if (customer != null) 'customer': customer?.toJson(),
      'leadingUnitSystem': leadingUnitSystem,
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
      'description': description,
      'drucklaenge': drucklaenge,
      'formType': formType.toJson(),
      'nutzenlayoutColumns':
          nutzenlayoutColumns.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'dimensions':
          dimensions.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'customerId': customerId,
      if (customer != null) 'customer': customer?.toJsonForProtocol(),
      'leadingUnitSystem': leadingUnitSystem,
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

  static NutzenlayoutDTOInclude include({_i5.CustomerDTOInclude? customer}) {
    return NutzenlayoutDTOInclude._(customer: customer);
  }

  static NutzenlayoutDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<NutzenlayoutDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NutzenlayoutDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NutzenlayoutDTOTable>? orderByList,
    NutzenlayoutDTOInclude? include,
  }) {
    return NutzenlayoutDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(NutzenlayoutDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(NutzenlayoutDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _NutzenlayoutDTOImpl extends NutzenlayoutDTO {
  _NutzenlayoutDTOImpl({
    int? id,
    required String description,
    required double drucklaenge,
    required _i2.NutzenlayoutFormType formType,
    required List<_i3.NutzenlayoutColumnDTO> nutzenlayoutColumns,
    required List<_i4.NutzenlayoutArtworkDimensions> dimensions,
    required int customerId,
    _i5.CustomerDTO? customer,
    required String leadingUnitSystem,
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
          description: description,
          drucklaenge: drucklaenge,
          formType: formType,
          nutzenlayoutColumns: nutzenlayoutColumns,
          dimensions: dimensions,
          customerId: customerId,
          customer: customer,
          leadingUnitSystem: leadingUnitSystem,
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

  /// Returns a shallow copy of this [NutzenlayoutDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  NutzenlayoutDTO copyWith({
    Object? id = _Undefined,
    String? description,
    double? drucklaenge,
    _i2.NutzenlayoutFormType? formType,
    List<_i3.NutzenlayoutColumnDTO>? nutzenlayoutColumns,
    List<_i4.NutzenlayoutArtworkDimensions>? dimensions,
    int? customerId,
    Object? customer = _Undefined,
    String? leadingUnitSystem,
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
    return NutzenlayoutDTO(
      id: id is int? ? id : this.id,
      description: description ?? this.description,
      drucklaenge: drucklaenge ?? this.drucklaenge,
      formType: formType ?? this.formType,
      nutzenlayoutColumns: nutzenlayoutColumns ??
          this.nutzenlayoutColumns.map((e0) => e0.copyWith()).toList(),
      dimensions:
          dimensions ?? this.dimensions.map((e0) => e0.copyWith()).toList(),
      customerId: customerId ?? this.customerId,
      customer:
          customer is _i5.CustomerDTO? ? customer : this.customer?.copyWith(),
      leadingUnitSystem: leadingUnitSystem ?? this.leadingUnitSystem,
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

class NutzenlayoutDTOTable extends _i1.Table<int?> {
  NutzenlayoutDTOTable({super.tableRelation})
      : super(tableName: 'ed_prepress_nutzenlayout') {
    description = _i1.ColumnString(
      'description',
      this,
    );
    drucklaenge = _i1.ColumnDouble(
      'drucklaenge',
      this,
    );
    formType = _i1.ColumnEnum(
      'formType',
      this,
      _i1.EnumSerialization.byName,
    );
    nutzenlayoutColumns = _i1.ColumnSerializable(
      'nutzenlayoutColumns',
      this,
    );
    dimensions = _i1.ColumnSerializable(
      'dimensions',
      this,
    );
    customerId = _i1.ColumnInt(
      'customerId',
      this,
    );
    leadingUnitSystem = _i1.ColumnString(
      'leadingUnitSystem',
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

  late final _i1.ColumnString description;

  late final _i1.ColumnDouble drucklaenge;

  late final _i1.ColumnEnum<_i2.NutzenlayoutFormType> formType;

  late final _i1.ColumnSerializable nutzenlayoutColumns;

  late final _i1.ColumnSerializable dimensions;

  late final _i1.ColumnInt customerId;

  _i5.CustomerDTOTable? _customer;

  late final _i1.ColumnString leadingUnitSystem;

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

  _i5.CustomerDTOTable get customer {
    if (_customer != null) return _customer!;
    _customer = _i1.createRelationTable(
      relationFieldName: 'customer',
      field: NutzenlayoutDTO.t.customerId,
      foreignField: _i5.CustomerDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.CustomerDTOTable(tableRelation: foreignTableRelation),
    );
    return _customer!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        description,
        drucklaenge,
        formType,
        nutzenlayoutColumns,
        dimensions,
        customerId,
        leadingUnitSystem,
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
    return null;
  }
}

class NutzenlayoutDTOInclude extends _i1.IncludeObject {
  NutzenlayoutDTOInclude._({_i5.CustomerDTOInclude? customer}) {
    _customer = customer;
  }

  _i5.CustomerDTOInclude? _customer;

  @override
  Map<String, _i1.Include?> get includes => {'customer': _customer};

  @override
  _i1.Table<int?> get table => NutzenlayoutDTO.t;
}

class NutzenlayoutDTOIncludeList extends _i1.IncludeList {
  NutzenlayoutDTOIncludeList._({
    _i1.WhereExpressionBuilder<NutzenlayoutDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(NutzenlayoutDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => NutzenlayoutDTO.t;
}

class NutzenlayoutDTORepository {
  const NutzenlayoutDTORepository._();

  final attachRow = const NutzenlayoutDTOAttachRowRepository._();

  /// Returns a list of [NutzenlayoutDTO]s matching the given query parameters.
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
  Future<List<NutzenlayoutDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NutzenlayoutDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NutzenlayoutDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NutzenlayoutDTOTable>? orderByList,
    _i1.Transaction? transaction,
    NutzenlayoutDTOInclude? include,
  }) async {
    return session.db.find<NutzenlayoutDTO>(
      where: where?.call(NutzenlayoutDTO.t),
      orderBy: orderBy?.call(NutzenlayoutDTO.t),
      orderByList: orderByList?.call(NutzenlayoutDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [NutzenlayoutDTO] matching the given query parameters.
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
  Future<NutzenlayoutDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NutzenlayoutDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<NutzenlayoutDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NutzenlayoutDTOTable>? orderByList,
    _i1.Transaction? transaction,
    NutzenlayoutDTOInclude? include,
  }) async {
    return session.db.findFirstRow<NutzenlayoutDTO>(
      where: where?.call(NutzenlayoutDTO.t),
      orderBy: orderBy?.call(NutzenlayoutDTO.t),
      orderByList: orderByList?.call(NutzenlayoutDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [NutzenlayoutDTO] by its [id] or null if no such row exists.
  Future<NutzenlayoutDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    NutzenlayoutDTOInclude? include,
  }) async {
    return session.db.findById<NutzenlayoutDTO>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [NutzenlayoutDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [NutzenlayoutDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<NutzenlayoutDTO>> insert(
    _i1.Session session,
    List<NutzenlayoutDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<NutzenlayoutDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [NutzenlayoutDTO] and returns the inserted row.
  ///
  /// The returned [NutzenlayoutDTO] will have its `id` field set.
  Future<NutzenlayoutDTO> insertRow(
    _i1.Session session,
    NutzenlayoutDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<NutzenlayoutDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [NutzenlayoutDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<NutzenlayoutDTO>> update(
    _i1.Session session,
    List<NutzenlayoutDTO> rows, {
    _i1.ColumnSelections<NutzenlayoutDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<NutzenlayoutDTO>(
      rows,
      columns: columns?.call(NutzenlayoutDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [NutzenlayoutDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<NutzenlayoutDTO> updateRow(
    _i1.Session session,
    NutzenlayoutDTO row, {
    _i1.ColumnSelections<NutzenlayoutDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<NutzenlayoutDTO>(
      row,
      columns: columns?.call(NutzenlayoutDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [NutzenlayoutDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<NutzenlayoutDTO>> delete(
    _i1.Session session,
    List<NutzenlayoutDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<NutzenlayoutDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [NutzenlayoutDTO].
  Future<NutzenlayoutDTO> deleteRow(
    _i1.Session session,
    NutzenlayoutDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<NutzenlayoutDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<NutzenlayoutDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<NutzenlayoutDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<NutzenlayoutDTO>(
      where: where(NutzenlayoutDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NutzenlayoutDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<NutzenlayoutDTO>(
      where: where?.call(NutzenlayoutDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class NutzenlayoutDTOAttachRowRepository {
  const NutzenlayoutDTOAttachRowRepository._();

  /// Creates a relation between the given [NutzenlayoutDTO] and [CustomerDTO]
  /// by setting the [NutzenlayoutDTO]'s foreign key `customerId` to refer to the [CustomerDTO].
  Future<void> customer(
    _i1.Session session,
    NutzenlayoutDTO nutzenlayoutDTO,
    _i5.CustomerDTO customer, {
    _i1.Transaction? transaction,
  }) async {
    if (nutzenlayoutDTO.id == null) {
      throw ArgumentError.notNull('nutzenlayoutDTO.id');
    }
    if (customer.id == null) {
      throw ArgumentError.notNull('customer.id');
    }

    var $nutzenlayoutDTO = nutzenlayoutDTO.copyWith(customerId: customer.id);
    await session.db.updateRow<NutzenlayoutDTO>(
      $nutzenlayoutDTO,
      columns: [NutzenlayoutDTO.t.customerId],
      transaction: transaction,
    );
  }
}
