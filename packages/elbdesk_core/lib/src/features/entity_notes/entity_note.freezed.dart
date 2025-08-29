// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entity_note.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EntityNote _$EntityNoteFromJson(Map<String, dynamic> json) {
  return _EntityNote.fromJson(json);
}

/// @nodoc
mixin _$EntityNote {
  String get message => throw _privateConstructorUsedError;
  String get tableType => throw _privateConstructorUsedError;
  int get entityId => throw _privateConstructorUsedError;
  List<EntityNote> get children => throw _privateConstructorUsedError;
  int? get parentId => throw _privateConstructorUsedError;
  List<Mention> get mentions => throw _privateConstructorUsedError;
  String? get hardcodedSender => throw _privateConstructorUsedError;
  String? get hint => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  int? get createdById => throw _privateConstructorUsedError;
  DateTime? get lastModifiedAt => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  /// Serializes this EntityNote to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EntityNote
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EntityNoteCopyWith<EntityNote> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntityNoteCopyWith<$Res> {
  factory $EntityNoteCopyWith(
          EntityNote value, $Res Function(EntityNote) then) =
      _$EntityNoteCopyWithImpl<$Res, EntityNote>;
  @useResult
  $Res call(
      {String message,
      String tableType,
      int entityId,
      List<EntityNote> children,
      int? parentId,
      List<Mention> mentions,
      String? hardcodedSender,
      String? hint,
      int? id,
      DateTime? createdAt,
      int? createdById,
      DateTime? lastModifiedAt,
      DateTime? deletedAt});
}

/// @nodoc
class _$EntityNoteCopyWithImpl<$Res, $Val extends EntityNote>
    implements $EntityNoteCopyWith<$Res> {
  _$EntityNoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EntityNote
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? tableType = null,
    Object? entityId = null,
    Object? children = null,
    Object? parentId = freezed,
    Object? mentions = null,
    Object? hardcodedSender = freezed,
    Object? hint = freezed,
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? createdById = freezed,
    Object? lastModifiedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      tableType: null == tableType
          ? _value.tableType
          : tableType // ignore: cast_nullable_to_non_nullable
              as String,
      entityId: null == entityId
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as int,
      children: null == children
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<EntityNote>,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      mentions: null == mentions
          ? _value.mentions
          : mentions // ignore: cast_nullable_to_non_nullable
              as List<Mention>,
      hardcodedSender: freezed == hardcodedSender
          ? _value.hardcodedSender
          : hardcodedSender // ignore: cast_nullable_to_non_nullable
              as String?,
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
      createdById: freezed == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int?,
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
abstract class _$$EntityNoteImplCopyWith<$Res>
    implements $EntityNoteCopyWith<$Res> {
  factory _$$EntityNoteImplCopyWith(
          _$EntityNoteImpl value, $Res Function(_$EntityNoteImpl) then) =
      __$$EntityNoteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message,
      String tableType,
      int entityId,
      List<EntityNote> children,
      int? parentId,
      List<Mention> mentions,
      String? hardcodedSender,
      String? hint,
      int? id,
      DateTime? createdAt,
      int? createdById,
      DateTime? lastModifiedAt,
      DateTime? deletedAt});
}

