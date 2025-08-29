// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entity_note_notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EntityNoteNotification _$EntityNoteNotificationFromJson(
    Map<String, dynamic> json) {
  return _EntityNoteNotification.fromJson(json);
}

/// @nodoc
mixin _$EntityNoteNotification {
  int get id => throw _privateConstructorUsedError;
  String get tableType => throw _privateConstructorUsedError;
  int get entityId => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String? get hardcodedSender => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get readAt => throw _privateConstructorUsedError;
  DateTime? get clearedAt => throw _privateConstructorUsedError;
  Map<String, dynamic>? get additionalData =>
      throw _privateConstructorUsedError;
  int? get senderId => throw _privateConstructorUsedError;
  bool get isUpdate => throw _privateConstructorUsedError;
  int? get parentId => throw _privateConstructorUsedError;

  /// Serializes this EntityNoteNotification to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EntityNoteNotification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EntityNoteNotificationCopyWith<EntityNoteNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntityNoteNotificationCopyWith<$Res> {
  factory $EntityNoteNotificationCopyWith(EntityNoteNotification value,
          $Res Function(EntityNoteNotification) then) =
      _$EntityNoteNotificationCopyWithImpl<$Res, EntityNoteNotification>;
  @useResult
  $Res call(
      {int id,
      String tableType,
      int entityId,
      String label,
      String message,
      String? hardcodedSender,
      DateTime createdAt,
      DateTime? readAt,
      DateTime? clearedAt,
      Map<String, dynamic>? additionalData,
      int? senderId,
      bool isUpdate,
      int? parentId});
}

/// @nodoc
class _$EntityNoteNotificationCopyWithImpl<$Res,
        $Val extends EntityNoteNotification>
    implements $EntityNoteNotificationCopyWith<$Res> {
  _$EntityNoteNotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EntityNoteNotification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tableType = null,
    Object? entityId = null,
    Object? label = null,
    Object? message = null,
    Object? hardcodedSender = freezed,
    Object? createdAt = null,
    Object? readAt = freezed,
    Object? clearedAt = freezed,
    Object? additionalData = freezed,
    Object? senderId = freezed,
    Object? isUpdate = null,
    Object? parentId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      tableType: null == tableType
          ? _value.tableType
          : tableType // ignore: cast_nullable_to_non_nullable
              as String,
      entityId: null == entityId
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as int,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      hardcodedSender: freezed == hardcodedSender
          ? _value.hardcodedSender
          : hardcodedSender // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      readAt: freezed == readAt
          ? _value.readAt
          : readAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      clearedAt: freezed == clearedAt
          ? _value.clearedAt
          : clearedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      additionalData: freezed == additionalData
          ? _value.additionalData
          : additionalData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      senderId: freezed == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as int?,
      isUpdate: null == isUpdate
          ? _value.isUpdate
          : isUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EntityNoteNotificationImplCopyWith<$Res>
    implements $EntityNoteNotificationCopyWith<$Res> {
  factory _$$EntityNoteNotificationImplCopyWith(
          _$EntityNoteNotificationImpl value,
          $Res Function(_$EntityNoteNotificationImpl) then) =
      __$$EntityNoteNotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String tableType,
      int entityId,
      String label,
      String message,
      String? hardcodedSender,
      DateTime createdAt,
      DateTime? readAt,
      DateTime? clearedAt,
      Map<String, dynamic>? additionalData,
      int? senderId,
      bool isUpdate,
      int? parentId});
}

