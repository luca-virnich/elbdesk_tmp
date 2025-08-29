// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_user_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ServiceUserToken _$ServiceUserTokenFromJson(Map<String, dynamic> json) {
  return _ServiceUserToken.fromJson(json);
}

/// @nodoc
mixin _$ServiceUserToken {
  DataMeta get meta => throw _privateConstructorUsedError;
  AuthKey? get authKey => throw _privateConstructorUsedError;
  String get tokenDescription => throw _privateConstructorUsedError;

  /// Serializes this ServiceUserToken to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ServiceUserToken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServiceUserTokenCopyWith<ServiceUserToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceUserTokenCopyWith<$Res> {
  factory $ServiceUserTokenCopyWith(
          ServiceUserToken value, $Res Function(ServiceUserToken) then) =
      _$ServiceUserTokenCopyWithImpl<$Res, ServiceUserToken>;
  @useResult
  $Res call({DataMeta meta, AuthKey? authKey, String tokenDescription});

  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$ServiceUserTokenCopyWithImpl<$Res, $Val extends ServiceUserToken>
    implements $ServiceUserTokenCopyWith<$Res> {
  _$ServiceUserTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServiceUserToken
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = null,
    Object? authKey = freezed,
    Object? tokenDescription = null,
  }) {
    return _then(_value.copyWith(
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
      authKey: freezed == authKey
          ? _value.authKey
          : authKey // ignore: cast_nullable_to_non_nullable
              as AuthKey?,
      tokenDescription: null == tokenDescription
          ? _value.tokenDescription
          : tokenDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of ServiceUserToken
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
abstract class _$$ServiceUserTokenImplCopyWith<$Res>
    implements $ServiceUserTokenCopyWith<$Res> {
  factory _$$ServiceUserTokenImplCopyWith(_$ServiceUserTokenImpl value,
          $Res Function(_$ServiceUserTokenImpl) then) =
      __$$ServiceUserTokenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DataMeta meta, AuthKey? authKey, String tokenDescription});

  @override
  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$ServiceUserTokenImplCopyWithImpl<$Res>
    extends _$ServiceUserTokenCopyWithImpl<$Res, _$ServiceUserTokenImpl>
    implements _$$ServiceUserTokenImplCopyWith<$Res> {
  __$$ServiceUserTokenImplCopyWithImpl(_$ServiceUserTokenImpl _value,
      $Res Function(_$ServiceUserTokenImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServiceUserToken
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = null,
    Object? authKey = freezed,
    Object? tokenDescription = null,
  }) {
    return _then(_$ServiceUserTokenImpl(
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
      authKey: freezed == authKey
          ? _value.authKey
          : authKey // ignore: cast_nullable_to_non_nullable
              as AuthKey?,
      tokenDescription: null == tokenDescription
          ? _value.tokenDescription
          : tokenDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceUserTokenImpl extends _ServiceUserToken {
  const _$ServiceUserTokenImpl(
      {required this.meta,
      required this.authKey,
      required this.tokenDescription})
      : super._();

  factory _$ServiceUserTokenImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceUserTokenImplFromJson(json);

  @override
  final DataMeta meta;
  @override
  final AuthKey? authKey;
  @override
  final String tokenDescription;

  @override
  String toString() {
    return 'ServiceUserToken(meta: $meta, authKey: $authKey, tokenDescription: $tokenDescription)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceUserTokenImpl &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.authKey, authKey) || other.authKey == authKey) &&
            (identical(other.tokenDescription, tokenDescription) ||
                other.tokenDescription == tokenDescription));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, meta, authKey, tokenDescription);

  /// Create a copy of ServiceUserToken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceUserTokenImplCopyWith<_$ServiceUserTokenImpl> get copyWith =>
      __$$ServiceUserTokenImplCopyWithImpl<_$ServiceUserTokenImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceUserTokenImplToJson(
      this,
    );
  }
}

abstract class _ServiceUserToken extends ServiceUserToken {
  const factory _ServiceUserToken(
      {required final DataMeta meta,
      required final AuthKey? authKey,
      required final String tokenDescription}) = _$ServiceUserTokenImpl;
  const _ServiceUserToken._() : super._();

  factory _ServiceUserToken.fromJson(Map<String, dynamic> json) =
      _$ServiceUserTokenImpl.fromJson;

  @override
  DataMeta get meta;
  @override
  AuthKey? get authKey;
  @override
  String get tokenDescription;

  /// Create a copy of ServiceUserToken
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServiceUserTokenImplCopyWith<_$ServiceUserTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