/// @nodoc
class __$$EntityNoteImplCopyWithImpl<$Res>
    extends _$EntityNoteCopyWithImpl<$Res, _$EntityNoteImpl>
    implements _$$EntityNoteImplCopyWith<$Res> {
  __$$EntityNoteImplCopyWithImpl(
      _$EntityNoteImpl _value, $Res Function(_$EntityNoteImpl) _then)
      : super(_value, _then);

  /// Create a copy of EntityNote
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? tableType = null,
    Object? entityId = null,
    Object? children = null,
    Object? parentId = freezed,
    Object? mentions = null,
    Object? hardcodedSender = freezed,
    Object? hint = freezed,
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? createdById = freezed,
    Object? lastModifiedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_$EntityNoteImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      tableType: null == tableType
          ? _value.tableType
          : tableType // ignore: cast_nullable_to_non_nullable
              as String,
      entityId: null == entityId
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as int,
      children: null == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<EntityNote>,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      mentions: null == mentions
          ? _value._mentions
          : mentions // ignore: cast_nullable_to_non_nullable
              as List<Mention>,
      hardcodedSender: freezed == hardcodedSender
          ? _value.hardcodedSender
          : hardcodedSender // ignore: cast_nullable_to_non_nullable
              as String?,
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
      createdById: freezed == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int?,
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
@JsonSerializable()
class _$EntityNoteImpl extends _EntityNote {
  const _$EntityNoteImpl(
      {required this.message,
      required this.tableType,
      required this.entityId,
      required final List<EntityNote> children,
      required this.parentId,
      final List<Mention> mentions = const [],
      this.hardcodedSender,
      this.hint,
      this.id,
      this.createdAt,
      this.createdById,
      this.lastModifiedAt,
      this.deletedAt})
      : _children = children,
        _mentions = mentions,
        super._();

  factory _$EntityNoteImpl.fromJson(Map<String, dynamic> json) =>
      _$$EntityNoteImplFromJson(json);

  @override
  final String message;
  @override
  final String tableType;
  @override
  final int entityId;
  final List<EntityNote> _children;
  @override
  List<EntityNote> get children {
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_children);
  }

  @override
  final int? parentId;
  final List<Mention> _mentions;
  @override
  @JsonKey()
  List<Mention> get mentions {
    if (_mentions is EqualUnmodifiableListView) return _mentions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mentions);
  }

  @override
  final String? hardcodedSender;
  @override
  final String? hint;
  @override
  final int? id;
  @override
  final DateTime? createdAt;
  @override
  final int? createdById;
  @override
  final DateTime? lastModifiedAt;
  @override
  final DateTime? deletedAt;

  @override
  String toString() {
    return 'EntityNote(message: $message, tableType: $tableType, entityId: $entityId, children: $children, parentId: $parentId, mentions: $mentions, hardcodedSender: $hardcodedSender, hint: $hint, id: $id, createdAt: $createdAt, createdById: $createdById, lastModifiedAt: $lastModifiedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EntityNoteImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.tableType, tableType) ||
                other.tableType == tableType) &&
            (identical(other.entityId, entityId) ||
                other.entityId == entityId) &&
            const DeepCollectionEquality().equals(other._children, _children) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            const DeepCollectionEquality().equals(other._mentions, _mentions) &&
            (identical(other.hardcodedSender, hardcodedSender) ||
                other.hardcodedSender == hardcodedSender) &&
            (identical(other.hint, hint) || other.hint == hint) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.lastModifiedAt, lastModifiedAt) ||
                other.lastModifiedAt == lastModifiedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      message,
      tableType,
      entityId,
      const DeepCollectionEquality().hash(_children),
      parentId,
      const DeepCollectionEquality().hash(_mentions),
      hardcodedSender,
      hint,
      id,
      createdAt,
      createdById,
      lastModifiedAt,
      deletedAt);

  /// Create a copy of EntityNote
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EntityNoteImplCopyWith<_$EntityNoteImpl> get copyWith =>
      __$$EntityNoteImplCopyWithImpl<_$EntityNoteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EntityNoteImplToJson(
      this,
    );
  }
}

abstract class _EntityNote extends EntityNote {
  const factory _EntityNote(
      {required final String message,
      required final String tableType,
      required final int entityId,
      required final List<EntityNote> children,
      required final int? parentId,
      final List<Mention> mentions,
      final String? hardcodedSender,
      final String? hint,
      final int? id,
      final DateTime? createdAt,
      final int? createdById,
      final DateTime? lastModifiedAt,
      final DateTime? deletedAt}) = _$EntityNoteImpl;
  const _EntityNote._() : super._();

