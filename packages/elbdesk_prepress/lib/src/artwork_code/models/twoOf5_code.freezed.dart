// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'twoOf5_code.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TwoOf5Code _$TwoOf5CodeFromJson(Map<String, dynamic> json) {
  return _TwoOf5Code.fromJson(json);
}

/// @nodoc
mixin _$TwoOf5Code {
  /// Id of the artwork code
  /// Bar width reduction (strichbreitenReduzierung)
  double? get barWidthReduction => throw _privateConstructorUsedError;

  /// Device compensation (geraeteKompensation)
  double? get deviceCompensation => throw _privateConstructorUsedError;

  /// Narrow bar width (schmalerStrich)
  double? get narrowBarWidth => throw _privateConstructorUsedError;

  /// Aspect ratio (verhaeltnis)
  double? get aspectRatio => throw _privateConstructorUsedError;

  /// Serializes this TwoOf5Code to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TwoOf5Code
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TwoOf5CodeCopyWith<TwoOf5Code> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TwoOf5CodeCopyWith<$Res> {
  factory $TwoOf5CodeCopyWith(
          TwoOf5Code value, $Res Function(TwoOf5Code) then) =
      _$TwoOf5CodeCopyWithImpl<$Res, TwoOf5Code>;
  @useResult
  $Res call(
      {double? barWidthReduction,
      double? deviceCompensation,
      double? narrowBarWidth,
      double? aspectRatio});
}

/// @nodoc
class _$TwoOf5CodeCopyWithImpl<$Res, $Val extends TwoOf5Code>
    implements $TwoOf5CodeCopyWith<$Res> {
  _$TwoOf5CodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TwoOf5Code
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? barWidthReduction = freezed,
    Object? deviceCompensation = freezed,
    Object? narrowBarWidth = freezed,
    Object? aspectRatio = freezed,
  }) {
    return _then(_value.copyWith(
      barWidthReduction: freezed == barWidthReduction
          ? _value.barWidthReduction
          : barWidthReduction // ignore: cast_nullable_to_non_nullable
              as double?,
      deviceCompensation: freezed == deviceCompensation
          ? _value.deviceCompensation
          : deviceCompensation // ignore: cast_nullable_to_non_nullable
              as double?,
      narrowBarWidth: freezed == narrowBarWidth
          ? _value.narrowBarWidth
          : narrowBarWidth // ignore: cast_nullable_to_non_nullable
              as double?,
      aspectRatio: freezed == aspectRatio
          ? _value.aspectRatio
          : aspectRatio // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TwoOf5CodeImplCopyWith<$Res>
    implements $TwoOf5CodeCopyWith<$Res> {
  factory _$$TwoOf5CodeImplCopyWith(
          _$TwoOf5CodeImpl value, $Res Function(_$TwoOf5CodeImpl) then) =
      __$$TwoOf5CodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double? barWidthReduction,
      double? deviceCompensation,
      double? narrowBarWidth,
      double? aspectRatio});
}

/// @nodoc
class __$$TwoOf5CodeImplCopyWithImpl<$Res>
    extends _$TwoOf5CodeCopyWithImpl<$Res, _$TwoOf5CodeImpl>
    implements _$$TwoOf5CodeImplCopyWith<$Res> {
  __$$TwoOf5CodeImplCopyWithImpl(
      _$TwoOf5CodeImpl _value, $Res Function(_$TwoOf5CodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of TwoOf5Code
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? barWidthReduction = freezed,
    Object? deviceCompensation = freezed,
    Object? narrowBarWidth = freezed,
    Object? aspectRatio = freezed,
  }) {
    return _then(_$TwoOf5CodeImpl(
      barWidthReduction: freezed == barWidthReduction
          ? _value.barWidthReduction
          : barWidthReduction // ignore: cast_nullable_to_non_nullable
              as double?,
      deviceCompensation: freezed == deviceCompensation
          ? _value.deviceCompensation
          : deviceCompensation // ignore: cast_nullable_to_non_nullable
              as double?,
      narrowBarWidth: freezed == narrowBarWidth
          ? _value.narrowBarWidth
          : narrowBarWidth // ignore: cast_nullable_to_non_nullable
              as double?,
      aspectRatio: freezed == aspectRatio
          ? _value.aspectRatio
          : aspectRatio // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TwoOf5CodeImpl extends _TwoOf5Code {
  const _$TwoOf5CodeImpl(
      {this.barWidthReduction,
      this.deviceCompensation,
      this.narrowBarWidth,
      this.aspectRatio})
      : super._();

  factory _$TwoOf5CodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$TwoOf5CodeImplFromJson(json);

  /// Id of the artwork code
  /// Bar width reduction (strichbreitenReduzierung)
  @override
  final double? barWidthReduction;

  /// Device compensation (geraeteKompensation)
  @override
  final double? deviceCompensation;

  /// Narrow bar width (schmalerStrich)
  @override
  final double? narrowBarWidth;

  /// Aspect ratio (verhaeltnis)
  @override
  final double? aspectRatio;

  @override
  String toString() {
    return 'TwoOf5Code(barWidthReduction: $barWidthReduction, deviceCompensation: $deviceCompensation, narrowBarWidth: $narrowBarWidth, aspectRatio: $aspectRatio)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TwoOf5CodeImpl &&
            (identical(other.barWidthReduction, barWidthReduction) ||
                other.barWidthReduction == barWidthReduction) &&
            (identical(other.deviceCompensation, deviceCompensation) ||
                other.deviceCompensation == deviceCompensation) &&
            (identical(other.narrowBarWidth, narrowBarWidth) ||
                other.narrowBarWidth == narrowBarWidth) &&
            (identical(other.aspectRatio, aspectRatio) ||
                other.aspectRatio == aspectRatio));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, barWidthReduction,
      deviceCompensation, narrowBarWidth, aspectRatio);

  /// Create a copy of TwoOf5Code
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TwoOf5CodeImplCopyWith<_$TwoOf5CodeImpl> get copyWith =>
      __$$TwoOf5CodeImplCopyWithImpl<_$TwoOf5CodeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TwoOf5CodeImplToJson(
      this,
    );
  }
}

abstract class _TwoOf5Code extends TwoOf5Code {
  const factory _TwoOf5Code(
      {final double? barWidthReduction,
      final double? deviceCompensation,
      final double? narrowBarWidth,
      final double? aspectRatio}) = _$TwoOf5CodeImpl;
  const _TwoOf5Code._() : super._();

  factory _TwoOf5Code.fromJson(Map<String, dynamic> json) =
      _$TwoOf5CodeImpl.fromJson;

  /// Id of the artwork code
  /// Bar width reduction (strichbreitenReduzierung)
  @override
  double? get barWidthReduction;

  /// Device compensation (geraeteKompensation)
  @override
  double? get deviceCompensation;

  /// Narrow bar width (schmalerStrich)
  @override
  double? get narrowBarWidth;

  /// Aspect ratio (verhaeltnis)
  @override
  double? get aspectRatio;

  /// Create a copy of TwoOf5Code
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TwoOf5CodeImplCopyWith<_$TwoOf5CodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
