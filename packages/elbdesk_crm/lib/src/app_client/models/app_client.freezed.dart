// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_client.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppClient _$AppClientFromJson(Map<String, dynamic> json) {
  return _AppClient.fromJson(json);
}

/// @nodoc
mixin _$AppClient {
  Contact? get contact => throw _privateConstructorUsedError;
  String get automationEngine => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DataMeta get meta => throw _privateConstructorUsedError;

  /// Serializes this AppClient to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppClient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppClientCopyWith<AppClient> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppClientCopyWith<$Res> {
  factory $AppClientCopyWith(AppClient value, $Res Function(AppClient) then) =
      _$AppClientCopyWithImpl<$Res, AppClient>;
  @useResult
  $Res call(
      {Contact? contact,
      String automationEngine,
      String description,
      DataMeta meta});

  $ContactCopyWith<$Res>? get contact;
  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$AppClientCopyWithImpl<$Res, $Val extends AppClient>
    implements $AppClientCopyWith<$Res> {
  _$AppClientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppClient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contact = freezed,
    Object? automationEngine = null,
    Object? description = null,
    Object? meta = null,
  }) {
    return _then(_value.copyWith(
      contact: freezed == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as Contact?,
      automationEngine: null == automationEngine
          ? _value.automationEngine
          : automationEngine // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
    ) as $Val);
  }

  /// Create a copy of AppClient
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContactCopyWith<$Res>? get contact {
    if (_value.contact == null) {
      return null;
    }

    return $ContactCopyWith<$Res>(_value.contact!, (value) {
      return _then(_value.copyWith(contact: value) as $Val);
    });
  }

  /// Create a copy of AppClient
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
abstract class _$$AppClientImplCopyWith<$Res>
    implements $AppClientCopyWith<$Res> {
  factory _$$AppClientImplCopyWith(
          _$AppClientImpl value, $Res Function(_$AppClientImpl) then) =
      __$$AppClientImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Contact? contact,
      String automationEngine,
      String description,
      DataMeta meta});

  @override
  $ContactCopyWith<$Res>? get contact;
  @override
  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$AppClientImplCopyWithImpl<$Res>
    extends _$AppClientCopyWithImpl<$Res, _$AppClientImpl>
    implements _$$AppClientImplCopyWith<$Res> {
  __$$AppClientImplCopyWithImpl(
      _$AppClientImpl _value, $Res Function(_$AppClientImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppClient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contact = freezed,
    Object? automationEngine = null,
    Object? description = null,
    Object? meta = null,
  }) {
    return _then(_$AppClientImpl(
      contact: freezed == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as Contact?,
      automationEngine: null == automationEngine
          ? _value.automationEngine
          : automationEngine // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppClientImpl extends _AppClient {
  const _$AppClientImpl(
      {required this.contact,
      required this.automationEngine,
      required this.description,
      required this.meta})
      : super._();

  factory _$AppClientImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppClientImplFromJson(json);

  @override
  final Contact? contact;
  @override
  final String automationEngine;
  @override
  final String description;
  @override
  final DataMeta meta;

  @override
  String toString() {
    return 'AppClient(contact: $contact, automationEngine: $automationEngine, description: $description, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppClientImpl &&
            (identical(other.contact, contact) || other.contact == contact) &&
            (identical(other.automationEngine, automationEngine) ||
                other.automationEngine == automationEngine) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, contact, automationEngine, description, meta);

  /// Create a copy of AppClient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppClientImplCopyWith<_$AppClientImpl> get copyWith =>
      __$$AppClientImplCopyWithImpl<_$AppClientImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppClientImplToJson(
      this,
    );
  }
}

abstract class _AppClient extends AppClient {
  const factory _AppClient(
      {required final Contact? contact,
      required final String automationEngine,
      required final String description,
      required final DataMeta meta}) = _$AppClientImpl;
  const _AppClient._() : super._();

  factory _AppClient.fromJson(Map<String, dynamic> json) =
      _$AppClientImpl.fromJson;

  @override
  Contact? get contact;
  @override
  String get automationEngine;
  @override
  String get description;
  @override
  DataMeta get meta;

  /// Create a copy of AppClient
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppClientImplCopyWith<_$AppClientImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
