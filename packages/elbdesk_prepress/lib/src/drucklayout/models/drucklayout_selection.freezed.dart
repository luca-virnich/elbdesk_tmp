// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drucklayout_selection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DrucklayoutSelection _$DrucklayoutSelectionFromJson(Map<String, dynamic> json) {
  return _DrucklayoutSelection.fromJson(json);
}

/// @nodoc
mixin _$DrucklayoutSelection {
  String get description => throw _privateConstructorUsedError;
  DataMeta get meta => throw _privateConstructorUsedError;
  int? get drucklayoutPreSelectionId => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  /// Serializes this DrucklayoutSelection to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DrucklayoutSelection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DrucklayoutSelectionCopyWith<DrucklayoutSelection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DrucklayoutSelectionCopyWith<$Res> {
  factory $DrucklayoutSelectionCopyWith(DrucklayoutSelection value,
          $Res Function(DrucklayoutSelection) then) =
      _$DrucklayoutSelectionCopyWithImpl<$Res, DrucklayoutSelection>;
  @useResult
  $Res call(
      {String description,
      DataMeta meta,
      int? drucklayoutPreSelectionId,
      int? id});

  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$DrucklayoutSelectionCopyWithImpl<$Res,
        $Val extends DrucklayoutSelection>
    implements $DrucklayoutSelectionCopyWith<$Res> {
  _$DrucklayoutSelectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DrucklayoutSelection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? meta = null,
    Object? drucklayoutPreSelectionId = freezed,
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
      drucklayoutPreSelectionId: freezed == drucklayoutPreSelectionId
          ? _value.drucklayoutPreSelectionId
          : drucklayoutPreSelectionId // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of DrucklayoutSelection
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
abstract class _$$DrucklayoutSelectionImplCopyWith<$Res>
    implements $DrucklayoutSelectionCopyWith<$Res> {
  factory _$$DrucklayoutSelectionImplCopyWith(_$DrucklayoutSelectionImpl value,
          $Res Function(_$DrucklayoutSelectionImpl) then) =
      __$$DrucklayoutSelectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String description,
      DataMeta meta,
      int? drucklayoutPreSelectionId,
      int? id});

  @override
  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$DrucklayoutSelectionImplCopyWithImpl<$Res>
    extends _$DrucklayoutSelectionCopyWithImpl<$Res, _$DrucklayoutSelectionImpl>
    implements _$$DrucklayoutSelectionImplCopyWith<$Res> {
  __$$DrucklayoutSelectionImplCopyWithImpl(_$DrucklayoutSelectionImpl _value,
      $Res Function(_$DrucklayoutSelectionImpl) _then)
      : super(_value, _then);

  /// Create a copy of DrucklayoutSelection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? meta = null,
    Object? drucklayoutPreSelectionId = freezed,
    Object? id = freezed,
  }) {
    return _then(_$DrucklayoutSelectionImpl(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
      drucklayoutPreSelectionId: freezed == drucklayoutPreSelectionId
          ? _value.drucklayoutPreSelectionId
          : drucklayoutPreSelectionId // ignore: cast_nullable_to_non_nullable
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
class _$DrucklayoutSelectionImpl extends _DrucklayoutSelection {
  const _$DrucklayoutSelectionImpl(
      {required this.description,
      required this.meta,
      this.drucklayoutPreSelectionId,
      this.id})
      : super._();

  factory _$DrucklayoutSelectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$DrucklayoutSelectionImplFromJson(json);

  @override
  final String description;
  @override
  final DataMeta meta;
  @override
  final int? drucklayoutPreSelectionId;
  @override
  final int? id;

  @override
  String toString() {
    return 'DrucklayoutSelection(description: $description, meta: $meta, drucklayoutPreSelectionId: $drucklayoutPreSelectionId, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DrucklayoutSelectionImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.drucklayoutPreSelectionId,
                    drucklayoutPreSelectionId) ||
                other.drucklayoutPreSelectionId == drucklayoutPreSelectionId) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, description, meta, drucklayoutPreSelectionId, id);

  /// Create a copy of DrucklayoutSelection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DrucklayoutSelectionImplCopyWith<_$DrucklayoutSelectionImpl>
      get copyWith =>
          __$$DrucklayoutSelectionImplCopyWithImpl<_$DrucklayoutSelectionImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DrucklayoutSelectionImplToJson(
      this,
    );
  }
}

abstract class _DrucklayoutSelection extends DrucklayoutSelection {
  const factory _DrucklayoutSelection(
      {required final String description,
      required final DataMeta meta,
      final int? drucklayoutPreSelectionId,
      final int? id}) = _$DrucklayoutSelectionImpl;
  const _DrucklayoutSelection._() : super._();

  factory _DrucklayoutSelection.fromJson(Map<String, dynamic> json) =
      _$DrucklayoutSelectionImpl.fromJson;

  @override
  String get description;
  @override
  DataMeta get meta;
  @override
  int? get drucklayoutPreSelectionId;
  @override
  int? get id;

  /// Create a copy of DrucklayoutSelection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DrucklayoutSelectionImplCopyWith<_$DrucklayoutSelectionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
