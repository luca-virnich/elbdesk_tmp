// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ribbon_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RibbonConfig {
  bool get useSmallRibbons => throw _privateConstructorUsedError;
  bool get hideRibbons => throw _privateConstructorUsedError;

  /// Create a copy of RibbonConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RibbonConfigCopyWith<RibbonConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RibbonConfigCopyWith<$Res> {
  factory $RibbonConfigCopyWith(
          RibbonConfig value, $Res Function(RibbonConfig) then) =
      _$RibbonConfigCopyWithImpl<$Res, RibbonConfig>;
  @useResult
  $Res call({bool useSmallRibbons, bool hideRibbons});
}

/// @nodoc
class _$RibbonConfigCopyWithImpl<$Res, $Val extends RibbonConfig>
    implements $RibbonConfigCopyWith<$Res> {
  _$RibbonConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RibbonConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? useSmallRibbons = null,
    Object? hideRibbons = null,
  }) {
    return _then(_value.copyWith(
      useSmallRibbons: null == useSmallRibbons
          ? _value.useSmallRibbons
          : useSmallRibbons // ignore: cast_nullable_to_non_nullable
              as bool,
      hideRibbons: null == hideRibbons
          ? _value.hideRibbons
          : hideRibbons // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RibbonConfigImplCopyWith<$Res>
    implements $RibbonConfigCopyWith<$Res> {
  factory _$$RibbonConfigImplCopyWith(
          _$RibbonConfigImpl value, $Res Function(_$RibbonConfigImpl) then) =
      __$$RibbonConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool useSmallRibbons, bool hideRibbons});
}

/// @nodoc
class __$$RibbonConfigImplCopyWithImpl<$Res>
    extends _$RibbonConfigCopyWithImpl<$Res, _$RibbonConfigImpl>
    implements _$$RibbonConfigImplCopyWith<$Res> {
  __$$RibbonConfigImplCopyWithImpl(
      _$RibbonConfigImpl _value, $Res Function(_$RibbonConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of RibbonConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? useSmallRibbons = null,
    Object? hideRibbons = null,
  }) {
    return _then(_$RibbonConfigImpl(
      useSmallRibbons: null == useSmallRibbons
          ? _value.useSmallRibbons
          : useSmallRibbons // ignore: cast_nullable_to_non_nullable
              as bool,
      hideRibbons: null == hideRibbons
          ? _value.hideRibbons
          : hideRibbons // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$RibbonConfigImpl extends _RibbonConfig {
  const _$RibbonConfigImpl(
      {required this.useSmallRibbons, required this.hideRibbons})
      : super._();

  @override
  final bool useSmallRibbons;
  @override
  final bool hideRibbons;

  @override
  String toString() {
    return 'RibbonConfig(useSmallRibbons: $useSmallRibbons, hideRibbons: $hideRibbons)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RibbonConfigImpl &&
            (identical(other.useSmallRibbons, useSmallRibbons) ||
                other.useSmallRibbons == useSmallRibbons) &&
            (identical(other.hideRibbons, hideRibbons) ||
                other.hideRibbons == hideRibbons));
  }

  @override
  int get hashCode => Object.hash(runtimeType, useSmallRibbons, hideRibbons);

  /// Create a copy of RibbonConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RibbonConfigImplCopyWith<_$RibbonConfigImpl> get copyWith =>
      __$$RibbonConfigImplCopyWithImpl<_$RibbonConfigImpl>(this, _$identity);
}

abstract class _RibbonConfig extends RibbonConfig {
  const factory _RibbonConfig(
      {required final bool useSmallRibbons,
      required final bool hideRibbons}) = _$RibbonConfigImpl;
  const _RibbonConfig._() : super._();

  @override
  bool get useSmallRibbons;
  @override
  bool get hideRibbons;

  /// Create a copy of RibbonConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RibbonConfigImplCopyWith<_$RibbonConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
