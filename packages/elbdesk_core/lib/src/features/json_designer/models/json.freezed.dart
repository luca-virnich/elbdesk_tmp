// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'json.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Json _$JsonFromJson(Map<String, dynamic> json) {
  return _Json.fromJson(json);
}

/// @nodoc
mixin _$Json {
  String get name => throw _privateConstructorUsedError;
  JsonFieldType get type => throw _privateConstructorUsedError;
  String get jsonKey => throw _privateConstructorUsedError;
  dynamic get jsonValue => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  Map<String, Json>? get children => throw _privateConstructorUsedError;

  /// Serializes this Json to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Json
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JsonCopyWith<Json> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JsonCopyWith<$Res> {
  factory $JsonCopyWith(Json value, $Res Function(Json) then) =
      _$JsonCopyWithImpl<$Res, Json>;
  @useResult
  $Res call(
      {String name,
      JsonFieldType type,
      String jsonKey,
      dynamic jsonValue,
      String uuid,
      Map<String, Json>? children});
}

/// @nodoc
class _$JsonCopyWithImpl<$Res, $Val extends Json>
    implements $JsonCopyWith<$Res> {
  _$JsonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Json
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? jsonKey = null,
    Object? jsonValue = freezed,
    Object? uuid = null,
    Object? children = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as JsonFieldType,
      jsonKey: null == jsonKey
          ? _value.jsonKey
          : jsonKey // ignore: cast_nullable_to_non_nullable
              as String,
      jsonValue: freezed == jsonValue
          ? _value.jsonValue
          : jsonValue // ignore: cast_nullable_to_non_nullable
              as dynamic,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      children: freezed == children
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as Map<String, Json>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JsonImplCopyWith<$Res> implements $JsonCopyWith<$Res> {
  factory _$$JsonImplCopyWith(
          _$JsonImpl value, $Res Function(_$JsonImpl) then) =
      __$$JsonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      JsonFieldType type,
      String jsonKey,
      dynamic jsonValue,
      String uuid,
      Map<String, Json>? children});
}

/// @nodoc
class __$$JsonImplCopyWithImpl<$Res>
    extends _$JsonCopyWithImpl<$Res, _$JsonImpl>
    implements _$$JsonImplCopyWith<$Res> {
  __$$JsonImplCopyWithImpl(_$JsonImpl _value, $Res Function(_$JsonImpl) _then)
      : super(_value, _then);

  /// Create a copy of Json
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? jsonKey = null,
    Object? jsonValue = freezed,
    Object? uuid = null,
    Object? children = freezed,
  }) {
    return _then(_$JsonImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as JsonFieldType,
      jsonKey: null == jsonKey
          ? _value.jsonKey
          : jsonKey // ignore: cast_nullable_to_non_nullable
              as String,
      jsonValue: freezed == jsonValue
          ? _value.jsonValue
          : jsonValue // ignore: cast_nullable_to_non_nullable
              as dynamic,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      children: freezed == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as Map<String, Json>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JsonImpl extends _Json {
  _$JsonImpl(
      {required this.name,
      required this.type,
      required this.jsonKey,
      required this.jsonValue,
      required this.uuid,
      final Map<String, Json>? children})
      : _children = children,
        super._();

  factory _$JsonImpl.fromJson(Map<String, dynamic> json) =>
      _$$JsonImplFromJson(json);

  @override
  final String name;
  @override
  final JsonFieldType type;
  @override
  final String jsonKey;
  @override
  final dynamic jsonValue;
  @override
  final String uuid;
  final Map<String, Json>? _children;
  @override
  Map<String, Json>? get children {
    final value = _children;
    if (value == null) return null;
    if (_children is EqualUnmodifiableMapView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'Json(name: $name, type: $type, jsonKey: $jsonKey, jsonValue: $jsonValue, uuid: $uuid, children: $children)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JsonImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.jsonKey, jsonKey) || other.jsonKey == jsonKey) &&
            const DeepCollectionEquality().equals(other.jsonValue, jsonValue) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            const DeepCollectionEquality().equals(other._children, _children));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      type,
      jsonKey,
      const DeepCollectionEquality().hash(jsonValue),
      uuid,
      const DeepCollectionEquality().hash(_children));

  /// Create a copy of Json
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JsonImplCopyWith<_$JsonImpl> get copyWith =>
      __$$JsonImplCopyWithImpl<_$JsonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JsonImplToJson(
      this,
    );
  }
}

abstract class _Json extends Json {
  factory _Json(
      {required final String name,
      required final JsonFieldType type,
      required final String jsonKey,
      required final dynamic jsonValue,
      required final String uuid,
      final Map<String, Json>? children}) = _$JsonImpl;
  _Json._() : super._();

  factory _Json.fromJson(Map<String, dynamic> json) = _$JsonImpl.fromJson;

  @override
  String get name;
  @override
  JsonFieldType get type;
  @override
  String get jsonKey;
  @override
  dynamic get jsonValue;
  @override
  String get uuid;
  @override
  Map<String, Json>? get children;

  /// Create a copy of Json
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JsonImplCopyWith<_$JsonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
