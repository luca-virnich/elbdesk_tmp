// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'light_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LightUser _$LightUserFromJson(Map<String, dynamic> json) {
  return _LightUser.fromJson(json);
}

/// @nodoc
mixin _$LightUser {
  String get email => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get initials => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  int get userInfoId => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  int get lightUserId => throw _privateConstructorUsedError;

  /// Serializes this LightUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LightUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LightUserCopyWith<LightUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LightUserCopyWith<$Res> {
  factory $LightUserCopyWith(LightUser value, $Res Function(LightUser) then) =
      _$LightUserCopyWithImpl<$Res, LightUser>;
  @useResult
  $Res call(
      {String email,
      String fullName,
      String initials,
      String imageUrl,
      int userInfoId,
      bool isActive,
      int lightUserId});
}

/// @nodoc
class _$LightUserCopyWithImpl<$Res, $Val extends LightUser>
    implements $LightUserCopyWith<$Res> {
  _$LightUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LightUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? fullName = null,
    Object? initials = null,
    Object? imageUrl = null,
    Object? userInfoId = null,
    Object? isActive = null,
    Object? lightUserId = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      initials: null == initials
          ? _value.initials
          : initials // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      userInfoId: null == userInfoId
          ? _value.userInfoId
          : userInfoId // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      lightUserId: null == lightUserId
          ? _value.lightUserId
          : lightUserId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LightUserImplCopyWith<$Res>
    implements $LightUserCopyWith<$Res> {
  factory _$$LightUserImplCopyWith(
          _$LightUserImpl value, $Res Function(_$LightUserImpl) then) =
      __$$LightUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String fullName,
      String initials,
      String imageUrl,
      int userInfoId,
      bool isActive,
      int lightUserId});
}

/// @nodoc
class __$$LightUserImplCopyWithImpl<$Res>
    extends _$LightUserCopyWithImpl<$Res, _$LightUserImpl>
    implements _$$LightUserImplCopyWith<$Res> {
  __$$LightUserImplCopyWithImpl(
      _$LightUserImpl _value, $Res Function(_$LightUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of LightUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? fullName = null,
    Object? initials = null,
    Object? imageUrl = null,
    Object? userInfoId = null,
    Object? isActive = null,
    Object? lightUserId = null,
  }) {
    return _then(_$LightUserImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      initials: null == initials
          ? _value.initials
          : initials // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      userInfoId: null == userInfoId
          ? _value.userInfoId
          : userInfoId // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      lightUserId: null == lightUserId
          ? _value.lightUserId
          : lightUserId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LightUserImpl extends _LightUser {
  const _$LightUserImpl(
      {required this.email,
      required this.fullName,
      required this.initials,
      required this.imageUrl,
      required this.userInfoId,
      required this.isActive,
      required this.lightUserId})
      : super._();

  factory _$LightUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$LightUserImplFromJson(json);

  @override
  final String email;
  @override
  final String fullName;
  @override
  final String initials;
  @override
  final String imageUrl;
  @override
  final int userInfoId;
  @override
  final bool isActive;
  @override
  final int lightUserId;

  @override
  String toString() {
    return 'LightUser(email: $email, fullName: $fullName, initials: $initials, imageUrl: $imageUrl, userInfoId: $userInfoId, isActive: $isActive, lightUserId: $lightUserId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LightUserImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.initials, initials) ||
                other.initials == initials) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.userInfoId, userInfoId) ||
                other.userInfoId == userInfoId) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.lightUserId, lightUserId) ||
                other.lightUserId == lightUserId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, fullName, initials,
      imageUrl, userInfoId, isActive, lightUserId);

  /// Create a copy of LightUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LightUserImplCopyWith<_$LightUserImpl> get copyWith =>
      __$$LightUserImplCopyWithImpl<_$LightUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LightUserImplToJson(
      this,
    );
  }
}

abstract class _LightUser extends LightUser {
  const factory _LightUser(
      {required final String email,
      required final String fullName,
      required final String initials,
      required final String imageUrl,
      required final int userInfoId,
      required final bool isActive,
      required final int lightUserId}) = _$LightUserImpl;
  const _LightUser._() : super._();

  factory _LightUser.fromJson(Map<String, dynamic> json) =
      _$LightUserImpl.fromJson;

  @override
  String get email;
  @override
  String get fullName;
  @override
  String get initials;
  @override
  String get imageUrl;
  @override
  int get userInfoId;
  @override
  bool get isActive;
  @override
  int get lightUserId;

  /// Create a copy of LightUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LightUserImplCopyWith<_$LightUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
