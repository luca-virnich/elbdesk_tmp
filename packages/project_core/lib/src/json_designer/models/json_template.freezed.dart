// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'json_template.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

JsonTemplate _$JsonTemplateFromJson(Map<String, dynamic> json) {
  return _JsonTemplate.fromJson(json);
}

/// @nodoc
mixin _$JsonTemplate {
  int? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  JsonTemplateType get type => throw _privateConstructorUsedError;
  Json get jsonTree => throw _privateConstructorUsedError;
  DataMeta get meta => throw _privateConstructorUsedError;

  /// Serializes this JsonTemplate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JsonTemplate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JsonTemplateCopyWith<JsonTemplate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JsonTemplateCopyWith<$Res> {
  factory $JsonTemplateCopyWith(
          JsonTemplate value, $Res Function(JsonTemplate) then) =
      _$JsonTemplateCopyWithImpl<$Res, JsonTemplate>;
  @useResult
  $Res call(
      {int? id,
      String name,
      JsonTemplateType type,
      Json jsonTree,
      DataMeta meta});

  $JsonCopyWith<$Res> get jsonTree;
  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$JsonTemplateCopyWithImpl<$Res, $Val extends JsonTemplate>
    implements $JsonTemplateCopyWith<$Res> {
  _$JsonTemplateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JsonTemplate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? type = null,
    Object? jsonTree = null,
    Object? meta = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as JsonTemplateType,
      jsonTree: null == jsonTree
          ? _value.jsonTree
          : jsonTree // ignore: cast_nullable_to_non_nullable
              as Json,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
    ) as $Val);
  }

  /// Create a copy of JsonTemplate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $JsonCopyWith<$Res> get jsonTree {
    return $JsonCopyWith<$Res>(_value.jsonTree, (value) {
      return _then(_value.copyWith(jsonTree: value) as $Val);
    });
  }

  /// Create a copy of JsonTemplate
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
abstract class _$$JsonTemplateImplCopyWith<$Res>
    implements $JsonTemplateCopyWith<$Res> {
  factory _$$JsonTemplateImplCopyWith(
          _$JsonTemplateImpl value, $Res Function(_$JsonTemplateImpl) then) =
      __$$JsonTemplateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String name,
      JsonTemplateType type,
      Json jsonTree,
      DataMeta meta});

  @override
  $JsonCopyWith<$Res> get jsonTree;
  @override
  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$JsonTemplateImplCopyWithImpl<$Res>
    extends _$JsonTemplateCopyWithImpl<$Res, _$JsonTemplateImpl>
    implements _$$JsonTemplateImplCopyWith<$Res> {
  __$$JsonTemplateImplCopyWithImpl(
      _$JsonTemplateImpl _value, $Res Function(_$JsonTemplateImpl) _then)
      : super(_value, _then);

  /// Create a copy of JsonTemplate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? type = null,
    Object? jsonTree = null,
    Object? meta = null,
  }) {
    return _then(_$JsonTemplateImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as JsonTemplateType,
      jsonTree: null == jsonTree
          ? _value.jsonTree
          : jsonTree // ignore: cast_nullable_to_non_nullable
              as Json,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JsonTemplateImpl extends _JsonTemplate {
  _$JsonTemplateImpl(
      {required this.id,
      required this.name,
      required this.type,
      required this.jsonTree,
      required this.meta})
      : super._();

  factory _$JsonTemplateImpl.fromJson(Map<String, dynamic> json) =>
      _$$JsonTemplateImplFromJson(json);

  @override
  final int? id;
  @override
  final String name;
  @override
  final JsonTemplateType type;
  @override
  final Json jsonTree;
  @override
  final DataMeta meta;

  @override
  String toString() {
    return 'JsonTemplate(id: $id, name: $name, type: $type, jsonTree: $jsonTree, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JsonTemplateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.jsonTree, jsonTree) ||
                other.jsonTree == jsonTree) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, type, jsonTree, meta);

  /// Create a copy of JsonTemplate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JsonTemplateImplCopyWith<_$JsonTemplateImpl> get copyWith =>
      __$$JsonTemplateImplCopyWithImpl<_$JsonTemplateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JsonTemplateImplToJson(
      this,
    );
  }
}

abstract class _JsonTemplate extends JsonTemplate {
  factory _JsonTemplate(
      {required final int? id,
      required final String name,
      required final JsonTemplateType type,
      required final Json jsonTree,
      required final DataMeta meta}) = _$JsonTemplateImpl;
  _JsonTemplate._() : super._();

  factory _JsonTemplate.fromJson(Map<String, dynamic> json) =
      _$JsonTemplateImpl.fromJson;

  @override
  int? get id;
  @override
  String get name;
  @override
  JsonTemplateType get type;
  @override
  Json get jsonTree;
  @override
  DataMeta get meta;

  /// Create a copy of JsonTemplate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JsonTemplateImplCopyWith<_$JsonTemplateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
