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
import '../../../../modules/sales/sales_order/models/sales_order.dart' as _i3;
import '../../../../modules/prepress/product/models/product_master.dart' as _i4;
import '../../../../modules/prepress/artwork/models/artwork.dart' as _i5;

abstract class ProductDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ProductDTO._({
    this.id,
    required this.serienId,
    required this.serienIndex,
    required this.serienIdString,
    required this.customerId,
    this.customer,
    required this.salesOrderId,
    this.salesOrder,
    required this.productMasterId,
    this.productMaster,
    this.artworks,
    required this.description,
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

  factory ProductDTO({
    int? id,
    required int serienId,
    required int serienIndex,
    required String serienIdString,
    required int customerId,
    _i2.CustomerDTO? customer,
    required int salesOrderId,
    _i3.SalesOrderDTO? salesOrder,
    required int productMasterId,
    _i4.ProductMasterDTO? productMaster,
    List<_i5.ArtworkDTO>? artworks,
    required String description,
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
  }) = _ProductDTOImpl;

  factory ProductDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return ProductDTO(
      id: jsonSerialization['id'] as int?,
      serienId: jsonSerialization['serienId'] as int,
      serienIndex: jsonSerialization['serienIndex'] as int,
      serienIdString: jsonSerialization['serienIdString'] as String,
      customerId: jsonSerialization['customerId'] as int,
      customer: jsonSerialization['customer'] == null
          ? null
          : _i2.CustomerDTO.fromJson(
              (jsonSerialization['customer'] as Map<String, dynamic>)),
      salesOrderId: jsonSerialization['salesOrderId'] as int,
      salesOrder: jsonSerialization['salesOrder'] == null
          ? null
          : _i3.SalesOrderDTO.fromJson(
              (jsonSerialization['salesOrder'] as Map<String, dynamic>)),
      productMasterId: jsonSerialization['productMasterId'] as int,
      productMaster: jsonSerialization['productMaster'] == null
          ? null
          : _i4.ProductMasterDTO.fromJson(
              (jsonSerialization['productMaster'] as Map<String, dynamic>)),
      artworks: (jsonSerialization['artworks'] as List?)
          ?.map((e) => _i5.ArtworkDTO.fromJson((e as Map<String, dynamic>)))
          .toList(),
      description: jsonSerialization['description'] as String,
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

  static final t = ProductDTOTable();

  static const db = ProductDTORepository._();

  @override
  int? id;

  int serienId;

  int serienIndex;

  String serienIdString;

  int customerId;

  _i2.CustomerDTO? customer;

  int salesOrderId;

  _i3.SalesOrderDTO? salesOrder;

  int productMasterId;

  _i4.ProductMasterDTO? productMaster;

  List<_i5.ArtworkDTO>? artworks;

  String description;

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

  /// Returns a shallow copy of this [ProductDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ProductDTO copyWith({
    int? id,
    int? serienId,
    int? serienIndex,
    String? serienIdString,
    int? customerId,
    _i2.CustomerDTO? customer,
    int? salesOrderId,
    _i3.SalesOrderDTO? salesOrder,
    int? productMasterId,
    _i4.ProductMasterDTO? productMaster,
    List<_i5.ArtworkDTO>? artworks,
    String? description,
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
      'serienId': serienId,
      'serienIndex': serienIndex,
      'serienIdString': serienIdString,
      'customerId': customerId,
      if (customer != null) 'customer': customer?.toJson(),
      'salesOrderId': salesOrderId,
      if (salesOrder != null) 'salesOrder': salesOrder?.toJson(),
      'productMasterId': productMasterId,
      if (productMaster != null) 'productMaster': productMaster?.toJson(),
      if (artworks != null)
        'artworks': artworks?.toJson(valueToJson: (v) => v.toJson()),
      'description': description,
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
      'serienId': serienId,
      'serienIndex': serienIndex,
      'serienIdString': serienIdString,
      'customerId': customerId,
      if (customer != null) 'customer': customer?.toJsonForProtocol(),
      'salesOrderId': salesOrderId,
      if (salesOrder != null) 'salesOrder': salesOrder?.toJsonForProtocol(),
      'productMasterId': productMasterId,
      if (productMaster != null)
        'productMaster': productMaster?.toJsonForProtocol(),
      if (artworks != null)
        'artworks': artworks?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'description': description,
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

  static ProductDTOInclude include({
    _i2.CustomerDTOInclude? customer,
    _i3.SalesOrderDTOInclude? salesOrder,
    _i4.ProductMasterDTOInclude? productMaster,
    _i5.ArtworkDTOIncludeList? artworks,
  }) {
    return ProductDTOInclude._(
      customer: customer,
      salesOrder: salesOrder,
      productMaster: productMaster,
      artworks: artworks,
    );
  }

  static ProductDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<ProductDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProductDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProductDTOTable>? orderByList,
    ProductDTOInclude? include,
  }) {
    return ProductDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ProductDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ProductDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ProductDTOImpl extends ProductDTO {
  _ProductDTOImpl({
    int? id,
    required int serienId,
    required int serienIndex,
    required String serienIdString,
    required int customerId,
    _i2.CustomerDTO? customer,
    required int salesOrderId,
    _i3.SalesOrderDTO? salesOrder,
    required int productMasterId,
    _i4.ProductMasterDTO? productMaster,
    List<_i5.ArtworkDTO>? artworks,
    required String description,
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
          serienId: serienId,
          serienIndex: serienIndex,
          serienIdString: serienIdString,
          customerId: customerId,
          customer: customer,
          salesOrderId: salesOrderId,
          salesOrder: salesOrder,
          productMasterId: productMasterId,
          productMaster: productMaster,
          artworks: artworks,
          description: description,
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

  /// Returns a shallow copy of this [ProductDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ProductDTO copyWith({
    Object? id = _Undefined,
    int? serienId,
    int? serienIndex,
    String? serienIdString,
    int? customerId,
    Object? customer = _Undefined,
    int? salesOrderId,
    Object? salesOrder = _Undefined,
    int? productMasterId,
    Object? productMaster = _Undefined,
    Object? artworks = _Undefined,
    String? description,
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
    return ProductDTO(
      id: id is int? ? id : this.id,
      serienId: serienId ?? this.serienId,
      serienIndex: serienIndex ?? this.serienIndex,
      serienIdString: serienIdString ?? this.serienIdString,
      customerId: customerId ?? this.customerId,
      customer:
          customer is _i2.CustomerDTO? ? customer : this.customer?.copyWith(),
      salesOrderId: salesOrderId ?? this.salesOrderId,
      salesOrder: salesOrder is _i3.SalesOrderDTO?
          ? salesOrder
          : this.salesOrder?.copyWith(),
      productMasterId: productMasterId ?? this.productMasterId,
      productMaster: productMaster is _i4.ProductMasterDTO?
          ? productMaster
          : this.productMaster?.copyWith(),
      artworks: artworks is List<_i5.ArtworkDTO>?
          ? artworks
          : this.artworks?.map((e0) => e0.copyWith()).toList(),
      description: description ?? this.description,
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

class ProductDTOTable extends _i1.Table<int?> {
  ProductDTOTable({super.tableRelation})
      : super(tableName: 'ed_prepress_product') {
    serienId = _i1.ColumnInt(
      'serienId',
      this,
    );
    serienIndex = _i1.ColumnInt(
      'serienIndex',
      this,
    );
    serienIdString = _i1.ColumnString(
      'serienIdString',
      this,
    );
    customerId = _i1.ColumnInt(
      'customerId',
      this,
    );
    salesOrderId = _i1.ColumnInt(
      'salesOrderId',
      this,
    );
    productMasterId = _i1.ColumnInt(
      'productMasterId',
      this,
    );
    description = _i1.ColumnString(
      'description',
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

  late final _i1.ColumnInt serienId;

  late final _i1.ColumnInt serienIndex;

  late final _i1.ColumnString serienIdString;

  late final _i1.ColumnInt customerId;

  _i2.CustomerDTOTable? _customer;

  late final _i1.ColumnInt salesOrderId;

  _i3.SalesOrderDTOTable? _salesOrder;

  late final _i1.ColumnInt productMasterId;

  _i4.ProductMasterDTOTable? _productMaster;

  _i5.ArtworkDTOTable? ___artworks;

  _i1.ManyRelation<_i5.ArtworkDTOTable>? _artworks;

  late final _i1.ColumnString description;

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

  _i2.CustomerDTOTable get customer {
    if (_customer != null) return _customer!;
    _customer = _i1.createRelationTable(
      relationFieldName: 'customer',
      field: ProductDTO.t.customerId,
      foreignField: _i2.CustomerDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.CustomerDTOTable(tableRelation: foreignTableRelation),
    );
    return _customer!;
  }

  _i3.SalesOrderDTOTable get salesOrder {
    if (_salesOrder != null) return _salesOrder!;
    _salesOrder = _i1.createRelationTable(
      relationFieldName: 'salesOrder',
      field: ProductDTO.t.salesOrderId,
      foreignField: _i3.SalesOrderDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.SalesOrderDTOTable(tableRelation: foreignTableRelation),
    );
    return _salesOrder!;
  }

  _i4.ProductMasterDTOTable get productMaster {
    if (_productMaster != null) return _productMaster!;
    _productMaster = _i1.createRelationTable(
      relationFieldName: 'productMaster',
      field: ProductDTO.t.productMasterId,
      foreignField: _i4.ProductMasterDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.ProductMasterDTOTable(tableRelation: foreignTableRelation),
    );
    return _productMaster!;
  }

  _i5.ArtworkDTOTable get __artworks {
    if (___artworks != null) return ___artworks!;
    ___artworks = _i1.createRelationTable(
      relationFieldName: '__artworks',
      field: ProductDTO.t.id,
      foreignField: _i5.ArtworkDTO.t.productId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.ArtworkDTOTable(tableRelation: foreignTableRelation),
    );
    return ___artworks!;
  }

  _i1.ManyRelation<_i5.ArtworkDTOTable> get artworks {
    if (_artworks != null) return _artworks!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'artworks',
      field: ProductDTO.t.id,
      foreignField: _i5.ArtworkDTO.t.productId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.ArtworkDTOTable(tableRelation: foreignTableRelation),
    );
    _artworks = _i1.ManyRelation<_i5.ArtworkDTOTable>(
      tableWithRelations: relationTable,
      table: _i5.ArtworkDTOTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _artworks!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        serienId,
        serienIndex,
        serienIdString,
        customerId,
        salesOrderId,
        productMasterId,
        description,
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
    if (relationField == 'customer') {
      return customer;
    }
    if (relationField == 'salesOrder') {
      return salesOrder;
    }
    if (relationField == 'productMaster') {
      return productMaster;
    }
    if (relationField == 'artworks') {
      return __artworks;
    }
    return null;
  }
}

class ProductDTOInclude extends _i1.IncludeObject {
  ProductDTOInclude._({
    _i2.CustomerDTOInclude? customer,
    _i3.SalesOrderDTOInclude? salesOrder,
    _i4.ProductMasterDTOInclude? productMaster,
    _i5.ArtworkDTOIncludeList? artworks,
  }) {
    _customer = customer;
    _salesOrder = salesOrder;
    _productMaster = productMaster;
    _artworks = artworks;
  }

  _i2.CustomerDTOInclude? _customer;

  _i3.SalesOrderDTOInclude? _salesOrder;

  _i4.ProductMasterDTOInclude? _productMaster;

  _i5.ArtworkDTOIncludeList? _artworks;

  @override
  Map<String, _i1.Include?> get includes => {
        'customer': _customer,
        'salesOrder': _salesOrder,
        'productMaster': _productMaster,
        'artworks': _artworks,
      };

  @override
  _i1.Table<int?> get table => ProductDTO.t;
}

class ProductDTOIncludeList extends _i1.IncludeList {
  ProductDTOIncludeList._({
    _i1.WhereExpressionBuilder<ProductDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ProductDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ProductDTO.t;
}

class ProductDTORepository {
  const ProductDTORepository._();

  final attach = const ProductDTOAttachRepository._();

  final attachRow = const ProductDTOAttachRowRepository._();

  final detach = const ProductDTODetachRepository._();

  final detachRow = const ProductDTODetachRowRepository._();

  /// Returns a list of [ProductDTO]s matching the given query parameters.
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
  Future<List<ProductDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProductDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProductDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProductDTOTable>? orderByList,
    _i1.Transaction? transaction,
    ProductDTOInclude? include,
  }) async {
    return session.db.find<ProductDTO>(
      where: where?.call(ProductDTO.t),
      orderBy: orderBy?.call(ProductDTO.t),
      orderByList: orderByList?.call(ProductDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [ProductDTO] matching the given query parameters.
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
  Future<ProductDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProductDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<ProductDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProductDTOTable>? orderByList,
    _i1.Transaction? transaction,
    ProductDTOInclude? include,
  }) async {
    return session.db.findFirstRow<ProductDTO>(
      where: where?.call(ProductDTO.t),
      orderBy: orderBy?.call(ProductDTO.t),
      orderByList: orderByList?.call(ProductDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [ProductDTO] by its [id] or null if no such row exists.
  Future<ProductDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ProductDTOInclude? include,
  }) async {
    return session.db.findById<ProductDTO>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [ProductDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [ProductDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ProductDTO>> insert(
    _i1.Session session,
    List<ProductDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ProductDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ProductDTO] and returns the inserted row.
  ///
  /// The returned [ProductDTO] will have its `id` field set.
  Future<ProductDTO> insertRow(
    _i1.Session session,
    ProductDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ProductDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ProductDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ProductDTO>> update(
    _i1.Session session,
    List<ProductDTO> rows, {
    _i1.ColumnSelections<ProductDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ProductDTO>(
      rows,
      columns: columns?.call(ProductDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ProductDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ProductDTO> updateRow(
    _i1.Session session,
    ProductDTO row, {
    _i1.ColumnSelections<ProductDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ProductDTO>(
      row,
      columns: columns?.call(ProductDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [ProductDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ProductDTO>> delete(
    _i1.Session session,
    List<ProductDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ProductDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ProductDTO].
  Future<ProductDTO> deleteRow(
    _i1.Session session,
    ProductDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ProductDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ProductDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ProductDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ProductDTO>(
      where: where(ProductDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProductDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ProductDTO>(
      where: where?.call(ProductDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ProductDTOAttachRepository {
  const ProductDTOAttachRepository._();

  /// Creates a relation between this [ProductDTO] and the given [ArtworkDTO]s
  /// by setting each [ArtworkDTO]'s foreign key `productId` to refer to this [ProductDTO].
  Future<void> artworks(
    _i1.Session session,
    ProductDTO productDTO,
    List<_i5.ArtworkDTO> artworkDTO, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkDTO.any((e) => e.id == null)) {
      throw ArgumentError.notNull('artworkDTO.id');
    }
    if (productDTO.id == null) {
      throw ArgumentError.notNull('productDTO.id');
    }

    var $artworkDTO =
        artworkDTO.map((e) => e.copyWith(productId: productDTO.id)).toList();
    await session.db.update<_i5.ArtworkDTO>(
      $artworkDTO,
      columns: [_i5.ArtworkDTO.t.productId],
      transaction: transaction,
    );
  }
}

class ProductDTOAttachRowRepository {
  const ProductDTOAttachRowRepository._();

  /// Creates a relation between the given [ProductDTO] and [CustomerDTO]
  /// by setting the [ProductDTO]'s foreign key `customerId` to refer to the [CustomerDTO].
  Future<void> customer(
    _i1.Session session,
    ProductDTO productDTO,
    _i2.CustomerDTO customer, {
    _i1.Transaction? transaction,
  }) async {
    if (productDTO.id == null) {
      throw ArgumentError.notNull('productDTO.id');
    }
    if (customer.id == null) {
      throw ArgumentError.notNull('customer.id');
    }

    var $productDTO = productDTO.copyWith(customerId: customer.id);
    await session.db.updateRow<ProductDTO>(
      $productDTO,
      columns: [ProductDTO.t.customerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [ProductDTO] and [SalesOrderDTO]
  /// by setting the [ProductDTO]'s foreign key `salesOrderId` to refer to the [SalesOrderDTO].
  Future<void> salesOrder(
    _i1.Session session,
    ProductDTO productDTO,
    _i3.SalesOrderDTO salesOrder, {
    _i1.Transaction? transaction,
  }) async {
    if (productDTO.id == null) {
      throw ArgumentError.notNull('productDTO.id');
    }
    if (salesOrder.id == null) {
      throw ArgumentError.notNull('salesOrder.id');
    }

    var $productDTO = productDTO.copyWith(salesOrderId: salesOrder.id);
    await session.db.updateRow<ProductDTO>(
      $productDTO,
      columns: [ProductDTO.t.salesOrderId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [ProductDTO] and [ProductMasterDTO]
  /// by setting the [ProductDTO]'s foreign key `productMasterId` to refer to the [ProductMasterDTO].
  Future<void> productMaster(
    _i1.Session session,
    ProductDTO productDTO,
    _i4.ProductMasterDTO productMaster, {
    _i1.Transaction? transaction,
  }) async {
    if (productDTO.id == null) {
      throw ArgumentError.notNull('productDTO.id');
    }
    if (productMaster.id == null) {
      throw ArgumentError.notNull('productMaster.id');
    }

    var $productDTO = productDTO.copyWith(productMasterId: productMaster.id);
    await session.db.updateRow<ProductDTO>(
      $productDTO,
      columns: [ProductDTO.t.productMasterId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [ProductDTO] and the given [ArtworkDTO]
  /// by setting the [ArtworkDTO]'s foreign key `productId` to refer to this [ProductDTO].
  Future<void> artworks(
    _i1.Session session,
    ProductDTO productDTO,
    _i5.ArtworkDTO artworkDTO, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkDTO.id == null) {
      throw ArgumentError.notNull('artworkDTO.id');
    }
    if (productDTO.id == null) {
      throw ArgumentError.notNull('productDTO.id');
    }

    var $artworkDTO = artworkDTO.copyWith(productId: productDTO.id);
    await session.db.updateRow<_i5.ArtworkDTO>(
      $artworkDTO,
      columns: [_i5.ArtworkDTO.t.productId],
      transaction: transaction,
    );
  }
}

class ProductDTODetachRepository {
  const ProductDTODetachRepository._();

  /// Detaches the relation between this [ProductDTO] and the given [ArtworkDTO]
  /// by setting the [ArtworkDTO]'s foreign key `productId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> artworks(
    _i1.Session session,
    List<_i5.ArtworkDTO> artworkDTO, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkDTO.any((e) => e.id == null)) {
      throw ArgumentError.notNull('artworkDTO.id');
    }

    var $artworkDTO =
        artworkDTO.map((e) => e.copyWith(productId: null)).toList();
    await session.db.update<_i5.ArtworkDTO>(
      $artworkDTO,
      columns: [_i5.ArtworkDTO.t.productId],
      transaction: transaction,
    );
  }
}

class ProductDTODetachRowRepository {
  const ProductDTODetachRowRepository._();

  /// Detaches the relation between this [ProductDTO] and the given [ArtworkDTO]
  /// by setting the [ArtworkDTO]'s foreign key `productId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> artworks(
    _i1.Session session,
    _i5.ArtworkDTO artworkDTO, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkDTO.id == null) {
      throw ArgumentError.notNull('artworkDTO.id');
    }

    var $artworkDTO = artworkDTO.copyWith(productId: null);
    await session.db.updateRow<_i5.ArtworkDTO>(
      $artworkDTO,
      columns: [_i5.ArtworkDTO.t.productId],
      transaction: transaction,
    );
  }
}
