// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cached_floating_window_constraints_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FloatingWindowConstraints _$FloatingWindowConstraintsFromJson(
    Map<String, dynamic> json) {
  return _FloatingWindowConstraints.fromJson(json);
}

/// @nodoc
mixin _$FloatingWindowConstraints {
  FloatingWindowType get type => throw _privateConstructorUsedError;
  @SizeConverter()
  Size get size => throw _privateConstructorUsedError;
  @OffsetConverter()
  Offset get position => throw _privateConstructorUsedError;

  /// Serializes this FloatingWindowConstraints to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FloatingWindowConstraints
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FloatingWindowConstraintsCopyWith<FloatingWindowConstraints> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FloatingWindowConstraintsCopyWith<$Res> {
  factory $FloatingWindowConstraintsCopyWith(FloatingWindowConstraints value,
          $Res Function(FloatingWindowConstraints) then) =
      _$FloatingWindowConstraintsCopyWithImpl<$Res, FloatingWindowConstraints>;
  @useResult
  $Res call(
      {FloatingWindowType type,
      @SizeConverter() Size size,
      @OffsetConverter() Offset position});
}

/// @nodoc
class _$FloatingWindowConstraintsCopyWithImpl<$Res,
        $Val extends FloatingWindowConstraints>
    implements $FloatingWindowConstraintsCopyWith<$Res> {
  _$FloatingWindowConstraintsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FloatingWindowConstraints
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? size = null,
    Object? position = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FloatingWindowType,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as Size,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Offset,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FloatingWindowConstraintsImplCopyWith<$Res>
    implements $FloatingWindowConstraintsCopyWith<$Res> {
  factory _$$FloatingWindowConstraintsImplCopyWith(
          _$FloatingWindowConstraintsImpl value,
          $Res Function(_$FloatingWindowConstraintsImpl) then) =
      __$$FloatingWindowConstraintsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FloatingWindowType type,
      @SizeConverter() Size size,
      @OffsetConverter() Offset position});
}

/// @nodoc
class __$$FloatingWindowConstraintsImplCopyWithImpl<$Res>
    extends _$FloatingWindowConstraintsCopyWithImpl<$Res,
        _$FloatingWindowConstraintsImpl>
    implements _$$FloatingWindowConstraintsImplCopyWith<$Res> {
  __$$FloatingWindowConstraintsImplCopyWithImpl(
      _$FloatingWindowConstraintsImpl _value,
      $Res Function(_$FloatingWindowConstraintsImpl) _then)
      : super(_value, _then);

  /// Create a copy of FloatingWindowConstraints
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? size = null,
    Object? position = null,
  }) {
    return _then(_$FloatingWindowConstraintsImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FloatingWindowType,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as Size,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Offset,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FloatingWindowConstraintsImpl extends _FloatingWindowConstraints
    with DiagnosticableTreeMixin {
  const _$FloatingWindowConstraintsImpl(
      {required this.type,
      @SizeConverter() required this.size,
      @OffsetConverter() required this.position})
      : super._();

  factory _$FloatingWindowConstraintsImpl.fromJson(Map<String, dynamic> json) =>
      _$$FloatingWindowConstraintsImplFromJson(json);

  @override
  final FloatingWindowType type;
  @override
  @SizeConverter()
  final Size size;
  @override
  @OffsetConverter()
  final Offset position;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FloatingWindowConstraints(type: $type, size: $size, position: $position)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FloatingWindowConstraints'))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('size', size))
      ..add(DiagnosticsProperty('position', position));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FloatingWindowConstraintsImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, size, position);

  /// Create a copy of FloatingWindowConstraints
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FloatingWindowConstraintsImplCopyWith<_$FloatingWindowConstraintsImpl>
      get copyWith => __$$FloatingWindowConstraintsImplCopyWithImpl<
          _$FloatingWindowConstraintsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FloatingWindowConstraintsImplToJson(
      this,
    );
  }
}

abstract class _FloatingWindowConstraints extends FloatingWindowConstraints {
  const factory _FloatingWindowConstraints(
          {required final FloatingWindowType type,
          @SizeConverter() required final Size size,
          @OffsetConverter() required final Offset position}) =
      _$FloatingWindowConstraintsImpl;
  const _FloatingWindowConstraints._() : super._();

  factory _FloatingWindowConstraints.fromJson(Map<String, dynamic> json) =
      _$FloatingWindowConstraintsImpl.fromJson;

  @override
  FloatingWindowType get type;
  @override
  @SizeConverter()
  Size get size;
  @override
  @OffsetConverter()
  Offset get position;

  /// Create a copy of FloatingWindowConstraints
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FloatingWindowConstraintsImplCopyWith<_$FloatingWindowConstraintsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