  factory _EntityNote.fromJson(Map<String, dynamic> json) =
      _$EntityNoteImpl.fromJson;

  @override
  String get message;
  @override
  String get tableType;
  @override
  int get entityId;
  @override
  List<EntityNote> get children;
  @override
  int? get parentId;
  @override
  List<Mention> get mentions;
  @override
  String? get hardcodedSender;
  @override
  String? get hint;
  @override
  int? get id;
  @override
  DateTime? get createdAt;
  @override
  int? get createdById;
  @override
  DateTime? get lastModifiedAt;
  @override
  DateTime? get deletedAt;

  /// Create a copy of EntityNote
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EntityNoteImplCopyWith<_$EntityNoteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Mention _$MentionFromJson(Map<String, dynamic> json) {
  return _Mention.fromJson(json);
}

/// @nodoc
mixin _$Mention {
  int get userId => throw _privateConstructorUsedError;
  int? get start => throw _privateConstructorUsedError;
  int? get end => throw _privateConstructorUsedError;
  String? get userName => throw _privateConstructorUsedError;

  /// Serializes this Mention to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Mention
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MentionCopyWith<Mention> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MentionCopyWith<$Res> {
  factory $MentionCopyWith(Mention value, $Res Function(Mention) then) =
      _$MentionCopyWithImpl<$Res, Mention>;
  @useResult
  $Res call({int userId, int? start, int? end, String? userName});
}

/// @nodoc
class _$MentionCopyWithImpl<$Res, $Val extends Mention>
    implements $MentionCopyWith<$Res> {
  _$MentionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Mention
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? start = freezed,
    Object? end = freezed,
    Object? userName = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      start: freezed == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as int?,
      end: freezed == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as int?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MentionImplCopyWith<$Res> implements $MentionCopyWith<$Res> {
  factory _$$MentionImplCopyWith(
          _$MentionImpl value, $Res Function(_$MentionImpl) then) =
      __$$MentionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int userId, int? start, int? end, String? userName});
}

/// @nodoc
class __$$MentionImplCopyWithImpl<$Res>
    extends _$MentionCopyWithImpl<$Res, _$MentionImpl>
    implements _$$MentionImplCopyWith<$Res> {
  __$$MentionImplCopyWithImpl(
      _$MentionImpl _value, $Res Function(_$MentionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Mention
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? start = freezed,
    Object? end = freezed,
    Object? userName = freezed,
  }) {
    return _then(_$MentionImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      start: freezed == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as int?,
      end: freezed == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as int?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MentionImpl extends _Mention {
  const _$MentionImpl(
      {required this.userId, this.start, this.end, this.userName})
      : super._();

  factory _$MentionImpl.fromJson(Map<String, dynamic> json) =>
      _$$MentionImplFromJson(json);

  @override
  final int userId;
  @override
  final int? start;
  @override
  final int? end;
  @override
  final String? userName;

  @override
  String toString() {
    return 'Mention(userId: $userId, start: $start, end: $end, userName: $userName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MentionImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            (identical(other.userName, userName) ||
                other.userName == userName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, start, end, userName);

  /// Create a copy of Mention
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MentionImplCopyWith<_$MentionImpl> get copyWith =>
      __$$MentionImplCopyWithImpl<_$MentionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MentionImplToJson(
      this,
    );
  }
}

abstract class _Mention extends Mention {
  const factory _Mention(
      {required final int userId,
      final int? start,
      final int? end,
      final String? userName}) = _$MentionImpl;
  const _Mention._() : super._();

  factory _Mention.fromJson(Map<String, dynamic> json) = _$MentionImpl.fromJson;

  @override
  int get userId;
  @override
  int? get start;
  @override
  int? get end;
  @override
  String? get userName;

  /// Create a copy of Mention
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MentionImplCopyWith<_$MentionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
