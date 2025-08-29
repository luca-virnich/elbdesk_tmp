// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Note {
  String get message => throw _privateConstructorUsedError;
  TableType get entity => throw _privateConstructorUsedError;
  int get entityId => throw _privateConstructorUsedError;
  List<Note> get children => throw _privateConstructorUsedError;
  int? get parentId => throw _privateConstructorUsedError;
  String? get hint => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  UserInfo? get createdBy => throw _privateConstructorUsedError;
  DateTime? get lastModifiedAt => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  /// Create a copy of Note
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NoteCopyWith<Note> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteCopyWith<$Res> {
  factory $NoteCopyWith(Note value, $Res Function(Note) then) =
      _$NoteCopyWithImpl<$Res, Note>;
  @useResult
  $Res call(
      {String message,
      TableType entity,
      int entityId,
      List<Note> children,
      int? parentId,
      String? hint,
      int? id,
      DateTime? createdAt,
      UserInfo? createdBy,
      DateTime? lastModifiedAt,
      DateTime? deletedAt});
}

/// @nodoc
class _$NoteCopyWithImpl<$Res, $Val extends Note>
    implements $NoteCopyWith<$Res> {
  _$NoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Note
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? entity = null,
    Object? entityId = null,
    Object? children = null,
    Object? parentId = freezed,
    Object? hint = freezed,
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? createdBy = freezed,
    Object? lastModifiedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      entity: null == entity
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as TableType,
      entityId: null == entityId
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as int,
      children: null == children
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<Note>,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      hint: freezed == hint
          ? _value.hint
          : hint // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as UserInfo?,
      lastModifiedAt: freezed == lastModifiedAt
          ? _value.lastModifiedAt
          : lastModifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NoteImplCopyWith<$Res> implements $NoteCopyWith<$Res> {
  factory _$$NoteImplCopyWith(
          _$NoteImpl value, $Res Function(_$NoteImpl) then) =
      __$$NoteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message,
      TableType entity,
      int entityId,
      List<Note> children,
      int? parentId,
      String? hint,
      int? id,
      DateTime? createdAt,
      UserInfo? createdBy,
      DateTime? lastModifiedAt,
      DateTime? deletedAt});
}

/// @nodoc
class __$$NoteImplCopyWithImpl<$Res>
    extends _$NoteCopyWithImpl<$Res, _$NoteImpl>
    implements _$$NoteImplCopyWith<$Res> {
  __$$NoteImplCopyWithImpl(_$NoteImpl _value, $Res Function(_$NoteImpl) _then)
      : super(_value, _then);

  /// Create a copy of Note
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? entity = null,
    Object? entityId = null,
    Object? children = null,
    Object? parentId = freezed,
    Object? hint = freezed,
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? createdBy = freezed,
    Object? lastModifiedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_$NoteImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      entity: null == entity
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as TableType,
      entityId: null == entityId
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as int,
      children: null == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<Note>,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      hint: freezed == hint
          ? _value.hint
          : hint // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as UserInfo?,
      lastModifiedAt: freezed == lastModifiedAt
          ? _value.lastModifiedAt
          : lastModifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$NoteImpl extends _Note {
  const _$NoteImpl(
      {required this.message,
      required this.entity,
      required this.entityId,
      required final List<Note> children,
      required this.parentId,
      this.hint,
      this.id,
      this.createdAt,
      this.createdBy,
      this.lastModifiedAt,
      this.deletedAt})
      : _children = children,
        super._();

  @override
  final String message;
  @override
  final TableType entity;
  @override
  final int entityId;
  final List<Note> _children;
  @override
  List<Note> get children {
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_children);
  }

  @override
  final int? parentId;
  @override
  final String? hint;
  @override
  final int? id;
  @override
  final DateTime? createdAt;
  @override
  final UserInfo? createdBy;
  @override
  final DateTime? lastModifiedAt;
  @override
  final DateTime? deletedAt;

  @override
  String toString() {
    return 'Note(message: $message, entity: $entity, entityId: $entityId, children: $children, parentId: $parentId, hint: $hint, id: $id, createdAt: $createdAt, createdBy: $createdBy, lastModifiedAt: $lastModifiedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoteImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.entity, entity) || other.entity == entity) &&
            (identical(other.entityId, entityId) ||
                other.entityId == entityId) &&
            const DeepCollectionEquality().equals(other._children, _children) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.hint, hint) || other.hint == hint) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.lastModifiedAt, lastModifiedAt) ||
                other.lastModifiedAt == lastModifiedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      message,
      entity,
      entityId,
      const DeepCollectionEquality().hash(_children),
      parentId,
      hint,
      id,
      createdAt,
      createdBy,
      lastModifiedAt,
      deletedAt);

  /// Create a copy of Note
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NoteImplCopyWith<_$NoteImpl> get copyWith =>
      __$$NoteImplCopyWithImpl<_$NoteImpl>(this, _$identity);
}

abstract class _Note extends Note {
  const factory _Note(
      {required final String message,
      required final TableType entity,
      required final int entityId,
      required final List<Note> children,
      required final int? parentId,
      final String? hint,
      final int? id,
      final DateTime? createdAt,
      final UserInfo? createdBy,
      final DateTime? lastModifiedAt,
      final DateTime? deletedAt}) = _$NoteImpl;
  const _Note._() : super._();

  @override
  String get message;
  @override
  TableType get entity;
  @override
  int get entityId;
  @override
  List<Note> get children;
  @override
  int? get parentId;
  @override
  String? get hint;
  @override
  int? get id;
  @override
  DateTime? get createdAt;
  @override
  UserInfo? get createdBy;
  @override
  DateTime? get lastModifiedAt;
  @override
  DateTime? get deletedAt;

  /// Create a copy of Note
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NoteImplCopyWith<_$NoteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
