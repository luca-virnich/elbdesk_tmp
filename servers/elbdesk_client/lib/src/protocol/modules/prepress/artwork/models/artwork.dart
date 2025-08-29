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

abstract class ArtworkDTO implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
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
