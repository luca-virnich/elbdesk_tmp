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

abstract class LightUserDTO implements _i1.SerializableModel {
  LightUserDTO._({
    this.id,
    required this.email,
    required this.fullName,
    required this.initials,
    required this.isActive,
    required this.imageUrl,
    this.userInfoId,
    this.userInfo,
  });

  factory LightUserDTO({
    int? id,
    required String email,
    required String fullName,
    required String initials,
    required bool isActive,
    required String imageUrl,
    int? userInfoId,
    _i2.UserInfo? userInfo,
  }) = _LightUserDTOImpl;

  factory LightUserDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return LightUserDTO(
      id: jsonSerialization['id'] as int?,
      email: jsonSerialization['email'] as String,
      fullName: jsonSerialization['fullName'] as String,
      initials: jsonSerialization['initials'] as String,
      isActive: jsonSerialization['isActive'] as bool,
      imageUrl: jsonSerialization['imageUrl'] as String,
      userInfoId: jsonSerialization['userInfoId'] as int?,
      userInfo: jsonSerialization['userInfo'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['userInfo'] as Map<String, dynamic>)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String email;

  String fullName;

  String initials;

  bool isActive;

  String imageUrl;

  int? userInfoId;

  _i2.UserInfo? userInfo;

  /// Returns a shallow copy of this [LightUserDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  LightUserDTO copyWith({
    int? id,
    String? email,
    String? fullName,
    String? initials,
    bool? isActive,
    String? imageUrl,
    int? userInfoId,
    _i2.UserInfo? userInfo,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'email': email,
      'fullName': fullName,
      'initials': initials,
      'isActive': isActive,
      'imageUrl': imageUrl,
      if (userInfoId != null) 'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LightUserDTOImpl extends LightUserDTO {
  _LightUserDTOImpl({
    int? id,
    required String email,
    required String fullName,
    required String initials,
    required bool isActive,
    required String imageUrl,
    int? userInfoId,
    _i2.UserInfo? userInfo,
  }) : super._(
          id: id,
          email: email,
          fullName: fullName,
          initials: initials,
          isActive: isActive,
          imageUrl: imageUrl,
          userInfoId: userInfoId,
          userInfo: userInfo,
        );

  /// Returns a shallow copy of this [LightUserDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  LightUserDTO copyWith({
    Object? id = _Undefined,
    String? email,
    String? fullName,
    String? initials,
    bool? isActive,
    String? imageUrl,
    Object? userInfoId = _Undefined,
    Object? userInfo = _Undefined,
  }) {
    return LightUserDTO(
      id: id is int? ? id : this.id,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      initials: initials ?? this.initials,
      isActive: isActive ?? this.isActive,
      imageUrl: imageUrl ?? this.imageUrl,
      userInfoId: userInfoId is int? ? userInfoId : this.userInfoId,
      userInfo:
          userInfo is _i2.UserInfo? ? userInfo : this.userInfo?.copyWith(),
    );
  }
}
