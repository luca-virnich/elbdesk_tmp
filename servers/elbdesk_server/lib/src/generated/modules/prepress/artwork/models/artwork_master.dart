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
import '../../../../modules/prepress/product/models/product_master.dart' as _i3;
import '../../../../modules/prepress/codes/models/artwork_code.dart' as _i4;
import '../../../../modules/prepress/trapping/models/trapping.dart' as _i5;
import '../../../../modules/prepress/layer/models/artwork_layer.dart' as _i6;
import '../../../../modules/prepress/color/models/artwork_color.dart' as _i7;

abstract class ArtworkMasterDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = ArtworkMasterDTOTable();

  static const db = ArtworkMasterDTORepository._();

  @override
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

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'description': description,
      'customerId': customerId,
      if (customer != null) 'customer': customer?.toJsonForProtocol(),
      'version': version,
      'reference': reference,
      'layerId': layerId,
      if (artworkQuarantineId != null)
        'artworkQuarantineId': artworkQuarantineId,
      if (productId != null) 'productId': productId,
      if (product != null) 'product': product?.toJsonForProtocol(),
      'codes': codes.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'artworkType': artworkType,
      'printProcessType': printProcessType,
      'width': width,
      'height': height,
      if (cornerRadius != null) 'cornerRadius': cornerRadius,
      if (dieCutterType != null) 'dieCutterType': dieCutterType,
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

  static ArtworkMasterDTOInclude include({
    _i2.CustomerDTOInclude? customer,
    _i3.ProductMasterDTOInclude? product,
  }) {
    return ArtworkMasterDTOInclude._(
      customer: customer,
      product: product,
    );
  }

  static ArtworkMasterDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<ArtworkMasterDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArtworkMasterDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkMasterDTOTable>? orderByList,
    ArtworkMasterDTOInclude? include,
  }) {
    return ArtworkMasterDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ArtworkMasterDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ArtworkMasterDTO.t),
      include: include,
    );
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

