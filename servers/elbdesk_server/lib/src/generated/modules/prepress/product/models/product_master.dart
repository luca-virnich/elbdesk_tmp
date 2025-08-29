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
import '../../../../modules/prepress/artwork/models/artwork_master.dart' as _i2;
import '../../../../modules/crm/customer/models/customer.dart' as _i3;

abstract class ProductMasterDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ProductMasterDTO._({
    this.id,
    required this.description,
    required this.serienId,
    required this.serienIdString,
    required this.serienIndex,
    this.artworks,
    required this.customerId,
    this.customer,
    required this.keywords,
    required this.productType,
    required this.printProcessType,
    required this.customerReference,
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

  factory ProductMasterDTO({
    int? id,
    required String description,
    required int serienId,
    required String serienIdString,
    required int serienIndex,
    List<_i2.ArtworkMasterDTO>? artworks,
    required int customerId,
    _i3.CustomerDTO? customer,
    required String keywords,
    required String productType,
    required String printProcessType,
    required String customerReference,
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
  }) = _ProductMasterDTOImpl;

  factory ProductMasterDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return ProductMasterDTO(
      id: jsonSerialization['id'] as int?,
      description: jsonSerialization['description'] as String,
      serienId: jsonSerialization['serienId'] as int,
      serienIdString: jsonSerialization['serienIdString'] as String,
      serienIndex: jsonSerialization['serienIndex'] as int,
      artworks: (jsonSerialization['artworks'] as List?)
          ?.map(
              (e) => _i2.ArtworkMasterDTO.fromJson((e as Map<String, dynamic>)))
          .toList(),
      customerId: jsonSerialization['customerId'] as int,
      customer: jsonSerialization['customer'] == null
          ? null
          : _i3.CustomerDTO.fromJson(
              (jsonSerialization['customer'] as Map<String, dynamic>)),
      keywords: jsonSerialization['keywords'] as String,
      productType: jsonSerialization['productType'] as String,
      printProcessType: jsonSerialization['printProcessType'] as String,
      customerReference: jsonSerialization['customerReference'] as String,
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

  static final t = ProductMasterDTOTable();

  static const db = ProductMasterDTORepository._();

  @override
  int? id;

  String description;

  int serienId;

  String serienIdString;

  int serienIndex;

  List<_i2.ArtworkMasterDTO>? artworks;

  int customerId;

  _i3.CustomerDTO? customer;

  String keywords;

  String productType;

  String printProcessType;

  String customerReference;

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

  /// Returns a shallow copy of this [ProductMasterDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ProductMasterDTO copyWith({
    int? id,
    String? description,
    int? serienId,
    String? serienIdString,
    int? serienIndex,
    List<_i2.ArtworkMasterDTO>? artworks,
    int? customerId,
    _i3.CustomerDTO? customer,
    String? keywords,
    String? productType,
    String? printProcessType,
    String? customerReference,
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
      'serienId': serienId,
      'serienIdString': serienIdString,
      'serienIndex': serienIndex,
      if (artworks != null)
        'artworks': artworks?.toJson(valueToJson: (v) => v.toJson()),
      'customerId': customerId,
      if (customer != null) 'customer': customer?.toJson(),
      'keywords': keywords,
      'productType': productType,
      'printProcessType': printProcessType,
      'customerReference': customerReference,
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
      'serienId': serienId,
      'serienIdString': serienIdString,
      'serienIndex': serienIndex,
      if (artworks != null)
        'artworks': artworks?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'customerId': customerId,
      if (customer != null) 'customer': customer?.toJsonForProtocol(),
      'keywords': keywords,
      'productType': productType,
      'printProcessType': printProcessType,
      'customerReference': customerReference,
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

  static ProductMasterDTOInclude include({
    _i2.ArtworkMasterDTOIncludeList? artworks,
    _i3.CustomerDTOInclude? customer,
  }) {
    return ProductMasterDTOInclude._(
      artworks: artworks,
      customer: customer,
    );
  }

  static ProductMasterDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<ProductMasterDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProductMasterDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProductMasterDTOTable>? orderByList,
    ProductMasterDTOInclude? include,
  }) {
    return ProductMasterDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ProductMasterDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ProductMasterDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ProductMasterDTOImpl extends ProductMasterDTO {
  _ProductMasterDTOImpl({
    int? id,
    required String description,
    required int serienId,
    required String serienIdString,
    required int serienIndex,
    List<_i2.ArtworkMasterDTO>? artworks,
    required int customerId,
    _i3.CustomerDTO? customer,
    required String keywords,
    required String productType,
    required String printProcessType,
    required String customerReference,
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
          serienId: serienId,
          serienIdString: serienIdString,
          serienIndex: serienIndex,
          artworks: artworks,
          customerId: customerId,
          customer: customer,
          keywords: keywords,
          productType: productType,
          printProcessType: printProcessType,
          customerReference: customerReference,
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

  /// Returns a shallow copy of this [ProductMasterDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ProductMasterDTO copyWith({
    Object? id = _Undefined,
    String? description,
    int? serienId,
    String? serienIdString,
    int? serienIndex,
    Object? artworks = _Undefined,
    int? customerId,
    Object? customer = _Undefined,
    String? keywords,
    String? productType,
    String? printProcessType,
    String? customerReference,
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
    return ProductMasterDTO(
      id: id is int? ? id : this.id,
      description: description ?? this.description,
      serienId: serienId ?? this.serienId,
      serienIdString: serienIdString ?? this.serienIdString,
      serienIndex: serienIndex ?? this.serienIndex,
      artworks: artworks is List<_i2.ArtworkMasterDTO>?
          ? artworks
          : this.artworks?.map((e0) => e0.copyWith()).toList(),
      customerId: customerId ?? this.customerId,
      customer:
          customer is _i3.CustomerDTO? ? customer : this.customer?.copyWith(),
      keywords: keywords ?? this.keywords,
      productType: productType ?? this.productType,
      printProcessType: printProcessType ?? this.printProcessType,
      customerReference: customerReference ?? this.customerReference,
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

class ProductMasterDTOTable extends _i1.Table<int?> {
  ProductMasterDTOTable({super.tableRelation})
      : super(tableName: 'ed_prepress_product_master') {
    description = _i1.ColumnString(
      'description',
      this,
    );
    serienId = _i1.ColumnInt(
      'serienId',
      this,
    );
    serienIdString = _i1.ColumnString(
      'serienIdString',
      this,
    );
    serienIndex = _i1.ColumnInt(
      'serienIndex',
      this,
    );
    customerId = _i1.ColumnInt(
      'customerId',
      this,
    );
    keywords = _i1.ColumnString(
      'keywords',
      this,
    );
    productType = _i1.ColumnString(
      'productType',
      this,
    );
    printProcessType = _i1.ColumnString(
      'printProcessType',
      this,
    );
    customerReference = _i1.ColumnString(
      'customerReference',
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

  late final _i1.ColumnInt serienId;

  late final _i1.ColumnString serienIdString;

  late final _i1.ColumnInt serienIndex;

  _i2.ArtworkMasterDTOTable? ___artworks;

  _i1.ManyRelation<_i2.ArtworkMasterDTOTable>? _artworks;

  late final _i1.ColumnInt customerId;

  _i3.CustomerDTOTable? _customer;

  late final _i1.ColumnString keywords;

  late final _i1.ColumnString productType;

  late final _i1.ColumnString printProcessType;

  late final _i1.ColumnString customerReference;

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

  _i2.ArtworkMasterDTOTable get __artworks {
    if (___artworks != null) return ___artworks!;
    ___artworks = _i1.createRelationTable(
      relationFieldName: '__artworks',
      field: ProductMasterDTO.t.id,
      foreignField: _i2.ArtworkMasterDTO.t.productId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ArtworkMasterDTOTable(tableRelation: foreignTableRelation),
    );
    return ___artworks!;
  }

  _i3.CustomerDTOTable get customer {
    if (_customer != null) return _customer!;
    _customer = _i1.createRelationTable(
      relationFieldName: 'customer',
      field: ProductMasterDTO.t.customerId,
      foreignField: _i3.CustomerDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.CustomerDTOTable(tableRelation: foreignTableRelation),
    );
    return _customer!;
  }

  _i1.ManyRelation<_i2.ArtworkMasterDTOTable> get artworks {
    if (_artworks != null) return _artworks!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'artworks',
      field: ProductMasterDTO.t.id,
      foreignField: _i2.ArtworkMasterDTO.t.productId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ArtworkMasterDTOTable(tableRelation: foreignTableRelation),
    );
    _artworks = _i1.ManyRelation<_i2.ArtworkMasterDTOTable>(
      tableWithRelations: relationTable,
      table: _i2.ArtworkMasterDTOTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _artworks!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        description,
        serienId,
        serienIdString,
        serienIndex,
        customerId,
        keywords,
        productType,
        printProcessType,
        customerReference,
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
    if (relationField == 'artworks') {
      return __artworks;
    }
    if (relationField == 'customer') {
      return customer;
    }
    return null;
  }
}

class ProductMasterDTOInclude extends _i1.IncludeObject {
  ProductMasterDTOInclude._({
    _i2.ArtworkMasterDTOIncludeList? artworks,
    _i3.CustomerDTOInclude? customer,
  }) {
    _artworks = artworks;
    _customer = customer;
  }

  _i2.ArtworkMasterDTOIncludeList? _artworks;

  _i3.CustomerDTOInclude? _customer;

  @override
  Map<String, _i1.Include?> get includes => {
        'artworks': _artworks,
        'customer': _customer,
      };

  @override
  _i1.Table<int?> get table => ProductMasterDTO.t;
}

class ProductMasterDTOIncludeList extends _i1.IncludeList {
  ProductMasterDTOIncludeList._({
    _i1.WhereExpressionBuilder<ProductMasterDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ProductMasterDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ProductMasterDTO.t;
}

class ProductMasterDTORepository {
  const ProductMasterDTORepository._();

  final attach = const ProductMasterDTOAttachRepository._();

  final attachRow = const ProductMasterDTOAttachRowRepository._();

  final detach = const ProductMasterDTODetachRepository._();

  final detachRow = const ProductMasterDTODetachRowRepository._();

  /// Returns a list of [ProductMasterDTO]s matching the given query parameters.
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
  Future<List<ProductMasterDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProductMasterDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProductMasterDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProductMasterDTOTable>? orderByList,
    _i1.Transaction? transaction,
    ProductMasterDTOInclude? include,
  }) async {
    return session.db.find<ProductMasterDTO>(
      where: where?.call(ProductMasterDTO.t),
      orderBy: orderBy?.call(ProductMasterDTO.t),
      orderByList: orderByList?.call(ProductMasterDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [ProductMasterDTO] matching the given query parameters.
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
  Future<ProductMasterDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProductMasterDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<ProductMasterDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProductMasterDTOTable>? orderByList,
    _i1.Transaction? transaction,
    ProductMasterDTOInclude? include,
  }) async {
    return session.db.findFirstRow<ProductMasterDTO>(
      where: where?.call(ProductMasterDTO.t),
      orderBy: orderBy?.call(ProductMasterDTO.t),
      orderByList: orderByList?.call(ProductMasterDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [ProductMasterDTO] by its [id] or null if no such row exists.
  Future<ProductMasterDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ProductMasterDTOInclude? include,
  }) async {
    return session.db.findById<ProductMasterDTO>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [ProductMasterDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [ProductMasterDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ProductMasterDTO>> insert(
    _i1.Session session,
    List<ProductMasterDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ProductMasterDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ProductMasterDTO] and returns the inserted row.
  ///
  /// The returned [ProductMasterDTO] will have its `id` field set.
  Future<ProductMasterDTO> insertRow(
    _i1.Session session,
    ProductMasterDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ProductMasterDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ProductMasterDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ProductMasterDTO>> update(
    _i1.Session session,
    List<ProductMasterDTO> rows, {
    _i1.ColumnSelections<ProductMasterDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ProductMasterDTO>(
      rows,
      columns: columns?.call(ProductMasterDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ProductMasterDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ProductMasterDTO> updateRow(
    _i1.Session session,
    ProductMasterDTO row, {
    _i1.ColumnSelections<ProductMasterDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ProductMasterDTO>(
      row,
      columns: columns?.call(ProductMasterDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [ProductMasterDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ProductMasterDTO>> delete(
    _i1.Session session,
    List<ProductMasterDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ProductMasterDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ProductMasterDTO].
  Future<ProductMasterDTO> deleteRow(
    _i1.Session session,
    ProductMasterDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ProductMasterDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ProductMasterDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ProductMasterDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ProductMasterDTO>(
      where: where(ProductMasterDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProductMasterDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ProductMasterDTO>(
      where: where?.call(ProductMasterDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ProductMasterDTOAttachRepository {
  const ProductMasterDTOAttachRepository._();

  /// Creates a relation between this [ProductMasterDTO] and the given [ArtworkMasterDTO]s
  /// by setting each [ArtworkMasterDTO]'s foreign key `productId` to refer to this [ProductMasterDTO].
  Future<void> artworks(
    _i1.Session session,
    ProductMasterDTO productMasterDTO,
    List<_i2.ArtworkMasterDTO> artworkMasterDTO, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkMasterDTO.any((e) => e.id == null)) {
      throw ArgumentError.notNull('artworkMasterDTO.id');
    }
    if (productMasterDTO.id == null) {
      throw ArgumentError.notNull('productMasterDTO.id');
    }

    var $artworkMasterDTO = artworkMasterDTO
        .map((e) => e.copyWith(productId: productMasterDTO.id))
        .toList();
    await session.db.update<_i2.ArtworkMasterDTO>(
      $artworkMasterDTO,
      columns: [_i2.ArtworkMasterDTO.t.productId],
      transaction: transaction,
    );
  }
}

class ProductMasterDTOAttachRowRepository {
  const ProductMasterDTOAttachRowRepository._();

  /// Creates a relation between the given [ProductMasterDTO] and [CustomerDTO]
  /// by setting the [ProductMasterDTO]'s foreign key `customerId` to refer to the [CustomerDTO].
  Future<void> customer(
    _i1.Session session,
    ProductMasterDTO productMasterDTO,
    _i3.CustomerDTO customer, {
    _i1.Transaction? transaction,
  }) async {
    if (productMasterDTO.id == null) {
      throw ArgumentError.notNull('productMasterDTO.id');
    }
    if (customer.id == null) {
      throw ArgumentError.notNull('customer.id');
    }

    var $productMasterDTO = productMasterDTO.copyWith(customerId: customer.id);
    await session.db.updateRow<ProductMasterDTO>(
      $productMasterDTO,
      columns: [ProductMasterDTO.t.customerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [ProductMasterDTO] and the given [ArtworkMasterDTO]
  /// by setting the [ArtworkMasterDTO]'s foreign key `productId` to refer to this [ProductMasterDTO].
  Future<void> artworks(
    _i1.Session session,
    ProductMasterDTO productMasterDTO,
    _i2.ArtworkMasterDTO artworkMasterDTO, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkMasterDTO.id == null) {
      throw ArgumentError.notNull('artworkMasterDTO.id');
    }
    if (productMasterDTO.id == null) {
      throw ArgumentError.notNull('productMasterDTO.id');
    }

    var $artworkMasterDTO =
        artworkMasterDTO.copyWith(productId: productMasterDTO.id);
    await session.db.updateRow<_i2.ArtworkMasterDTO>(
      $artworkMasterDTO,
      columns: [_i2.ArtworkMasterDTO.t.productId],
      transaction: transaction,
    );
  }
}

class ProductMasterDTODetachRepository {
  const ProductMasterDTODetachRepository._();

  /// Detaches the relation between this [ProductMasterDTO] and the given [ArtworkMasterDTO]
  /// by setting the [ArtworkMasterDTO]'s foreign key `productId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> artworks(
    _i1.Session session,
    List<_i2.ArtworkMasterDTO> artworkMasterDTO, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkMasterDTO.any((e) => e.id == null)) {
      throw ArgumentError.notNull('artworkMasterDTO.id');
    }

    var $artworkMasterDTO =
        artworkMasterDTO.map((e) => e.copyWith(productId: null)).toList();
    await session.db.update<_i2.ArtworkMasterDTO>(
      $artworkMasterDTO,
      columns: [_i2.ArtworkMasterDTO.t.productId],
      transaction: transaction,
    );
  }
}

class ProductMasterDTODetachRowRepository {
  const ProductMasterDTODetachRowRepository._();

  /// Detaches the relation between this [ProductMasterDTO] and the given [ArtworkMasterDTO]
  /// by setting the [ArtworkMasterDTO]'s foreign key `productId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> artworks(
    _i1.Session session,
    _i2.ArtworkMasterDTO artworkMasterDTO, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkMasterDTO.id == null) {
      throw ArgumentError.notNull('artworkMasterDTO.id');
    }

    var $artworkMasterDTO = artworkMasterDTO.copyWith(productId: null);
    await session.db.updateRow<_i2.ArtworkMasterDTO>(
      $artworkMasterDTO,
      columns: [_i2.ArtworkMasterDTO.t.productId],
      transaction: transaction,
    );
  }
}
