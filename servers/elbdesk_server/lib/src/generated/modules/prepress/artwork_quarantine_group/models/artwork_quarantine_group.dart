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
import '../../../../modules/prepress/artwork_quarantine_group/models/system_file.dart'
    as _i3;
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart'
    as _i4;
import '../../../../modules/prepress/artwork_quarantine/models/artwork_quarantine_dto.dart'
    as _i5;

abstract class ArtworkQuarantineGroupDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ArtworkQuarantineGroupDTO._({
    this.id,
    this.customerId,
    this.customer,
    this.status,
    this.artworkType,
    this.type,
    this.productType,
    this.printProcessType,
    this.width,
    this.height,
    this.cornerRadius,
    required this.description,
    this.selectedProductSeriesId,
    this.outputPath,
    this.attachments,
    this.assignedUserId,
    this.assignedUser,
    this.artworkQuarantines,
    this.sendToAeAt,
    this.sendToAeBy,
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

  factory ArtworkQuarantineGroupDTO({
    int? id,
    int? customerId,
    _i2.CustomerDTO? customer,
    String? status,
    String? artworkType,
    String? type,
    String? productType,
    String? printProcessType,
    double? width,
    double? height,
    double? cornerRadius,
    required String description,
    int? selectedProductSeriesId,
    String? outputPath,
    List<_i3.SystemFileDTO>? attachments,
    int? assignedUserId,
    _i4.LightUserDTO? assignedUser,
    List<_i5.ArtworkQuarantineDTO>? artworkQuarantines,
    DateTime? sendToAeAt,
    int? sendToAeBy,
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
  }) = _ArtworkQuarantineGroupDTOImpl;

  factory ArtworkQuarantineGroupDTO.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return ArtworkQuarantineGroupDTO(
      id: jsonSerialization['id'] as int?,
      customerId: jsonSerialization['customerId'] as int?,
      customer: jsonSerialization['customer'] == null
          ? null
          : _i2.CustomerDTO.fromJson(
              (jsonSerialization['customer'] as Map<String, dynamic>)),
      status: jsonSerialization['status'] as String?,
      artworkType: jsonSerialization['artworkType'] as String?,
      type: jsonSerialization['type'] as String?,
      productType: jsonSerialization['productType'] as String?,
      printProcessType: jsonSerialization['printProcessType'] as String?,
      width: (jsonSerialization['width'] as num?)?.toDouble(),
      height: (jsonSerialization['height'] as num?)?.toDouble(),
      cornerRadius: (jsonSerialization['cornerRadius'] as num?)?.toDouble(),
      description: jsonSerialization['description'] as String,
      selectedProductSeriesId:
          jsonSerialization['selectedProductSeriesId'] as int?,
      outputPath: jsonSerialization['outputPath'] as String?,
      attachments: (jsonSerialization['attachments'] as List?)
          ?.map((e) => _i3.SystemFileDTO.fromJson((e as Map<String, dynamic>)))
          .toList(),
      assignedUserId: jsonSerialization['assignedUserId'] as int?,
      assignedUser: jsonSerialization['assignedUser'] == null
          ? null
          : _i4.LightUserDTO.fromJson(
              (jsonSerialization['assignedUser'] as Map<String, dynamic>)),
      artworkQuarantines: (jsonSerialization['artworkQuarantines'] as List?)
          ?.map((e) =>
              _i5.ArtworkQuarantineDTO.fromJson((e as Map<String, dynamic>)))
          .toList(),
      sendToAeAt: jsonSerialization['sendToAeAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['sendToAeAt']),
      sendToAeBy: jsonSerialization['sendToAeBy'] as int?,
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

  static final t = ArtworkQuarantineGroupDTOTable();

  static const db = ArtworkQuarantineGroupDTORepository._();

  @override
  int? id;

  int? customerId;

  _i2.CustomerDTO? customer;

  String? status;

  String? artworkType;

  String? type;

  String? productType;

  String? printProcessType;

  double? width;

  double? height;

  double? cornerRadius;

  String description;

  int? selectedProductSeriesId;

  String? outputPath;

  List<_i3.SystemFileDTO>? attachments;

  int? assignedUserId;

  _i4.LightUserDTO? assignedUser;

  List<_i5.ArtworkQuarantineDTO>? artworkQuarantines;

  DateTime? sendToAeAt;

  int? sendToAeBy;

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

  /// Returns a shallow copy of this [ArtworkQuarantineGroupDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ArtworkQuarantineGroupDTO copyWith({
    int? id,
    int? customerId,
    _i2.CustomerDTO? customer,
    String? status,
    String? artworkType,
    String? type,
    String? productType,
    String? printProcessType,
    double? width,
    double? height,
    double? cornerRadius,
    String? description,
    int? selectedProductSeriesId,
    String? outputPath,
    List<_i3.SystemFileDTO>? attachments,
    int? assignedUserId,
    _i4.LightUserDTO? assignedUser,
    List<_i5.ArtworkQuarantineDTO>? artworkQuarantines,
    DateTime? sendToAeAt,
    int? sendToAeBy,
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
      if (customerId != null) 'customerId': customerId,
      if (customer != null) 'customer': customer?.toJson(),
      if (status != null) 'status': status,
      if (artworkType != null) 'artworkType': artworkType,
      if (type != null) 'type': type,
      if (productType != null) 'productType': productType,
      if (printProcessType != null) 'printProcessType': printProcessType,
      if (width != null) 'width': width,
      if (height != null) 'height': height,
      if (cornerRadius != null) 'cornerRadius': cornerRadius,
      'description': description,
      if (selectedProductSeriesId != null)
        'selectedProductSeriesId': selectedProductSeriesId,
      if (outputPath != null) 'outputPath': outputPath,
      if (attachments != null)
        'attachments': attachments?.toJson(valueToJson: (v) => v.toJson()),
      if (assignedUserId != null) 'assignedUserId': assignedUserId,
      if (assignedUser != null) 'assignedUser': assignedUser?.toJson(),
      if (artworkQuarantines != null)
        'artworkQuarantines':
            artworkQuarantines?.toJson(valueToJson: (v) => v.toJson()),
      if (sendToAeAt != null) 'sendToAeAt': sendToAeAt?.toJson(),
      if (sendToAeBy != null) 'sendToAeBy': sendToAeBy,
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
      if (customerId != null) 'customerId': customerId,
      if (customer != null) 'customer': customer?.toJsonForProtocol(),
      if (status != null) 'status': status,
      if (artworkType != null) 'artworkType': artworkType,
      if (type != null) 'type': type,
      if (productType != null) 'productType': productType,
      if (printProcessType != null) 'printProcessType': printProcessType,
      if (width != null) 'width': width,
      if (height != null) 'height': height,
      if (cornerRadius != null) 'cornerRadius': cornerRadius,
      'description': description,
      if (selectedProductSeriesId != null)
        'selectedProductSeriesId': selectedProductSeriesId,
      if (outputPath != null) 'outputPath': outputPath,
      if (attachments != null)
        'attachments':
            attachments?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (assignedUserId != null) 'assignedUserId': assignedUserId,
      if (assignedUser != null)
        'assignedUser': assignedUser?.toJsonForProtocol(),
      if (artworkQuarantines != null)
        'artworkQuarantines': artworkQuarantines?.toJson(
            valueToJson: (v) => v.toJsonForProtocol()),
      if (sendToAeAt != null) 'sendToAeAt': sendToAeAt?.toJson(),
      if (sendToAeBy != null) 'sendToAeBy': sendToAeBy,
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

  static ArtworkQuarantineGroupDTOInclude include({
    _i2.CustomerDTOInclude? customer,
    _i4.LightUserDTOInclude? assignedUser,
    _i5.ArtworkQuarantineDTOIncludeList? artworkQuarantines,
  }) {
    return ArtworkQuarantineGroupDTOInclude._(
      customer: customer,
      assignedUser: assignedUser,
      artworkQuarantines: artworkQuarantines,
    );
  }

  static ArtworkQuarantineGroupDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<ArtworkQuarantineGroupDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArtworkQuarantineGroupDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkQuarantineGroupDTOTable>? orderByList,
    ArtworkQuarantineGroupDTOInclude? include,
  }) {
    return ArtworkQuarantineGroupDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ArtworkQuarantineGroupDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ArtworkQuarantineGroupDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ArtworkQuarantineGroupDTOImpl extends ArtworkQuarantineGroupDTO {
  _ArtworkQuarantineGroupDTOImpl({
    int? id,
    int? customerId,
    _i2.CustomerDTO? customer,
    String? status,
    String? artworkType,
    String? type,
    String? productType,
    String? printProcessType,
    double? width,
    double? height,
    double? cornerRadius,
    required String description,
    int? selectedProductSeriesId,
    String? outputPath,
    List<_i3.SystemFileDTO>? attachments,
    int? assignedUserId,
    _i4.LightUserDTO? assignedUser,
    List<_i5.ArtworkQuarantineDTO>? artworkQuarantines,
    DateTime? sendToAeAt,
    int? sendToAeBy,
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
          customerId: customerId,
          customer: customer,
          status: status,
          artworkType: artworkType,
          type: type,
          productType: productType,
          printProcessType: printProcessType,
          width: width,
          height: height,
          cornerRadius: cornerRadius,
          description: description,
          selectedProductSeriesId: selectedProductSeriesId,
          outputPath: outputPath,
          attachments: attachments,
          assignedUserId: assignedUserId,
          assignedUser: assignedUser,
          artworkQuarantines: artworkQuarantines,
          sendToAeAt: sendToAeAt,
          sendToAeBy: sendToAeBy,
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

  /// Returns a shallow copy of this [ArtworkQuarantineGroupDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ArtworkQuarantineGroupDTO copyWith({
    Object? id = _Undefined,
    Object? customerId = _Undefined,
    Object? customer = _Undefined,
    Object? status = _Undefined,
    Object? artworkType = _Undefined,
    Object? type = _Undefined,
    Object? productType = _Undefined,
    Object? printProcessType = _Undefined,
    Object? width = _Undefined,
    Object? height = _Undefined,
    Object? cornerRadius = _Undefined,
    String? description,
    Object? selectedProductSeriesId = _Undefined,
    Object? outputPath = _Undefined,
    Object? attachments = _Undefined,
    Object? assignedUserId = _Undefined,
    Object? assignedUser = _Undefined,
    Object? artworkQuarantines = _Undefined,
    Object? sendToAeAt = _Undefined,
    Object? sendToAeBy = _Undefined,
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
    return ArtworkQuarantineGroupDTO(
      id: id is int? ? id : this.id,
      customerId: customerId is int? ? customerId : this.customerId,
      customer:
          customer is _i2.CustomerDTO? ? customer : this.customer?.copyWith(),
      status: status is String? ? status : this.status,
      artworkType: artworkType is String? ? artworkType : this.artworkType,
      type: type is String? ? type : this.type,
      productType: productType is String? ? productType : this.productType,
      printProcessType: printProcessType is String?
          ? printProcessType
          : this.printProcessType,
      width: width is double? ? width : this.width,
      height: height is double? ? height : this.height,
      cornerRadius: cornerRadius is double? ? cornerRadius : this.cornerRadius,
      description: description ?? this.description,
      selectedProductSeriesId: selectedProductSeriesId is int?
          ? selectedProductSeriesId
          : this.selectedProductSeriesId,
      outputPath: outputPath is String? ? outputPath : this.outputPath,
      attachments: attachments is List<_i3.SystemFileDTO>?
          ? attachments
          : this.attachments?.map((e0) => e0.copyWith()).toList(),
      assignedUserId:
          assignedUserId is int? ? assignedUserId : this.assignedUserId,
      assignedUser: assignedUser is _i4.LightUserDTO?
          ? assignedUser
          : this.assignedUser?.copyWith(),
      artworkQuarantines: artworkQuarantines is List<_i5.ArtworkQuarantineDTO>?
          ? artworkQuarantines
          : this.artworkQuarantines?.map((e0) => e0.copyWith()).toList(),
      sendToAeAt: sendToAeAt is DateTime? ? sendToAeAt : this.sendToAeAt,
      sendToAeBy: sendToAeBy is int? ? sendToAeBy : this.sendToAeBy,
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

class ArtworkQuarantineGroupDTOTable extends _i1.Table<int?> {
  ArtworkQuarantineGroupDTOTable({super.tableRelation})
      : super(tableName: 'ed_prepress_artwork_quarantine_group') {
    customerId = _i1.ColumnInt(
      'customerId',
      this,
    );
    status = _i1.ColumnString(
      'status',
      this,
    );
    artworkType = _i1.ColumnString(
      'artworkType',
      this,
    );
    type = _i1.ColumnString(
      'type',
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
    description = _i1.ColumnString(
      'description',
      this,
    );
    selectedProductSeriesId = _i1.ColumnInt(
      'selectedProductSeriesId',
      this,
    );
    outputPath = _i1.ColumnString(
      'outputPath',
      this,
    );
    attachments = _i1.ColumnSerializable(
      'attachments',
      this,
    );
    assignedUserId = _i1.ColumnInt(
      'assignedUserId',
      this,
    );
    sendToAeAt = _i1.ColumnDateTime(
      'sendToAeAt',
      this,
    );
    sendToAeBy = _i1.ColumnInt(
      'sendToAeBy',
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

  late final _i1.ColumnInt customerId;

  _i2.CustomerDTOTable? _customer;

  late final _i1.ColumnString status;

  late final _i1.ColumnString artworkType;

  late final _i1.ColumnString type;

  late final _i1.ColumnString productType;

  late final _i1.ColumnString printProcessType;

  late final _i1.ColumnDouble width;

  late final _i1.ColumnDouble height;

  late final _i1.ColumnDouble cornerRadius;

  late final _i1.ColumnString description;

  late final _i1.ColumnInt selectedProductSeriesId;

  late final _i1.ColumnString outputPath;

  late final _i1.ColumnSerializable attachments;

  late final _i1.ColumnInt assignedUserId;

  _i4.LightUserDTOTable? _assignedUser;

  _i5.ArtworkQuarantineDTOTable? ___artworkQuarantines;

  _i1.ManyRelation<_i5.ArtworkQuarantineDTOTable>? _artworkQuarantines;

  late final _i1.ColumnDateTime sendToAeAt;

  late final _i1.ColumnInt sendToAeBy;

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
      field: ArtworkQuarantineGroupDTO.t.customerId,
      foreignField: _i2.CustomerDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.CustomerDTOTable(tableRelation: foreignTableRelation),
    );
    return _customer!;
  }

  _i4.LightUserDTOTable get assignedUser {
    if (_assignedUser != null) return _assignedUser!;
    _assignedUser = _i1.createRelationTable(
      relationFieldName: 'assignedUser',
      field: ArtworkQuarantineGroupDTO.t.assignedUserId,
      foreignField: _i4.LightUserDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.LightUserDTOTable(tableRelation: foreignTableRelation),
    );
    return _assignedUser!;
  }

  _i5.ArtworkQuarantineDTOTable get __artworkQuarantines {
    if (___artworkQuarantines != null) return ___artworkQuarantines!;
    ___artworkQuarantines = _i1.createRelationTable(
      relationFieldName: '__artworkQuarantines',
      field: ArtworkQuarantineGroupDTO.t.id,
      foreignField: _i5.ArtworkQuarantineDTO.t.groupId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.ArtworkQuarantineDTOTable(tableRelation: foreignTableRelation),
    );
    return ___artworkQuarantines!;
  }

  _i1.ManyRelation<_i5.ArtworkQuarantineDTOTable> get artworkQuarantines {
    if (_artworkQuarantines != null) return _artworkQuarantines!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'artworkQuarantines',
      field: ArtworkQuarantineGroupDTO.t.id,
      foreignField: _i5.ArtworkQuarantineDTO.t.groupId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.ArtworkQuarantineDTOTable(tableRelation: foreignTableRelation),
    );
    _artworkQuarantines = _i1.ManyRelation<_i5.ArtworkQuarantineDTOTable>(
      tableWithRelations: relationTable,
      table: _i5.ArtworkQuarantineDTOTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _artworkQuarantines!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        customerId,
        status,
        artworkType,
        type,
        productType,
        printProcessType,
        width,
        height,
        cornerRadius,
        description,
        selectedProductSeriesId,
        outputPath,
        attachments,
        assignedUserId,
        sendToAeAt,
        sendToAeBy,
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
    if (relationField == 'assignedUser') {
      return assignedUser;
    }
    if (relationField == 'artworkQuarantines') {
      return __artworkQuarantines;
    }
    return null;
  }
}

class ArtworkQuarantineGroupDTOInclude extends _i1.IncludeObject {
  ArtworkQuarantineGroupDTOInclude._({
    _i2.CustomerDTOInclude? customer,
    _i4.LightUserDTOInclude? assignedUser,
    _i5.ArtworkQuarantineDTOIncludeList? artworkQuarantines,
  }) {
    _customer = customer;
    _assignedUser = assignedUser;
    _artworkQuarantines = artworkQuarantines;
  }

  _i2.CustomerDTOInclude? _customer;

  _i4.LightUserDTOInclude? _assignedUser;

  _i5.ArtworkQuarantineDTOIncludeList? _artworkQuarantines;

  @override
  Map<String, _i1.Include?> get includes => {
        'customer': _customer,
        'assignedUser': _assignedUser,
        'artworkQuarantines': _artworkQuarantines,
      };

  @override
  _i1.Table<int?> get table => ArtworkQuarantineGroupDTO.t;
}

class ArtworkQuarantineGroupDTOIncludeList extends _i1.IncludeList {
  ArtworkQuarantineGroupDTOIncludeList._({
    _i1.WhereExpressionBuilder<ArtworkQuarantineGroupDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ArtworkQuarantineGroupDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ArtworkQuarantineGroupDTO.t;
}

class ArtworkQuarantineGroupDTORepository {
  const ArtworkQuarantineGroupDTORepository._();

  final attach = const ArtworkQuarantineGroupDTOAttachRepository._();

  final attachRow = const ArtworkQuarantineGroupDTOAttachRowRepository._();

  final detachRow = const ArtworkQuarantineGroupDTODetachRowRepository._();

  /// Returns a list of [ArtworkQuarantineGroupDTO]s matching the given query parameters.
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
  Future<List<ArtworkQuarantineGroupDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkQuarantineGroupDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArtworkQuarantineGroupDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkQuarantineGroupDTOTable>? orderByList,
    _i1.Transaction? transaction,
    ArtworkQuarantineGroupDTOInclude? include,
  }) async {
    return session.db.find<ArtworkQuarantineGroupDTO>(
      where: where?.call(ArtworkQuarantineGroupDTO.t),
      orderBy: orderBy?.call(ArtworkQuarantineGroupDTO.t),
      orderByList: orderByList?.call(ArtworkQuarantineGroupDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [ArtworkQuarantineGroupDTO] matching the given query parameters.
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
  Future<ArtworkQuarantineGroupDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkQuarantineGroupDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<ArtworkQuarantineGroupDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkQuarantineGroupDTOTable>? orderByList,
    _i1.Transaction? transaction,
    ArtworkQuarantineGroupDTOInclude? include,
  }) async {
    return session.db.findFirstRow<ArtworkQuarantineGroupDTO>(
      where: where?.call(ArtworkQuarantineGroupDTO.t),
      orderBy: orderBy?.call(ArtworkQuarantineGroupDTO.t),
      orderByList: orderByList?.call(ArtworkQuarantineGroupDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [ArtworkQuarantineGroupDTO] by its [id] or null if no such row exists.
  Future<ArtworkQuarantineGroupDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ArtworkQuarantineGroupDTOInclude? include,
  }) async {
    return session.db.findById<ArtworkQuarantineGroupDTO>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [ArtworkQuarantineGroupDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [ArtworkQuarantineGroupDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ArtworkQuarantineGroupDTO>> insert(
    _i1.Session session,
    List<ArtworkQuarantineGroupDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ArtworkQuarantineGroupDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ArtworkQuarantineGroupDTO] and returns the inserted row.
  ///
  /// The returned [ArtworkQuarantineGroupDTO] will have its `id` field set.
  Future<ArtworkQuarantineGroupDTO> insertRow(
    _i1.Session session,
    ArtworkQuarantineGroupDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ArtworkQuarantineGroupDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ArtworkQuarantineGroupDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ArtworkQuarantineGroupDTO>> update(
    _i1.Session session,
    List<ArtworkQuarantineGroupDTO> rows, {
    _i1.ColumnSelections<ArtworkQuarantineGroupDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ArtworkQuarantineGroupDTO>(
      rows,
      columns: columns?.call(ArtworkQuarantineGroupDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ArtworkQuarantineGroupDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ArtworkQuarantineGroupDTO> updateRow(
    _i1.Session session,
    ArtworkQuarantineGroupDTO row, {
    _i1.ColumnSelections<ArtworkQuarantineGroupDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ArtworkQuarantineGroupDTO>(
      row,
      columns: columns?.call(ArtworkQuarantineGroupDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [ArtworkQuarantineGroupDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ArtworkQuarantineGroupDTO>> delete(
    _i1.Session session,
    List<ArtworkQuarantineGroupDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ArtworkQuarantineGroupDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ArtworkQuarantineGroupDTO].
  Future<ArtworkQuarantineGroupDTO> deleteRow(
    _i1.Session session,
    ArtworkQuarantineGroupDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ArtworkQuarantineGroupDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ArtworkQuarantineGroupDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ArtworkQuarantineGroupDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ArtworkQuarantineGroupDTO>(
      where: where(ArtworkQuarantineGroupDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkQuarantineGroupDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ArtworkQuarantineGroupDTO>(
      where: where?.call(ArtworkQuarantineGroupDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ArtworkQuarantineGroupDTOAttachRepository {
  const ArtworkQuarantineGroupDTOAttachRepository._();

  /// Creates a relation between this [ArtworkQuarantineGroupDTO] and the given [ArtworkQuarantineDTO]s
  /// by setting each [ArtworkQuarantineDTO]'s foreign key `groupId` to refer to this [ArtworkQuarantineGroupDTO].
  Future<void> artworkQuarantines(
    _i1.Session session,
    ArtworkQuarantineGroupDTO artworkQuarantineGroupDTO,
    List<_i5.ArtworkQuarantineDTO> artworkQuarantineDTO, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkQuarantineDTO.any((e) => e.id == null)) {
      throw ArgumentError.notNull('artworkQuarantineDTO.id');
    }
    if (artworkQuarantineGroupDTO.id == null) {
      throw ArgumentError.notNull('artworkQuarantineGroupDTO.id');
    }

    var $artworkQuarantineDTO = artworkQuarantineDTO
        .map((e) => e.copyWith(groupId: artworkQuarantineGroupDTO.id))
        .toList();
    await session.db.update<_i5.ArtworkQuarantineDTO>(
      $artworkQuarantineDTO,
      columns: [_i5.ArtworkQuarantineDTO.t.groupId],
      transaction: transaction,
    );
  }
}

class ArtworkQuarantineGroupDTOAttachRowRepository {
  const ArtworkQuarantineGroupDTOAttachRowRepository._();

  /// Creates a relation between the given [ArtworkQuarantineGroupDTO] and [CustomerDTO]
  /// by setting the [ArtworkQuarantineGroupDTO]'s foreign key `customerId` to refer to the [CustomerDTO].
  Future<void> customer(
    _i1.Session session,
    ArtworkQuarantineGroupDTO artworkQuarantineGroupDTO,
    _i2.CustomerDTO customer, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkQuarantineGroupDTO.id == null) {
      throw ArgumentError.notNull('artworkQuarantineGroupDTO.id');
    }
    if (customer.id == null) {
      throw ArgumentError.notNull('customer.id');
    }

    var $artworkQuarantineGroupDTO =
        artworkQuarantineGroupDTO.copyWith(customerId: customer.id);
    await session.db.updateRow<ArtworkQuarantineGroupDTO>(
      $artworkQuarantineGroupDTO,
      columns: [ArtworkQuarantineGroupDTO.t.customerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [ArtworkQuarantineGroupDTO] and [LightUserDTO]
  /// by setting the [ArtworkQuarantineGroupDTO]'s foreign key `assignedUserId` to refer to the [LightUserDTO].
  Future<void> assignedUser(
    _i1.Session session,
    ArtworkQuarantineGroupDTO artworkQuarantineGroupDTO,
    _i4.LightUserDTO assignedUser, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkQuarantineGroupDTO.id == null) {
      throw ArgumentError.notNull('artworkQuarantineGroupDTO.id');
    }
    if (assignedUser.id == null) {
      throw ArgumentError.notNull('assignedUser.id');
    }

    var $artworkQuarantineGroupDTO =
        artworkQuarantineGroupDTO.copyWith(assignedUserId: assignedUser.id);
    await session.db.updateRow<ArtworkQuarantineGroupDTO>(
      $artworkQuarantineGroupDTO,
      columns: [ArtworkQuarantineGroupDTO.t.assignedUserId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [ArtworkQuarantineGroupDTO] and the given [ArtworkQuarantineDTO]
  /// by setting the [ArtworkQuarantineDTO]'s foreign key `groupId` to refer to this [ArtworkQuarantineGroupDTO].
  Future<void> artworkQuarantines(
    _i1.Session session,
    ArtworkQuarantineGroupDTO artworkQuarantineGroupDTO,
    _i5.ArtworkQuarantineDTO artworkQuarantineDTO, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkQuarantineDTO.id == null) {
      throw ArgumentError.notNull('artworkQuarantineDTO.id');
    }
    if (artworkQuarantineGroupDTO.id == null) {
      throw ArgumentError.notNull('artworkQuarantineGroupDTO.id');
    }

    var $artworkQuarantineDTO =
        artworkQuarantineDTO.copyWith(groupId: artworkQuarantineGroupDTO.id);
    await session.db.updateRow<_i5.ArtworkQuarantineDTO>(
      $artworkQuarantineDTO,
      columns: [_i5.ArtworkQuarantineDTO.t.groupId],
      transaction: transaction,
    );
  }
}

class ArtworkQuarantineGroupDTODetachRowRepository {
  const ArtworkQuarantineGroupDTODetachRowRepository._();

  /// Detaches the relation between this [ArtworkQuarantineGroupDTO] and the [CustomerDTO] set in `customer`
  /// by setting the [ArtworkQuarantineGroupDTO]'s foreign key `customerId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> customer(
    _i1.Session session,
    ArtworkQuarantineGroupDTO artworkquarantinegroupdto, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkquarantinegroupdto.id == null) {
      throw ArgumentError.notNull('artworkquarantinegroupdto.id');
    }

    var $artworkquarantinegroupdto =
        artworkquarantinegroupdto.copyWith(customerId: null);
    await session.db.updateRow<ArtworkQuarantineGroupDTO>(
      $artworkquarantinegroupdto,
      columns: [ArtworkQuarantineGroupDTO.t.customerId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [ArtworkQuarantineGroupDTO] and the [LightUserDTO] set in `assignedUser`
  /// by setting the [ArtworkQuarantineGroupDTO]'s foreign key `assignedUserId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> assignedUser(
    _i1.Session session,
    ArtworkQuarantineGroupDTO artworkquarantinegroupdto, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkquarantinegroupdto.id == null) {
      throw ArgumentError.notNull('artworkquarantinegroupdto.id');
    }

    var $artworkquarantinegroupdto =
        artworkquarantinegroupdto.copyWith(assignedUserId: null);
    await session.db.updateRow<ArtworkQuarantineGroupDTO>(
      $artworkquarantinegroupdto,
      columns: [ArtworkQuarantineGroupDTO.t.assignedUserId],
      transaction: transaction,
    );
  }
}
