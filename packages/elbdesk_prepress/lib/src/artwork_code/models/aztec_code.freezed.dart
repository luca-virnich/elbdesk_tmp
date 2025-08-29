// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'aztec_code.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AztecCode _$AztecCodeFromJson(Map<String, dynamic> json) {
  return _AztecCode.fromJson(json);
}

/// @nodoc
mixin _$AztecCode {
  /// Symbol size (symbolGroesse)
  double? get symbolSize => throw _privateConstructorUsedError;

  /// Error correction level (fehlerKorrektur)
  double? get errorCorrection => throw _privateConstructorUsedError;

  /// Device compensation (geraeteKompensation)
  double? get deviceCompensation => throw _privateConstructorUsedError;

  /// Cell size (zellengroesse)
  double? get cellSize => throw _privateConstructorUsedError;

  /// Serializes this AztecCode to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AztecCode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AztecCodeCopyWith<AztecCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AztecCodeCopyWith<$Res> {
  factory $AztecCodeCopyWith(AztecCode value, $Res Function(AztecCode) then) =
      _$AztecCodeCopyWithImpl<$Res, AztecCode>;
  @useResult
  $Res call(
      {double? symbolSize,
      double? errorCorrection,
      double? deviceCompensation,
      double? cellSize});
}

/// @nodoc
class _$AztecCodeCopyWithImpl<$Res, $Val extends AztecCode>
    implements $AztecCodeCopyWith<$Res> {
  _$AztecCodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AztecCode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbolSize = freezed,
    Object? errorCorrection = freezed,
    Object? deviceCompensation = freezed,
    Object? cellSize = freezed,
  }) {
    return _then(_value.copyWith(
      symbolSize: freezed == symbolSize
          ? _value.symbolSize
          : symbolSize // ignore: cast_nullable_to_non_nullable
              as double?,
      errorCorrection: freezed == errorCorrection
          ? _value.errorCorrection
          : errorCorrection // ignore: cast_nullable_to_non_nullable
              as double?,
      deviceCompensation: freezed == deviceCompensation
          ? _value.deviceCompensation
          : deviceCompensation // ignore: cast_nullable_to_non_nullable
              as double?,
      cellSize: freezed == cellSize
          ? _value.cellSize
          : cellSize // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AztecCodeImplCopyWith<$Res>
    implements $AztecCodeCopyWith<$Res> {
  factory _$$AztecCodeImplCopyWith(
          _$AztecCodeImpl value, $Res Function(_$AztecCodeImpl) then) =
      __$$AztecCodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double? symbolSize,
      double? errorCorrection,
      double? deviceCompensation,
      double? cellSize});
}

/// @nodoc
class __$$AztecCodeImplCopyWithImpl<$Res>
    extends _$AztecCodeCopyWithImpl<$Res, _$AztecCodeImpl>
    implements _$$AztecCodeImplCopyWith<$Res> {
  __$$AztecCodeImplCopyWithImpl(
      _$AztecCodeImpl _value, $Res Function(_$AztecCodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of AztecCode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbolSize = freezed,
    Object? errorCorrection = freezed,
    Object? deviceCompensation = freezed,
    Object? cellSize = freezed,
  }) {
    return _then(_$AztecCodeImpl(
      symbolSize: freezed == symbolSize
          ? _value.symbolSize
          : symbolSize // ignore: cast_nullable_to_non_nullable
              as double?,
      errorCorrection: freezed == errorCorrection
          ? _value.errorCorrection
          : errorCorrection // ignore: cast_nullable_to_non_nullable
              as double?,
      deviceCompensation: freezed == deviceCompensation
          ? _value.deviceCompensation
          : deviceCompensation // ignore: cast_nullable_to_non_nullable
              as double?,
      cellSize: freezed == cellSize
          ? _value.cellSize
          : cellSize // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AztecCodeImpl extends _AztecCode {
  const _$AztecCodeImpl(
      {this.symbolSize,
      this.errorCorrection,
      this.deviceCompensation,
      this.cellSize})
      : super._();

  factory _$AztecCodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$AztecCodeImplFromJson(json);

  /// Symbol size (symbolGroesse)
  @override
  final double? symbolSize;

  /// Error correction level (fehlerKorrektur)
  @override
  final double? errorCorrection;

  /// Device compensation (geraeteKompensation)
  @override
  final double? deviceCompensation;

  /// Cell size (zellengroesse)
  @override
  final double? cellSize;

  @override
  String toString() {
    return 'AztecCode(symbolSize: $symbolSize, errorCorrection: $errorCorrection, deviceCompensation: $deviceCompensation, cellSize: $cellSize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AztecCodeImpl &&
            (identical(other.symbolSize, symbolSize) ||
                other.symbolSize == symbolSize) &&
            (identical(other.errorCorrection, errorCorrection) ||
                other.errorCorrection == errorCorrection) &&
            (identical(other.deviceCompensation, deviceCompensation) ||
                other.deviceCompensation == deviceCompensation) &&
            (identical(other.cellSize, cellSize) ||
                other.cellSize == cellSize));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, symbolSize, errorCorrection, deviceCompensation, cellSize);

  /// Create a copy of AztecCode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AztecCodeImplCopyWith<_$AztecCodeImpl> get copyWith =>
      __$$AztecCodeImplCopyWithImpl<_$AztecCodeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AztecCodeImplToJson(
      this,
    );
  }
}

abstract class _AztecCode extends AztecCode {
  const factory _AztecCode(
      {final double? symbolSize,
      final double? errorCorrection,
      final double? deviceCompensation,
      final double? cellSize}) = _$AztecCodeImpl;
  const _AztecCode._() : super._();

  factory _AztecCode.fromJson(Map<String, dynamic> json) =
      _$AztecCodeImpl.fromJson;

  /// Symbol size (symbolGroesse)
  @override
  double? get symbolSize;

  /// Error correction level (fehlerKorrektur)
  @override
  double? get errorCorrection;

  /// Device compensation (geraeteKompensation)
  @override
  double? get deviceCompensation;

  /// Cell size (zellengroesse)
  @override
  double? get cellSize;

  /// Create a copy of AztecCode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AztecCodeImplCopyWith<_$AztecCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
