// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'artwork_template_selection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ArtworkTemplateSelection _$ArtworkTemplateSelectionFromJson(
    Map<String, dynamic> json) {
  return _ArtworkTemplateSelection.fromJson(json);
}

/// @nodoc
mixin _$ArtworkTemplateSelection {
  String get description => throw _privateConstructorUsedError;
  DataMeta get meta => throw _privateConstructorUsedError;
  int? get artworkTemplatePreSelectionId => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  /// Serializes this ArtworkTemplateSelection to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ArtworkTemplateSelection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ArtworkTemplateSelectionCopyWith<ArtworkTemplateSelection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtworkTemplateSelectionCopyWith<$Res> {
  factory $ArtworkTemplateSelectionCopyWith(ArtworkTemplateSelection value,
          $Res Function(ArtworkTemplateSelection) then) =
      _$ArtworkTemplateSelectionCopyWithImpl<$Res, ArtworkTemplateSelection>;
  @useResult
  $Res call(
      {String description,
      DataMeta meta,
      int? artworkTemplatePreSelectionId,
      int? id});

  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$ArtworkTemplateSelectionCopyWithImpl<$Res,
        $Val extends ArtworkTemplateSelection>
    implements $ArtworkTemplateSelectionCopyWith<$Res> {
  _$ArtworkTemplateSelectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ArtworkTemplateSelection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? meta = null,
    Object? artworkTemplatePreSelectionId = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
      artworkTemplatePreSelectionId: freezed == artworkTemplatePreSelectionId
          ? _value.artworkTemplatePreSelectionId
          : artworkTemplatePreSelectionId // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of ArtworkTemplateSelection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataMetaCopyWith<$Res> get meta {
    return $DataMetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ArtworkTemplateSelectionImplCopyWith<$Res>
    implements $ArtworkTemplateSelectionCopyWith<$Res> {
  factory _$$ArtworkTemplateSelectionImplCopyWith(
          _$ArtworkTemplateSelectionImpl value,
          $Res Function(_$ArtworkTemplateSelectionImpl) then) =
      __$$ArtworkTemplateSelectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String description,
      DataMeta meta,
      int? artworkTemplatePreSelectionId,
      int? id});

  @override
  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$ArtworkTemplateSelectionImplCopyWithImpl<$Res>
    extends _$ArtworkTemplateSelectionCopyWithImpl<$Res,
        _$ArtworkTemplateSelectionImpl>
    implements _$$ArtworkTemplateSelectionImplCopyWith<$Res> {
  __$$ArtworkTemplateSelectionImplCopyWithImpl(
      _$ArtworkTemplateSelectionImpl _value,
      $Res Function(_$ArtworkTemplateSelectionImpl) _then)
      : super(_value, _then);

  /// Create a copy of ArtworkTemplateSelection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? meta = null,
    Object? artworkTemplatePreSelectionId = freezed,
    Object? id = freezed,
  }) {
    return _then(_$ArtworkTemplateSelectionImpl(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
      artworkTemplatePreSelectionId: freezed == artworkTemplatePreSelectionId
          ? _value.artworkTemplatePreSelectionId
          : artworkTemplatePreSelectionId // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArtworkTemplateSelectionImpl extends _ArtworkTemplateSelection {
  const _$ArtworkTemplateSelectionImpl(
      {required this.description,
      required this.meta,
      this.artworkTemplatePreSelectionId,
      this.id})
      : super._();

  factory _$ArtworkTemplateSelectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArtworkTemplateSelectionImplFromJson(json);

  @override
  final String description;
  @override
  final DataMeta meta;
  @override
  final int? artworkTemplatePreSelectionId;
  @override
  final int? id;

  @override
  String toString() {
    return 'ArtworkTemplateSelection(description: $description, meta: $meta, artworkTemplatePreSelectionId: $artworkTemplatePreSelectionId, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtworkTemplateSelectionImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.artworkTemplatePreSelectionId,
                    artworkTemplatePreSelectionId) ||
                other.artworkTemplatePreSelectionId ==
                    artworkTemplatePreSelectionId) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, description, meta, artworkTemplatePreSelectionId, id);

  /// Create a copy of ArtworkTemplateSelection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtworkTemplateSelectionImplCopyWith<_$ArtworkTemplateSelectionImpl>
      get copyWith => __$$ArtworkTemplateSelectionImplCopyWithImpl<
          _$ArtworkTemplateSelectionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArtworkTemplateSelectionImplToJson(
      this,
    );
  }
}

abstract class _ArtworkTemplateSelection extends ArtworkTemplateSelection {
  const factory _ArtworkTemplateSelection(
      {required final String description,
      required final DataMeta meta,
      final int? artworkTemplatePreSelectionId,
      final int? id}) = _$ArtworkTemplateSelectionImpl;
  const _ArtworkTemplateSelection._() : super._();

  factory _ArtworkTemplateSelection.fromJson(Map<String, dynamic> json) =
      _$ArtworkTemplateSelectionImpl.fromJson;

  @override
  String get description;
  @override
  DataMeta get meta;
  @override
  int? get artworkTemplatePreSelectionId;
  @override
  int? get id;

  /// Create a copy of ArtworkTemplateSelection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ArtworkTemplateSelectionImplCopyWith<_$ArtworkTemplateSelectionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
