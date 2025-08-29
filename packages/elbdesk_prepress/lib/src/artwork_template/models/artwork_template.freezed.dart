// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'artwork_template.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ArtworkTemplate _$ArtworkTemplateFromJson(Map<String, dynamic> json) {
  return _ArtworkTemplate.fromJson(json);
}

/// @nodoc
mixin _$ArtworkTemplate {
  String get description => throw _privateConstructorUsedError;
  Customer? get customer => throw _privateConstructorUsedError;
  ArtworkTemplatePreSelection get artworkTemplatePreSelection =>
      throw _privateConstructorUsedError;
  ArtworkTemplateSelection get artworkTemplateSelection =>
      throw _privateConstructorUsedError;
  DataMeta get meta => throw _privateConstructorUsedError;
  Trapping get trapping => throw _privateConstructorUsedError;
  double get anschnitt => throw _privateConstructorUsedError;
  List<ArtworkColor> get colors => throw _privateConstructorUsedError;
  List<ArtworkLayer> get layers => throw _privateConstructorUsedError;

  /// Serializes this ArtworkTemplate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ArtworkTemplate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ArtworkTemplateCopyWith<ArtworkTemplate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtworkTemplateCopyWith<$Res> {
  factory $ArtworkTemplateCopyWith(
          ArtworkTemplate value, $Res Function(ArtworkTemplate) then) =
      _$ArtworkTemplateCopyWithImpl<$Res, ArtworkTemplate>;
  @useResult
  $Res call(
      {String description,
      Customer? customer,
      ArtworkTemplatePreSelection artworkTemplatePreSelection,
      ArtworkTemplateSelection artworkTemplateSelection,
      DataMeta meta,
      Trapping trapping,
      double anschnitt,
      List<ArtworkColor> colors,
      List<ArtworkLayer> layers});

  $CustomerCopyWith<$Res>? get customer;
  $ArtworkTemplatePreSelectionCopyWith<$Res> get artworkTemplatePreSelection;
  $ArtworkTemplateSelectionCopyWith<$Res> get artworkTemplateSelection;
  $DataMetaCopyWith<$Res> get meta;
  $TrappingCopyWith<$Res> get trapping;
}

