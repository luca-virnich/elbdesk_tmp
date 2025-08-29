/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../../../modules/unsorted/ftp_interface/ftp_type.dart' as _i2;
import '../../../modules/unsorted/ftp_interface/ftp_incoming_reply_type.dart'
    as _i3;

abstract class FTPInterfaceDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  FTPInterfaceDTO._({
    this.id,
    required this.type,
    required this.description,
    required this.host,
    required this.user,
    required this.password,
    required this.port,
    required this.dataInput,
    required this.extractZip,
    required this.workflowStart,
    required this.incomingReplyType,
    required this.incomingConfirmationReference,
    required this.incomingConfirmation,
    required this.incomingConfirmationEmail,
    required this.incomingClientConfirmationReference,
    required this.incomingClientConfirmation,
    required this.incomingClientConfirmationEmail,
    required this.dataOutput,
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
  }) : _edCrmCustomerFtpinterfacesEdCrmCustomerId = null;

  factory FTPInterfaceDTO({
    int? id,
    required _i2.FTPType type,
    required String description,
    required String host,
    required String user,
    required String password,
    required int port,
    required String dataInput,
    required bool extractZip,
    required String workflowStart,
    required _i3.FTPIncomingReplyType incomingReplyType,
    required String incomingConfirmationReference,
    required String incomingConfirmation,
    required String incomingConfirmationEmail,
    required String incomingClientConfirmationReference,
    required String incomingClientConfirmation,
    required String incomingClientConfirmationEmail,
    required String dataOutput,
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
  }) = _FTPInterfaceDTOImpl;

  factory FTPInterfaceDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return FTPInterfaceDTOImplicit._(
      id: jsonSerialization['id'] as int?,
      type: _i2.FTPType.fromJson((jsonSerialization['type'] as String)),
      description: jsonSerialization['description'] as String,
      host: jsonSerialization['host'] as String,
      user: jsonSerialization['user'] as String,
      password: jsonSerialization['password'] as String,
      port: jsonSerialization['port'] as int,
      dataInput: jsonSerialization['dataInput'] as String,
      extractZip: jsonSerialization['extractZip'] as bool,
      workflowStart: jsonSerialization['workflowStart'] as String,
      incomingReplyType: _i3.FTPIncomingReplyType.fromJson(
          (jsonSerialization['incomingReplyType'] as String)),
      incomingConfirmationReference:
          jsonSerialization['incomingConfirmationReference'] as String,
      incomingConfirmation: jsonSerialization['incomingConfirmation'] as String,
      incomingConfirmationEmail:
          jsonSerialization['incomingConfirmationEmail'] as String,
      incomingClientConfirmationReference:
          jsonSerialization['incomingClientConfirmationReference'] as String,
      incomingClientConfirmation:
          jsonSerialization['incomingClientConfirmation'] as String,
      incomingClientConfirmationEmail:
          jsonSerialization['incomingClientConfirmationEmail'] as String,
      dataOutput: jsonSerialization['dataOutput'] as String,
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
      $_edCrmCustomerFtpinterfacesEdCrmCustomerId:
          jsonSerialization['_edCrmCustomerFtpinterfacesEdCrmCustomerId']
              as int?,
    );
  }

  static final t = FTPInterfaceDTOTable();

  static const db = FTPInterfaceDTORepository._();

  @override
  int? id;

  _i2.FTPType type;

  String description;

  String host;

  String user;

  String password;

  int port;

  String dataInput;

  bool extractZip;

  String workflowStart;

  _i3.FTPIncomingReplyType incomingReplyType;

  String incomingConfirmationReference;

  String incomingConfirmation;

  String incomingConfirmationEmail;

  String incomingClientConfirmationReference;

  String incomingClientConfirmation;

  String incomingClientConfirmationEmail;

  String dataOutput;

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

  final int? _edCrmCustomerFtpinterfacesEdCrmCustomerId;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [FTPInterfaceDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  FTPInterfaceDTO copyWith({
    int? id,
    _i2.FTPType? type,
    String? description,
    String? host,
    String? user,
    String? password,
    int? port,
    String? dataInput,
    bool? extractZip,
    String? workflowStart,
    _i3.FTPIncomingReplyType? incomingReplyType,
    String? incomingConfirmationReference,
    String? incomingConfirmation,
    String? incomingConfirmationEmail,
    String? incomingClientConfirmationReference,
    String? incomingClientConfirmation,
    String? incomingClientConfirmationEmail,
    String? dataOutput,
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
      'type': type.toJson(),
      'description': description,
      'host': host,
      'user': user,
      'password': password,
      'port': port,
      'dataInput': dataInput,
      'extractZip': extractZip,
      'workflowStart': workflowStart,
      'incomingReplyType': incomingReplyType.toJson(),
      'incomingConfirmationReference': incomingConfirmationReference,
      'incomingConfirmation': incomingConfirmation,
      'incomingConfirmationEmail': incomingConfirmationEmail,
      'incomingClientConfirmationReference':
          incomingClientConfirmationReference,
      'incomingClientConfirmation': incomingClientConfirmation,
      'incomingClientConfirmationEmail': incomingClientConfirmationEmail,
      'dataOutput': dataOutput,
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
      if (_edCrmCustomerFtpinterfacesEdCrmCustomerId != null)
        '_edCrmCustomerFtpinterfacesEdCrmCustomerId':
            _edCrmCustomerFtpinterfacesEdCrmCustomerId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'type': type.toJson(),
      'description': description,
      'host': host,
      'user': user,
      'password': password,
      'port': port,
      'dataInput': dataInput,
      'extractZip': extractZip,
      'workflowStart': workflowStart,
      'incomingReplyType': incomingReplyType.toJson(),
      'incomingConfirmationReference': incomingConfirmationReference,
      'incomingConfirmation': incomingConfirmation,
      'incomingConfirmationEmail': incomingConfirmationEmail,
      'incomingClientConfirmationReference':
          incomingClientConfirmationReference,
      'incomingClientConfirmation': incomingClientConfirmation,
      'incomingClientConfirmationEmail': incomingClientConfirmationEmail,
      'dataOutput': dataOutput,
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

  static FTPInterfaceDTOInclude include() {
    return FTPInterfaceDTOInclude._();
  }

  static FTPInterfaceDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<FTPInterfaceDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<FTPInterfaceDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FTPInterfaceDTOTable>? orderByList,
    FTPInterfaceDTOInclude? include,
  }) {
    return FTPInterfaceDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(FTPInterfaceDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(FTPInterfaceDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _FTPInterfaceDTOImpl extends FTPInterfaceDTO {
  _FTPInterfaceDTOImpl({
    int? id,
    required _i2.FTPType type,
    required String description,
    required String host,
    required String user,
    required String password,
    required int port,
    required String dataInput,
    required bool extractZip,
    required String workflowStart,
    required _i3.FTPIncomingReplyType incomingReplyType,
    required String incomingConfirmationReference,
    required String incomingConfirmation,
    required String incomingConfirmationEmail,
    required String incomingClientConfirmationReference,
    required String incomingClientConfirmation,
    required String incomingClientConfirmationEmail,
    required String dataOutput,
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
          type: type,
          description: description,
          host: host,
          user: user,
          password: password,
          port: port,
          dataInput: dataInput,
          extractZip: extractZip,
          workflowStart: workflowStart,
          incomingReplyType: incomingReplyType,
          incomingConfirmationReference: incomingConfirmationReference,
          incomingConfirmation: incomingConfirmation,
          incomingConfirmationEmail: incomingConfirmationEmail,
          incomingClientConfirmationReference:
              incomingClientConfirmationReference,
          incomingClientConfirmation: incomingClientConfirmation,
          incomingClientConfirmationEmail: incomingClientConfirmationEmail,
          dataOutput: dataOutput,
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

  /// Returns a shallow copy of this [FTPInterfaceDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  FTPInterfaceDTO copyWith({
    Object? id = _Undefined,
    _i2.FTPType? type,
    String? description,
    String? host,
    String? user,
    String? password,
    int? port,
    String? dataInput,
    bool? extractZip,
    String? workflowStart,
    _i3.FTPIncomingReplyType? incomingReplyType,
    String? incomingConfirmationReference,
    String? incomingConfirmation,
    String? incomingConfirmationEmail,
    String? incomingClientConfirmationReference,
    String? incomingClientConfirmation,
    String? incomingClientConfirmationEmail,
    String? dataOutput,
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
    return FTPInterfaceDTOImplicit._(
      id: id is int? ? id : this.id,
      type: type ?? this.type,
      description: description ?? this.description,
      host: host ?? this.host,
      user: user ?? this.user,
      password: password ?? this.password,
      port: port ?? this.port,
      dataInput: dataInput ?? this.dataInput,
      extractZip: extractZip ?? this.extractZip,
      workflowStart: workflowStart ?? this.workflowStart,
      incomingReplyType: incomingReplyType ?? this.incomingReplyType,
      incomingConfirmationReference:
          incomingConfirmationReference ?? this.incomingConfirmationReference,
      incomingConfirmation: incomingConfirmation ?? this.incomingConfirmation,
      incomingConfirmationEmail:
          incomingConfirmationEmail ?? this.incomingConfirmationEmail,
      incomingClientConfirmationReference:
          incomingClientConfirmationReference ??
              this.incomingClientConfirmationReference,
      incomingClientConfirmation:
          incomingClientConfirmation ?? this.incomingClientConfirmation,
      incomingClientConfirmationEmail: incomingClientConfirmationEmail ??
          this.incomingClientConfirmationEmail,
      dataOutput: dataOutput ?? this.dataOutput,
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
      $_edCrmCustomerFtpinterfacesEdCrmCustomerId:
          this._edCrmCustomerFtpinterfacesEdCrmCustomerId,
    );
  }
}

class FTPInterfaceDTOImplicit extends _FTPInterfaceDTOImpl {
  FTPInterfaceDTOImplicit._({
    int? id,
    required _i2.FTPType type,
    required String description,
    required String host,
    required String user,
    required String password,
    required int port,
    required String dataInput,
    required bool extractZip,
    required String workflowStart,
    required _i3.FTPIncomingReplyType incomingReplyType,
    required String incomingConfirmationReference,
    required String incomingConfirmation,
    required String incomingConfirmationEmail,
    required String incomingClientConfirmationReference,
    required String incomingClientConfirmation,
    required String incomingClientConfirmationEmail,
    required String dataOutput,
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
    int? $_edCrmCustomerFtpinterfacesEdCrmCustomerId,
  })  : _edCrmCustomerFtpinterfacesEdCrmCustomerId =
            $_edCrmCustomerFtpinterfacesEdCrmCustomerId,
        super(
          id: id,
          type: type,
          description: description,
          host: host,
          user: user,
          password: password,
          port: port,
          dataInput: dataInput,
          extractZip: extractZip,
          workflowStart: workflowStart,
          incomingReplyType: incomingReplyType,
          incomingConfirmationReference: incomingConfirmationReference,
          incomingConfirmation: incomingConfirmation,
          incomingConfirmationEmail: incomingConfirmationEmail,
          incomingClientConfirmationReference:
              incomingClientConfirmationReference,
          incomingClientConfirmation: incomingClientConfirmation,
          incomingClientConfirmationEmail: incomingClientConfirmationEmail,
          dataOutput: dataOutput,
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

  factory FTPInterfaceDTOImplicit(
    FTPInterfaceDTO fTPInterfaceDTO, {
    int? $_edCrmCustomerFtpinterfacesEdCrmCustomerId,
  }) {
    return FTPInterfaceDTOImplicit._(
      id: fTPInterfaceDTO.id,
      type: fTPInterfaceDTO.type,
      description: fTPInterfaceDTO.description,
      host: fTPInterfaceDTO.host,
      user: fTPInterfaceDTO.user,
      password: fTPInterfaceDTO.password,
      port: fTPInterfaceDTO.port,
      dataInput: fTPInterfaceDTO.dataInput,
      extractZip: fTPInterfaceDTO.extractZip,
      workflowStart: fTPInterfaceDTO.workflowStart,
      incomingReplyType: fTPInterfaceDTO.incomingReplyType,
      incomingConfirmationReference:
          fTPInterfaceDTO.incomingConfirmationReference,
      incomingConfirmation: fTPInterfaceDTO.incomingConfirmation,
      incomingConfirmationEmail: fTPInterfaceDTO.incomingConfirmationEmail,
      incomingClientConfirmationReference:
          fTPInterfaceDTO.incomingClientConfirmationReference,
      incomingClientConfirmation: fTPInterfaceDTO.incomingClientConfirmation,
      incomingClientConfirmationEmail:
          fTPInterfaceDTO.incomingClientConfirmationEmail,
      dataOutput: fTPInterfaceDTO.dataOutput,
      createdAt: fTPInterfaceDTO.createdAt,
      createdById: fTPInterfaceDTO.createdById,
      lastModifiedAt: fTPInterfaceDTO.lastModifiedAt,
      lastModifiedById: fTPInterfaceDTO.lastModifiedById,
      deletedAt: fTPInterfaceDTO.deletedAt,
      deletedById: fTPInterfaceDTO.deletedById,
      editingById: fTPInterfaceDTO.editingById,
      editingSince: fTPInterfaceDTO.editingSince,
      isDraft: fTPInterfaceDTO.isDraft,
      editingSession: fTPInterfaceDTO.editingSession,
      $_edCrmCustomerFtpinterfacesEdCrmCustomerId:
          $_edCrmCustomerFtpinterfacesEdCrmCustomerId,
    );
  }

  @override
  final int? _edCrmCustomerFtpinterfacesEdCrmCustomerId;
}

class FTPInterfaceDTOTable extends _i1.Table<int?> {
  FTPInterfaceDTOTable({super.tableRelation})
      : super(tableName: 'prepress_ftp_interface') {
    type = _i1.ColumnEnum(
      'type',
      this,
      _i1.EnumSerialization.byName,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    host = _i1.ColumnString(
      'host',
      this,
    );
    user = _i1.ColumnString(
      'user',
      this,
    );
    password = _i1.ColumnString(
      'password',
      this,
    );
    port = _i1.ColumnInt(
      'port',
      this,
    );
    dataInput = _i1.ColumnString(
      'dataInput',
      this,
    );
    extractZip = _i1.ColumnBool(
      'extractZip',
      this,
    );
    workflowStart = _i1.ColumnString(
      'workflowStart',
      this,
    );
    incomingReplyType = _i1.ColumnEnum(
      'incomingReplyType',
      this,
      _i1.EnumSerialization.byName,
    );
    incomingConfirmationReference = _i1.ColumnString(
      'incomingConfirmationReference',
      this,
    );
    incomingConfirmation = _i1.ColumnString(
      'incomingConfirmation',
      this,
    );
    incomingConfirmationEmail = _i1.ColumnString(
      'incomingConfirmationEmail',
      this,
    );
    incomingClientConfirmationReference = _i1.ColumnString(
      'incomingClientConfirmationReference',
      this,
    );
    incomingClientConfirmation = _i1.ColumnString(
      'incomingClientConfirmation',
      this,
    );
    incomingClientConfirmationEmail = _i1.ColumnString(
      'incomingClientConfirmationEmail',
      this,
    );
    dataOutput = _i1.ColumnString(
      'dataOutput',
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
    $_edCrmCustomerFtpinterfacesEdCrmCustomerId = _i1.ColumnInt(
      '_edCrmCustomerFtpinterfacesEdCrmCustomerId',
      this,
    );
  }

  late final _i1.ColumnEnum<_i2.FTPType> type;

  late final _i1.ColumnString description;

  late final _i1.ColumnString host;

  late final _i1.ColumnString user;

  late final _i1.ColumnString password;

  late final _i1.ColumnInt port;

  late final _i1.ColumnString dataInput;

  late final _i1.ColumnBool extractZip;

  late final _i1.ColumnString workflowStart;

  late final _i1.ColumnEnum<_i3.FTPIncomingReplyType> incomingReplyType;

  late final _i1.ColumnString incomingConfirmationReference;

  late final _i1.ColumnString incomingConfirmation;

  late final _i1.ColumnString incomingConfirmationEmail;

  late final _i1.ColumnString incomingClientConfirmationReference;

  late final _i1.ColumnString incomingClientConfirmation;

  late final _i1.ColumnString incomingClientConfirmationEmail;

  late final _i1.ColumnString dataOutput;

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

  late final _i1.ColumnInt $_edCrmCustomerFtpinterfacesEdCrmCustomerId;

  @override
  List<_i1.Column> get columns => [
        id,
        type,
        description,
        host,
        user,
        password,
        port,
        dataInput,
        extractZip,
        workflowStart,
        incomingReplyType,
        incomingConfirmationReference,
        incomingConfirmation,
        incomingConfirmationEmail,
        incomingClientConfirmationReference,
        incomingClientConfirmation,
        incomingClientConfirmationEmail,
        dataOutput,
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
        $_edCrmCustomerFtpinterfacesEdCrmCustomerId,
      ];

  @override
  List<_i1.Column> get managedColumns => [
        id,
        type,
        description,
        host,
        user,
        password,
        port,
        dataInput,
        extractZip,
        workflowStart,
        incomingReplyType,
        incomingConfirmationReference,
        incomingConfirmation,
        incomingConfirmationEmail,
        incomingClientConfirmationReference,
        incomingClientConfirmation,
        incomingClientConfirmationEmail,
        dataOutput,
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
}

class FTPInterfaceDTOInclude extends _i1.IncludeObject {
  FTPInterfaceDTOInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => FTPInterfaceDTO.t;
}

class FTPInterfaceDTOIncludeList extends _i1.IncludeList {
  FTPInterfaceDTOIncludeList._({
    _i1.WhereExpressionBuilder<FTPInterfaceDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(FTPInterfaceDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => FTPInterfaceDTO.t;
}

class FTPInterfaceDTORepository {
  const FTPInterfaceDTORepository._();

  /// Returns a list of [FTPInterfaceDTO]s matching the given query parameters.
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
  Future<List<FTPInterfaceDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FTPInterfaceDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<FTPInterfaceDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FTPInterfaceDTOTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<FTPInterfaceDTO>(
      where: where?.call(FTPInterfaceDTO.t),
      orderBy: orderBy?.call(FTPInterfaceDTO.t),
      orderByList: orderByList?.call(FTPInterfaceDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [FTPInterfaceDTO] matching the given query parameters.
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
  Future<FTPInterfaceDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FTPInterfaceDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<FTPInterfaceDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FTPInterfaceDTOTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<FTPInterfaceDTO>(
      where: where?.call(FTPInterfaceDTO.t),
      orderBy: orderBy?.call(FTPInterfaceDTO.t),
      orderByList: orderByList?.call(FTPInterfaceDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [FTPInterfaceDTO] by its [id] or null if no such row exists.
  Future<FTPInterfaceDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<FTPInterfaceDTO>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [FTPInterfaceDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [FTPInterfaceDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<FTPInterfaceDTO>> insert(
    _i1.Session session,
    List<FTPInterfaceDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<FTPInterfaceDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [FTPInterfaceDTO] and returns the inserted row.
  ///
  /// The returned [FTPInterfaceDTO] will have its `id` field set.
  Future<FTPInterfaceDTO> insertRow(
    _i1.Session session,
    FTPInterfaceDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<FTPInterfaceDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [FTPInterfaceDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<FTPInterfaceDTO>> update(
    _i1.Session session,
    List<FTPInterfaceDTO> rows, {
    _i1.ColumnSelections<FTPInterfaceDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<FTPInterfaceDTO>(
      rows,
      columns: columns?.call(FTPInterfaceDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [FTPInterfaceDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<FTPInterfaceDTO> updateRow(
    _i1.Session session,
    FTPInterfaceDTO row, {
    _i1.ColumnSelections<FTPInterfaceDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<FTPInterfaceDTO>(
      row,
      columns: columns?.call(FTPInterfaceDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [FTPInterfaceDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<FTPInterfaceDTO>> delete(
    _i1.Session session,
    List<FTPInterfaceDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<FTPInterfaceDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [FTPInterfaceDTO].
  Future<FTPInterfaceDTO> deleteRow(
    _i1.Session session,
    FTPInterfaceDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<FTPInterfaceDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<FTPInterfaceDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<FTPInterfaceDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<FTPInterfaceDTO>(
      where: where(FTPInterfaceDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FTPInterfaceDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<FTPInterfaceDTO>(
      where: where?.call(FTPInterfaceDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
