// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prepress_color_palette.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PrepressColorPalette _$PrepressColorPaletteFromJson(Map<String, dynamic> json) {
  return _PrepressColorPalette.fromJson(json);
}

/// @nodoc
mixin _$PrepressColorPalette {
  String get paletteName => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<ArtworkColor>? get colors => throw _privateConstructorUsedError;
  DataMeta get meta => throw _privateConstructorUsedError;
  Customer? get customer => throw _privateConstructorUsedError;

  /// Serializes this PrepressColorPalette to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrepressColorPalette
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrepressColorPaletteCopyWith<PrepressColorPalette> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrepressColorPaletteCopyWith<$Res> {
  factory $PrepressColorPaletteCopyWith(PrepressColorPalette value,
          $Res Function(PrepressColorPalette) then) =
      _$PrepressColorPaletteCopyWithImpl<$Res, PrepressColorPalette>;
  @useResult
  $Res call(
      {String paletteName,
      String description,
      List<ArtworkColor>? colors,
      DataMeta meta,
      Customer? customer});

  $DataMetaCopyWith<$Res> get meta;
  $CustomerCopyWith<$Res>? get customer;
}

/// @nodoc
class _$PrepressColorPaletteCopyWithImpl<$Res,
        $Val extends PrepressColorPalette>
    implements $PrepressColorPaletteCopyWith<$Res> {
  _$PrepressColorPaletteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrepressColorPalette
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paletteName = null,
    Object? description = null,
    Object? colors = freezed,
    Object? meta = null,
    Object? customer = freezed,
  }) {
    return _then(_value.copyWith(
      paletteName: null == paletteName
          ? _value.paletteName
          : paletteName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      colors: freezed == colors
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as List<ArtworkColor>?,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
    ) as $Val);
  }

  /// Create a copy of PrepressColorPalette
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataMetaCopyWith<$Res> get meta {
    return $DataMetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }

  /// Create a copy of PrepressColorPalette
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerCopyWith<$Res>? get customer {
    if (_value.customer == null) {
      return null;
    }

    return $CustomerCopyWith<$Res>(_value.customer!, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PrepressColorPaletteImplCopyWith<$Res>
    implements $PrepressColorPaletteCopyWith<$Res> {
  factory _$$PrepressColorPaletteImplCopyWith(_$PrepressColorPaletteImpl value,
          $Res Function(_$PrepressColorPaletteImpl) then) =
      __$$PrepressColorPaletteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String paletteName,
      String description,
      List<ArtworkColor>? colors,
      DataMeta meta,
      Customer? customer});

  @override
  $DataMetaCopyWith<$Res> get meta;
  @override
  $CustomerCopyWith<$Res>? get customer;
}

/// @nodoc
class __$$PrepressColorPaletteImplCopyWithImpl<$Res>
    extends _$PrepressColorPaletteCopyWithImpl<$Res, _$PrepressColorPaletteImpl>
    implements _$$PrepressColorPaletteImplCopyWith<$Res> {
  __$$PrepressColorPaletteImplCopyWithImpl(_$PrepressColorPaletteImpl _value,
      $Res Function(_$PrepressColorPaletteImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrepressColorPalette
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paletteName = null,
    Object? description = null,
    Object? colors = freezed,
    Object? meta = null,
    Object? customer = freezed,
  }) {
    return _then(_$PrepressColorPaletteImpl(
      paletteName: null == paletteName
          ? _value.paletteName
          : paletteName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      colors: freezed == colors
          ? _value._colors
          : colors // ignore: cast_nullable_to_non_nullable
              as List<ArtworkColor>?,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PrepressColorPaletteImpl extends _PrepressColorPalette {
  const _$PrepressColorPaletteImpl(
      {required this.paletteName,
      required this.description,
      required final List<ArtworkColor>? colors,
      required this.meta,
      required this.customer})
      : _colors = colors,
        super._();

  factory _$PrepressColorPaletteImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrepressColorPaletteImplFromJson(json);

  @override
  final String paletteName;
  @override
  final String description;
  final List<ArtworkColor>? _colors;
  @override
  List<ArtworkColor>? get colors {
    final value = _colors;
    if (value == null) return null;
    if (_colors is EqualUnmodifiableListView) return _colors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DataMeta meta;
  @override
  final Customer? customer;

  @override
  String toString() {
    return 'PrepressColorPalette(paletteName: $paletteName, description: $description, colors: $colors, meta: $meta, customer: $customer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrepressColorPaletteImpl &&
            (identical(other.paletteName, paletteName) ||
                other.paletteName == paletteName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._colors, _colors) &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.customer, customer) ||
                other.customer == customer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, paletteName, description,
      const DeepCollectionEquality().hash(_colors), meta, customer);

  /// Create a copy of PrepressColorPalette
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrepressColorPaletteImplCopyWith<_$PrepressColorPaletteImpl>
      get copyWith =>
          __$$PrepressColorPaletteImplCopyWithImpl<_$PrepressColorPaletteImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrepressColorPaletteImplToJson(
      this,
    );
  }
}

abstract class _PrepressColorPalette extends PrepressColorPalette {
  const factory _PrepressColorPalette(
      {required final String paletteName,
      required final String description,
      required final List<ArtworkColor>? colors,
      required final DataMeta meta,
      required final Customer? customer}) = _$PrepressColorPaletteImpl;
  const _PrepressColorPalette._() : super._();

  factory _PrepressColorPalette.fromJson(Map<String, dynamic> json) =
      _$PrepressColorPaletteImpl.fromJson;

  @override
  String get paletteName;
  @override
  String get description;
  @override
  List<ArtworkColor>? get colors;
  @override
  DataMeta get meta;
  @override
  Customer? get customer;

  /// Create a copy of PrepressColorPalette
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrepressColorPaletteImplCopyWith<_$PrepressColorPaletteImpl>
      get copyWith => throw _privateConstructorUsedError;
}
