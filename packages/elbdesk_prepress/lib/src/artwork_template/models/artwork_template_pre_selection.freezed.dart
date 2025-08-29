// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'artwork_template_pre_selection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ArtworkTemplatePreSelection _$ArtworkTemplatePreSelectionFromJson(
    Map<String, dynamic> json) {
  return _ArtworkTemplatePreSelection.fromJson(json);
}

/// @nodoc
mixin _$ArtworkTemplatePreSelection {
  String get description => throw _privateConstructorUsedError;
  DataMeta get meta => throw _privateConstructorUsedError;
  int? get customerId => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  /// Serializes this ArtworkTemplatePreSelection to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ArtworkTemplatePreSelection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ArtworkTemplatePreSelectionCopyWith<ArtworkTemplatePreSelection>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtworkTemplatePreSelectionCopyWith<$Res> {
  factory $ArtworkTemplatePreSelectionCopyWith(
          ArtworkTemplatePreSelection value,
          $Res Function(ArtworkTemplatePreSelection) then) =
      _$ArtworkTemplatePreSelectionCopyWithImpl<$Res,
          ArtworkTemplatePreSelection>;
  @useResult
  $Res call({String description, DataMeta meta, int? customerId, int? id});

  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$ArtworkTemplatePreSelectionCopyWithImpl<$Res,
        $Val extends ArtworkTemplatePreSelection>
    implements $ArtworkTemplatePreSelectionCopyWith<$Res> {
  _$ArtworkTemplatePreSelectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ArtworkTemplatePreSelection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? meta = null,
    Object? customerId = freezed,
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
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of ArtworkTemplatePreSelection
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
abstract class _$$ArtworkTemplatePreSelectionImplCopyWith<$Res>
    implements $ArtworkTemplatePreSelectionCopyWith<$Res> {
  factory _$$ArtworkTemplatePreSelectionImplCopyWith(
          _$ArtworkTemplatePreSelectionImpl value,
          $Res Function(_$ArtworkTemplatePreSelectionImpl) then) =
      __$$ArtworkTemplatePreSelectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String description, DataMeta meta, int? customerId, int? id});

  @override
  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$ArtworkTemplatePreSelectionImplCopyWithImpl<$Res>
    extends _$ArtworkTemplatePreSelectionCopyWithImpl<$Res,
        _$ArtworkTemplatePreSelectionImpl>
    implements _$$ArtworkTemplatePreSelectionImplCopyWith<$Res> {
  __$$ArtworkTemplatePreSelectionImplCopyWithImpl(
      _$ArtworkTemplatePreSelectionImpl _value,
      $Res Function(_$ArtworkTemplatePreSelectionImpl) _then)
      : super(_value, _then);

  /// Create a copy of ArtworkTemplatePreSelection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? meta = null,
    Object? customerId = freezed,
    Object? id = freezed,
  }) {
    return _then(_$ArtworkTemplatePreSelectionImpl(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
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
class _$ArtworkTemplatePreSelectionImpl extends _ArtworkTemplatePreSelection {
  const _$ArtworkTemplatePreSelectionImpl(
      {required this.description,
      required this.meta,
      required this.customerId,
      this.id})
      : super._();

  factory _$ArtworkTemplatePreSelectionImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ArtworkTemplatePreSelectionImplFromJson(json);

  @override
  final String description;
  @override
  final DataMeta meta;
  @override
  final int? customerId;
  @override
  final int? id;

  @override
  String toString() {
    return 'ArtworkTemplatePreSelection(description: $description, meta: $meta, customerId: $customerId, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtworkTemplatePreSelectionImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, description, meta, customerId, id);

  /// Create a copy of ArtworkTemplatePreSelection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtworkTemplatePreSelectionImplCopyWith<_$ArtworkTemplatePreSelectionImpl>
      get copyWith => __$$ArtworkTemplatePreSelectionImplCopyWithImpl<
          _$ArtworkTemplatePreSelectionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArtworkTemplatePreSelectionImplToJson(
      this,
    );
  }
}

abstract class _ArtworkTemplatePreSelection
    extends ArtworkTemplatePreSelection {
  const factory _ArtworkTemplatePreSelection(
      {required final String description,
      required final DataMeta meta,
      required final int? customerId,
      final int? id}) = _$ArtworkTemplatePreSelectionImpl;
  const _ArtworkTemplatePreSelection._() : super._();

  factory _ArtworkTemplatePreSelection.fromJson(Map<String, dynamic> json) =
      _$ArtworkTemplatePreSelectionImpl.fromJson;

  @override
  String get description;
  @override
  DataMeta get meta;
  @override
  int? get customerId;
  @override
  int? get id;

  /// Create a copy of ArtworkTemplatePreSelection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ArtworkTemplatePreSelectionImplCopyWith<_$ArtworkTemplatePreSelectionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
