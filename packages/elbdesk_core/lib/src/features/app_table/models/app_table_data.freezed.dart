// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_table_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppTableData {
  Set<int> get selectedRows => throw _privateConstructorUsedError;
  int? get hoveredRow => throw _privateConstructorUsedError;
  bool get disposeBlocker => throw _privateConstructorUsedError;
  int? get lastPressedRow => throw _privateConstructorUsedError;

  /// Create a copy of AppTableData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppTableDataCopyWith<AppTableData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppTableDataCopyWith<$Res> {
  factory $AppTableDataCopyWith(
          AppTableData value, $Res Function(AppTableData) then) =
      _$AppTableDataCopyWithImpl<$Res, AppTableData>;
  @useResult
  $Res call(
      {Set<int> selectedRows,
      int? hoveredRow,
      bool disposeBlocker,
      int? lastPressedRow});
}

/// @nodoc
class _$AppTableDataCopyWithImpl<$Res, $Val extends AppTableData>
    implements $AppTableDataCopyWith<$Res> {
  _$AppTableDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppTableData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedRows = null,
    Object? hoveredRow = freezed,
    Object? disposeBlocker = null,
    Object? lastPressedRow = freezed,
  }) {
    return _then(_value.copyWith(
      selectedRows: null == selectedRows
          ? _value.selectedRows
          : selectedRows // ignore: cast_nullable_to_non_nullable
              as Set<int>,
      hoveredRow: freezed == hoveredRow
          ? _value.hoveredRow
          : hoveredRow // ignore: cast_nullable_to_non_nullable
              as int?,
      disposeBlocker: null == disposeBlocker
          ? _value.disposeBlocker
          : disposeBlocker // ignore: cast_nullable_to_non_nullable
              as bool,
      lastPressedRow: freezed == lastPressedRow
          ? _value.lastPressedRow
          : lastPressedRow // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppTableDataImplCopyWith<$Res>
    implements $AppTableDataCopyWith<$Res> {
  factory _$$AppTableDataImplCopyWith(
          _$AppTableDataImpl value, $Res Function(_$AppTableDataImpl) then) =
      __$$AppTableDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Set<int> selectedRows,
      int? hoveredRow,
      bool disposeBlocker,
      int? lastPressedRow});
}

/// @nodoc
class __$$AppTableDataImplCopyWithImpl<$Res>
    extends _$AppTableDataCopyWithImpl<$Res, _$AppTableDataImpl>
    implements _$$AppTableDataImplCopyWith<$Res> {
  __$$AppTableDataImplCopyWithImpl(
      _$AppTableDataImpl _value, $Res Function(_$AppTableDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppTableData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedRows = null,
    Object? hoveredRow = freezed,
    Object? disposeBlocker = null,
    Object? lastPressedRow = freezed,
  }) {
    return _then(_$AppTableDataImpl(
      selectedRows: null == selectedRows
          ? _value._selectedRows
          : selectedRows // ignore: cast_nullable_to_non_nullable
              as Set<int>,
      hoveredRow: freezed == hoveredRow
          ? _value.hoveredRow
          : hoveredRow // ignore: cast_nullable_to_non_nullable
              as int?,
      disposeBlocker: null == disposeBlocker
          ? _value.disposeBlocker
          : disposeBlocker // ignore: cast_nullable_to_non_nullable
              as bool,
      lastPressedRow: freezed == lastPressedRow
          ? _value.lastPressedRow
          : lastPressedRow // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$AppTableDataImpl extends _AppTableData {
  const _$AppTableDataImpl(
      {required final Set<int> selectedRows,
      required this.hoveredRow,
      required this.disposeBlocker,
      required this.lastPressedRow})
      : _selectedRows = selectedRows,
        super._();

  final Set<int> _selectedRows;
  @override
  Set<int> get selectedRows {
    if (_selectedRows is EqualUnmodifiableSetView) return _selectedRows;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_selectedRows);
  }

  @override
  final int? hoveredRow;
  @override
  final bool disposeBlocker;
  @override
  final int? lastPressedRow;

  @override
  String toString() {
    return 'AppTableData(selectedRows: $selectedRows, hoveredRow: $hoveredRow, disposeBlocker: $disposeBlocker, lastPressedRow: $lastPressedRow)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppTableDataImpl &&
            const DeepCollectionEquality()
                .equals(other._selectedRows, _selectedRows) &&
            (identical(other.hoveredRow, hoveredRow) ||
                other.hoveredRow == hoveredRow) &&
            (identical(other.disposeBlocker, disposeBlocker) ||
                other.disposeBlocker == disposeBlocker) &&
            (identical(other.lastPressedRow, lastPressedRow) ||
                other.lastPressedRow == lastPressedRow));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_selectedRows),
      hoveredRow,
      disposeBlocker,
      lastPressedRow);

  /// Create a copy of AppTableData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppTableDataImplCopyWith<_$AppTableDataImpl> get copyWith =>
      __$$AppTableDataImplCopyWithImpl<_$AppTableDataImpl>(this, _$identity);
}

abstract class _AppTableData extends AppTableData {
  const factory _AppTableData(
      {required final Set<int> selectedRows,
      required final int? hoveredRow,
      required final bool disposeBlocker,
      required final int? lastPressedRow}) = _$AppTableDataImpl;
  const _AppTableData._() : super._();

  @override
  Set<int> get selectedRows;
  @override
  int? get hoveredRow;
  @override
  bool get disposeBlocker;
  @override
  int? get lastPressedRow;

  /// Create a copy of AppTableData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppTableDataImplCopyWith<_$AppTableDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
