// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'salutation_code.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SalutationCode _$SalutationCodeFromJson(Map<String, dynamic> json) {
  return _SalutationCode.fromJson(json);
}

/// @nodoc
mixin _$SalutationCode {
  String get code => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get isPrimaryPerson => throw _privateConstructorUsedError;
  bool get isPrimaryCompany => throw _privateConstructorUsedError;
  DataMeta get meta => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  /// Serializes this SalutationCode to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SalutationCode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SalutationCodeCopyWith<SalutationCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalutationCodeCopyWith<$Res> {
  factory $SalutationCodeCopyWith(
          SalutationCode value, $Res Function(SalutationCode) then) =
      _$SalutationCodeCopyWithImpl<$Res, SalutationCode>;
  @useResult
  $Res call(
      {String code,
      String description,
      bool isPrimaryPerson,
      bool isPrimaryCompany,
      DataMeta meta,
      int? id});

  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$SalutationCodeCopyWithImpl<$Res, $Val extends SalutationCode>
    implements $SalutationCodeCopyWith<$Res> {
  _$SalutationCodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SalutationCode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? description = null,
    Object? isPrimaryPerson = null,
    Object? isPrimaryCompany = null,
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
      isPrimaryPerson: null == isPrimaryPerson
          ? _value.isPrimaryPerson
          : isPrimaryPerson // ignore: cast_nullable_to_non_nullable
              as bool,
      isPrimaryCompany: null == isPrimaryCompany
          ? _value.isPrimaryCompany
          : isPrimaryCompany // ignore: cast_nullable_to_non_nullable
              as bool,
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

  /// Create a copy of SalutationCode
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
abstract class _$$SalutationCodeImplCopyWith<$Res>
    implements $SalutationCodeCopyWith<$Res> {
  factory _$$SalutationCodeImplCopyWith(_$SalutationCodeImpl value,
          $Res Function(_$SalutationCodeImpl) then) =
      __$$SalutationCodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code,
      String description,
      bool isPrimaryPerson,
      bool isPrimaryCompany,
      DataMeta meta,
      int? id});

  @override
  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$SalutationCodeImplCopyWithImpl<$Res>
    extends _$SalutationCodeCopyWithImpl<$Res, _$SalutationCodeImpl>
    implements _$$SalutationCodeImplCopyWith<$Res> {
  __$$SalutationCodeImplCopyWithImpl(
      _$SalutationCodeImpl _value, $Res Function(_$SalutationCodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalutationCode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? description = null,
    Object? isPrimaryPerson = null,
    Object? isPrimaryCompany = null,
    Object? meta = null,
    Object? id = freezed,
  }) {
    return _then(_$SalutationCodeImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isPrimaryPerson: null == isPrimaryPerson
          ? _value.isPrimaryPerson
          : isPrimaryPerson // ignore: cast_nullable_to_non_nullable
              as bool,
      isPrimaryCompany: null == isPrimaryCompany
          ? _value.isPrimaryCompany
          : isPrimaryCompany // ignore: cast_nullable_to_non_nullable
              as bool,
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
class _$SalutationCodeImpl extends _SalutationCode {
  const _$SalutationCodeImpl(
      {required this.code,
      required this.description,
      required this.isPrimaryPerson,
      required this.isPrimaryCompany,
      required this.meta,
      this.id})
      : super._();

  factory _$SalutationCodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$SalutationCodeImplFromJson(json);

  @override
  final String code;
  @override
  final String description;
  @override
  final bool isPrimaryPerson;
  @override
  final bool isPrimaryCompany;
  @override
  final DataMeta meta;
  @override
  final int? id;

  @override
  String toString() {
    return 'SalutationCode(code: $code, description: $description, isPrimaryPerson: $isPrimaryPerson, isPrimaryCompany: $isPrimaryCompany, meta: $meta, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalutationCodeImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isPrimaryPerson, isPrimaryPerson) ||
                other.isPrimaryPerson == isPrimaryPerson) &&
            (identical(other.isPrimaryCompany, isPrimaryCompany) ||
                other.isPrimaryCompany == isPrimaryCompany) &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, description,
      isPrimaryPerson, isPrimaryCompany, meta, id);

  /// Create a copy of SalutationCode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SalutationCodeImplCopyWith<_$SalutationCodeImpl> get copyWith =>
      __$$SalutationCodeImplCopyWithImpl<_$SalutationCodeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalutationCodeImplToJson(
      this,
    );
  }
}

abstract class _SalutationCode extends SalutationCode {
  const factory _SalutationCode(
      {required final String code,
      required final String description,
      required final bool isPrimaryPerson,
      required final bool isPrimaryCompany,
      required final DataMeta meta,
      final int? id}) = _$SalutationCodeImpl;
  const _SalutationCode._() : super._();

  factory _SalutationCode.fromJson(Map<String, dynamic> json) =
      _$SalutationCodeImpl.fromJson;

  @override
  String get code;
  @override
  String get description;
  @override
  bool get isPrimaryPerson;
  @override
  bool get isPrimaryCompany;
  @override
  DataMeta get meta;
  @override
  int? get id;

  /// Create a copy of SalutationCode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SalutationCodeImplCopyWith<_$SalutationCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
