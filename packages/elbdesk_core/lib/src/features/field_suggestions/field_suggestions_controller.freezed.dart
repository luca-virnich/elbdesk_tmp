// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'field_suggestions_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FieldSuggestion {
  String get tableType => throw _privateConstructorUsedError;
  String get fieldKey => throw _privateConstructorUsedError;
  FilterFieldType get fieldType => throw _privateConstructorUsedError;

  /// Create a copy of FieldSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FieldSuggestionCopyWith<FieldSuggestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FieldSuggestionCopyWith<$Res> {
  factory $FieldSuggestionCopyWith(
          FieldSuggestion value, $Res Function(FieldSuggestion) then) =
      _$FieldSuggestionCopyWithImpl<$Res, FieldSuggestion>;
  @useResult
  $Res call({String tableType, String fieldKey, FilterFieldType fieldType});
}

/// @nodoc
class _$FieldSuggestionCopyWithImpl<$Res, $Val extends FieldSuggestion>
    implements $FieldSuggestionCopyWith<$Res> {
  _$FieldSuggestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FieldSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tableType = null,
    Object? fieldKey = null,
    Object? fieldType = null,
  }) {
    return _then(_value.copyWith(
      tableType: null == tableType
          ? _value.tableType
          : tableType // ignore: cast_nullable_to_non_nullable
              as String,
      fieldKey: null == fieldKey
          ? _value.fieldKey
          : fieldKey // ignore: cast_nullable_to_non_nullable
              as String,
      fieldType: null == fieldType
          ? _value.fieldType
          : fieldType // ignore: cast_nullable_to_non_nullable
              as FilterFieldType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FieldSuggestionImplCopyWith<$Res>
    implements $FieldSuggestionCopyWith<$Res> {
  factory _$$FieldSuggestionImplCopyWith(_$FieldSuggestionImpl value,
          $Res Function(_$FieldSuggestionImpl) then) =
      __$$FieldSuggestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String tableType, String fieldKey, FilterFieldType fieldType});
}

/// @nodoc
class __$$FieldSuggestionImplCopyWithImpl<$Res>
    extends _$FieldSuggestionCopyWithImpl<$Res, _$FieldSuggestionImpl>
    implements _$$FieldSuggestionImplCopyWith<$Res> {
  __$$FieldSuggestionImplCopyWithImpl(
      _$FieldSuggestionImpl _value, $Res Function(_$FieldSuggestionImpl) _then)
      : super(_value, _then);

  /// Create a copy of FieldSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tableType = null,
    Object? fieldKey = null,
    Object? fieldType = null,
  }) {
    return _then(_$FieldSuggestionImpl(
      tableType: null == tableType
          ? _value.tableType
          : tableType // ignore: cast_nullable_to_non_nullable
              as String,
      fieldKey: null == fieldKey
          ? _value.fieldKey
          : fieldKey // ignore: cast_nullable_to_non_nullable
              as String,
      fieldType: null == fieldType
          ? _value.fieldType
          : fieldType // ignore: cast_nullable_to_non_nullable
              as FilterFieldType,
    ));
  }
}

/// @nodoc

class _$FieldSuggestionImpl extends _FieldSuggestion {
  const _$FieldSuggestionImpl(
      {required this.tableType,
      required this.fieldKey,
      required this.fieldType})
      : super._();

  @override
  final String tableType;
  @override
  final String fieldKey;
  @override
  final FilterFieldType fieldType;

  @override
  String toString() {
    return 'FieldSuggestion(tableType: $tableType, fieldKey: $fieldKey, fieldType: $fieldType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FieldSuggestionImpl &&
            (identical(other.tableType, tableType) ||
                other.tableType == tableType) &&
            (identical(other.fieldKey, fieldKey) ||
                other.fieldKey == fieldKey) &&
            (identical(other.fieldType, fieldType) ||
                other.fieldType == fieldType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tableType, fieldKey, fieldType);

  /// Create a copy of FieldSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FieldSuggestionImplCopyWith<_$FieldSuggestionImpl> get copyWith =>
      __$$FieldSuggestionImplCopyWithImpl<_$FieldSuggestionImpl>(
          this, _$identity);
}

abstract class _FieldSuggestion extends FieldSuggestion {
  const factory _FieldSuggestion(
      {required final String tableType,
      required final String fieldKey,
      required final FilterFieldType fieldType}) = _$FieldSuggestionImpl;
  const _FieldSuggestion._() : super._();

  @override
  String get tableType;
  @override
  String get fieldKey;
  @override
  FilterFieldType get fieldType;

  /// Create a copy of FieldSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FieldSuggestionImplCopyWith<_$FieldSuggestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
