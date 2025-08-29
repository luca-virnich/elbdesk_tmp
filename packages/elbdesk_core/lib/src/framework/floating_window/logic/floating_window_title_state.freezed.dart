// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'floating_window_title_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FloatingWindowTitlebarData {
  String? get title => throw _privateConstructorUsedError;
  String? get baseTitle => throw _privateConstructorUsedError;
  IconData? get icon => throw _privateConstructorUsedError;

  /// Create a copy of FloatingWindowTitlebarData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FloatingWindowTitlebarDataCopyWith<FloatingWindowTitlebarData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FloatingWindowTitlebarDataCopyWith<$Res> {
  factory $FloatingWindowTitlebarDataCopyWith(FloatingWindowTitlebarData value,
          $Res Function(FloatingWindowTitlebarData) then) =
      _$FloatingWindowTitlebarDataCopyWithImpl<$Res,
          FloatingWindowTitlebarData>;
  @useResult
  $Res call({String? title, String? baseTitle, IconData? icon});
}

/// @nodoc
class _$FloatingWindowTitlebarDataCopyWithImpl<$Res,
        $Val extends FloatingWindowTitlebarData>
    implements $FloatingWindowTitlebarDataCopyWith<$Res> {
  _$FloatingWindowTitlebarDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FloatingWindowTitlebarData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? baseTitle = freezed,
    Object? icon = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      baseTitle: freezed == baseTitle
          ? _value.baseTitle
          : baseTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FloatingWindowTitlebarDataImplCopyWith<$Res>
    implements $FloatingWindowTitlebarDataCopyWith<$Res> {
  factory _$$FloatingWindowTitlebarDataImplCopyWith(
          _$FloatingWindowTitlebarDataImpl value,
          $Res Function(_$FloatingWindowTitlebarDataImpl) then) =
      __$$FloatingWindowTitlebarDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? title, String? baseTitle, IconData? icon});
}

/// @nodoc
class __$$FloatingWindowTitlebarDataImplCopyWithImpl<$Res>
    extends _$FloatingWindowTitlebarDataCopyWithImpl<$Res,
        _$FloatingWindowTitlebarDataImpl>
    implements _$$FloatingWindowTitlebarDataImplCopyWith<$Res> {
  __$$FloatingWindowTitlebarDataImplCopyWithImpl(
      _$FloatingWindowTitlebarDataImpl _value,
      $Res Function(_$FloatingWindowTitlebarDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of FloatingWindowTitlebarData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? baseTitle = freezed,
    Object? icon = freezed,
  }) {
    return _then(_$FloatingWindowTitlebarDataImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      baseTitle: freezed == baseTitle
          ? _value.baseTitle
          : baseTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData?,
    ));
  }
}

/// @nodoc

class _$FloatingWindowTitlebarDataImpl extends _FloatingWindowTitlebarData {
  const _$FloatingWindowTitlebarDataImpl(
      {this.title, this.baseTitle, this.icon})
      : super._();

  @override
  final String? title;
  @override
  final String? baseTitle;
  @override
  final IconData? icon;

  @override
  String toString() {
    return 'FloatingWindowTitlebarData(title: $title, baseTitle: $baseTitle, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FloatingWindowTitlebarDataImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.baseTitle, baseTitle) ||
                other.baseTitle == baseTitle) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, baseTitle, icon);

  /// Create a copy of FloatingWindowTitlebarData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FloatingWindowTitlebarDataImplCopyWith<_$FloatingWindowTitlebarDataImpl>
      get copyWith => __$$FloatingWindowTitlebarDataImplCopyWithImpl<
          _$FloatingWindowTitlebarDataImpl>(this, _$identity);
}

abstract class _FloatingWindowTitlebarData extends FloatingWindowTitlebarData {
  const factory _FloatingWindowTitlebarData(
      {final String? title,
      final String? baseTitle,
      final IconData? icon}) = _$FloatingWindowTitlebarDataImpl;
  const _FloatingWindowTitlebarData._() : super._();

  @override
  String? get title;
  @override
  String? get baseTitle;
  @override
  IconData? get icon;

  /// Create a copy of FloatingWindowTitlebarData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FloatingWindowTitlebarDataImplCopyWith<_$FloatingWindowTitlebarDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
