// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'floating_window_resizing.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FloatingWindowResizeData {
  String get windowId => throw _privateConstructorUsedError;
  MouseCursor get mouseCursor => throw _privateConstructorUsedError;
  FloatingWindowResizeType get handleType => throw _privateConstructorUsedError;

  /// Create a copy of FloatingWindowResizeData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FloatingWindowResizeDataCopyWith<FloatingWindowResizeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FloatingWindowResizeDataCopyWith<$Res> {
  factory $FloatingWindowResizeDataCopyWith(FloatingWindowResizeData value,
          $Res Function(FloatingWindowResizeData) then) =
      _$FloatingWindowResizeDataCopyWithImpl<$Res, FloatingWindowResizeData>;
  @useResult
  $Res call(
      {String windowId,
      MouseCursor mouseCursor,
      FloatingWindowResizeType handleType});
}

/// @nodoc
class _$FloatingWindowResizeDataCopyWithImpl<$Res,
        $Val extends FloatingWindowResizeData>
    implements $FloatingWindowResizeDataCopyWith<$Res> {
  _$FloatingWindowResizeDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FloatingWindowResizeData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? windowId = null,
    Object? mouseCursor = null,
    Object? handleType = null,
  }) {
    return _then(_value.copyWith(
      windowId: null == windowId
          ? _value.windowId
          : windowId // ignore: cast_nullable_to_non_nullable
              as String,
      mouseCursor: null == mouseCursor
          ? _value.mouseCursor
          : mouseCursor // ignore: cast_nullable_to_non_nullable
              as MouseCursor,
      handleType: null == handleType
          ? _value.handleType
          : handleType // ignore: cast_nullable_to_non_nullable
              as FloatingWindowResizeType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FloatingWindowResizeDataImplCopyWith<$Res>
    implements $FloatingWindowResizeDataCopyWith<$Res> {
  factory _$$FloatingWindowResizeDataImplCopyWith(
          _$FloatingWindowResizeDataImpl value,
          $Res Function(_$FloatingWindowResizeDataImpl) then) =
      __$$FloatingWindowResizeDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String windowId,
      MouseCursor mouseCursor,
      FloatingWindowResizeType handleType});
}

/// @nodoc
class __$$FloatingWindowResizeDataImplCopyWithImpl<$Res>
    extends _$FloatingWindowResizeDataCopyWithImpl<$Res,
        _$FloatingWindowResizeDataImpl>
    implements _$$FloatingWindowResizeDataImplCopyWith<$Res> {
  __$$FloatingWindowResizeDataImplCopyWithImpl(
      _$FloatingWindowResizeDataImpl _value,
      $Res Function(_$FloatingWindowResizeDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of FloatingWindowResizeData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? windowId = null,
    Object? mouseCursor = null,
    Object? handleType = null,
  }) {
    return _then(_$FloatingWindowResizeDataImpl(
      windowId: null == windowId
          ? _value.windowId
          : windowId // ignore: cast_nullable_to_non_nullable
              as String,
      mouseCursor: null == mouseCursor
          ? _value.mouseCursor
          : mouseCursor // ignore: cast_nullable_to_non_nullable
              as MouseCursor,
      handleType: null == handleType
          ? _value.handleType
          : handleType // ignore: cast_nullable_to_non_nullable
              as FloatingWindowResizeType,
    ));
  }
}

/// @nodoc

class _$FloatingWindowResizeDataImpl extends _FloatingWindowResizeData {
  const _$FloatingWindowResizeDataImpl(
      {required this.windowId,
      required this.mouseCursor,
      required this.handleType})
      : super._();

  @override
  final String windowId;
  @override
  final MouseCursor mouseCursor;
  @override
  final FloatingWindowResizeType handleType;

  @override
  String toString() {
    return 'FloatingWindowResizeData(windowId: $windowId, mouseCursor: $mouseCursor, handleType: $handleType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FloatingWindowResizeDataImpl &&
            (identical(other.windowId, windowId) ||
                other.windowId == windowId) &&
            (identical(other.mouseCursor, mouseCursor) ||
                other.mouseCursor == mouseCursor) &&
            (identical(other.handleType, handleType) ||
                other.handleType == handleType));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, windowId, mouseCursor, handleType);

  /// Create a copy of FloatingWindowResizeData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FloatingWindowResizeDataImplCopyWith<_$FloatingWindowResizeDataImpl>
      get copyWith => __$$FloatingWindowResizeDataImplCopyWithImpl<
          _$FloatingWindowResizeDataImpl>(this, _$identity);
}

abstract class _FloatingWindowResizeData extends FloatingWindowResizeData {
  const factory _FloatingWindowResizeData(
          {required final String windowId,
          required final MouseCursor mouseCursor,
          required final FloatingWindowResizeType handleType}) =
      _$FloatingWindowResizeDataImpl;
  const _FloatingWindowResizeData._() : super._();

  @override
  String get windowId;
  @override
  MouseCursor get mouseCursor;
  @override
  FloatingWindowResizeType get handleType;

  /// Create a copy of FloatingWindowResizeData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FloatingWindowResizeDataImplCopyWith<_$FloatingWindowResizeDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
