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
import '../../../../modules/prepress/product/models/product_master.dart' as _i3;
import '../../../../modules/prepress/codes/models/artwork_code.dart' as _i4;
import '../../../../modules/prepress/trapping/models/trapping.dart' as _i5;
import '../../../../modules/prepress/layer/models/artwork_layer.dart' as _i6;
import '../../../../modules/prepress/color/models/artwork_color.dart' as _i7;

abstract class ArtworkMasterDTO implements _i1.SerializableModel {
  ArtworkMasterDTO._({
    this.id,
    required this.description,
    required this.customerId,
    this.customer,
    required this.version,
    required this.reference,
    required this.layerId,
    this.artworkQuarantineId,
    this.productId,
    this.product,
    required this.codes,
    required this.artworkType,
    required this.printProcessType,
    required this.width,
    required this.height,
    this.cornerRadius,
    this.dieCutterType,
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

  factory ArtworkMasterDTO({
    int? id,
    required String description,
    required int customerId,
    _i2.CustomerDTO? customer,
    required int version,
    required String reference,
    required int layerId,
    int? artworkQuarantineId,
    int? productId,
    _i3.ProductMasterDTO? product,
    required List<_i4.ArtworkCodeDTO> codes,
    required String artworkType,
    required String printProcessType,
    required double width,
    required double height,
    double? cornerRadius,
    String? dieCutterType,
    required _i5.TrappingDTO trapping,
    required List<_i6.ArtworkLayerDTO> layers,
    required double anschnitt,
    required List<_i7.ArtworkColorDTO> colors,
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
  }) = _ArtworkMasterDTOImpl;

  factory ArtworkMasterDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return ArtworkMasterDTO(
      id: jsonSerialization['id'] as int?,
      description: jsonSerialization['description'] as String,
      customerId: jsonSerialization['customerId'] as int,
      customer: jsonSerialization['customer'] == null
          ? null
          : _i2.CustomerDTO.fromJson(
              (jsonSerialization['customer'] as Map<String, dynamic>)),
      version: jsonSerialization['version'] as int,
      reference: jsonSerialization['reference'] as String,
      layerId: jsonSerialization['layerId'] as int,
      artworkQuarantineId: jsonSerialization['artworkQuarantineId'] as int?,
      productId: jsonSerialization['productId'] as int?,
      product: jsonSerialization['product'] == null
          ? null
          : _i3.ProductMasterDTO.fromJson(
              (jsonSerialization['product'] as Map<String, dynamic>)),
      codes: (jsonSerialization['codes'] as List)
          .map((e) => _i4.ArtworkCodeDTO.fromJson((e as Map<String, dynamic>)))
          .toList(),
      artworkType: jsonSerialization['artworkType'] as String,
      printProcessType: jsonSerialization['printProcessType'] as String,
      width: (jsonSerialization['width'] as num).toDouble(),
      height: (jsonSerialization['height'] as num).toDouble(),
      cornerRadius: (jsonSerialization['cornerRadius'] as num?)?.toDouble(),
      dieCutterType: jsonSerialization['dieCutterType'] as String?,
      trapping: _i5.TrappingDTO.fromJson(
          (jsonSerialization['trapping'] as Map<String, dynamic>)),
      layers: (jsonSerialization['layers'] as List)
          .map((e) => _i6.ArtworkLayerDTO.fromJson((e as Map<String, dynamic>)))
          .toList(),
      anschnitt: (jsonSerialization['anschnitt'] as num).toDouble(),
      colors: (jsonSerialization['colors'] as List)
          .map((e) => _i7.ArtworkColorDTO.fromJson((e as Map<String, dynamic>)))
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

  int version;

  String reference;

  int layerId;

  int? artworkQuarantineId;

  int? productId;

  _i3.ProductMasterDTO? product;

  List<_i4.ArtworkCodeDTO> codes;

  String artworkType;

  String printProcessType;

  double width;

  double height;

  double? cornerRadius;

  String? dieCutterType;

  _i5.TrappingDTO trapping;

  List<_i6.ArtworkLayerDTO> layers;

  double anschnitt;

  List<_i7.ArtworkColorDTO> colors;

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

  /// Returns a shallow copy of this [ArtworkMasterDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ArtworkMasterDTO copyWith({
    int? id,
    String? description,
    int? customerId,
    _i2.CustomerDTO? customer,
    int? version,
    String? reference,
    int? layerId,
    int? artworkQuarantineId,
    int? productId,
    _i3.ProductMasterDTO? product,
    List<_i4.ArtworkCodeDTO>? codes,
    String? artworkType,
    String? printProcessType,
    double? width,
    double? height,
    double? cornerRadius,
    String? dieCutterType,
    _i5.TrappingDTO? trapping,
    List<_i6.ArtworkLayerDTO>? layers,
    double? anschnitt,
    List<_i7.ArtworkColorDTO>? colors,
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
      'version': version,
      'reference': reference,
      'layerId': layerId,
      if (artworkQuarantineId != null)
        'artworkQuarantineId': artworkQuarantineId,
      if (productId != null) 'productId': productId,
      if (product != null) 'product': product?.toJson(),
      'codes': codes.toJson(valueToJson: (v) => v.toJson()),
      'artworkType': artworkType,
      'printProcessType': printProcessType,
      'width': width,
      'height': height,
      if (cornerRadius != null) 'cornerRadius': cornerRadius,
      if (dieCutterType != null) 'dieCutterType': dieCutterType,
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

class _ArtworkMasterDTOImpl extends ArtworkMasterDTO {
  _ArtworkMasterDTOImpl({
    int? id,
    required String description,
    required int customerId,
    _i2.CustomerDTO? customer,
    required int version,
    required String reference,
    required int layerId,
    int? artworkQuarantineId,
    int? productId,
    _i3.ProductMasterDTO? product,
    required List<_i4.ArtworkCodeDTO> codes,
    required String artworkType,
    required String printProcessType,
    required double width,
    required double height,
    double? cornerRadius,
    String? dieCutterType,
    required _i5.TrappingDTO trapping,
    required List<_i6.ArtworkLayerDTO> layers,
    required double anschnitt,
    required List<_i7.ArtworkColorDTO> colors,
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
          version: version,
          reference: reference,
          layerId: layerId,
          artworkQuarantineId: artworkQuarantineId,
          productId: productId,
          product: product,
          codes: codes,
          artworkType: artworkType,
          printProcessType: printProcessType,
          width: width,
          height: height,
          cornerRadius: cornerRadius,
          dieCutterType: dieCutterType,
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

  /// Returns a shallow copy of this [ArtworkMasterDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ArtworkMasterDTO copyWith({
    Object? id = _Undefined,
    String? description,
    int? customerId,
    Object? customer = _Undefined,
    int? version,
    String? reference,
    int? layerId,
    Object? artworkQuarantineId = _Undefined,
    Object? productId = _Undefined,
    Object? product = _Undefined,
    List<_i4.ArtworkCodeDTO>? codes,
    String? artworkType,
    String? printProcessType,
    double? width,
    double? height,
    Object? cornerRadius = _Undefined,
    Object? dieCutterType = _Undefined,
    _i5.TrappingDTO? trapping,
    List<_i6.ArtworkLayerDTO>? layers,
    double? anschnitt,
    List<_i7.ArtworkColorDTO>? colors,
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
    return ArtworkMasterDTO(
      id: id is int? ? id : this.id,
      description: description ?? this.description,
      customerId: customerId ?? this.customerId,
      customer:
          customer is _i2.CustomerDTO? ? customer : this.customer?.copyWith(),
      version: version ?? this.version,
      reference: reference ?? this.reference,
      layerId: layerId ?? this.layerId,
      artworkQuarantineId: artworkQuarantineId is int?
          ? artworkQuarantineId
          : this.artworkQuarantineId,
      productId: productId is int? ? productId : this.productId,
      product:
          product is _i3.ProductMasterDTO? ? product : this.product?.copyWith(),
      codes: codes ?? this.codes.map((e0) => e0.copyWith()).toList(),
      artworkType: artworkType ?? this.artworkType,
      printProcessType: printProcessType ?? this.printProcessType,
      width: width ?? this.width,
      height: height ?? this.height,
      cornerRadius: cornerRadius is double? ? cornerRadius : this.cornerRadius,
      dieCutterType:
          dieCutterType is String? ? dieCutterType : this.dieCutterType,
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
