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
import '../../../../modules/prepress/artwork_quarantine_group/models/artwork_quarantine_group.dart'
    as _i2;
import '../../../../modules/crm/customer/models/customer.dart' as _i3;
import '../../../../modules/prepress/artwork/models/artwork.dart' as _i4;
import '../../../../modules/sales/sales_order/models/sales_order.dart' as _i5;
import '../../../../modules/prepress/artwork_quarantine/models/artwork_quaratine_analysis_data_dto.dart'
    as _i6;
import '../../../../modules/prepress/color/models/artwork_color.dart' as _i7;

abstract class ArtworkQuarantineDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ArtworkQuarantineDTO._({
    this.id,
    required this.groupId,
    this.group,
    required this.description,
    this.customerId,
    this.customer,
    this.artworkId,
    this.artwork,
    this.salesOrderId,
    this.salesOrder,
    required this.quarantineUuid,
    this.keywords,
    this.type,
    this.originalFilePath,
    required this.status,
    this.productType,
    this.printProcessType,
    this.width,
    this.height,
    this.cornerRadius,
    this.analysisData,
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

  factory ArtworkQuarantineDTO({
    int? id,
    required int groupId,
    _i2.ArtworkQuarantineGroupDTO? group,
    required String description,
    int? customerId,
    _i3.CustomerDTO? customer,
    int? artworkId,
    _i4.ArtworkDTO? artwork,
    int? salesOrderId,
    _i5.SalesOrderDTO? salesOrder,
    required String quarantineUuid,
    String? keywords,
    String? type,
    String? originalFilePath,
    required String status,
    String? productType,
    String? printProcessType,
    double? width,
    double? height,
    double? cornerRadius,
    _i6.ArtworkQuarantineAnalysisDataDTO? analysisData,
    List<_i7.ArtworkColorDTO>? colors,
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
  }) = _ArtworkQuarantineDTOImpl;

  factory ArtworkQuarantineDTO.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return ArtworkQuarantineDTO(
      id: jsonSerialization['id'] as int?,
      groupId: jsonSerialization['groupId'] as int,
      group: jsonSerialization['group'] == null
          ? null
          : _i2.ArtworkQuarantineGroupDTO.fromJson(
              (jsonSerialization['group'] as Map<String, dynamic>)),
      description: jsonSerialization['description'] as String,
      customerId: jsonSerialization['customerId'] as int?,
      customer: jsonSerialization['customer'] == null
          ? null
          : _i3.CustomerDTO.fromJson(
              (jsonSerialization['customer'] as Map<String, dynamic>)),
      artworkId: jsonSerialization['artworkId'] as int?,
      artwork: jsonSerialization['artwork'] == null
          ? null
          : _i4.ArtworkDTO.fromJson(
              (jsonSerialization['artwork'] as Map<String, dynamic>)),
      salesOrderId: jsonSerialization['salesOrderId'] as int?,
      salesOrder: jsonSerialization['salesOrder'] == null
          ? null
          : _i5.SalesOrderDTO.fromJson(
              (jsonSerialization['salesOrder'] as Map<String, dynamic>)),
      quarantineUuid: jsonSerialization['quarantineUuid'] as String,
      keywords: jsonSerialization['keywords'] as String?,
      type: jsonSerialization['type'] as String?,
      originalFilePath: jsonSerialization['originalFilePath'] as String?,
      status: jsonSerialization['status'] as String,
      productType: jsonSerialization['productType'] as String?,
      printProcessType: jsonSerialization['printProcessType'] as String?,
      width: (jsonSerialization['width'] as num?)?.toDouble(),
      height: (jsonSerialization['height'] as num?)?.toDouble(),
      cornerRadius: (jsonSerialization['cornerRadius'] as num?)?.toDouble(),
      analysisData: jsonSerialization['analysisData'] == null
          ? null
          : _i6.ArtworkQuarantineAnalysisDataDTO.fromJson(
              (jsonSerialization['analysisData'] as Map<String, dynamic>)),
      colors: (jsonSerialization['colors'] as List?)
          ?.map(
              (e) => _i7.ArtworkColorDTO.fromJson((e as Map<String, dynamic>)))
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

  static final t = ArtworkQuarantineDTOTable();

  static const db = ArtworkQuarantineDTORepository._();

  @override
  int? id;

  int groupId;

  _i2.ArtworkQuarantineGroupDTO? group;

  String description;

  int? customerId;

  _i3.CustomerDTO? customer;

  int? artworkId;

  _i4.ArtworkDTO? artwork;

  int? salesOrderId;

  _i5.SalesOrderDTO? salesOrder;

  String quarantineUuid;

  String? keywords;

  String? type;

  String? originalFilePath;

  String status;

  String? productType;

  String? printProcessType;

  double? width;

  double? height;

  double? cornerRadius;

  _i6.ArtworkQuarantineAnalysisDataDTO? analysisData;

  List<_i7.ArtworkColorDTO>? colors;

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

  /// Returns a shallow copy of this [ArtworkQuarantineDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ArtworkQuarantineDTO copyWith({
    int? id,
    int? groupId,
    _i2.ArtworkQuarantineGroupDTO? group,
    String? description,
    int? customerId,
    _i3.CustomerDTO? customer,
    int? artworkId,
    _i4.ArtworkDTO? artwork,
    int? salesOrderId,
    _i5.SalesOrderDTO? salesOrder,
    String? quarantineUuid,
    String? keywords,
    String? type,
    String? originalFilePath,
    String? status,
    String? productType,
    String? printProcessType,
    double? width,
    double? height,
    double? cornerRadius,
    _i6.ArtworkQuarantineAnalysisDataDTO? analysisData,
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
      'groupId': groupId,
      if (group != null) 'group': group?.toJson(),
      'description': description,
      if (customerId != null) 'customerId': customerId,
      if (customer != null) 'customer': customer?.toJson(),
      if (artworkId != null) 'artworkId': artworkId,
      if (artwork != null) 'artwork': artwork?.toJson(),
      if (salesOrderId != null) 'salesOrderId': salesOrderId,
      if (salesOrder != null) 'salesOrder': salesOrder?.toJson(),
      'quarantineUuid': quarantineUuid,
      if (keywords != null) 'keywords': keywords,
      if (type != null) 'type': type,
      if (originalFilePath != null) 'originalFilePath': originalFilePath,
      'status': status,
      if (productType != null) 'productType': productType,
      if (printProcessType != null) 'printProcessType': printProcessType,
      if (width != null) 'width': width,
      if (height != null) 'height': height,
      if (cornerRadius != null) 'cornerRadius': cornerRadius,
      if (analysisData != null) 'analysisData': analysisData?.toJson(),
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
      'groupId': groupId,
      if (group != null) 'group': group?.toJsonForProtocol(),
      'description': description,
      if (customerId != null) 'customerId': customerId,
      if (customer != null) 'customer': customer?.toJsonForProtocol(),
      if (artworkId != null) 'artworkId': artworkId,
      if (artwork != null) 'artwork': artwork?.toJsonForProtocol(),
      if (salesOrderId != null) 'salesOrderId': salesOrderId,
      if (salesOrder != null) 'salesOrder': salesOrder?.toJsonForProtocol(),
      'quarantineUuid': quarantineUuid,
      if (keywords != null) 'keywords': keywords,
      if (type != null) 'type': type,
      if (originalFilePath != null) 'originalFilePath': originalFilePath,
      'status': status,
      if (productType != null) 'productType': productType,
      if (printProcessType != null) 'printProcessType': printProcessType,
      if (width != null) 'width': width,
      if (height != null) 'height': height,
      if (cornerRadius != null) 'cornerRadius': cornerRadius,
      if (analysisData != null)
        'analysisData': analysisData?.toJsonForProtocol(),
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

  static ArtworkQuarantineDTOInclude include({
    _i2.ArtworkQuarantineGroupDTOInclude? group,
    _i3.CustomerDTOInclude? customer,
    _i4.ArtworkDTOInclude? artwork,
    _i5.SalesOrderDTOInclude? salesOrder,
  }) {
    return ArtworkQuarantineDTOInclude._(
      group: group,
      customer: customer,
      artwork: artwork,
      salesOrder: salesOrder,
    );
  }

  static ArtworkQuarantineDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<ArtworkQuarantineDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArtworkQuarantineDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkQuarantineDTOTable>? orderByList,
    ArtworkQuarantineDTOInclude? include,
  }) {
    return ArtworkQuarantineDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ArtworkQuarantineDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ArtworkQuarantineDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ArtworkQuarantineDTOImpl extends ArtworkQuarantineDTO {
  _ArtworkQuarantineDTOImpl({
    int? id,
    required int groupId,
    _i2.ArtworkQuarantineGroupDTO? group,
    required String description,
    int? customerId,
    _i3.CustomerDTO? customer,
    int? artworkId,
    _i4.ArtworkDTO? artwork,
    int? salesOrderId,
    _i5.SalesOrderDTO? salesOrder,
    required String quarantineUuid,
    String? keywords,
    String? type,
    String? originalFilePath,
    required String status,
    String? productType,
    String? printProcessType,
    double? width,
    double? height,
    double? cornerRadius,
    _i6.ArtworkQuarantineAnalysisDataDTO? analysisData,
    List<_i7.ArtworkColorDTO>? colors,
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
          groupId: groupId,
          group: group,
          description: description,
          customerId: customerId,
          customer: customer,
          artworkId: artworkId,
          artwork: artwork,
          salesOrderId: salesOrderId,
          salesOrder: salesOrder,
          quarantineUuid: quarantineUuid,
          keywords: keywords,
          type: type,
          originalFilePath: originalFilePath,
          status: status,
          productType: productType,
          printProcessType: printProcessType,
          width: width,
          height: height,
          cornerRadius: cornerRadius,
          analysisData: analysisData,
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

  /// Returns a shallow copy of this [ArtworkQuarantineDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ArtworkQuarantineDTO copyWith({
    Object? id = _Undefined,
    int? groupId,
    Object? group = _Undefined,
    String? description,
    Object? customerId = _Undefined,
    Object? customer = _Undefined,
    Object? artworkId = _Undefined,
    Object? artwork = _Undefined,
    Object? salesOrderId = _Undefined,
    Object? salesOrder = _Undefined,
    String? quarantineUuid,
    Object? keywords = _Undefined,
    Object? type = _Undefined,
    Object? originalFilePath = _Undefined,
    String? status,
    Object? productType = _Undefined,
    Object? printProcessType = _Undefined,
    Object? width = _Undefined,
    Object? height = _Undefined,
    Object? cornerRadius = _Undefined,
    Object? analysisData = _Undefined,
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
    return ArtworkQuarantineDTO(
      id: id is int? ? id : this.id,
      groupId: groupId ?? this.groupId,
      group: group is _i2.ArtworkQuarantineGroupDTO?
          ? group
          : this.group?.copyWith(),
      description: description ?? this.description,
      customerId: customerId is int? ? customerId : this.customerId,
      customer:
          customer is _i3.CustomerDTO? ? customer : this.customer?.copyWith(),
      artworkId: artworkId is int? ? artworkId : this.artworkId,
      artwork: artwork is _i4.ArtworkDTO? ? artwork : this.artwork?.copyWith(),
      salesOrderId: salesOrderId is int? ? salesOrderId : this.salesOrderId,
      salesOrder: salesOrder is _i5.SalesOrderDTO?
          ? salesOrder
          : this.salesOrder?.copyWith(),
      quarantineUuid: quarantineUuid ?? this.quarantineUuid,
      keywords: keywords is String? ? keywords : this.keywords,
      type: type is String? ? type : this.type,
      originalFilePath: originalFilePath is String?
          ? originalFilePath
          : this.originalFilePath,
      status: status ?? this.status,
      productType: productType is String? ? productType : this.productType,
      printProcessType: printProcessType is String?
          ? printProcessType
          : this.printProcessType,
      width: width is double? ? width : this.width,
      height: height is double? ? height : this.height,
      cornerRadius: cornerRadius is double? ? cornerRadius : this.cornerRadius,
      analysisData: analysisData is _i6.ArtworkQuarantineAnalysisDataDTO?
          ? analysisData
          : this.analysisData?.copyWith(),
      colors: colors is List<_i7.ArtworkColorDTO>?
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

class ArtworkQuarantineDTOTable extends _i1.Table<int?> {
  ArtworkQuarantineDTOTable({super.tableRelation})
      : super(tableName: 'ed_prepress_artwork_quarantine') {
    groupId = _i1.ColumnInt(
      'groupId',
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
    artworkId = _i1.ColumnInt(
      'artworkId',
      this,
    );
    salesOrderId = _i1.ColumnInt(
      'salesOrderId',
      this,
    );
    quarantineUuid = _i1.ColumnString(
      'quarantineUuid',
      this,
    );
    keywords = _i1.ColumnString(
      'keywords',
      this,
    );
    type = _i1.ColumnString(
      'type',
      this,
    );
    originalFilePath = _i1.ColumnString(
      'originalFilePath',
      this,
    );
    status = _i1.ColumnString(
      'status',
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
    analysisData = _i1.ColumnSerializable(
      'analysisData',
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

  late final _i1.ColumnInt groupId;

  _i2.ArtworkQuarantineGroupDTOTable? _group;

  late final _i1.ColumnString description;

  late final _i1.ColumnInt customerId;

  _i3.CustomerDTOTable? _customer;

  late final _i1.ColumnInt artworkId;

  _i4.ArtworkDTOTable? _artwork;

  late final _i1.ColumnInt salesOrderId;

  _i5.SalesOrderDTOTable? _salesOrder;

  late final _i1.ColumnString quarantineUuid;

  late final _i1.ColumnString keywords;

  late final _i1.ColumnString type;

  late final _i1.ColumnString originalFilePath;

  late final _i1.ColumnString status;

  late final _i1.ColumnString productType;

  late final _i1.ColumnString printProcessType;

  late final _i1.ColumnDouble width;

  late final _i1.ColumnDouble height;

  late final _i1.ColumnDouble cornerRadius;

  late final _i1.ColumnSerializable analysisData;

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

  _i2.ArtworkQuarantineGroupDTOTable get group {
    if (_group != null) return _group!;
    _group = _i1.createRelationTable(
      relationFieldName: 'group',
      field: ArtworkQuarantineDTO.t.groupId,
      foreignField: _i2.ArtworkQuarantineGroupDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) => _i2.ArtworkQuarantineGroupDTOTable(
          tableRelation: foreignTableRelation),
    );
    return _group!;
  }

  _i3.CustomerDTOTable get customer {
    if (_customer != null) return _customer!;
    _customer = _i1.createRelationTable(
      relationFieldName: 'customer',
      field: ArtworkQuarantineDTO.t.customerId,
      foreignField: _i3.CustomerDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.CustomerDTOTable(tableRelation: foreignTableRelation),
    );
    return _customer!;
  }

  _i4.ArtworkDTOTable get artwork {
    if (_artwork != null) return _artwork!;
    _artwork = _i1.createRelationTable(
      relationFieldName: 'artwork',
      field: ArtworkQuarantineDTO.t.artworkId,
      foreignField: _i4.ArtworkDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.ArtworkDTOTable(tableRelation: foreignTableRelation),
    );
    return _artwork!;
  }

  _i5.SalesOrderDTOTable get salesOrder {
    if (_salesOrder != null) return _salesOrder!;
    _salesOrder = _i1.createRelationTable(
      relationFieldName: 'salesOrder',
      field: ArtworkQuarantineDTO.t.salesOrderId,
      foreignField: _i5.SalesOrderDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.SalesOrderDTOTable(tableRelation: foreignTableRelation),
    );
    return _salesOrder!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        groupId,
        description,
        customerId,
        artworkId,
        salesOrderId,
        quarantineUuid,
        keywords,
        type,
        originalFilePath,
        status,
        productType,
        printProcessType,
        width,
        height,
        cornerRadius,
        analysisData,
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
    if (relationField == 'group') {
      return group;
    }
    if (relationField == 'customer') {
      return customer;
    }
    if (relationField == 'artwork') {
      return artwork;
    }
    if (relationField == 'salesOrder') {
      return salesOrder;
    }
    return null;
  }
}

class ArtworkQuarantineDTOInclude extends _i1.IncludeObject {
  ArtworkQuarantineDTOInclude._({
    _i2.ArtworkQuarantineGroupDTOInclude? group,
    _i3.CustomerDTOInclude? customer,
    _i4.ArtworkDTOInclude? artwork,
    _i5.SalesOrderDTOInclude? salesOrder,
  }) {
    _group = group;
    _customer = customer;
    _artwork = artwork;
    _salesOrder = salesOrder;
  }

  _i2.ArtworkQuarantineGroupDTOInclude? _group;

  _i3.CustomerDTOInclude? _customer;

  _i4.ArtworkDTOInclude? _artwork;

  _i5.SalesOrderDTOInclude? _salesOrder;

  @override
  Map<String, _i1.Include?> get includes => {
        'group': _group,
        'customer': _customer,
        'artwork': _artwork,
        'salesOrder': _salesOrder,
      };

  @override
  _i1.Table<int?> get table => ArtworkQuarantineDTO.t;
}

class ArtworkQuarantineDTOIncludeList extends _i1.IncludeList {
  ArtworkQuarantineDTOIncludeList._({
    _i1.WhereExpressionBuilder<ArtworkQuarantineDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ArtworkQuarantineDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ArtworkQuarantineDTO.t;
}

class ArtworkQuarantineDTORepository {
  const ArtworkQuarantineDTORepository._();

  final attachRow = const ArtworkQuarantineDTOAttachRowRepository._();

  final detachRow = const ArtworkQuarantineDTODetachRowRepository._();

  /// Returns a list of [ArtworkQuarantineDTO]s matching the given query parameters.
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
  Future<List<ArtworkQuarantineDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkQuarantineDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArtworkQuarantineDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkQuarantineDTOTable>? orderByList,
    _i1.Transaction? transaction,
    ArtworkQuarantineDTOInclude? include,
  }) async {
    return session.db.find<ArtworkQuarantineDTO>(
      where: where?.call(ArtworkQuarantineDTO.t),
      orderBy: orderBy?.call(ArtworkQuarantineDTO.t),
      orderByList: orderByList?.call(ArtworkQuarantineDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [ArtworkQuarantineDTO] matching the given query parameters.
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
  Future<ArtworkQuarantineDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkQuarantineDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<ArtworkQuarantineDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkQuarantineDTOTable>? orderByList,
    _i1.Transaction? transaction,
    ArtworkQuarantineDTOInclude? include,
  }) async {
    return session.db.findFirstRow<ArtworkQuarantineDTO>(
      where: where?.call(ArtworkQuarantineDTO.t),
      orderBy: orderBy?.call(ArtworkQuarantineDTO.t),
      orderByList: orderByList?.call(ArtworkQuarantineDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [ArtworkQuarantineDTO] by its [id] or null if no such row exists.
  Future<ArtworkQuarantineDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ArtworkQuarantineDTOInclude? include,
  }) async {
    return session.db.findById<ArtworkQuarantineDTO>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [ArtworkQuarantineDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [ArtworkQuarantineDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ArtworkQuarantineDTO>> insert(
    _i1.Session session,
    List<ArtworkQuarantineDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ArtworkQuarantineDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ArtworkQuarantineDTO] and returns the inserted row.
  ///
  /// The returned [ArtworkQuarantineDTO] will have its `id` field set.
  Future<ArtworkQuarantineDTO> insertRow(
    _i1.Session session,
    ArtworkQuarantineDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ArtworkQuarantineDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ArtworkQuarantineDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ArtworkQuarantineDTO>> update(
    _i1.Session session,
    List<ArtworkQuarantineDTO> rows, {
    _i1.ColumnSelections<ArtworkQuarantineDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ArtworkQuarantineDTO>(
      rows,
      columns: columns?.call(ArtworkQuarantineDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ArtworkQuarantineDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ArtworkQuarantineDTO> updateRow(
    _i1.Session session,
    ArtworkQuarantineDTO row, {
    _i1.ColumnSelections<ArtworkQuarantineDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ArtworkQuarantineDTO>(
      row,
      columns: columns?.call(ArtworkQuarantineDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [ArtworkQuarantineDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ArtworkQuarantineDTO>> delete(
    _i1.Session session,
    List<ArtworkQuarantineDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ArtworkQuarantineDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ArtworkQuarantineDTO].
  Future<ArtworkQuarantineDTO> deleteRow(
    _i1.Session session,
    ArtworkQuarantineDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ArtworkQuarantineDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ArtworkQuarantineDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ArtworkQuarantineDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ArtworkQuarantineDTO>(
      where: where(ArtworkQuarantineDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkQuarantineDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ArtworkQuarantineDTO>(
      where: where?.call(ArtworkQuarantineDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ArtworkQuarantineDTOAttachRowRepository {
  const ArtworkQuarantineDTOAttachRowRepository._();

  /// Creates a relation between the given [ArtworkQuarantineDTO] and [ArtworkQuarantineGroupDTO]
  /// by setting the [ArtworkQuarantineDTO]'s foreign key `groupId` to refer to the [ArtworkQuarantineGroupDTO].
  Future<void> group(
    _i1.Session session,
    ArtworkQuarantineDTO artworkQuarantineDTO,
    _i2.ArtworkQuarantineGroupDTO group, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkQuarantineDTO.id == null) {
      throw ArgumentError.notNull('artworkQuarantineDTO.id');
    }
    if (group.id == null) {
      throw ArgumentError.notNull('group.id');
    }

    var $artworkQuarantineDTO =
        artworkQuarantineDTO.copyWith(groupId: group.id);
    await session.db.updateRow<ArtworkQuarantineDTO>(
      $artworkQuarantineDTO,
      columns: [ArtworkQuarantineDTO.t.groupId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [ArtworkQuarantineDTO] and [CustomerDTO]
  /// by setting the [ArtworkQuarantineDTO]'s foreign key `customerId` to refer to the [CustomerDTO].
  Future<void> customer(
    _i1.Session session,
    ArtworkQuarantineDTO artworkQuarantineDTO,
    _i3.CustomerDTO customer, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkQuarantineDTO.id == null) {
      throw ArgumentError.notNull('artworkQuarantineDTO.id');
    }
    if (customer.id == null) {
      throw ArgumentError.notNull('customer.id');
    }

    var $artworkQuarantineDTO =
        artworkQuarantineDTO.copyWith(customerId: customer.id);
    await session.db.updateRow<ArtworkQuarantineDTO>(
      $artworkQuarantineDTO,
      columns: [ArtworkQuarantineDTO.t.customerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [ArtworkQuarantineDTO] and [ArtworkDTO]
  /// by setting the [ArtworkQuarantineDTO]'s foreign key `artworkId` to refer to the [ArtworkDTO].
  Future<void> artwork(
    _i1.Session session,
    ArtworkQuarantineDTO artworkQuarantineDTO,
    _i4.ArtworkDTO artwork, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkQuarantineDTO.id == null) {
      throw ArgumentError.notNull('artworkQuarantineDTO.id');
    }
    if (artwork.id == null) {
      throw ArgumentError.notNull('artwork.id');
    }

    var $artworkQuarantineDTO =
        artworkQuarantineDTO.copyWith(artworkId: artwork.id);
    await session.db.updateRow<ArtworkQuarantineDTO>(
      $artworkQuarantineDTO,
      columns: [ArtworkQuarantineDTO.t.artworkId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [ArtworkQuarantineDTO] and [SalesOrderDTO]
  /// by setting the [ArtworkQuarantineDTO]'s foreign key `salesOrderId` to refer to the [SalesOrderDTO].
  Future<void> salesOrder(
    _i1.Session session,
    ArtworkQuarantineDTO artworkQuarantineDTO,
    _i5.SalesOrderDTO salesOrder, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkQuarantineDTO.id == null) {
      throw ArgumentError.notNull('artworkQuarantineDTO.id');
    }
    if (salesOrder.id == null) {
      throw ArgumentError.notNull('salesOrder.id');
    }

    var $artworkQuarantineDTO =
        artworkQuarantineDTO.copyWith(salesOrderId: salesOrder.id);
    await session.db.updateRow<ArtworkQuarantineDTO>(
      $artworkQuarantineDTO,
      columns: [ArtworkQuarantineDTO.t.salesOrderId],
      transaction: transaction,
    );
  }
}

class ArtworkQuarantineDTODetachRowRepository {
  const ArtworkQuarantineDTODetachRowRepository._();

  /// Detaches the relation between this [ArtworkQuarantineDTO] and the [CustomerDTO] set in `customer`
  /// by setting the [ArtworkQuarantineDTO]'s foreign key `customerId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> customer(
    _i1.Session session,
    ArtworkQuarantineDTO artworkquarantinedto, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkquarantinedto.id == null) {
      throw ArgumentError.notNull('artworkquarantinedto.id');
    }

    var $artworkquarantinedto = artworkquarantinedto.copyWith(customerId: null);
    await session.db.updateRow<ArtworkQuarantineDTO>(
      $artworkquarantinedto,
      columns: [ArtworkQuarantineDTO.t.customerId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [ArtworkQuarantineDTO] and the [ArtworkDTO] set in `artwork`
  /// by setting the [ArtworkQuarantineDTO]'s foreign key `artworkId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> artwork(
    _i1.Session session,
    ArtworkQuarantineDTO artworkquarantinedto, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkquarantinedto.id == null) {
      throw ArgumentError.notNull('artworkquarantinedto.id');
    }

    var $artworkquarantinedto = artworkquarantinedto.copyWith(artworkId: null);
    await session.db.updateRow<ArtworkQuarantineDTO>(
      $artworkquarantinedto,
      columns: [ArtworkQuarantineDTO.t.artworkId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [ArtworkQuarantineDTO] and the [SalesOrderDTO] set in `salesOrder`
  /// by setting the [ArtworkQuarantineDTO]'s foreign key `salesOrderId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> salesOrder(
    _i1.Session session,
    ArtworkQuarantineDTO artworkquarantinedto, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkquarantinedto.id == null) {
      throw ArgumentError.notNull('artworkquarantinedto.id');
    }

    var $artworkquarantinedto =
        artworkquarantinedto.copyWith(salesOrderId: null);
    await session.db.updateRow<ArtworkQuarantineDTO>(
      $artworkquarantinedto,
      columns: [ArtworkQuarantineDTO.t.salesOrderId],
      transaction: transaction,
    );
  }
}
