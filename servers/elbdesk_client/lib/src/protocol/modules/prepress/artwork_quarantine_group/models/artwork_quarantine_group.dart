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
import '../../../../modules/prepress/artwork_quarantine_group/models/system_file.dart'
    as _i3;
import 'package:elbdesk_backend_core_client/elbdesk_backend_core_client.dart'
    as _i4;
import '../../../../modules/prepress/artwork_quarantine/models/artwork_quarantine_dto.dart'
    as _i5;

abstract class ArtworkQuarantineGroupDTO implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
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
