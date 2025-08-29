// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_meta.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DataMeta _$DataMetaFromJson(Map<String, dynamic> json) {
  return _DataMeta.fromJson(json);
}

/// @nodoc
mixin _$DataMeta {
  int? get id => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get lastModifiedAt => throw _privateConstructorUsedError;
  int? get lastModifiedById => throw _privateConstructorUsedError;
  bool get isDraft => throw _privateConstructorUsedError;
  String? get editingSessionId => throw _privateConstructorUsedError;
  int? get createdById => throw _privateConstructorUsedError;
  DateTime? get editingSince => throw _privateConstructorUsedError;
  int? get editingById => throw _privateConstructorUsedError;
  int? get deletedById => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  /// Serializes this DataMeta to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DataMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DataMetaCopyWith<DataMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataMetaCopyWith<$Res> {
  factory $DataMetaCopyWith(DataMeta value, $Res Function(DataMeta) then) =
      _$DataMetaCopyWithImpl<$Res, DataMeta>;
  @useResult
  $Res call(
      {int? id,
      DateTime? createdAt,
      DateTime? lastModifiedAt,
      int? lastModifiedById,
      bool isDraft,
      String? editingSessionId,
      int? createdById,
      DateTime? editingSince,
      int? editingById,
      int? deletedById,
      DateTime? deletedAt});
}

/// @nodoc
class _$DataMetaCopyWithImpl<$Res, $Val extends DataMeta>
    implements $DataMetaCopyWith<$Res> {
  _$DataMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DataMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? lastModifiedAt = freezed,
    Object? lastModifiedById = freezed,
    Object? isDraft = null,
    Object? editingSessionId = freezed,
    Object? createdById = freezed,
    Object? editingSince = freezed,
    Object? editingById = freezed,
    Object? deletedById = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastModifiedAt: freezed == lastModifiedAt
          ? _value.lastModifiedAt
          : lastModifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastModifiedById: freezed == lastModifiedById
          ? _value.lastModifiedById
          : lastModifiedById // ignore: cast_nullable_to_non_nullable
              as int?,
      isDraft: null == isDraft
          ? _value.isDraft
          : isDraft // ignore: cast_nullable_to_non_nullable
              as bool,
      editingSessionId: freezed == editingSessionId
          ? _value.editingSessionId
          : editingSessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdById: freezed == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int?,
      editingSince: freezed == editingSince
          ? _value.editingSince
          : editingSince // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      editingById: freezed == editingById
          ? _value.editingById
          : editingById // ignore: cast_nullable_to_non_nullable
              as int?,
      deletedById: freezed == deletedById
          ? _value.deletedById
          : deletedById // ignore: cast_nullable_to_non_nullable
              as int?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataMetaImplCopyWith<$Res>
    implements $DataMetaCopyWith<$Res> {
  factory _$$DataMetaImplCopyWith(
          _$DataMetaImpl value, $Res Function(_$DataMetaImpl) then) =
      __$$DataMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      DateTime? createdAt,
      DateTime? lastModifiedAt,
      int? lastModifiedById,
      bool isDraft,
      String? editingSessionId,
      int? createdById,
      DateTime? editingSince,
      int? editingById,
      int? deletedById,
      DateTime? deletedAt});
}

