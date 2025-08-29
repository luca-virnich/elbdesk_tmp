// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutzenlayout_column.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NutzenlayoutColumn _$NutzenlayoutColumnFromJson(Map<String, dynamic> json) {
  return _NutzenlayoutColumn.fromJson(json);
}

/// @nodoc
mixin _$NutzenlayoutColumn {
  double get offset => throw _privateConstructorUsedError;
  List<NutzenlayoutCell> get cells => throw _privateConstructorUsedError;

  /// Serializes this NutzenlayoutColumn to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NutzenlayoutColumn
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NutzenlayoutColumnCopyWith<NutzenlayoutColumn> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NutzenlayoutColumnCopyWith<$Res> {
  factory $NutzenlayoutColumnCopyWith(
          NutzenlayoutColumn value, $Res Function(NutzenlayoutColumn) then) =
      _$NutzenlayoutColumnCopyWithImpl<$Res, NutzenlayoutColumn>;
  @useResult
  $Res call({double offset, List<NutzenlayoutCell> cells});
}

/// @nodoc
class _$NutzenlayoutColumnCopyWithImpl<$Res, $Val extends NutzenlayoutColumn>
    implements $NutzenlayoutColumnCopyWith<$Res> {
  _$NutzenlayoutColumnCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NutzenlayoutColumn
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offset = null,
    Object? cells = null,
  }) {
    return _then(_value.copyWith(
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as double,
      cells: null == cells
          ? _value.cells
          : cells // ignore: cast_nullable_to_non_nullable
              as List<NutzenlayoutCell>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NutzenlayoutColumnImplCopyWith<$Res>
    implements $NutzenlayoutColumnCopyWith<$Res> {
  factory _$$NutzenlayoutColumnImplCopyWith(_$NutzenlayoutColumnImpl value,
          $Res Function(_$NutzenlayoutColumnImpl) then) =
      __$$NutzenlayoutColumnImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double offset, List<NutzenlayoutCell> cells});
}

/// @nodoc
class __$$NutzenlayoutColumnImplCopyWithImpl<$Res>
    extends _$NutzenlayoutColumnCopyWithImpl<$Res, _$NutzenlayoutColumnImpl>
    implements _$$NutzenlayoutColumnImplCopyWith<$Res> {
  __$$NutzenlayoutColumnImplCopyWithImpl(_$NutzenlayoutColumnImpl _value,
      $Res Function(_$NutzenlayoutColumnImpl) _then)
      : super(_value, _then);

  /// Create a copy of NutzenlayoutColumn
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offset = null,
    Object? cells = null,
  }) {
    return _then(_$NutzenlayoutColumnImpl(
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as double,
      cells: null == cells
          ? _value._cells
          : cells // ignore: cast_nullable_to_non_nullable
              as List<NutzenlayoutCell>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NutzenlayoutColumnImpl extends _NutzenlayoutColumn {
  const _$NutzenlayoutColumnImpl(
      {required this.offset, required final List<NutzenlayoutCell> cells})
      : _cells = cells,
        super._();

  factory _$NutzenlayoutColumnImpl.fromJson(Map<String, dynamic> json) =>
      _$$NutzenlayoutColumnImplFromJson(json);

  @override
  final double offset;
  final List<NutzenlayoutCell> _cells;
  @override
  List<NutzenlayoutCell> get cells {
    if (_cells is EqualUnmodifiableListView) return _cells;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cells);
  }

  @override
  String toString() {
    return 'NutzenlayoutColumn(offset: $offset, cells: $cells)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NutzenlayoutColumnImpl &&
            (identical(other.offset, offset) || other.offset == offset) &&
            const DeepCollectionEquality().equals(other._cells, _cells));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, offset, const DeepCollectionEquality().hash(_cells));

  /// Create a copy of NutzenlayoutColumn
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NutzenlayoutColumnImplCopyWith<_$NutzenlayoutColumnImpl> get copyWith =>
      __$$NutzenlayoutColumnImplCopyWithImpl<_$NutzenlayoutColumnImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NutzenlayoutColumnImplToJson(
      this,
    );
  }
}

abstract class _NutzenlayoutColumn extends NutzenlayoutColumn {
  const factory _NutzenlayoutColumn(
      {required final double offset,
      required final List<NutzenlayoutCell> cells}) = _$NutzenlayoutColumnImpl;
  const _NutzenlayoutColumn._() : super._();

  factory _NutzenlayoutColumn.fromJson(Map<String, dynamic> json) =
      _$NutzenlayoutColumnImpl.fromJson;

  @override
  double get offset;
  @override
  List<NutzenlayoutCell> get cells;

  /// Create a copy of NutzenlayoutColumn
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NutzenlayoutColumnImplCopyWith<_$NutzenlayoutColumnImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
