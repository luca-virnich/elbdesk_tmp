// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'artwork_layer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ArtworkLayer _$ArtworkLayerFromJson(Map<String, dynamic> json) {
  return _ArtworkLayer.fromJson(json);
}

/// @nodoc
mixin _$ArtworkLayer {
  String get layerName => throw _privateConstructorUsedError;
  ArtworkLayerType? get layerType => throw _privateConstructorUsedError;
  bool get printable => throw _privateConstructorUsedError;
  bool get locked => throw _privateConstructorUsedError;
  String get runtimeId => throw _privateConstructorUsedError;

  /// Serializes this ArtworkLayer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ArtworkLayer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ArtworkLayerCopyWith<ArtworkLayer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtworkLayerCopyWith<$Res> {
  factory $ArtworkLayerCopyWith(
          ArtworkLayer value, $Res Function(ArtworkLayer) then) =
      _$ArtworkLayerCopyWithImpl<$Res, ArtworkLayer>;
  @useResult
  $Res call(
      {String layerName,
      ArtworkLayerType? layerType,
      bool printable,
      bool locked,
      String runtimeId});
}

/// @nodoc
class _$ArtworkLayerCopyWithImpl<$Res, $Val extends ArtworkLayer>
    implements $ArtworkLayerCopyWith<$Res> {
  _$ArtworkLayerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ArtworkLayer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? layerName = null,
    Object? layerType = freezed,
    Object? printable = null,
    Object? locked = null,
    Object? runtimeId = null,
  }) {
    return _then(_value.copyWith(
      layerName: null == layerName
          ? _value.layerName
          : layerName // ignore: cast_nullable_to_non_nullable
              as String,
      layerType: freezed == layerType
          ? _value.layerType
          : layerType // ignore: cast_nullable_to_non_nullable
              as ArtworkLayerType?,
      printable: null == printable
          ? _value.printable
          : printable // ignore: cast_nullable_to_non_nullable
              as bool,
      locked: null == locked
          ? _value.locked
          : locked // ignore: cast_nullable_to_non_nullable
              as bool,
      runtimeId: null == runtimeId
          ? _value.runtimeId
          : runtimeId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArtworkLayerImplCopyWith<$Res>
    implements $ArtworkLayerCopyWith<$Res> {
  factory _$$ArtworkLayerImplCopyWith(
          _$ArtworkLayerImpl value, $Res Function(_$ArtworkLayerImpl) then) =
      __$$ArtworkLayerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String layerName,
      ArtworkLayerType? layerType,
      bool printable,
      bool locked,
      String runtimeId});
}

/// @nodoc
class __$$ArtworkLayerImplCopyWithImpl<$Res>
    extends _$ArtworkLayerCopyWithImpl<$Res, _$ArtworkLayerImpl>
    implements _$$ArtworkLayerImplCopyWith<$Res> {
  __$$ArtworkLayerImplCopyWithImpl(
      _$ArtworkLayerImpl _value, $Res Function(_$ArtworkLayerImpl) _then)
      : super(_value, _then);

  /// Create a copy of ArtworkLayer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? layerName = null,
    Object? layerType = freezed,
    Object? printable = null,
    Object? locked = null,
    Object? runtimeId = null,
  }) {
    return _then(_$ArtworkLayerImpl(
      layerName: null == layerName
          ? _value.layerName
          : layerName // ignore: cast_nullable_to_non_nullable
              as String,
      layerType: freezed == layerType
          ? _value.layerType
          : layerType // ignore: cast_nullable_to_non_nullable
              as ArtworkLayerType?,
      printable: null == printable
          ? _value.printable
          : printable // ignore: cast_nullable_to_non_nullable
              as bool,
      locked: null == locked
          ? _value.locked
          : locked // ignore: cast_nullable_to_non_nullable
              as bool,
      runtimeId: null == runtimeId
          ? _value.runtimeId
          : runtimeId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArtworkLayerImpl extends _ArtworkLayer {
  const _$ArtworkLayerImpl(
      {required this.layerName,
      required this.layerType,
      required this.printable,
      required this.locked,
      required this.runtimeId})
      : super._();

  factory _$ArtworkLayerImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArtworkLayerImplFromJson(json);

  @override
  final String layerName;
  @override
  final ArtworkLayerType? layerType;
  @override
  final bool printable;
  @override
  final bool locked;
  @override
  final String runtimeId;

  @override
  String toString() {
    return 'ArtworkLayer(layerName: $layerName, layerType: $layerType, printable: $printable, locked: $locked, runtimeId: $runtimeId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtworkLayerImpl &&
            (identical(other.layerName, layerName) ||
                other.layerName == layerName) &&
            (identical(other.layerType, layerType) ||
                other.layerType == layerType) &&
            (identical(other.printable, printable) ||
                other.printable == printable) &&
            (identical(other.locked, locked) || other.locked == locked) &&
            (identical(other.runtimeId, runtimeId) ||
                other.runtimeId == runtimeId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, layerName, layerType, printable, locked, runtimeId);

  /// Create a copy of ArtworkLayer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtworkLayerImplCopyWith<_$ArtworkLayerImpl> get copyWith =>
      __$$ArtworkLayerImplCopyWithImpl<_$ArtworkLayerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArtworkLayerImplToJson(
      this,
    );
  }
}

abstract class _ArtworkLayer extends ArtworkLayer {
  const factory _ArtworkLayer(
      {required final String layerName,
      required final ArtworkLayerType? layerType,
      required final bool printable,
      required final bool locked,
      required final String runtimeId}) = _$ArtworkLayerImpl;
  const _ArtworkLayer._() : super._();

  factory _ArtworkLayer.fromJson(Map<String, dynamic> json) =
      _$ArtworkLayerImpl.fromJson;

  @override
  String get layerName;
  @override
  ArtworkLayerType? get layerType;
  @override
  bool get printable;
  @override
  bool get locked;
  @override
  String get runtimeId;

  /// Create a copy of ArtworkLayer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ArtworkLayerImplCopyWith<_$ArtworkLayerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