/// @nodoc
class __$$DataMetaImplCopyWithImpl<$Res>
    extends _$DataMetaCopyWithImpl<$Res, _$DataMetaImpl>
    implements _$$DataMetaImplCopyWith<$Res> {
  __$$DataMetaImplCopyWithImpl(
      _$DataMetaImpl _value, $Res Function(_$DataMetaImpl) _then)
      : super(_value, _then);

  /// Create a copy of DataMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? lastModifiedAt = freezed,
    Object? lastModifiedById = freezed,
    Object? isDraft = null,
    Object? editingSessionId = freezed,
    Object? createdById = freezed,
    Object? editingSince = freezed,
    Object? editingById = freezed,
    Object? deletedById = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_$DataMetaImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastModifiedAt: freezed == lastModifiedAt
          ? _value.lastModifiedAt
          : lastModifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastModifiedById: freezed == lastModifiedById
          ? _value.lastModifiedById
          : lastModifiedById // ignore: cast_nullable_to_non_nullable
              as int?,
      isDraft: null == isDraft
          ? _value.isDraft
          : isDraft // ignore: cast_nullable_to_non_nullable
              as bool,
      editingSessionId: freezed == editingSessionId
          ? _value.editingSessionId
          : editingSessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdById: freezed == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int?,
      editingSince: freezed == editingSince
          ? _value.editingSince
          : editingSince // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      editingById: freezed == editingById
          ? _value.editingById
          : editingById // ignore: cast_nullable_to_non_nullable
              as int?,
      deletedById: freezed == deletedById
          ? _value.deletedById
          : deletedById // ignore: cast_nullable_to_non_nullable
              as int?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataMetaImpl extends _DataMeta {
  const _$DataMetaImpl(
      {required this.id,
      required this.createdAt,
      required this.lastModifiedAt,
      required this.lastModifiedById,
      required this.isDraft,
      required this.editingSessionId,
      required this.createdById,
      required this.editingSince,
      required this.editingById,
      required this.deletedById,
      required this.deletedAt})
      : super._();

  factory _$DataMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataMetaImplFromJson(json);

  @override
  final int? id;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? lastModifiedAt;
  @override
  final int? lastModifiedById;
  @override
  final bool isDraft;
  @override
  final String? editingSessionId;
  @override
  final int? createdById;
  @override
  final DateTime? editingSince;
  @override
  final int? editingById;
  @override
  final int? deletedById;
  @override
  final DateTime? deletedAt;

  @override
  String toString() {
    return 'DataMeta(id: $id, createdAt: $createdAt, lastModifiedAt: $lastModifiedAt, lastModifiedById: $lastModifiedById, isDraft: $isDraft, editingSessionId: $editingSessionId, createdById: $createdById, editingSince: $editingSince, editingById: $editingById, deletedById: $deletedById, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataMetaImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastModifiedAt, lastModifiedAt) ||
                other.lastModifiedAt == lastModifiedAt) &&
            (identical(other.lastModifiedById, lastModifiedById) ||
                other.lastModifiedById == lastModifiedById) &&
            (identical(other.isDraft, isDraft) || other.isDraft == isDraft) &&
            (identical(other.editingSessionId, editingSessionId) ||
                other.editingSessionId == editingSessionId) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.editingSince, editingSince) ||
                other.editingSince == editingSince) &&
            (identical(other.editingById, editingById) ||
                other.editingById == editingById) &&
            (identical(other.deletedById, deletedById) ||
                other.deletedById == deletedById) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      lastModifiedAt,
      lastModifiedById,
      isDraft,
      editingSessionId,
      createdById,
      editingSince,
      editingById,
      deletedById,
      deletedAt);

  /// Create a copy of DataMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataMetaImplCopyWith<_$DataMetaImpl> get copyWith =>
      __$$DataMetaImplCopyWithImpl<_$DataMetaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataMetaImplToJson(
      this,
    );
  }
}

abstract class _DataMeta extends DataMeta {
  const factory _DataMeta(
      {required final int? id,
      required final DateTime? createdAt,
      required final DateTime? lastModifiedAt,
      required final int? lastModifiedById,
      required final bool isDraft,
      required final String? editingSessionId,
      required final int? createdById,
      required final DateTime? editingSince,
      required final int? editingById,
      required final int? deletedById,
      required final DateTime? deletedAt}) = _$DataMetaImpl;
  const _DataMeta._() : super._();

  factory _DataMeta.fromJson(Map<String, dynamic> json) =
      _$DataMetaImpl.fromJson;

  @override
  int? get id;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get lastModifiedAt;
  @override
  int? get lastModifiedById;
  @override
  bool get isDraft;
  @override
  String? get editingSessionId;
  @override
  int? get createdById;
  @override
  DateTime? get editingSince;
  @override
  int? get editingById;
  @override
  int? get deletedById;
  @override
  DateTime? get deletedAt;

  /// Create a copy of DataMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataMetaImplCopyWith<_$DataMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
