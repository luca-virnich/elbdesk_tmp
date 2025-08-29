// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'language_code.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LanguageCode _$LanguageCodeFromJson(Map<String, dynamic> json) {
  return _LanguageCode.fromJson(json);
}

/// @nodoc
mixin _$LanguageCode {
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DataMeta get meta => throw _privateConstructorUsedError;
  bool get isPrimary => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  /// Serializes this LanguageCode to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LanguageCode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LanguageCodeCopyWith<LanguageCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LanguageCodeCopyWith<$Res> {
  factory $LanguageCodeCopyWith(
          LanguageCode value, $Res Function(LanguageCode) then) =
      _$LanguageCodeCopyWithImpl<$Res, LanguageCode>;
  @useResult
  $Res call({String code, String name, DataMeta meta, bool isPrimary, int? id});

  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$LanguageCodeCopyWithImpl<$Res, $Val extends LanguageCode>
    implements $LanguageCodeCopyWith<$Res> {
  _$LanguageCodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LanguageCode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? meta = null,
    Object? isPrimary = null,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
      isPrimary: null == isPrimary
          ? _value.isPrimary
          : isPrimary // ignore: cast_nullable_to_non_nullable
              as bool,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of LanguageCode
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
abstract class _$$LanguageCodeImplCopyWith<$Res>
    implements $LanguageCodeCopyWith<$Res> {
  factory _$$LanguageCodeImplCopyWith(
          _$LanguageCodeImpl value, $Res Function(_$LanguageCodeImpl) then) =
      __$$LanguageCodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String name, DataMeta meta, bool isPrimary, int? id});

  @override
  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$LanguageCodeImplCopyWithImpl<$Res>
    extends _$LanguageCodeCopyWithImpl<$Res, _$LanguageCodeImpl>
    implements _$$LanguageCodeImplCopyWith<$Res> {
  __$$LanguageCodeImplCopyWithImpl(
      _$LanguageCodeImpl _value, $Res Function(_$LanguageCodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of LanguageCode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? meta = null,
    Object? isPrimary = null,
    Object? id = freezed,
  }) {
    return _then(_$LanguageCodeImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
      isPrimary: null == isPrimary
          ? _value.isPrimary
          : isPrimary // ignore: cast_nullable_to_non_nullable
              as bool,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LanguageCodeImpl extends _LanguageCode {
  const _$LanguageCodeImpl(
      {required this.code,
      required this.name,
      required this.meta,
      required this.isPrimary,
      this.id})
      : super._();

  factory _$LanguageCodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$LanguageCodeImplFromJson(json);

  @override
  final String code;
  @override
  final String name;
  @override
  final DataMeta meta;
  @override
  final bool isPrimary;
  @override
  final int? id;

  @override
  String toString() {
    return 'LanguageCode(code: $code, name: $name, meta: $meta, isPrimary: $isPrimary, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LanguageCodeImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.isPrimary, isPrimary) ||
                other.isPrimary == isPrimary) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, name, meta, isPrimary, id);

  /// Create a copy of LanguageCode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LanguageCodeImplCopyWith<_$LanguageCodeImpl> get copyWith =>
      __$$LanguageCodeImplCopyWithImpl<_$LanguageCodeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LanguageCodeImplToJson(
      this,
    );
  }
}

abstract class _LanguageCode extends LanguageCode {
  const factory _LanguageCode(
      {required final String code,
      required final String name,
      required final DataMeta meta,
      required final bool isPrimary,
      final int? id}) = _$LanguageCodeImpl;
  const _LanguageCode._() : super._();

  factory _LanguageCode.fromJson(Map<String, dynamic> json) =
      _$LanguageCodeImpl.fromJson;

  @override
  String get code;
  @override
  String get name;
  @override
  DataMeta get meta;
  @override
  bool get isPrimary;
  @override
  int? get id;

  /// Create a copy of LanguageCode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LanguageCodeImplCopyWith<_$LanguageCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
