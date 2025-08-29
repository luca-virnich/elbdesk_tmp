// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'department_code.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DepartmentCode _$DepartmentCodeFromJson(Map<String, dynamic> json) {
  return _DepartmentCode.fromJson(json);
}

/// @nodoc
mixin _$DepartmentCode {
  String get code => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DataMeta get meta => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  /// Serializes this DepartmentCode to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DepartmentCode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DepartmentCodeCopyWith<DepartmentCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DepartmentCodeCopyWith<$Res> {
  factory $DepartmentCodeCopyWith(
          DepartmentCode value, $Res Function(DepartmentCode) then) =
      _$DepartmentCodeCopyWithImpl<$Res, DepartmentCode>;
  @useResult
  $Res call({String code, String description, DataMeta meta, int? id});

  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$DepartmentCodeCopyWithImpl<$Res, $Val extends DepartmentCode>
    implements $DepartmentCodeCopyWith<$Res> {
  _$DepartmentCodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DepartmentCode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? description = null,
    Object? meta = null,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of DepartmentCode
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
abstract class _$$DepartmentCodeImplCopyWith<$Res>
    implements $DepartmentCodeCopyWith<$Res> {
  factory _$$DepartmentCodeImplCopyWith(_$DepartmentCodeImpl value,
          $Res Function(_$DepartmentCodeImpl) then) =
      __$$DepartmentCodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String description, DataMeta meta, int? id});

  @override
  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$DepartmentCodeImplCopyWithImpl<$Res>
    extends _$DepartmentCodeCopyWithImpl<$Res, _$DepartmentCodeImpl>
    implements _$$DepartmentCodeImplCopyWith<$Res> {
  __$$DepartmentCodeImplCopyWithImpl(
      _$DepartmentCodeImpl _value, $Res Function(_$DepartmentCodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of DepartmentCode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? description = null,
    Object? meta = null,
    Object? id = freezed,
  }) {
    return _then(_$DepartmentCodeImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DepartmentCodeImpl extends _DepartmentCode {
  const _$DepartmentCodeImpl(
      {required this.code,
      required this.description,
      required this.meta,
      this.id})
      : super._();

  factory _$DepartmentCodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$DepartmentCodeImplFromJson(json);

  @override
  final String code;
  @override
  final String description;
  @override
  final DataMeta meta;
  @override
  final int? id;

  @override
  String toString() {
    return 'DepartmentCode(code: $code, description: $description, meta: $meta, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DepartmentCodeImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, description, meta, id);

  /// Create a copy of DepartmentCode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DepartmentCodeImplCopyWith<_$DepartmentCodeImpl> get copyWith =>
      __$$DepartmentCodeImplCopyWithImpl<_$DepartmentCodeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DepartmentCodeImplToJson(
      this,
    );
  }
}

abstract class _DepartmentCode extends DepartmentCode {
  const factory _DepartmentCode(
      {required final String code,
      required final String description,
      required final DataMeta meta,
      final int? id}) = _$DepartmentCodeImpl;
  const _DepartmentCode._() : super._();

  factory _DepartmentCode.fromJson(Map<String, dynamic> json) =
      _$DepartmentCodeImpl.fromJson;

  @override
  String get code;
  @override
  String get description;
  @override
  DataMeta get meta;
  @override
  int? get id;

  /// Create a copy of DepartmentCode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DepartmentCodeImplCopyWith<_$DepartmentCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
