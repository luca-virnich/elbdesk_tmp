// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ServiceUser _$ServiceUserFromJson(Map<String, dynamic> json) {
  return _ServiceUser.fromJson(json);
}

/// @nodoc
mixin _$ServiceUser {
  DataMeta get meta => throw _privateConstructorUsedError;
  UserInfo get userInfo => throw _privateConstructorUsedError;
  String get serviceName => throw _privateConstructorUsedError;
  String get serviceDescription => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  List<ServiceUserToken> get tokens => throw _privateConstructorUsedError;

  /// Serializes this ServiceUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ServiceUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServiceUserCopyWith<ServiceUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceUserCopyWith<$Res> {
  factory $ServiceUserCopyWith(
          ServiceUser value, $Res Function(ServiceUser) then) =
      _$ServiceUserCopyWithImpl<$Res, ServiceUser>;
  @useResult
  $Res call(
      {DataMeta meta,
      UserInfo userInfo,
      String serviceName,
      String serviceDescription,
      bool isActive,
      List<ServiceUserToken> tokens});

  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$ServiceUserCopyWithImpl<$Res, $Val extends ServiceUser>
    implements $ServiceUserCopyWith<$Res> {
  _$ServiceUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServiceUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = null,
    Object? userInfo = null,
    Object? serviceName = null,
    Object? serviceDescription = null,
    Object? isActive = null,
    Object? tokens = null,
  }) {
    return _then(_value.copyWith(
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
      userInfo: null == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfo,
      serviceName: null == serviceName
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      serviceDescription: null == serviceDescription
          ? _value.serviceDescription
          : serviceDescription // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      tokens: null == tokens
          ? _value.tokens
          : tokens // ignore: cast_nullable_to_non_nullable
              as List<ServiceUserToken>,
    ) as $Val);
  }

  /// Create a copy of ServiceUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataMetaCopyWith<$Res> get meta {
    return $DataMetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ServiceUserImplCopyWith<$Res>
    implements $ServiceUserCopyWith<$Res> {
  factory _$$ServiceUserImplCopyWith(
          _$ServiceUserImpl value, $Res Function(_$ServiceUserImpl) then) =
      __$$ServiceUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DataMeta meta,
      UserInfo userInfo,
      String serviceName,
      String serviceDescription,
      bool isActive,
      List<ServiceUserToken> tokens});

  @override
  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$ServiceUserImplCopyWithImpl<$Res>
    extends _$ServiceUserCopyWithImpl<$Res, _$ServiceUserImpl>
    implements _$$ServiceUserImplCopyWith<$Res> {
  __$$ServiceUserImplCopyWithImpl(
      _$ServiceUserImpl _value, $Res Function(_$ServiceUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServiceUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = null,
    Object? userInfo = null,
    Object? serviceName = null,
    Object? serviceDescription = null,
    Object? isActive = null,
    Object? tokens = null,
  }) {
    return _then(_$ServiceUserImpl(
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
      userInfo: null == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfo,
      serviceName: null == serviceName
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      serviceDescription: null == serviceDescription
          ? _value.serviceDescription
          : serviceDescription // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      tokens: null == tokens
          ? _value._tokens
          : tokens // ignore: cast_nullable_to_non_nullable
              as List<ServiceUserToken>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceUserImpl extends _ServiceUser {
  const _$ServiceUserImpl(
      {required this.meta,
      required this.userInfo,
      required this.serviceName,
      required this.serviceDescription,
      required this.isActive,
      required final List<ServiceUserToken> tokens})
      : _tokens = tokens,
        super._();

  factory _$ServiceUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceUserImplFromJson(json);

  @override
  final DataMeta meta;
  @override
  final UserInfo userInfo;
  @override
  final String serviceName;
  @override
  final String serviceDescription;
  @override
  final bool isActive;
  final List<ServiceUserToken> _tokens;
  @override
  List<ServiceUserToken> get tokens {
    if (_tokens is EqualUnmodifiableListView) return _tokens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tokens);
  }

  @override
  String toString() {
    return 'ServiceUser(meta: $meta, userInfo: $userInfo, serviceName: $serviceName, serviceDescription: $serviceDescription, isActive: $isActive, tokens: $tokens)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceUserImpl &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo) &&
            (identical(other.serviceName, serviceName) ||
                other.serviceName == serviceName) &&
            (identical(other.serviceDescription, serviceDescription) ||
                other.serviceDescription == serviceDescription) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality().equals(other._tokens, _tokens));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      meta,
      userInfo,
      serviceName,
      serviceDescription,
      isActive,
      const DeepCollectionEquality().hash(_tokens));

  /// Create a copy of ServiceUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceUserImplCopyWith<_$ServiceUserImpl> get copyWith =>
      __$$ServiceUserImplCopyWithImpl<_$ServiceUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceUserImplToJson(
      this,
    );
  }
}

abstract class _ServiceUser extends ServiceUser {
  const factory _ServiceUser(
      {required final DataMeta meta,
      required final UserInfo userInfo,
      required final String serviceName,
      required final String serviceDescription,
      required final bool isActive,
      required final List<ServiceUserToken> tokens}) = _$ServiceUserImpl;
  const _ServiceUser._() : super._();

  factory _ServiceUser.fromJson(Map<String, dynamic> json) =
      _$ServiceUserImpl.fromJson;

  @override
  DataMeta get meta;
  @override
  UserInfo get userInfo;
  @override
  String get serviceName;
  @override
  String get serviceDescription;
  @override
  bool get isActive;
  @override
  List<ServiceUserToken> get tokens;

  /// Create a copy of ServiceUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServiceUserImplCopyWith<_$ServiceUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
