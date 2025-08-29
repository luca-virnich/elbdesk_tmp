// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EditRequest _$EditRequestFromJson(Map<String, dynamic> json) {
  return _EditRequest.fromJson(json);
}

/// @nodoc
mixin _$EditRequest {
  String get createdByName => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get requestId => throw _privateConstructorUsedError;
  String get requestingFloatingWindowId => throw _privateConstructorUsedError;

  /// Serializes this EditRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EditRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EditRequestCopyWith<EditRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditRequestCopyWith<$Res> {
  factory $EditRequestCopyWith(
          EditRequest value, $Res Function(EditRequest) then) =
      _$EditRequestCopyWithImpl<$Res, EditRequest>;
  @useResult
  $Res call(
      {String createdByName,
      DateTime createdAt,
      String message,
      String requestId,
      String requestingFloatingWindowId});
}

/// @nodoc
class _$EditRequestCopyWithImpl<$Res, $Val extends EditRequest>
    implements $EditRequestCopyWith<$Res> {
  _$EditRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EditRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdByName = null,
    Object? createdAt = null,
    Object? message = null,
    Object? requestId = null,
    Object? requestingFloatingWindowId = null,
  }) {
    return _then(_value.copyWith(
      createdByName: null == createdByName
          ? _value.createdByName
          : createdByName // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
      requestingFloatingWindowId: null == requestingFloatingWindowId
          ? _value.requestingFloatingWindowId
          : requestingFloatingWindowId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditRequestImplCopyWith<$Res>
    implements $EditRequestCopyWith<$Res> {
  factory _$$EditRequestImplCopyWith(
          _$EditRequestImpl value, $Res Function(_$EditRequestImpl) then) =
      __$$EditRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String createdByName,
      DateTime createdAt,
      String message,
      String requestId,
      String requestingFloatingWindowId});
}

/// @nodoc
class __$$EditRequestImplCopyWithImpl<$Res>
    extends _$EditRequestCopyWithImpl<$Res, _$EditRequestImpl>
    implements _$$EditRequestImplCopyWith<$Res> {
  __$$EditRequestImplCopyWithImpl(
      _$EditRequestImpl _value, $Res Function(_$EditRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of EditRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdByName = null,
    Object? createdAt = null,
    Object? message = null,
    Object? requestId = null,
    Object? requestingFloatingWindowId = null,
  }) {
    return _then(_$EditRequestImpl(
      createdByName: null == createdByName
          ? _value.createdByName
          : createdByName // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
      requestingFloatingWindowId: null == requestingFloatingWindowId
          ? _value.requestingFloatingWindowId
          : requestingFloatingWindowId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EditRequestImpl extends _EditRequest {
  const _$EditRequestImpl(
      {required this.createdByName,
      required this.createdAt,
      required this.message,
      required this.requestId,
      required this.requestingFloatingWindowId})
      : super._();

  factory _$EditRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$EditRequestImplFromJson(json);

  @override
  final String createdByName;
  @override
  final DateTime createdAt;
  @override
  final String message;
  @override
  final String requestId;
  @override
  final String requestingFloatingWindowId;

  @override
  String toString() {
    return 'EditRequest(createdByName: $createdByName, createdAt: $createdAt, message: $message, requestId: $requestId, requestingFloatingWindowId: $requestingFloatingWindowId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditRequestImpl &&
            (identical(other.createdByName, createdByName) ||
                other.createdByName == createdByName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.requestingFloatingWindowId,
                    requestingFloatingWindowId) ||
                other.requestingFloatingWindowId ==
                    requestingFloatingWindowId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, createdByName, createdAt,
      message, requestId, requestingFloatingWindowId);

  /// Create a copy of EditRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditRequestImplCopyWith<_$EditRequestImpl> get copyWith =>
      __$$EditRequestImplCopyWithImpl<_$EditRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EditRequestImplToJson(
      this,
    );
  }
}

abstract class _EditRequest extends EditRequest {
  const factory _EditRequest(
      {required final String createdByName,
      required final DateTime createdAt,
      required final String message,
      required final String requestId,
      required final String requestingFloatingWindowId}) = _$EditRequestImpl;
  const _EditRequest._() : super._();

  factory _EditRequest.fromJson(Map<String, dynamic> json) =
      _$EditRequestImpl.fromJson;

  @override
  String get createdByName;
  @override
  DateTime get createdAt;
  @override
  String get message;
  @override
  String get requestId;
  @override
  String get requestingFloatingWindowId;

  /// Create a copy of EditRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditRequestImplCopyWith<_$EditRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
