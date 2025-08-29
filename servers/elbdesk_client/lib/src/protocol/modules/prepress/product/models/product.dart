/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../../../../modules/crm/customer/models/customer.dart' as _i2;
import '../../../../modules/sales/sales_order/models/sales_order.dart' as _i3;
import '../../../../modules/prepress/product/models/product_master.dart' as _i4;
import '../../../../modules/prepress/artwork/models/artwork.dart' as _i5;

abstract class ProductDTO implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
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