/// @nodoc
class _$ArtworkTemplateCopyWithImpl<$Res, $Val extends ArtworkTemplate>
    implements $ArtworkTemplateCopyWith<$Res> {
  _$ArtworkTemplateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ArtworkTemplate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? customer = freezed,
    Object? artworkTemplatePreSelection = null,
    Object? artworkTemplateSelection = null,
    Object? meta = null,
    Object? trapping = null,
    Object? anschnitt = null,
    Object? colors = null,
    Object? layers = null,
  }) {
    return _then(_value.copyWith(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
      artworkTemplatePreSelection: null == artworkTemplatePreSelection
          ? _value.artworkTemplatePreSelection
          : artworkTemplatePreSelection // ignore: cast_nullable_to_non_nullable
              as ArtworkTemplatePreSelection,
      artworkTemplateSelection: null == artworkTemplateSelection
          ? _value.artworkTemplateSelection
          : artworkTemplateSelection // ignore: cast_nullable_to_non_nullable
              as ArtworkTemplateSelection,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
      trapping: null == trapping
          ? _value.trapping
          : trapping // ignore: cast_nullable_to_non_nullable
              as Trapping,
      anschnitt: null == anschnitt
          ? _value.anschnitt
          : anschnitt // ignore: cast_nullable_to_non_nullable
              as double,
      colors: null == colors
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as List<ArtworkColor>,
      layers: null == layers
          ? _value.layers
          : layers // ignore: cast_nullable_to_non_nullable
              as List<ArtworkLayer>,
    ) as $Val);
  }

  /// Create a copy of ArtworkTemplate
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

  /// Create a copy of ArtworkTemplate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ArtworkTemplatePreSelectionCopyWith<$Res> get artworkTemplatePreSelection {
    return $ArtworkTemplatePreSelectionCopyWith<$Res>(
        _value.artworkTemplatePreSelection, (value) {
      return _then(_value.copyWith(artworkTemplatePreSelection: value) as $Val);
    });
  }

  /// Create a copy of ArtworkTemplate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ArtworkTemplateSelectionCopyWith<$Res> get artworkTemplateSelection {
    return $ArtworkTemplateSelectionCopyWith<$Res>(
        _value.artworkTemplateSelection, (value) {
      return _then(_value.copyWith(artworkTemplateSelection: value) as $Val);
    });
  }

  /// Create a copy of ArtworkTemplate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataMetaCopyWith<$Res> get meta {
    return $DataMetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }

  /// Create a copy of ArtworkTemplate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TrappingCopyWith<$Res> get trapping {
    return $TrappingCopyWith<$Res>(_value.trapping, (value) {
      return _then(_value.copyWith(trapping: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ArtworkTemplateImplCopyWith<$Res>
    implements $ArtworkTemplateCopyWith<$Res> {
  factory _$$ArtworkTemplateImplCopyWith(_$ArtworkTemplateImpl value,
          $Res Function(_$ArtworkTemplateImpl) then) =
      __$$ArtworkTemplateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String description,
      Customer? customer,
      ArtworkTemplatePreSelection artworkTemplatePreSelection,
      ArtworkTemplateSelection artworkTemplateSelection,
      DataMeta meta,
      Trapping trapping,
      double anschnitt,
      List<ArtworkColor> colors,
      List<ArtworkLayer> layers});

  @override
  $CustomerCopyWith<$Res>? get customer;
  @override
  $ArtworkTemplatePreSelectionCopyWith<$Res> get artworkTemplatePreSelection;
  @override
  $ArtworkTemplateSelectionCopyWith<$Res> get artworkTemplateSelection;
  @override
  $DataMetaCopyWith<$Res> get meta;
  @override
  $TrappingCopyWith<$Res> get trapping;
}

/// @nodoc
class __$$ArtworkTemplateImplCopyWithImpl<$Res>
    extends _$ArtworkTemplateCopyWithImpl<$Res, _$ArtworkTemplateImpl>
    implements _$$ArtworkTemplateImplCopyWith<$Res> {
  __$$ArtworkTemplateImplCopyWithImpl(
      _$ArtworkTemplateImpl _value, $Res Function(_$ArtworkTemplateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ArtworkTemplate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? customer = freezed,
    Object? artworkTemplatePreSelection = null,
    Object? artworkTemplateSelection = null,
    Object? meta = null,
    Object? trapping = null,
    Object? anschnitt = null,
    Object? colors = null,
    Object? layers = null,
  }) {
    return _then(_$ArtworkTemplateImpl(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
      artworkTemplatePreSelection: null == artworkTemplatePreSelection
          ? _value.artworkTemplatePreSelection
          : artworkTemplatePreSelection // ignore: cast_nullable_to_non_nullable
              as ArtworkTemplatePreSelection,
      artworkTemplateSelection: null == artworkTemplateSelection
          ? _value.artworkTemplateSelection
          : artworkTemplateSelection // ignore: cast_nullable_to_non_nullable
              as ArtworkTemplateSelection,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
      trapping: null == trapping
          ? _value.trapping
          : trapping // ignore: cast_nullable_to_non_nullable
              as Trapping,
      anschnitt: null == anschnitt
          ? _value.anschnitt
          : anschnitt // ignore: cast_nullable_to_non_nullable
              as double,
      colors: null == colors
          ? _value._colors
          : colors // ignore: cast_nullable_to_non_nullable
              as List<ArtworkColor>,
      layers: null == layers
          ? _value._layers
          : layers // ignore: cast_nullable_to_non_nullable
              as List<ArtworkLayer>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArtworkTemplateImpl extends _ArtworkTemplate {
  const _$ArtworkTemplateImpl(
      {required this.description,
      required this.customer,
      required this.artworkTemplatePreSelection,
      required this.artworkTemplateSelection,
      required this.meta,
      required this.trapping,
      required this.anschnitt,
      required final List<ArtworkColor> colors,
      required final List<ArtworkLayer> layers})
      : _colors = colors,
        _layers = layers,
        super._();

  factory _$ArtworkTemplateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArtworkTemplateImplFromJson(json);

  @override
  final String description;
  @override
  final Customer? customer;
  @override
  final ArtworkTemplatePreSelection artworkTemplatePreSelection;
  @override
  final ArtworkTemplateSelection artworkTemplateSelection;
  @override
  final DataMeta meta;
  @override
  final Trapping trapping;
  @override
  final double anschnitt;
  final List<ArtworkColor> _colors;
  @override
  List<ArtworkColor> get colors {
    if (_colors is EqualUnmodifiableListView) return _colors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_colors);
  }

  final List<ArtworkLayer> _layers;
  @override
  List<ArtworkLayer> get layers {
    if (_layers is EqualUnmodifiableListView) return _layers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_layers);
  }

  @override
  String toString() {
    return 'ArtworkTemplate(description: $description, customer: $customer, artworkTemplatePreSelection: $artworkTemplatePreSelection, artworkTemplateSelection: $artworkTemplateSelection, meta: $meta, trapping: $trapping, anschnitt: $anschnitt, colors: $colors, layers: $layers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtworkTemplateImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.artworkTemplatePreSelection,
                    artworkTemplatePreSelection) ||
                other.artworkTemplatePreSelection ==
                    artworkTemplatePreSelection) &&
            (identical(
                    other.artworkTemplateSelection, artworkTemplateSelection) ||
                other.artworkTemplateSelection == artworkTemplateSelection) &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.trapping, trapping) ||
                other.trapping == trapping) &&
            (identical(other.anschnitt, anschnitt) ||
                other.anschnitt == anschnitt) &&
            const DeepCollectionEquality().equals(other._colors, _colors) &&
            const DeepCollectionEquality().equals(other._layers, _layers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      description,
      customer,
      artworkTemplatePreSelection,
      artworkTemplateSelection,
      meta,
      trapping,
      anschnitt,
      const DeepCollectionEquality().hash(_colors),
      const DeepCollectionEquality().hash(_layers));

  /// Create a copy of ArtworkTemplate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtworkTemplateImplCopyWith<_$ArtworkTemplateImpl> get copyWith =>
      __$$ArtworkTemplateImplCopyWithImpl<_$ArtworkTemplateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArtworkTemplateImplToJson(
      this,
    );
  }
}

abstract class _ArtworkTemplate extends ArtworkTemplate {
  const factory _ArtworkTemplate(
      {required final String description,
      required final Customer? customer,
      required final ArtworkTemplatePreSelection artworkTemplatePreSelection,
      required final ArtworkTemplateSelection artworkTemplateSelection,
      required final DataMeta meta,
      required final Trapping trapping,
      required final double anschnitt,
      required final List<ArtworkColor> colors,
      required final List<ArtworkLayer> layers}) = _$ArtworkTemplateImpl;
  const _ArtworkTemplate._() : super._();

  factory _ArtworkTemplate.fromJson(Map<String, dynamic> json) =
      _$ArtworkTemplateImpl.fromJson;

  @override
  String get description;
  @override
  Customer? get customer;
  @override
  ArtworkTemplatePreSelection get artworkTemplatePreSelection;
  @override
  ArtworkTemplateSelection get artworkTemplateSelection;
  @override
  DataMeta get meta;
  @override
  Trapping get trapping;
  @override
  double get anschnitt;
  @override
  List<ArtworkColor> get colors;
  @override
  List<ArtworkLayer> get layers;

  /// Create a copy of ArtworkTemplate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ArtworkTemplateImplCopyWith<_$ArtworkTemplateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
