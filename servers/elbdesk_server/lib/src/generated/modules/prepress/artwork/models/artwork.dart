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
import '../../../../modules/prepress/artwork/models/artwork_master.dart' as _i3;
import '../../../../modules/sales/sales_order/models/sales_order.dart' as _i4;
import '../../../../modules/prepress/nutzenlayout/models/tables/sales_order_single_nutzenlayout_artwork_jt.dart'
    as _i5;
import '../../../../modules/prepress/nutzenlayout/models/tables/sales_order_multi_nutzenlayout_artwork_jt.dart'
    as _i6;
import '../../../../modules/prepress/artwork_quarantine/models/artwork_quarantine_dto.dart'
    as _i7;
import '../../../../modules/prepress/product/models/product.dart' as _i8;
import '../../../../modules/prepress/codes/models/artwork_code.dart' as _i9;
import '../../../../modules/prepress/trapping/models/trapping.dart' as _i10;
import '../../../../modules/prepress/layer/models/artwork_layer.dart' as _i11;
import '../../../../modules/prepress/color/models/artwork_color.dart' as _i12;

abstract class ArtworkDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ArtworkDTO._({
    this.id,
    required this.description,
    required this.customerId,
    this.customer,
    required this.artworkMasterId,
    this.artworkMaster,
    required this.salesOrderId,
    this.salesOrder,
    required this.version,
    required this.abzug,
    required this.reference,
    required this.isLocked,
    this.dieCutterType,
    this.salesOrderSingleNutzenlayouts,
    this.salesOrderMultiNutzenlayouts,
    required this.layerId,
    this.artworkQuarantineId,
    this.artworkQuarantine,
    required this.artworkType,
    required this.printProcessType,
    this.productId,
    this.product,
    required this.codes,
    required this.width,
    required this.height,
    this.cornerRadius,
    required this.trapping,
    required this.layers,
    required this.anschnitt,
    required this.colors,
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

  factory ArtworkDTO({
    int? id,
    required String description,
    required int customerId,
    _i2.CustomerDTO? customer,
    required int artworkMasterId,
    _i3.ArtworkMasterDTO? artworkMaster,
    required int salesOrderId,
    _i4.SalesOrderDTO? salesOrder,
    required int version,
    required int abzug,
    required String reference,
    required bool isLocked,
    String? dieCutterType,
    List<_i5.SalesOrderSingleNutzenlayoutArtworkJT>?
        salesOrderSingleNutzenlayouts,
    List<_i6.SalesOrderMultiNutzenlayoutArtworkJT>?
        salesOrderMultiNutzenlayouts,
    required int layerId,
    int? artworkQuarantineId,
    _i7.ArtworkQuarantineDTO? artworkQuarantine,
    required String artworkType,
    required String printProcessType,
    int? productId,
    _i8.ProductDTO? product,
    required List<_i9.ArtworkCodeDTO> codes,
    required double width,
    required double height,
    double? cornerRadius,
    required _i10.TrappingDTO trapping,
    required List<_i11.ArtworkLayerDTO> layers,
    required double anschnitt,
    required List<_i12.ArtworkColorDTO> colors,
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
  }) = _ArtworkDTOImpl;

  factory ArtworkDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return ArtworkDTO(
      id: jsonSerialization['id'] as int?,
      description: jsonSerialization['description'] as String,
      customerId: jsonSerialization['customerId'] as int,
      customer: jsonSerialization['customer'] == null
          ? null
          : _i2.CustomerDTO.fromJson(
              (jsonSerialization['customer'] as Map<String, dynamic>)),
      artworkMasterId: jsonSerialization['artworkMasterId'] as int,
      artworkMaster: jsonSerialization['artworkMaster'] == null
          ? null
          : _i3.ArtworkMasterDTO.fromJson(
              (jsonSerialization['artworkMaster'] as Map<String, dynamic>)),
      salesOrderId: jsonSerialization['salesOrderId'] as int,
      salesOrder: jsonSerialization['salesOrder'] == null
          ? null
          : _i4.SalesOrderDTO.fromJson(
              (jsonSerialization['salesOrder'] as Map<String, dynamic>)),
      version: jsonSerialization['version'] as int,
      abzug: jsonSerialization['abzug'] as int,
      reference: jsonSerialization['reference'] as String,
      isLocked: jsonSerialization['isLocked'] as bool,
      dieCutterType: jsonSerialization['dieCutterType'] as String?,
      salesOrderSingleNutzenlayouts:
          (jsonSerialization['salesOrderSingleNutzenlayouts'] as List?)
              ?.map((e) => _i5.SalesOrderSingleNutzenlayoutArtworkJT.fromJson(
                  (e as Map<String, dynamic>)))
              .toList(),
      salesOrderMultiNutzenlayouts:
          (jsonSerialization['salesOrderMultiNutzenlayouts'] as List?)
              ?.map((e) => _i6.SalesOrderMultiNutzenlayoutArtworkJT.fromJson(
                  (e as Map<String, dynamic>)))
              .toList(),
      layerId: jsonSerialization['layerId'] as int,
      artworkQuarantineId: jsonSerialization['artworkQuarantineId'] as int?,
      artworkQuarantine: jsonSerialization['artworkQuarantine'] == null
          ? null
          : _i7.ArtworkQuarantineDTO.fromJson(
              (jsonSerialization['artworkQuarantine'] as Map<String, dynamic>)),
      artworkType: jsonSerialization['artworkType'] as String,
      printProcessType: jsonSerialization['printProcessType'] as String,
      productId: jsonSerialization['productId'] as int?,
      product: jsonSerialization['product'] == null
          ? null
          : _i8.ProductDTO.fromJson(
              (jsonSerialization['product'] as Map<String, dynamic>)),
      codes: (jsonSerialization['codes'] as List)
          .map((e) => _i9.ArtworkCodeDTO.fromJson((e as Map<String, dynamic>)))
          .toList(),
      width: (jsonSerialization['width'] as num).toDouble(),
      height: (jsonSerialization['height'] as num).toDouble(),
      cornerRadius: (jsonSerialization['cornerRadius'] as num?)?.toDouble(),
      trapping: _i10.TrappingDTO.fromJson(
          (jsonSerialization['trapping'] as Map<String, dynamic>)),
      layers: (jsonSerialization['layers'] as List)
          .map(
              (e) => _i11.ArtworkLayerDTO.fromJson((e as Map<String, dynamic>)))
          .toList(),
      anschnitt: (jsonSerialization['anschnitt'] as num).toDouble(),
      colors: (jsonSerialization['colors'] as List)
          .map(
              (e) => _i12.ArtworkColorDTO.fromJson((e as Map<String, dynamic>)))
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

  static final t = ArtworkDTOTable();

  static const db = ArtworkDTORepository._();

  @override
  int? id;

  String description;

  int customerId;

  _i2.CustomerDTO? customer;

  int artworkMasterId;

  _i3.ArtworkMasterDTO? artworkMaster;

  int salesOrderId;

  _i4.SalesOrderDTO? salesOrder;

  int version;

  int abzug;

  String reference;

  bool isLocked;

  String? dieCutterType;

  List<_i5.SalesOrderSingleNutzenlayoutArtworkJT>?
      salesOrderSingleNutzenlayouts;

  List<_i6.SalesOrderMultiNutzenlayoutArtworkJT>? salesOrderMultiNutzenlayouts;

  int layerId;

  int? artworkQuarantineId;

  _i7.ArtworkQuarantineDTO? artworkQuarantine;

  String artworkType;

  String printProcessType;

  int? productId;

  _i8.ProductDTO? product;

  List<_i9.ArtworkCodeDTO> codes;

  double width;

  double height;

  double? cornerRadius;

  _i10.TrappingDTO trapping;

  List<_i11.ArtworkLayerDTO> layers;

  double anschnitt;

  List<_i12.ArtworkColorDTO> colors;

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

  /// Returns a shallow copy of this [ArtworkDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ArtworkDTO copyWith({
    int? id,
    String? description,
    int? customerId,
    _i2.CustomerDTO? customer,
    int? artworkMasterId,
    _i3.ArtworkMasterDTO? artworkMaster,
    int? salesOrderId,
    _i4.SalesOrderDTO? salesOrder,
    int? version,
    int? abzug,
    String? reference,
    bool? isLocked,
    String? dieCutterType,
    List<_i5.SalesOrderSingleNutzenlayoutArtworkJT>?
        salesOrderSingleNutzenlayouts,
    List<_i6.SalesOrderMultiNutzenlayoutArtworkJT>?
        salesOrderMultiNutzenlayouts,
    int? layerId,
    int? artworkQuarantineId,
    _i7.ArtworkQuarantineDTO? artworkQuarantine,
    String? artworkType,
    String? printProcessType,
    int? productId,
    _i8.ProductDTO? product,
    List<_i9.ArtworkCodeDTO>? codes,
    double? width,
    double? height,
    double? cornerRadius,
    _i10.TrappingDTO? trapping,
    List<_i11.ArtworkLayerDTO>? layers,
    double? anschnitt,
    List<_i12.ArtworkColorDTO>? colors,
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
      'customerId': customerId,
      if (customer != null) 'customer': customer?.toJson(),
      'artworkMasterId': artworkMasterId,
      if (artworkMaster != null) 'artworkMaster': artworkMaster?.toJson(),
      'salesOrderId': salesOrderId,
      if (salesOrder != null) 'salesOrder': salesOrder?.toJson(),
      'version': version,
      'abzug': abzug,
      'reference': reference,
      'isLocked': isLocked,
      if (dieCutterType != null) 'dieCutterType': dieCutterType,
      if (salesOrderSingleNutzenlayouts != null)
        'salesOrderSingleNutzenlayouts': salesOrderSingleNutzenlayouts?.toJson(
            valueToJson: (v) => v.toJson()),
      if (salesOrderMultiNutzenlayouts != null)
        'salesOrderMultiNutzenlayouts': salesOrderMultiNutzenlayouts?.toJson(
            valueToJson: (v) => v.toJson()),
      'layerId': layerId,
      if (artworkQuarantineId != null)
        'artworkQuarantineId': artworkQuarantineId,
      if (artworkQuarantine != null)
        'artworkQuarantine': artworkQuarantine?.toJson(),
      'artworkType': artworkType,
      'printProcessType': printProcessType,
      if (productId != null) 'productId': productId,
      if (product != null) 'product': product?.toJson(),
      'codes': codes.toJson(valueToJson: (v) => v.toJson()),
      'width': width,
      'height': height,
      if (cornerRadius != null) 'cornerRadius': cornerRadius,
      'trapping': trapping.toJson(),
      'layers': layers.toJson(valueToJson: (v) => v.toJson()),
      'anschnitt': anschnitt,
      'colors': colors.toJson(valueToJson: (v) => v.toJson()),
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
      'customerId': customerId,
      if (customer != null) 'customer': customer?.toJsonForProtocol(),
      'artworkMasterId': artworkMasterId,
      if (artworkMaster != null)
        'artworkMaster': artworkMaster?.toJsonForProtocol(),
      'salesOrderId': salesOrderId,
      if (salesOrder != null) 'salesOrder': salesOrder?.toJsonForProtocol(),
      'version': version,
      'abzug': abzug,
      'reference': reference,
      'isLocked': isLocked,
      if (dieCutterType != null) 'dieCutterType': dieCutterType,
      if (salesOrderSingleNutzenlayouts != null)
        'salesOrderSingleNutzenlayouts': salesOrderSingleNutzenlayouts?.toJson(
            valueToJson: (v) => v.toJsonForProtocol()),
      if (salesOrderMultiNutzenlayouts != null)
        'salesOrderMultiNutzenlayouts': salesOrderMultiNutzenlayouts?.toJson(
            valueToJson: (v) => v.toJsonForProtocol()),
      'layerId': layerId,
      if (artworkQuarantineId != null)
        'artworkQuarantineId': artworkQuarantineId,
      if (artworkQuarantine != null)
        'artworkQuarantine': artworkQuarantine?.toJsonForProtocol(),
      'artworkType': artworkType,
      'printProcessType': printProcessType,
      if (productId != null) 'productId': productId,
      if (product != null) 'product': product?.toJsonForProtocol(),
      'codes': codes.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'width': width,
      'height': height,
      if (cornerRadius != null) 'cornerRadius': cornerRadius,
      'trapping': trapping.toJsonForProtocol(),
      'layers': layers.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'anschnitt': anschnitt,
      'colors': colors.toJson(valueToJson: (v) => v.toJsonForProtocol()),
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

  static ArtworkDTOInclude include({
    _i2.CustomerDTOInclude? customer,
    _i3.ArtworkMasterDTOInclude? artworkMaster,
    _i4.SalesOrderDTOInclude? salesOrder,
    _i5.SalesOrderSingleNutzenlayoutArtworkJTIncludeList?
        salesOrderSingleNutzenlayouts,
    _i6.SalesOrderMultiNutzenlayoutArtworkJTIncludeList?
        salesOrderMultiNutzenlayouts,
    _i7.ArtworkQuarantineDTOInclude? artworkQuarantine,
    _i8.ProductDTOInclude? product,
  }) {
    return ArtworkDTOInclude._(
      customer: customer,
      artworkMaster: artworkMaster,
      salesOrder: salesOrder,
      salesOrderSingleNutzenlayouts: salesOrderSingleNutzenlayouts,
      salesOrderMultiNutzenlayouts: salesOrderMultiNutzenlayouts,
      artworkQuarantine: artworkQuarantine,
      product: product,
    );
  }

  static ArtworkDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<ArtworkDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArtworkDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkDTOTable>? orderByList,
    ArtworkDTOInclude? include,
  }) {
    return ArtworkDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ArtworkDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ArtworkDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ArtworkDTOImpl extends ArtworkDTO {
  _ArtworkDTOImpl({
    int? id,
    required String description,
    required int customerId,
    _i2.CustomerDTO? customer,
    required int artworkMasterId,
    _i3.ArtworkMasterDTO? artworkMaster,
    required int salesOrderId,
    _i4.SalesOrderDTO? salesOrder,
    required int version,
    required int abzug,
    required String reference,
    required bool isLocked,
    String? dieCutterType,
    List<_i5.SalesOrderSingleNutzenlayoutArtworkJT>?
        salesOrderSingleNutzenlayouts,
    List<_i6.SalesOrderMultiNutzenlayoutArtworkJT>?
        salesOrderMultiNutzenlayouts,
    required int layerId,
    int? artworkQuarantineId,
    _i7.ArtworkQuarantineDTO? artworkQuarantine,
    required String artworkType,
    required String printProcessType,
    int? productId,
    _i8.ProductDTO? product,
    required List<_i9.ArtworkCodeDTO> codes,
    required double width,
    required double height,
    double? cornerRadius,
    required _i10.TrappingDTO trapping,
    required List<_i11.ArtworkLayerDTO> layers,
    required double anschnitt,
    required List<_i12.ArtworkColorDTO> colors,
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
          customerId: customerId,
          customer: customer,
          artworkMasterId: artworkMasterId,
          artworkMaster: artworkMaster,
          salesOrderId: salesOrderId,
          salesOrder: salesOrder,
          version: version,
          abzug: abzug,
          reference: reference,
          isLocked: isLocked,
          dieCutterType: dieCutterType,
          salesOrderSingleNutzenlayouts: salesOrderSingleNutzenlayouts,
          salesOrderMultiNutzenlayouts: salesOrderMultiNutzenlayouts,
          layerId: layerId,
          artworkQuarantineId: artworkQuarantineId,
          artworkQuarantine: artworkQuarantine,
          artworkType: artworkType,
          printProcessType: printProcessType,
          productId: productId,
          product: product,
          codes: codes,
          width: width,
          height: height,
          cornerRadius: cornerRadius,
          trapping: trapping,
          layers: layers,
          anschnitt: anschnitt,
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

  /// Returns a shallow copy of this [ArtworkDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ArtworkDTO copyWith({
    Object? id = _Undefined,
    String? description,
    int? customerId,
    Object? customer = _Undefined,
    int? artworkMasterId,
    Object? artworkMaster = _Undefined,
    int? salesOrderId,
    Object? salesOrder = _Undefined,
    int? version,
    int? abzug,
    String? reference,
    bool? isLocked,
    Object? dieCutterType = _Undefined,
    Object? salesOrderSingleNutzenlayouts = _Undefined,
    Object? salesOrderMultiNutzenlayouts = _Undefined,
    int? layerId,
    Object? artworkQuarantineId = _Undefined,
    Object? artworkQuarantine = _Undefined,
    String? artworkType,
    String? printProcessType,
    Object? productId = _Undefined,
    Object? product = _Undefined,
    List<_i9.ArtworkCodeDTO>? codes,
    double? width,
    double? height,
    Object? cornerRadius = _Undefined,
    _i10.TrappingDTO? trapping,
    List<_i11.ArtworkLayerDTO>? layers,
    double? anschnitt,
    List<_i12.ArtworkColorDTO>? colors,
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
    return ArtworkDTO(
      id: id is int? ? id : this.id,
      description: description ?? this.description,
      customerId: customerId ?? this.customerId,
      customer:
          customer is _i2.CustomerDTO? ? customer : this.customer?.copyWith(),
      artworkMasterId: artworkMasterId ?? this.artworkMasterId,
      artworkMaster: artworkMaster is _i3.ArtworkMasterDTO?
          ? artworkMaster
          : this.artworkMaster?.copyWith(),
      salesOrderId: salesOrderId ?? this.salesOrderId,
      salesOrder: salesOrder is _i4.SalesOrderDTO?
          ? salesOrder
          : this.salesOrder?.copyWith(),
      version: version ?? this.version,
      abzug: abzug ?? this.abzug,
      reference: reference ?? this.reference,
      isLocked: isLocked ?? this.isLocked,
      dieCutterType:
          dieCutterType is String? ? dieCutterType : this.dieCutterType,
      salesOrderSingleNutzenlayouts: salesOrderSingleNutzenlayouts
              is List<_i5.SalesOrderSingleNutzenlayoutArtworkJT>?
          ? salesOrderSingleNutzenlayouts
          : this
              .salesOrderSingleNutzenlayouts
              ?.map((e0) => e0.copyWith())
              .toList(),
      salesOrderMultiNutzenlayouts: salesOrderMultiNutzenlayouts
              is List<_i6.SalesOrderMultiNutzenlayoutArtworkJT>?
          ? salesOrderMultiNutzenlayouts
          : this
              .salesOrderMultiNutzenlayouts
              ?.map((e0) => e0.copyWith())
              .toList(),
      layerId: layerId ?? this.layerId,
      artworkQuarantineId: artworkQuarantineId is int?
          ? artworkQuarantineId
          : this.artworkQuarantineId,
      artworkQuarantine: artworkQuarantine is _i7.ArtworkQuarantineDTO?
          ? artworkQuarantine
          : this.artworkQuarantine?.copyWith(),
      artworkType: artworkType ?? this.artworkType,
      printProcessType: printProcessType ?? this.printProcessType,
      productId: productId is int? ? productId : this.productId,
      product: product is _i8.ProductDTO? ? product : this.product?.copyWith(),
      codes: codes ?? this.codes.map((e0) => e0.copyWith()).toList(),
      width: width ?? this.width,
      height: height ?? this.height,
      cornerRadius: cornerRadius is double? ? cornerRadius : this.cornerRadius,
      trapping: trapping ?? this.trapping.copyWith(),
      layers: layers ?? this.layers.map((e0) => e0.copyWith()).toList(),
      anschnitt: anschnitt ?? this.anschnitt,
      colors: colors ?? this.colors.map((e0) => e0.copyWith()).toList(),
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

class ArtworkDTOTable extends _i1.Table<int?> {
  ArtworkDTOTable({super.tableRelation})
      : super(tableName: 'ed_prepress_artwork') {
    description = _i1.ColumnString(
      'description',
      this,
    );
    customerId = _i1.ColumnInt(
      'customerId',
      this,
    );
    artworkMasterId = _i1.ColumnInt(
      'artworkMasterId',
      this,
    );
    salesOrderId = _i1.ColumnInt(
      'salesOrderId',
      this,
    );
    version = _i1.ColumnInt(
      'version',
      this,
    );
    abzug = _i1.ColumnInt(
      'abzug',
      this,
    );
    reference = _i1.ColumnString(
      'reference',
      this,
    );
    isLocked = _i1.ColumnBool(
      'isLocked',
      this,
    );
    dieCutterType = _i1.ColumnString(
      'dieCutterType',
      this,
    );
    layerId = _i1.ColumnInt(
      'layerId',
      this,
    );
    artworkQuarantineId = _i1.ColumnInt(
      'artworkQuarantineId',
      this,
    );
    artworkType = _i1.ColumnString(
      'artworkType',
      this,
    );
    printProcessType = _i1.ColumnString(
      'printProcessType',
      this,
    );
    productId = _i1.ColumnInt(
      'productId',
      this,
    );
    codes = _i1.ColumnSerializable(
      'codes',
      this,
    );
    width = _i1.ColumnDouble(
      'width',
      this,
    );
    height = _i1.ColumnDouble(
      'height',
      this,
    );
    cornerRadius = _i1.ColumnDouble(
      'cornerRadius',
      this,
    );
    trapping = _i1.ColumnSerializable(
      'trapping',
      this,
    );
    layers = _i1.ColumnSerializable(
      'layers',
      this,
    );
    anschnitt = _i1.ColumnDouble(
      'anschnitt',
      this,
    );
    colors = _i1.ColumnSerializable(
      'colors',
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

  late final _i1.ColumnInt customerId;

  _i2.CustomerDTOTable? _customer;

  late final _i1.ColumnInt artworkMasterId;

  _i3.ArtworkMasterDTOTable? _artworkMaster;

  late final _i1.ColumnInt salesOrderId;

  _i4.SalesOrderDTOTable? _salesOrder;

  late final _i1.ColumnInt version;

  late final _i1.ColumnInt abzug;

  late final _i1.ColumnString reference;

  late final _i1.ColumnBool isLocked;

  late final _i1.ColumnString dieCutterType;

  _i5.SalesOrderSingleNutzenlayoutArtworkJTTable?
      ___salesOrderSingleNutzenlayouts;

  _i1.ManyRelation<_i5.SalesOrderSingleNutzenlayoutArtworkJTTable>?
      _salesOrderSingleNutzenlayouts;

  _i6.SalesOrderMultiNutzenlayoutArtworkJTTable?
      ___salesOrderMultiNutzenlayouts;

  _i1.ManyRelation<_i6.SalesOrderMultiNutzenlayoutArtworkJTTable>?
      _salesOrderMultiNutzenlayouts;

  late final _i1.ColumnInt layerId;

  late final _i1.ColumnInt artworkQuarantineId;

  _i7.ArtworkQuarantineDTOTable? _artworkQuarantine;

  late final _i1.ColumnString artworkType;

  late final _i1.ColumnString printProcessType;

  late final _i1.ColumnInt productId;

  _i8.ProductDTOTable? _product;

  late final _i1.ColumnSerializable codes;

  late final _i1.ColumnDouble width;

  late final _i1.ColumnDouble height;

  late final _i1.ColumnDouble cornerRadius;

  late final _i1.ColumnSerializable trapping;

  late final _i1.ColumnSerializable layers;

  late final _i1.ColumnDouble anschnitt;

  late final _i1.ColumnSerializable colors;

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
      field: ArtworkDTO.t.customerId,
      foreignField: _i2.CustomerDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.CustomerDTOTable(tableRelation: foreignTableRelation),
    );
    return _customer!;
  }

  _i3.ArtworkMasterDTOTable get artworkMaster {
    if (_artworkMaster != null) return _artworkMaster!;
    _artworkMaster = _i1.createRelationTable(
      relationFieldName: 'artworkMaster',
      field: ArtworkDTO.t.artworkMasterId,
      foreignField: _i3.ArtworkMasterDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.ArtworkMasterDTOTable(tableRelation: foreignTableRelation),
    );
    return _artworkMaster!;
  }

  _i4.SalesOrderDTOTable get salesOrder {
    if (_salesOrder != null) return _salesOrder!;
    _salesOrder = _i1.createRelationTable(
      relationFieldName: 'salesOrder',
      field: ArtworkDTO.t.salesOrderId,
      foreignField: _i4.SalesOrderDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.SalesOrderDTOTable(tableRelation: foreignTableRelation),
    );
    return _salesOrder!;
  }

  _i5.SalesOrderSingleNutzenlayoutArtworkJTTable
      get __salesOrderSingleNutzenlayouts {
    if (___salesOrderSingleNutzenlayouts != null)
      return ___salesOrderSingleNutzenlayouts!;
    ___salesOrderSingleNutzenlayouts = _i1.createRelationTable(
      relationFieldName: '__salesOrderSingleNutzenlayouts',
      field: ArtworkDTO.t.id,
      foreignField: _i5.SalesOrderSingleNutzenlayoutArtworkJT.t.artworkId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.SalesOrderSingleNutzenlayoutArtworkJTTable(
              tableRelation: foreignTableRelation),
    );
    return ___salesOrderSingleNutzenlayouts!;
  }

  _i6.SalesOrderMultiNutzenlayoutArtworkJTTable
      get __salesOrderMultiNutzenlayouts {
    if (___salesOrderMultiNutzenlayouts != null)
      return ___salesOrderMultiNutzenlayouts!;
    ___salesOrderMultiNutzenlayouts = _i1.createRelationTable(
      relationFieldName: '__salesOrderMultiNutzenlayouts',
      field: ArtworkDTO.t.id,
      foreignField: _i6.SalesOrderMultiNutzenlayoutArtworkJT.t.artworkId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i6.SalesOrderMultiNutzenlayoutArtworkJTTable(
              tableRelation: foreignTableRelation),
    );
    return ___salesOrderMultiNutzenlayouts!;
  }

  _i7.ArtworkQuarantineDTOTable get artworkQuarantine {
    if (_artworkQuarantine != null) return _artworkQuarantine!;
    _artworkQuarantine = _i1.createRelationTable(
      relationFieldName: 'artworkQuarantine',
      field: ArtworkDTO.t.artworkQuarantineId,
      foreignField: _i7.ArtworkQuarantineDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i7.ArtworkQuarantineDTOTable(tableRelation: foreignTableRelation),
    );
    return _artworkQuarantine!;
  }

  _i8.ProductDTOTable get product {
    if (_product != null) return _product!;
    _product = _i1.createRelationTable(
      relationFieldName: 'product',
      field: ArtworkDTO.t.productId,
      foreignField: _i8.ProductDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i8.ProductDTOTable(tableRelation: foreignTableRelation),
    );
    return _product!;
  }

  _i1.ManyRelation<_i5.SalesOrderSingleNutzenlayoutArtworkJTTable>
      get salesOrderSingleNutzenlayouts {
    if (_salesOrderSingleNutzenlayouts != null)
      return _salesOrderSingleNutzenlayouts!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'salesOrderSingleNutzenlayouts',
      field: ArtworkDTO.t.id,
      foreignField: _i5.SalesOrderSingleNutzenlayoutArtworkJT.t.artworkId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.SalesOrderSingleNutzenlayoutArtworkJTTable(
              tableRelation: foreignTableRelation),
    );
    _salesOrderSingleNutzenlayouts =
        _i1.ManyRelation<_i5.SalesOrderSingleNutzenlayoutArtworkJTTable>(
      tableWithRelations: relationTable,
      table: _i5.SalesOrderSingleNutzenlayoutArtworkJTTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _salesOrderSingleNutzenlayouts!;
  }

  _i1.ManyRelation<_i6.SalesOrderMultiNutzenlayoutArtworkJTTable>
      get salesOrderMultiNutzenlayouts {
    if (_salesOrderMultiNutzenlayouts != null)
      return _salesOrderMultiNutzenlayouts!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'salesOrderMultiNutzenlayouts',
      field: ArtworkDTO.t.id,
      foreignField: _i6.SalesOrderMultiNutzenlayoutArtworkJT.t.artworkId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i6.SalesOrderMultiNutzenlayoutArtworkJTTable(
              tableRelation: foreignTableRelation),
    );
    _salesOrderMultiNutzenlayouts =
        _i1.ManyRelation<_i6.SalesOrderMultiNutzenlayoutArtworkJTTable>(
      tableWithRelations: relationTable,
      table: _i6.SalesOrderMultiNutzenlayoutArtworkJTTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _salesOrderMultiNutzenlayouts!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        description,
        customerId,
        artworkMasterId,
        salesOrderId,
        version,
        abzug,
        reference,
        isLocked,
        dieCutterType,
        layerId,
        artworkQuarantineId,
        artworkType,
        printProcessType,
        productId,
        codes,
        width,
        height,
        cornerRadius,
        trapping,
        layers,
        anschnitt,
        colors,
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
    if (relationField == 'artworkMaster') {
      return artworkMaster;
    }
    if (relationField == 'salesOrder') {
      return salesOrder;
    }
    if (relationField == 'salesOrderSingleNutzenlayouts') {
      return __salesOrderSingleNutzenlayouts;
    }
    if (relationField == 'salesOrderMultiNutzenlayouts') {
      return __salesOrderMultiNutzenlayouts;
    }
    if (relationField == 'artworkQuarantine') {
      return artworkQuarantine;
    }
    if (relationField == 'product') {
      return product;
    }
    return null;
  }
}

class ArtworkDTOInclude extends _i1.IncludeObject {
  ArtworkDTOInclude._({
    _i2.CustomerDTOInclude? customer,
    _i3.ArtworkMasterDTOInclude? artworkMaster,
    _i4.SalesOrderDTOInclude? salesOrder,
    _i5.SalesOrderSingleNutzenlayoutArtworkJTIncludeList?
        salesOrderSingleNutzenlayouts,
    _i6.SalesOrderMultiNutzenlayoutArtworkJTIncludeList?
        salesOrderMultiNutzenlayouts,
    _i7.ArtworkQuarantineDTOInclude? artworkQuarantine,
    _i8.ProductDTOInclude? product,
  }) {
    _customer = customer;
    _artworkMaster = artworkMaster;
    _salesOrder = salesOrder;
    _salesOrderSingleNutzenlayouts = salesOrderSingleNutzenlayouts;
    _salesOrderMultiNutzenlayouts = salesOrderMultiNutzenlayouts;
    _artworkQuarantine = artworkQuarantine;
    _product = product;
  }

  _i2.CustomerDTOInclude? _customer;

  _i3.ArtworkMasterDTOInclude? _artworkMaster;

  _i4.SalesOrderDTOInclude? _salesOrder;

  _i5.SalesOrderSingleNutzenlayoutArtworkJTIncludeList?
      _salesOrderSingleNutzenlayouts;

  _i6.SalesOrderMultiNutzenlayoutArtworkJTIncludeList?
      _salesOrderMultiNutzenlayouts;

  _i7.ArtworkQuarantineDTOInclude? _artworkQuarantine;

  _i8.ProductDTOInclude? _product;

  @override
  Map<String, _i1.Include?> get includes => {
        'customer': _customer,
        'artworkMaster': _artworkMaster,
        'salesOrder': _salesOrder,
        'salesOrderSingleNutzenlayouts': _salesOrderSingleNutzenlayouts,
        'salesOrderMultiNutzenlayouts': _salesOrderMultiNutzenlayouts,
        'artworkQuarantine': _artworkQuarantine,
        'product': _product,
      };

  @override
  _i1.Table<int?> get table => ArtworkDTO.t;
}

class ArtworkDTOIncludeList extends _i1.IncludeList {
  ArtworkDTOIncludeList._({
    _i1.WhereExpressionBuilder<ArtworkDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ArtworkDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ArtworkDTO.t;
}

class ArtworkDTORepository {
  const ArtworkDTORepository._();

  final attach = const ArtworkDTOAttachRepository._();

  final attachRow = const ArtworkDTOAttachRowRepository._();

  final detach = const ArtworkDTODetachRepository._();

  final detachRow = const ArtworkDTODetachRowRepository._();

  /// Returns a list of [ArtworkDTO]s matching the given query parameters.
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
  Future<List<ArtworkDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArtworkDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkDTOTable>? orderByList,
    _i1.Transaction? transaction,
    ArtworkDTOInclude? include,
  }) async {
    return session.db.find<ArtworkDTO>(
      where: where?.call(ArtworkDTO.t),
      orderBy: orderBy?.call(ArtworkDTO.t),
      orderByList: orderByList?.call(ArtworkDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [ArtworkDTO] matching the given query parameters.
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
  Future<ArtworkDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<ArtworkDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkDTOTable>? orderByList,
    _i1.Transaction? transaction,
    ArtworkDTOInclude? include,
  }) async {
    return session.db.findFirstRow<ArtworkDTO>(
      where: where?.call(ArtworkDTO.t),
      orderBy: orderBy?.call(ArtworkDTO.t),
      orderByList: orderByList?.call(ArtworkDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [ArtworkDTO] by its [id] or null if no such row exists.
  Future<ArtworkDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ArtworkDTOInclude? include,
  }) async {
    return session.db.findById<ArtworkDTO>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [ArtworkDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [ArtworkDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ArtworkDTO>> insert(
    _i1.Session session,
    List<ArtworkDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ArtworkDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ArtworkDTO] and returns the inserted row.
  ///
  /// The returned [ArtworkDTO] will have its `id` field set.
  Future<ArtworkDTO> insertRow(
    _i1.Session session,
    ArtworkDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ArtworkDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ArtworkDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ArtworkDTO>> update(
    _i1.Session session,
    List<ArtworkDTO> rows, {
    _i1.ColumnSelections<ArtworkDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ArtworkDTO>(
      rows,
      columns: columns?.call(ArtworkDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ArtworkDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ArtworkDTO> updateRow(
    _i1.Session session,
    ArtworkDTO row, {
    _i1.ColumnSelections<ArtworkDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ArtworkDTO>(
      row,
      columns: columns?.call(ArtworkDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [ArtworkDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ArtworkDTO>> delete(
    _i1.Session session,
    List<ArtworkDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ArtworkDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ArtworkDTO].
  Future<ArtworkDTO> deleteRow(
    _i1.Session session,
    ArtworkDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ArtworkDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ArtworkDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ArtworkDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ArtworkDTO>(
      where: where(ArtworkDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ArtworkDTO>(
      where: where?.call(ArtworkDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ArtworkDTOAttachRepository {
  const ArtworkDTOAttachRepository._();

  /// Creates a relation between this [ArtworkDTO] and the given [SalesOrderSingleNutzenlayoutArtworkJT]s
  /// by setting each [SalesOrderSingleNutzenlayoutArtworkJT]'s foreign key `artworkId` to refer to this [ArtworkDTO].
  Future<void> salesOrderSingleNutzenlayouts(
    _i1.Session session,
    ArtworkDTO artworkDTO,
    List<_i5.SalesOrderSingleNutzenlayoutArtworkJT>
        salesOrderSingleNutzenlayoutArtworkJT, {
    _i1.Transaction? transaction,
  }) async {
    if (salesOrderSingleNutzenlayoutArtworkJT.any((e) => e.id == null)) {
      throw ArgumentError.notNull('salesOrderSingleNutzenlayoutArtworkJT.id');
    }
    if (artworkDTO.id == null) {
      throw ArgumentError.notNull('artworkDTO.id');
    }

    var $salesOrderSingleNutzenlayoutArtworkJT =
        salesOrderSingleNutzenlayoutArtworkJT
            .map((e) => e.copyWith(artworkId: artworkDTO.id))
            .toList();
    await session.db.update<_i5.SalesOrderSingleNutzenlayoutArtworkJT>(
      $salesOrderSingleNutzenlayoutArtworkJT,
      columns: [_i5.SalesOrderSingleNutzenlayoutArtworkJT.t.artworkId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [ArtworkDTO] and the given [SalesOrderMultiNutzenlayoutArtworkJT]s
  /// by setting each [SalesOrderMultiNutzenlayoutArtworkJT]'s foreign key `artworkId` to refer to this [ArtworkDTO].
  Future<void> salesOrderMultiNutzenlayouts(
    _i1.Session session,
    ArtworkDTO artworkDTO,
    List<_i6.SalesOrderMultiNutzenlayoutArtworkJT>
        salesOrderMultiNutzenlayoutArtworkJT, {
    _i1.Transaction? transaction,
  }) async {
    if (salesOrderMultiNutzenlayoutArtworkJT.any((e) => e.id == null)) {
      throw ArgumentError.notNull('salesOrderMultiNutzenlayoutArtworkJT.id');
    }
    if (artworkDTO.id == null) {
      throw ArgumentError.notNull('artworkDTO.id');
    }

    var $salesOrderMultiNutzenlayoutArtworkJT =
        salesOrderMultiNutzenlayoutArtworkJT
            .map((e) => e.copyWith(artworkId: artworkDTO.id))
            .toList();
    await session.db.update<_i6.SalesOrderMultiNutzenlayoutArtworkJT>(
      $salesOrderMultiNutzenlayoutArtworkJT,
      columns: [_i6.SalesOrderMultiNutzenlayoutArtworkJT.t.artworkId],
      transaction: transaction,
    );
  }
}

class ArtworkDTOAttachRowRepository {
  const ArtworkDTOAttachRowRepository._();

  /// Creates a relation between the given [ArtworkDTO] and [CustomerDTO]
  /// by setting the [ArtworkDTO]'s foreign key `customerId` to refer to the [CustomerDTO].
  Future<void> customer(
    _i1.Session session,
    ArtworkDTO artworkDTO,
    _i2.CustomerDTO customer, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkDTO.id == null) {
      throw ArgumentError.notNull('artworkDTO.id');
    }
    if (customer.id == null) {
      throw ArgumentError.notNull('customer.id');
    }

    var $artworkDTO = artworkDTO.copyWith(customerId: customer.id);
    await session.db.updateRow<ArtworkDTO>(
      $artworkDTO,
      columns: [ArtworkDTO.t.customerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [ArtworkDTO] and [ArtworkMasterDTO]
  /// by setting the [ArtworkDTO]'s foreign key `artworkMasterId` to refer to the [ArtworkMasterDTO].
  Future<void> artworkMaster(
    _i1.Session session,
    ArtworkDTO artworkDTO,
    _i3.ArtworkMasterDTO artworkMaster, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkDTO.id == null) {
      throw ArgumentError.notNull('artworkDTO.id');
    }
    if (artworkMaster.id == null) {
      throw ArgumentError.notNull('artworkMaster.id');
    }

    var $artworkDTO = artworkDTO.copyWith(artworkMasterId: artworkMaster.id);
    await session.db.updateRow<ArtworkDTO>(
      $artworkDTO,
      columns: [ArtworkDTO.t.artworkMasterId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [ArtworkDTO] and [SalesOrderDTO]
  /// by setting the [ArtworkDTO]'s foreign key `salesOrderId` to refer to the [SalesOrderDTO].
  Future<void> salesOrder(
    _i1.Session session,
    ArtworkDTO artworkDTO,
    _i4.SalesOrderDTO salesOrder, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkDTO.id == null) {
      throw ArgumentError.notNull('artworkDTO.id');
    }
    if (salesOrder.id == null) {
      throw ArgumentError.notNull('salesOrder.id');
    }

    var $artworkDTO = artworkDTO.copyWith(salesOrderId: salesOrder.id);
    await session.db.updateRow<ArtworkDTO>(
      $artworkDTO,
      columns: [ArtworkDTO.t.salesOrderId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [ArtworkDTO] and [ArtworkQuarantineDTO]
  /// by setting the [ArtworkDTO]'s foreign key `artworkQuarantineId` to refer to the [ArtworkQuarantineDTO].
  Future<void> artworkQuarantine(
    _i1.Session session,
    ArtworkDTO artworkDTO,
    _i7.ArtworkQuarantineDTO artworkQuarantine, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkDTO.id == null) {
      throw ArgumentError.notNull('artworkDTO.id');
    }
    if (artworkQuarantine.id == null) {
      throw ArgumentError.notNull('artworkQuarantine.id');
    }

    var $artworkDTO =
        artworkDTO.copyWith(artworkQuarantineId: artworkQuarantine.id);
    await session.db.updateRow<ArtworkDTO>(
      $artworkDTO,
      columns: [ArtworkDTO.t.artworkQuarantineId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [ArtworkDTO] and [ProductDTO]
  /// by setting the [ArtworkDTO]'s foreign key `productId` to refer to the [ProductDTO].
  Future<void> product(
    _i1.Session session,
    ArtworkDTO artworkDTO,
    _i8.ProductDTO product, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkDTO.id == null) {
      throw ArgumentError.notNull('artworkDTO.id');
    }
    if (product.id == null) {
      throw ArgumentError.notNull('product.id');
    }

    var $artworkDTO = artworkDTO.copyWith(productId: product.id);
    await session.db.updateRow<ArtworkDTO>(
      $artworkDTO,
      columns: [ArtworkDTO.t.productId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [ArtworkDTO] and the given [SalesOrderSingleNutzenlayoutArtworkJT]
  /// by setting the [SalesOrderSingleNutzenlayoutArtworkJT]'s foreign key `artworkId` to refer to this [ArtworkDTO].
  Future<void> salesOrderSingleNutzenlayouts(
    _i1.Session session,
    ArtworkDTO artworkDTO,
    _i5.SalesOrderSingleNutzenlayoutArtworkJT
        salesOrderSingleNutzenlayoutArtworkJT, {
    _i1.Transaction? transaction,
  }) async {
    if (salesOrderSingleNutzenlayoutArtworkJT.id == null) {
      throw ArgumentError.notNull('salesOrderSingleNutzenlayoutArtworkJT.id');
    }
    if (artworkDTO.id == null) {
      throw ArgumentError.notNull('artworkDTO.id');
    }

    var $salesOrderSingleNutzenlayoutArtworkJT =
        salesOrderSingleNutzenlayoutArtworkJT.copyWith(
            artworkId: artworkDTO.id);
    await session.db.updateRow<_i5.SalesOrderSingleNutzenlayoutArtworkJT>(
      $salesOrderSingleNutzenlayoutArtworkJT,
      columns: [_i5.SalesOrderSingleNutzenlayoutArtworkJT.t.artworkId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [ArtworkDTO] and the given [SalesOrderMultiNutzenlayoutArtworkJT]
  /// by setting the [SalesOrderMultiNutzenlayoutArtworkJT]'s foreign key `artworkId` to refer to this [ArtworkDTO].
  Future<void> salesOrderMultiNutzenlayouts(
    _i1.Session session,
    ArtworkDTO artworkDTO,
    _i6.SalesOrderMultiNutzenlayoutArtworkJT
        salesOrderMultiNutzenlayoutArtworkJT, {
    _i1.Transaction? transaction,
  }) async {
    if (salesOrderMultiNutzenlayoutArtworkJT.id == null) {
      throw ArgumentError.notNull('salesOrderMultiNutzenlayoutArtworkJT.id');
    }
    if (artworkDTO.id == null) {
      throw ArgumentError.notNull('artworkDTO.id');
    }

    var $salesOrderMultiNutzenlayoutArtworkJT =
        salesOrderMultiNutzenlayoutArtworkJT.copyWith(artworkId: artworkDTO.id);
    await session.db.updateRow<_i6.SalesOrderMultiNutzenlayoutArtworkJT>(
      $salesOrderMultiNutzenlayoutArtworkJT,
      columns: [_i6.SalesOrderMultiNutzenlayoutArtworkJT.t.artworkId],
      transaction: transaction,
    );
  }
}

class ArtworkDTODetachRepository {
  const ArtworkDTODetachRepository._();

  /// Detaches the relation between this [ArtworkDTO] and the given [SalesOrderSingleNutzenlayoutArtworkJT]
  /// by setting the [SalesOrderSingleNutzenlayoutArtworkJT]'s foreign key `artworkId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> salesOrderSingleNutzenlayouts(
    _i1.Session session,
    List<_i5.SalesOrderSingleNutzenlayoutArtworkJT>
        salesOrderSingleNutzenlayoutArtworkJT, {
    _i1.Transaction? transaction,
  }) async {
    if (salesOrderSingleNutzenlayoutArtworkJT.any((e) => e.id == null)) {
      throw ArgumentError.notNull('salesOrderSingleNutzenlayoutArtworkJT.id');
    }

    var $salesOrderSingleNutzenlayoutArtworkJT =
        salesOrderSingleNutzenlayoutArtworkJT
            .map((e) => e.copyWith(artworkId: null))
            .toList();
    await session.db.update<_i5.SalesOrderSingleNutzenlayoutArtworkJT>(
      $salesOrderSingleNutzenlayoutArtworkJT,
      columns: [_i5.SalesOrderSingleNutzenlayoutArtworkJT.t.artworkId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [ArtworkDTO] and the given [SalesOrderMultiNutzenlayoutArtworkJT]
  /// by setting the [SalesOrderMultiNutzenlayoutArtworkJT]'s foreign key `artworkId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> salesOrderMultiNutzenlayouts(
    _i1.Session session,
    List<_i6.SalesOrderMultiNutzenlayoutArtworkJT>
        salesOrderMultiNutzenlayoutArtworkJT, {
    _i1.Transaction? transaction,
  }) async {
    if (salesOrderMultiNutzenlayoutArtworkJT.any((e) => e.id == null)) {
      throw ArgumentError.notNull('salesOrderMultiNutzenlayoutArtworkJT.id');
    }

    var $salesOrderMultiNutzenlayoutArtworkJT =
        salesOrderMultiNutzenlayoutArtworkJT
            .map((e) => e.copyWith(artworkId: null))
            .toList();
    await session.db.update<_i6.SalesOrderMultiNutzenlayoutArtworkJT>(
      $salesOrderMultiNutzenlayoutArtworkJT,
      columns: [_i6.SalesOrderMultiNutzenlayoutArtworkJT.t.artworkId],
      transaction: transaction,
    );
  }
}

class ArtworkDTODetachRowRepository {
  const ArtworkDTODetachRowRepository._();

  /// Detaches the relation between this [ArtworkDTO] and the [ArtworkQuarantineDTO] set in `artworkQuarantine`
  /// by setting the [ArtworkDTO]'s foreign key `artworkQuarantineId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> artworkQuarantine(
    _i1.Session session,
    ArtworkDTO artworkdto, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkdto.id == null) {
      throw ArgumentError.notNull('artworkdto.id');
    }

    var $artworkdto = artworkdto.copyWith(artworkQuarantineId: null);
    await session.db.updateRow<ArtworkDTO>(
      $artworkdto,
      columns: [ArtworkDTO.t.artworkQuarantineId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [ArtworkDTO] and the [ProductDTO] set in `product`
  /// by setting the [ArtworkDTO]'s foreign key `productId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> product(
    _i1.Session session,
    ArtworkDTO artworkdto, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkdto.id == null) {
      throw ArgumentError.notNull('artworkdto.id');
    }

    var $artworkdto = artworkdto.copyWith(productId: null);
    await session.db.updateRow<ArtworkDTO>(
      $artworkdto,
      columns: [ArtworkDTO.t.productId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [ArtworkDTO] and the given [SalesOrderSingleNutzenlayoutArtworkJT]
  /// by setting the [SalesOrderSingleNutzenlayoutArtworkJT]'s foreign key `artworkId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> salesOrderSingleNutzenlayouts(
    _i1.Session session,
    _i5.SalesOrderSingleNutzenlayoutArtworkJT
        salesOrderSingleNutzenlayoutArtworkJT, {
    _i1.Transaction? transaction,
  }) async {
    if (salesOrderSingleNutzenlayoutArtworkJT.id == null) {
      throw ArgumentError.notNull('salesOrderSingleNutzenlayoutArtworkJT.id');
    }

    var $salesOrderSingleNutzenlayoutArtworkJT =
        salesOrderSingleNutzenlayoutArtworkJT.copyWith(artworkId: null);
    await session.db.updateRow<_i5.SalesOrderSingleNutzenlayoutArtworkJT>(
      $salesOrderSingleNutzenlayoutArtworkJT,
      columns: [_i5.SalesOrderSingleNutzenlayoutArtworkJT.t.artworkId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [ArtworkDTO] and the given [SalesOrderMultiNutzenlayoutArtworkJT]
  /// by setting the [SalesOrderMultiNutzenlayoutArtworkJT]'s foreign key `artworkId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> salesOrderMultiNutzenlayouts(
    _i1.Session session,
    _i6.SalesOrderMultiNutzenlayoutArtworkJT
        salesOrderMultiNutzenlayoutArtworkJT, {
    _i1.Transaction? transaction,
  }) async {
    if (salesOrderMultiNutzenlayoutArtworkJT.id == null) {
      throw ArgumentError.notNull('salesOrderMultiNutzenlayoutArtworkJT.id');
    }

    var $salesOrderMultiNutzenlayoutArtworkJT =
        salesOrderMultiNutzenlayoutArtworkJT.copyWith(artworkId: null);
    await session.db.updateRow<_i6.SalesOrderMultiNutzenlayoutArtworkJT>(
      $salesOrderMultiNutzenlayoutArtworkJT,
      columns: [_i6.SalesOrderMultiNutzenlayoutArtworkJT.t.artworkId],
      transaction: transaction,
    );
  }
}
