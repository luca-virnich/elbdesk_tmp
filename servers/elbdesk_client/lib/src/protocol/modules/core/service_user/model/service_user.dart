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
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i2;
import '../../../../modules/core/service_user/model/service_user_token.dart'
    as _i3;

abstract class ServiceUserDTO implements _i1.SerializableModel {
  ServiceUserDTO._({
    this.id,
    this.userInfoId,
    this.userInfo,
    required this.serviceName,
    required this.serviceDescription,
    required this.isActive,
    this.tokens,
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

  factory ServiceUserDTO({
    int? id,
    int? userInfoId,
    _i2.UserInfo? userInfo,
    required String serviceName,
    required String serviceDescription,
    required bool isActive,
    List<_i3.ServiceUserTokenDTO>? tokens,
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
  }) = _ServiceUserDTOImpl;

  factory ServiceUserDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return ServiceUserDTO(
      id: jsonSerialization['id'] as int?,
      userInfoId: jsonSerialization['userInfoId'] as int?,
      userInfo: jsonSerialization['userInfo'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['userInfo'] as Map<String, dynamic>)),
      serviceName: jsonSerialization['serviceName'] as String,
      serviceDescription: jsonSerialization['serviceDescription'] as String,
      isActive: jsonSerialization['isActive'] as bool,
      tokens: (jsonSerialization['tokens'] as List?)
          ?.map((e) =>
              _i3.ServiceUserTokenDTO.fromJson((e as Map<String, dynamic>)))
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

  int? userInfoId;

  _i2.UserInfo? userInfo;

  String serviceName;

  String serviceDescription;

  bool isActive;

  List<_i3.ServiceUserTokenDTO>? tokens;

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

  /// Returns a shallow copy of this [ServiceUserDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ServiceUserDTO copyWith({
    int? id,
    int? userInfoId,
    _i2.UserInfo? userInfo,
    String? serviceName,
    String? serviceDescription,
    bool? isActive,
    List<_i3.ServiceUserTokenDTO>? tokens,
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
      if (userInfoId != null) 'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJson(),
      'serviceName': serviceName,
      'serviceDescription': serviceDescription,
      'isActive': isActive,
      if (tokens != null)
        'tokens': tokens?.toJson(valueToJson: (v) => v.toJson()),
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

class _ServiceUserDTOImpl extends ServiceUserDTO {
  _ServiceUserDTOImpl({
    int? id,
    int? userInfoId,
    _i2.UserInfo? userInfo,
    required String serviceName,
    required String serviceDescription,
    required bool isActive,
    List<_i3.ServiceUserTokenDTO>? tokens,
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
          userInfoId: userInfoId,
          userInfo: userInfo,
          serviceName: serviceName,
          serviceDescription: serviceDescription,
          isActive: isActive,
          tokens: tokens,
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

  /// Returns a shallow copy of this [ServiceUserDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ServiceUserDTO copyWith({
    Object? id = _Undefined,
    Object? userInfoId = _Undefined,
    Object? userInfo = _Undefined,
    String? serviceName,
    String? serviceDescription,
    bool? isActive,
    Object? tokens = _Undefined,
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
    return ServiceUserDTO(
      id: id is int? ? id : this.id,
      userInfoId: userInfoId is int? ? userInfoId : this.userInfoId,
      userInfo:
          userInfo is _i2.UserInfo? ? userInfo : this.userInfo?.copyWith(),
      serviceName: serviceName ?? this.serviceName,
      serviceDescription: serviceDescription ?? this.serviceDescription,
      isActive: isActive ?? this.isActive,
      tokens: tokens is List<_i3.ServiceUserTokenDTO>?
          ? tokens
          : this.tokens?.map((e0) => e0.copyWith()).toList(),
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
