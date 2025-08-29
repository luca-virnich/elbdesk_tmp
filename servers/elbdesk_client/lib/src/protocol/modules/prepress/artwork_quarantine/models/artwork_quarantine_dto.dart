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
import '../../../../modules/prepress/artwork_quarantine_group/models/artwork_quarantine_group.dart'
    as _i2;
import '../../../../modules/crm/customer/models/customer.dart' as _i3;
import '../../../../modules/prepress/artwork/models/artwork.dart' as _i4;
import '../../../../modules/sales/sales_order/models/sales_order.dart' as _i5;
import '../../../../modules/prepress/artwork_quarantine/models/artwork_quaratine_analysis_data_dto.dart'
    as _i6;
import '../../../../modules/prepress/color/models/artwork_color.dart' as _i7;

abstract class ArtworkQuarantineDTO implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
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
