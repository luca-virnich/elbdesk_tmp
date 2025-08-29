// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recent_window.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RecentWindow {
  String get type => throw _privateConstructorUsedError;
  int? get entityId => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  Map<String, dynamic>? get additionalData =>
      throw _privateConstructorUsedError;

  /// Create a copy of RecentWindow
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecentWindowCopyWith<RecentWindow> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentWindowCopyWith<$Res> {
  factory $RecentWindowCopyWith(
          RecentWindow value, $Res Function(RecentWindow) then) =
      _$RecentWindowCopyWithImpl<$Res, RecentWindow>;
  @useResult
  $Res call(
      {String type,
      int? entityId,
      String label,
      Map<String, dynamic>? additionalData});
}

/// @nodoc
class _$RecentWindowCopyWithImpl<$Res, $Val extends RecentWindow>
    implements $RecentWindowCopyWith<$Res> {
  _$RecentWindowCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecentWindow
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? entityId = freezed,
    Object? label = null,
    Object? additionalData = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      entityId: freezed == entityId
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as int?,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      additionalData: freezed == additionalData
          ? _value.additionalData
          : additionalData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecentWindowImplCopyWith<$Res>
    implements $RecentWindowCopyWith<$Res> {
  factory _$$RecentWindowImplCopyWith(
          _$RecentWindowImpl value, $Res Function(_$RecentWindowImpl) then) =
      __$$RecentWindowImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String type,
      int? entityId,
      String label,
      Map<String, dynamic>? additionalData});
}

/// @nodoc
class __$$RecentWindowImplCopyWithImpl<$Res>
    extends _$RecentWindowCopyWithImpl<$Res, _$RecentWindowImpl>
    implements _$$RecentWindowImplCopyWith<$Res> {
  __$$RecentWindowImplCopyWithImpl(
      _$RecentWindowImpl _value, $Res Function(_$RecentWindowImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecentWindow
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? entityId = freezed,
    Object? label = null,
    Object? additionalData = freezed,
  }) {
    return _then(_$RecentWindowImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      entityId: freezed == entityId
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as int?,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      additionalData: freezed == additionalData
          ? _value._additionalData
          : additionalData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc

class _$RecentWindowImpl extends _RecentWindow {
  _$RecentWindowImpl(
      {required this.type,
      required this.entityId,
      required this.label,
      final Map<String, dynamic>? additionalData})
      : _additionalData = additionalData,
        super._();

  @override
  final String type;
  @override
  final int? entityId;
  @override
  final String label;
  final Map<String, dynamic>? _additionalData;
  @override
  Map<String, dynamic>? get additionalData {
    final value = _additionalData;
    if (value == null) return null;
    if (_additionalData is EqualUnmodifiableMapView) return _additionalData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'RecentWindow(type: $type, entityId: $entityId, label: $label, additionalData: $additionalData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecentWindowImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.entityId, entityId) ||
                other.entityId == entityId) &&
            (identical(other.label, label) || other.label == label) &&
            const DeepCollectionEquality()
                .equals(other._additionalData, _additionalData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, entityId, label,
      const DeepCollectionEquality().hash(_additionalData));

  /// Create a copy of RecentWindow
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecentWindowImplCopyWith<_$RecentWindowImpl> get copyWith =>
      __$$RecentWindowImplCopyWithImpl<_$RecentWindowImpl>(this, _$identity);
}

abstract class _RecentWindow extends RecentWindow {
  factory _RecentWindow(
      {required final String type,
      required final int? entityId,
      required final String label,
      final Map<String, dynamic>? additionalData}) = _$RecentWindowImpl;
  _RecentWindow._() : super._();

  @override
  String get type;
  @override
  int? get entityId;
  @override
  String get label;
  @override
  Map<String, dynamic>? get additionalData;

  /// Create a copy of RecentWindow
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecentWindowImplCopyWith<_$RecentWindowImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
