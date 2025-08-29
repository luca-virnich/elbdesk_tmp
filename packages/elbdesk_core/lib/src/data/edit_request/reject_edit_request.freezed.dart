// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reject_edit_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RejectEditRequest {
  String get tableType => throw _privateConstructorUsedError;
  int get tablePrimaryKey => throw _privateConstructorUsedError;
  String get createdByName => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;
  String get requestingFloatingWindowId => throw _privateConstructorUsedError;

  /// Create a copy of RejectEditRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RejectEditRequestCopyWith<RejectEditRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RejectEditRequestCopyWith<$Res> {
  factory $RejectEditRequestCopyWith(
          RejectEditRequest value, $Res Function(RejectEditRequest) then) =
      _$RejectEditRequestCopyWithImpl<$Res, RejectEditRequest>;
  @useResult
  $Res call(
      {String tableType,
      int tablePrimaryKey,
      String createdByName,
      DateTime createdAt,
      String reason,
      String requestingFloatingWindowId});
}

/// @nodoc
class _$RejectEditRequestCopyWithImpl<$Res, $Val extends RejectEditRequest>
    implements $RejectEditRequestCopyWith<$Res> {
  _$RejectEditRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RejectEditRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tableType = null,
    Object? tablePrimaryKey = null,
    Object? createdByName = null,
    Object? createdAt = null,
    Object? reason = null,
    Object? requestingFloatingWindowId = null,
  }) {
    return _then(_value.copyWith(
      tableType: null == tableType
          ? _value.tableType
          : tableType // ignore: cast_nullable_to_non_nullable
              as String,
      tablePrimaryKey: null == tablePrimaryKey
          ? _value.tablePrimaryKey
          : tablePrimaryKey // ignore: cast_nullable_to_non_nullable
              as int,
      createdByName: null == createdByName
          ? _value.createdByName
          : createdByName // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      requestingFloatingWindowId: null == requestingFloatingWindowId
          ? _value.requestingFloatingWindowId
          : requestingFloatingWindowId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RejectEditRequestImplCopyWith<$Res>
    implements $RejectEditRequestCopyWith<$Res> {
  factory _$$RejectEditRequestImplCopyWith(_$RejectEditRequestImpl value,
          $Res Function(_$RejectEditRequestImpl) then) =
      __$$RejectEditRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String tableType,
      int tablePrimaryKey,
      String createdByName,
      DateTime createdAt,
      String reason,
      String requestingFloatingWindowId});
}

/// @nodoc
class __$$RejectEditRequestImplCopyWithImpl<$Res>
    extends _$RejectEditRequestCopyWithImpl<$Res, _$RejectEditRequestImpl>
    implements _$$RejectEditRequestImplCopyWith<$Res> {
  __$$RejectEditRequestImplCopyWithImpl(_$RejectEditRequestImpl _value,
      $Res Function(_$RejectEditRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of RejectEditRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tableType = null,
    Object? tablePrimaryKey = null,
    Object? createdByName = null,
    Object? createdAt = null,
    Object? reason = null,
    Object? requestingFloatingWindowId = null,
  }) {
    return _then(_$RejectEditRequestImpl(
      tableType: null == tableType
          ? _value.tableType
          : tableType // ignore: cast_nullable_to_non_nullable
              as String,
      tablePrimaryKey: null == tablePrimaryKey
          ? _value.tablePrimaryKey
          : tablePrimaryKey // ignore: cast_nullable_to_non_nullable
              as int,
      createdByName: null == createdByName
          ? _value.createdByName
          : createdByName // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      requestingFloatingWindowId: null == requestingFloatingWindowId
          ? _value.requestingFloatingWindowId
          : requestingFloatingWindowId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RejectEditRequestImpl extends _RejectEditRequest {
  const _$RejectEditRequestImpl(
      {required this.tableType,
      required this.tablePrimaryKey,
      required this.createdByName,
      required this.createdAt,
      required this.reason,
      required this.requestingFloatingWindowId})
      : super._();

  @override
  final String tableType;
  @override
  final int tablePrimaryKey;
  @override
  final String createdByName;
  @override
  final DateTime createdAt;
  @override
  final String reason;
  @override
  final String requestingFloatingWindowId;

  @override
  String toString() {
    return 'RejectEditRequest(tableType: $tableType, tablePrimaryKey: $tablePrimaryKey, createdByName: $createdByName, createdAt: $createdAt, reason: $reason, requestingFloatingWindowId: $requestingFloatingWindowId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RejectEditRequestImpl &&
            (identical(other.tableType, tableType) ||
                other.tableType == tableType) &&
            (identical(other.tablePrimaryKey, tablePrimaryKey) ||
                other.tablePrimaryKey == tablePrimaryKey) &&
            (identical(other.createdByName, createdByName) ||
                other.createdByName == createdByName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.requestingFloatingWindowId,
                    requestingFloatingWindowId) ||
                other.requestingFloatingWindowId ==
                    requestingFloatingWindowId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tableType, tablePrimaryKey,
      createdByName, createdAt, reason, requestingFloatingWindowId);

  /// Create a copy of RejectEditRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RejectEditRequestImplCopyWith<_$RejectEditRequestImpl> get copyWith =>
      __$$RejectEditRequestImplCopyWithImpl<_$RejectEditRequestImpl>(
          this, _$identity);
}

abstract class _RejectEditRequest extends RejectEditRequest {
  const factory _RejectEditRequest(
          {required final String tableType,
          required final int tablePrimaryKey,
          required final String createdByName,
          required final DateTime createdAt,
          required final String reason,
          required final String requestingFloatingWindowId}) =
      _$RejectEditRequestImpl;
  const _RejectEditRequest._() : super._();

  @override
  String get tableType;
  @override
  int get tablePrimaryKey;
  @override
  String get createdByName;
  @override
  DateTime get createdAt;
  @override
  String get reason;
  @override
  String get requestingFloatingWindowId;

  /// Create a copy of RejectEditRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RejectEditRequestImplCopyWith<_$RejectEditRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
