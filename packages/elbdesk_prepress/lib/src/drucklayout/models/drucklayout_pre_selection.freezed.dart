// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drucklayout_pre_selection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DrucklayoutPreSelection _$DrucklayoutPreSelectionFromJson(
    Map<String, dynamic> json) {
  return _DrucklayoutPreSelection.fromJson(json);
}

/// @nodoc
mixin _$DrucklayoutPreSelection {
  String get description => throw _privateConstructorUsedError;
  DataMeta get meta => throw _privateConstructorUsedError;
  int? get customerId => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  /// Serializes this DrucklayoutPreSelection to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DrucklayoutPreSelection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DrucklayoutPreSelectionCopyWith<DrucklayoutPreSelection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DrucklayoutPreSelectionCopyWith<$Res> {
  factory $DrucklayoutPreSelectionCopyWith(DrucklayoutPreSelection value,
          $Res Function(DrucklayoutPreSelection) then) =
      _$DrucklayoutPreSelectionCopyWithImpl<$Res, DrucklayoutPreSelection>;
  @useResult
  $Res call({String description, DataMeta meta, int? customerId, int? id});

  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$DrucklayoutPreSelectionCopyWithImpl<$Res,
        $Val extends DrucklayoutPreSelection>
    implements $DrucklayoutPreSelectionCopyWith<$Res> {
  _$DrucklayoutPreSelectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DrucklayoutPreSelection
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

  /// Create a copy of DrucklayoutPreSelection
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
abstract class _$$DrucklayoutPreSelectionImplCopyWith<$Res>
    implements $DrucklayoutPreSelectionCopyWith<$Res> {
  factory _$$DrucklayoutPreSelectionImplCopyWith(
          _$DrucklayoutPreSelectionImpl value,
          $Res Function(_$DrucklayoutPreSelectionImpl) then) =
      __$$DrucklayoutPreSelectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String description, DataMeta meta, int? customerId, int? id});

  @override
  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$DrucklayoutPreSelectionImplCopyWithImpl<$Res>
    extends _$DrucklayoutPreSelectionCopyWithImpl<$Res,
        _$DrucklayoutPreSelectionImpl>
    implements _$$DrucklayoutPreSelectionImplCopyWith<$Res> {
  __$$DrucklayoutPreSelectionImplCopyWithImpl(
      _$DrucklayoutPreSelectionImpl _value,
      $Res Function(_$DrucklayoutPreSelectionImpl) _then)
      : super(_value, _then);

  /// Create a copy of DrucklayoutPreSelection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? meta = null,
    Object? customerId = freezed,
    Object? id = freezed,
  }) {
    return _then(_$DrucklayoutPreSelectionImpl(
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
class _$DrucklayoutPreSelectionImpl extends _DrucklayoutPreSelection {
  const _$DrucklayoutPreSelectionImpl(
      {required this.description,
      required this.meta,
      required this.customerId,
      this.id})
      : super._();

  factory _$DrucklayoutPreSelectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$DrucklayoutPreSelectionImplFromJson(json);

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
    return 'DrucklayoutPreSelection(description: $description, meta: $meta, customerId: $customerId, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DrucklayoutPreSelectionImpl &&
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

  /// Create a copy of DrucklayoutPreSelection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DrucklayoutPreSelectionImplCopyWith<_$DrucklayoutPreSelectionImpl>
      get copyWith => __$$DrucklayoutPreSelectionImplCopyWithImpl<
          _$DrucklayoutPreSelectionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DrucklayoutPreSelectionImplToJson(
      this,
    );
  }
}

abstract class _DrucklayoutPreSelection extends DrucklayoutPreSelection {
  const factory _DrucklayoutPreSelection(
      {required final String description,
      required final DataMeta meta,
      required final int? customerId,
      final int? id}) = _$DrucklayoutPreSelectionImpl;
  const _DrucklayoutPreSelection._() : super._();

  factory _DrucklayoutPreSelection.fromJson(Map<String, dynamic> json) =
      _$DrucklayoutPreSelectionImpl.fromJson;

  @override
  String get description;
  @override
  DataMeta get meta;
  @override
  int? get customerId;
  @override
  int? get id;

  /// Create a copy of DrucklayoutPreSelection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DrucklayoutPreSelectionImplCopyWith<_$DrucklayoutPreSelectionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