/// @nodoc
class __$$EntityNoteNotificationImplCopyWithImpl<$Res>
    extends _$EntityNoteNotificationCopyWithImpl<$Res,
        _$EntityNoteNotificationImpl>
    implements _$$EntityNoteNotificationImplCopyWith<$Res> {
  __$$EntityNoteNotificationImplCopyWithImpl(
      _$EntityNoteNotificationImpl _value,
      $Res Function(_$EntityNoteNotificationImpl) _then)
      : super(_value, _then);

  /// Create a copy of EntityNoteNotification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tableType = null,
    Object? entityId = null,
    Object? label = null,
    Object? message = null,
    Object? hardcodedSender = freezed,
    Object? createdAt = null,
    Object? readAt = freezed,
    Object? clearedAt = freezed,
    Object? additionalData = freezed,
    Object? senderId = freezed,
    Object? isUpdate = null,
    Object? parentId = freezed,
  }) {
    return _then(_$EntityNoteNotificationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      tableType: null == tableType
          ? _value.tableType
          : tableType // ignore: cast_nullable_to_non_nullable
              as String,
      entityId: null == entityId
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as int,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      hardcodedSender: freezed == hardcodedSender
          ? _value.hardcodedSender
          : hardcodedSender // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      readAt: freezed == readAt
          ? _value.readAt
          : readAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      clearedAt: freezed == clearedAt
          ? _value.clearedAt
          : clearedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      additionalData: freezed == additionalData
          ? _value._additionalData
          : additionalData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      senderId: freezed == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as int?,
      isUpdate: null == isUpdate
          ? _value.isUpdate
          : isUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EntityNoteNotificationImpl extends _EntityNoteNotification {
  _$EntityNoteNotificationImpl(
      {required this.id,
      required this.tableType,
      required this.entityId,
      required this.label,
      required this.message,
      required this.hardcodedSender,
      required this.createdAt,
      required this.readAt,
      required this.clearedAt,
      required final Map<String, dynamic>? additionalData,
      required this.senderId,
      required this.isUpdate,
      required this.parentId})
      : _additionalData = additionalData,
        super._();

  factory _$EntityNoteNotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$EntityNoteNotificationImplFromJson(json);

  @override
  final int id;
  @override
  final String tableType;
  @override
  final int entityId;
  @override
  final String label;
  @override
  final String message;
  @override
  final String? hardcodedSender;
  @override
  final DateTime createdAt;
  @override
  final DateTime? readAt;
  @override
  final DateTime? clearedAt;
  final Map<String, dynamic>? _additionalData;
  @override
  Map<String, dynamic>? get additionalData {
    final value = _additionalData;
    if (value == null) return null;
    if (_additionalData is EqualUnmodifiableMapView) return _additionalData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final int? senderId;
  @override
  final bool isUpdate;
  @override
  final int? parentId;

  @override
  String toString() {
    return 'EntityNoteNotification(id: $id, tableType: $tableType, entityId: $entityId, label: $label, message: $message, hardcodedSender: $hardcodedSender, createdAt: $createdAt, readAt: $readAt, clearedAt: $clearedAt, additionalData: $additionalData, senderId: $senderId, isUpdate: $isUpdate, parentId: $parentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EntityNoteNotificationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tableType, tableType) ||
                other.tableType == tableType) &&
            (identical(other.entityId, entityId) ||
                other.entityId == entityId) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.hardcodedSender, hardcodedSender) ||
                other.hardcodedSender == hardcodedSender) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.readAt, readAt) || other.readAt == readAt) &&
            (identical(other.clearedAt, clearedAt) ||
                other.clearedAt == clearedAt) &&
            const DeepCollectionEquality()
                .equals(other._additionalData, _additionalData) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.isUpdate, isUpdate) ||
                other.isUpdate == isUpdate) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      tableType,
      entityId,
      label,
      message,
      hardcodedSender,
      createdAt,
      readAt,
      clearedAt,
      const DeepCollectionEquality().hash(_additionalData),
      senderId,
      isUpdate,
      parentId);

  /// Create a copy of EntityNoteNotification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EntityNoteNotificationImplCopyWith<_$EntityNoteNotificationImpl>
      get copyWith => __$$EntityNoteNotificationImplCopyWithImpl<
          _$EntityNoteNotificationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EntityNoteNotificationImplToJson(
      this,
    );
  }
}

abstract class _EntityNoteNotification extends EntityNoteNotification {
  factory _EntityNoteNotification(
      {required final int id,
      required final String tableType,
      required final int entityId,
      required final String label,
      required final String message,
      required final String? hardcodedSender,
      required final DateTime createdAt,
      required final DateTime? readAt,
      required final DateTime? clearedAt,
      required final Map<String, dynamic>? additionalData,
      required final int? senderId,
      required final bool isUpdate,
      required final int? parentId}) = _$EntityNoteNotificationImpl;
  _EntityNoteNotification._() : super._();

  factory _EntityNoteNotification.fromJson(Map<String, dynamic> json) =
      _$EntityNoteNotificationImpl.fromJson;

  @override
  int get id;
  @override
  String get tableType;
  @override
  int get entityId;
  @override
  String get label;
  @override
  String get message;
  @override
  String? get hardcodedSender;
  @override
  DateTime get createdAt;
  @override
  DateTime? get readAt;
  @override
  DateTime? get clearedAt;
  @override
  Map<String, dynamic>? get additionalData;
  @override
  int? get senderId;
  @override
  bool get isUpdate;
  @override
  int? get parentId;

  /// Create a copy of EntityNoteNotification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EntityNoteNotificationImplCopyWith<_$EntityNoteNotificationImpl>
      get copyWith => throw _privateConstructorUsedError;
}