class ArtworkMasterDTOTable extends _i1.Table<int?> {
  ArtworkMasterDTOTable({super.tableRelation})
      : super(tableName: 'ed_prepress_artwork_master') {
    description = _i1.ColumnString(
      'description',
      this,
    );
    customerId = _i1.ColumnInt(
      'customerId',
      this,
    );
    version = _i1.ColumnInt(
      'version',
      this,
    );
    reference = _i1.ColumnString(
      'reference',
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
    productId = _i1.ColumnInt(
      'productId',
      this,
    );
    codes = _i1.ColumnSerializable(
      'codes',
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
    dieCutterType = _i1.ColumnString(
      'dieCutterType',
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

  late final _i1.ColumnInt version;

  late final _i1.ColumnString reference;

  late final _i1.ColumnInt layerId;

  late final _i1.ColumnInt artworkQuarantineId;

  late final _i1.ColumnInt productId;

  _i3.ProductMasterDTOTable? _product;

  late final _i1.ColumnSerializable codes;

  late final _i1.ColumnString artworkType;

  late final _i1.ColumnString printProcessType;

  late final _i1.ColumnDouble width;

  late final _i1.ColumnDouble height;

  late final _i1.ColumnDouble cornerRadius;

  late final _i1.ColumnString dieCutterType;

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
      field: ArtworkMasterDTO.t.customerId,
      foreignField: _i2.CustomerDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.CustomerDTOTable(tableRelation: foreignTableRelation),
    );
    return _customer!;
  }

  _i3.ProductMasterDTOTable get product {
    if (_product != null) return _product!;
    _product = _i1.createRelationTable(
      relationFieldName: 'product',
      field: ArtworkMasterDTO.t.productId,
      foreignField: _i3.ProductMasterDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.ProductMasterDTOTable(tableRelation: foreignTableRelation),
    );
    return _product!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        description,
        customerId,
        version,
        reference,
        layerId,
        artworkQuarantineId,
        productId,
        codes,
        artworkType,
        printProcessType,
        width,
        height,
        cornerRadius,
        dieCutterType,
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
    if (relationField == 'product') {
      return product;
    }
    return null;
  }
}

class ArtworkMasterDTOInclude extends _i1.IncludeObject {
  ArtworkMasterDTOInclude._({
    _i2.CustomerDTOInclude? customer,
    _i3.ProductMasterDTOInclude? product,
  }) {
    _customer = customer;
    _product = product;
  }

  _i2.CustomerDTOInclude? _customer;

  _i3.ProductMasterDTOInclude? _product;

  @override
  Map<String, _i1.Include?> get includes => {
        'customer': _customer,
        'product': _product,
      };

  @override
  _i1.Table<int?> get table => ArtworkMasterDTO.t;
}

class ArtworkMasterDTOIncludeList extends _i1.IncludeList {
  ArtworkMasterDTOIncludeList._({
    _i1.WhereExpressionBuilder<ArtworkMasterDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ArtworkMasterDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ArtworkMasterDTO.t;
}

class ArtworkMasterDTORepository {
  const ArtworkMasterDTORepository._();

  final attachRow = const ArtworkMasterDTOAttachRowRepository._();

  final detachRow = const ArtworkMasterDTODetachRowRepository._();

  /// Returns a list of [ArtworkMasterDTO]s matching the given query parameters.
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
  Future<List<ArtworkMasterDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkMasterDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArtworkMasterDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkMasterDTOTable>? orderByList,
    _i1.Transaction? transaction,
    ArtworkMasterDTOInclude? include,
  }) async {
    return session.db.find<ArtworkMasterDTO>(
      where: where?.call(ArtworkMasterDTO.t),
      orderBy: orderBy?.call(ArtworkMasterDTO.t),
      orderByList: orderByList?.call(ArtworkMasterDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [ArtworkMasterDTO] matching the given query parameters.
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
  Future<ArtworkMasterDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkMasterDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<ArtworkMasterDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkMasterDTOTable>? orderByList,
    _i1.Transaction? transaction,
    ArtworkMasterDTOInclude? include,
  }) async {
    return session.db.findFirstRow<ArtworkMasterDTO>(
      where: where?.call(ArtworkMasterDTO.t),
      orderBy: orderBy?.call(ArtworkMasterDTO.t),
      orderByList: orderByList?.call(ArtworkMasterDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [ArtworkMasterDTO] by its [id] or null if no such row exists.
  Future<ArtworkMasterDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ArtworkMasterDTOInclude? include,
  }) async {
    return session.db.findById<ArtworkMasterDTO>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [ArtworkMasterDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [ArtworkMasterDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ArtworkMasterDTO>> insert(
    _i1.Session session,
    List<ArtworkMasterDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ArtworkMasterDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ArtworkMasterDTO] and returns the inserted row.
  ///
  /// The returned [ArtworkMasterDTO] will have its `id` field set.
  Future<ArtworkMasterDTO> insertRow(
    _i1.Session session,
    ArtworkMasterDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ArtworkMasterDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ArtworkMasterDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ArtworkMasterDTO>> update(
    _i1.Session session,
    List<ArtworkMasterDTO> rows, {
    _i1.ColumnSelections<ArtworkMasterDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ArtworkMasterDTO>(
      rows,
      columns: columns?.call(ArtworkMasterDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ArtworkMasterDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ArtworkMasterDTO> updateRow(
    _i1.Session session,
    ArtworkMasterDTO row, {
    _i1.ColumnSelections<ArtworkMasterDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ArtworkMasterDTO>(
      row,
      columns: columns?.call(ArtworkMasterDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [ArtworkMasterDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ArtworkMasterDTO>> delete(
    _i1.Session session,
    List<ArtworkMasterDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ArtworkMasterDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ArtworkMasterDTO].
  Future<ArtworkMasterDTO> deleteRow(
    _i1.Session session,
    ArtworkMasterDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ArtworkMasterDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ArtworkMasterDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ArtworkMasterDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ArtworkMasterDTO>(
      where: where(ArtworkMasterDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkMasterDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ArtworkMasterDTO>(
      where: where?.call(ArtworkMasterDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ArtworkMasterDTOAttachRowRepository {
  const ArtworkMasterDTOAttachRowRepository._();

  /// Creates a relation between the given [ArtworkMasterDTO] and [CustomerDTO]
  /// by setting the [ArtworkMasterDTO]'s foreign key `customerId` to refer to the [CustomerDTO].
  Future<void> customer(
    _i1.Session session,
    ArtworkMasterDTO artworkMasterDTO,
    _i2.CustomerDTO customer, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkMasterDTO.id == null) {
      throw ArgumentError.notNull('artworkMasterDTO.id');
    }
    if (customer.id == null) {
      throw ArgumentError.notNull('customer.id');
    }

    var $artworkMasterDTO = artworkMasterDTO.copyWith(customerId: customer.id);
    await session.db.updateRow<ArtworkMasterDTO>(
      $artworkMasterDTO,
      columns: [ArtworkMasterDTO.t.customerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [ArtworkMasterDTO] and [ProductMasterDTO]
  /// by setting the [ArtworkMasterDTO]'s foreign key `productId` to refer to the [ProductMasterDTO].
  Future<void> product(
    _i1.Session session,
    ArtworkMasterDTO artworkMasterDTO,
    _i3.ProductMasterDTO product, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkMasterDTO.id == null) {
      throw ArgumentError.notNull('artworkMasterDTO.id');
    }
    if (product.id == null) {
      throw ArgumentError.notNull('product.id');
    }

    var $artworkMasterDTO = artworkMasterDTO.copyWith(productId: product.id);
    await session.db.updateRow<ArtworkMasterDTO>(
      $artworkMasterDTO,
      columns: [ArtworkMasterDTO.t.productId],
      transaction: transaction,
    );
  }
}

class ArtworkMasterDTODetachRowRepository {
  const ArtworkMasterDTODetachRowRepository._();

  /// Detaches the relation between this [ArtworkMasterDTO] and the [ProductMasterDTO] set in `product`
  /// by setting the [ArtworkMasterDTO]'s foreign key `productId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> product(
    _i1.Session session,
    ArtworkMasterDTO artworkmasterdto, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkmasterdto.id == null) {
      throw ArgumentError.notNull('artworkmasterdto.id');
    }

    var $artworkmasterdto = artworkmasterdto.copyWith(productId: null);
    await session.db.updateRow<ArtworkMasterDTO>(
      $artworkmasterdto,
      columns: [ArtworkMasterDTO.t.productId],
      transaction: transaction,
    );
  }
}
