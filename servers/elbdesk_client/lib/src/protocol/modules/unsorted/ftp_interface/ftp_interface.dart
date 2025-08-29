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
import '../../../modules/unsorted/ftp_interface/ftp_type.dart' as _i2;
import '../../../modules/unsorted/ftp_interface/ftp_incoming_reply_type.dart'
    as _i3;

abstract class FTPInterfaceDTO implements _i1.SerializableModel {
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
  });

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
    return FTPInterfaceDTO(
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
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
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
    };
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
    return FTPInterfaceDTO(
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
    );
  }
}
