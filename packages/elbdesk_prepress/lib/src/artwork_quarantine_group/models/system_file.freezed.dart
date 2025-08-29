// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'system_file.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SystemFile _$SystemFileFromJson(Map<String, dynamic> json) {
  return _SystemFile.fromJson(json);
}

/// @nodoc
mixin _$SystemFile {
  String get id => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  String get filename => throw _privateConstructorUsedError;
  SystemFileAttachmentType? get attachmentType =>
      throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get originalPath => throw _privateConstructorUsedError;
  int? get fileSize => throw _privateConstructorUsedError;
  String? get mimeType => throw _privateConstructorUsedError;
  int? get createdById => throw _privateConstructorUsedError;
  DateTime? get lastModifiedAt => throw _privateConstructorUsedError;
  int? get lastModifiedById => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;
  int? get deletedById => throw _privateConstructorUsedError;
  bool get isCopiedToOutputPath => throw _privateConstructorUsedError;

  /// Serializes this SystemFile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SystemFile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SystemFileCopyWith<SystemFile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SystemFileCopyWith<$Res> {
  factory $SystemFileCopyWith(
          SystemFile value, $Res Function(SystemFile) then) =
      _$SystemFileCopyWithImpl<$Res, SystemFile>;
  @useResult
  $Res call(
      {String id,
      String path,
      String filename,
      SystemFileAttachmentType? attachmentType,
      DateTime createdAt,
      String originalPath,
      int? fileSize,
      String? mimeType,
      int? createdById,
      DateTime? lastModifiedAt,
      int? lastModifiedById,
      DateTime? deletedAt,
      int? deletedById,
      bool isCopiedToOutputPath});
}

/// @nodoc
class _$SystemFileCopyWithImpl<$Res, $Val extends SystemFile>
    implements $SystemFileCopyWith<$Res> {
  _$SystemFileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SystemFile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? path = null,
    Object? filename = null,
    Object? attachmentType = freezed,
    Object? createdAt = null,
    Object? originalPath = null,
    Object? fileSize = freezed,
    Object? mimeType = freezed,
    Object? createdById = freezed,
    Object? lastModifiedAt = freezed,
    Object? lastModifiedById = freezed,
    Object? deletedAt = freezed,
    Object? deletedById = freezed,
    Object? isCopiedToOutputPath = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      filename: null == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
      attachmentType: freezed == attachmentType
          ? _value.attachmentType
          : attachmentType // ignore: cast_nullable_to_non_nullable
              as SystemFileAttachmentType?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      originalPath: null == originalPath
          ? _value.originalPath
          : originalPath // ignore: cast_nullable_to_non_nullable
              as String,
      fileSize: freezed == fileSize
          ? _value.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as int?,
      mimeType: freezed == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String?,
      createdById: freezed == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int?,
      lastModifiedAt: freezed == lastModifiedAt
          ? _value.lastModifiedAt
          : lastModifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastModifiedById: freezed == lastModifiedById
          ? _value.lastModifiedById
          : lastModifiedById // ignore: cast_nullable_to_non_nullable
              as int?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deletedById: freezed == deletedById
          ? _value.deletedById
          : deletedById // ignore: cast_nullable_to_non_nullable
              as int?,
      isCopiedToOutputPath: null == isCopiedToOutputPath
          ? _value.isCopiedToOutputPath
          : isCopiedToOutputPath // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SystemFileImplCopyWith<$Res>
    implements $SystemFileCopyWith<$Res> {
  factory _$$SystemFileImplCopyWith(
          _$SystemFileImpl value, $Res Function(_$SystemFileImpl) then) =
      __$$SystemFileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String path,
      String filename,
      SystemFileAttachmentType? attachmentType,
      DateTime createdAt,
      String originalPath,
      int? fileSize,
      String? mimeType,
      int? createdById,
      DateTime? lastModifiedAt,
      int? lastModifiedById,
      DateTime? deletedAt,
      int? deletedById,
      bool isCopiedToOutputPath});
}

/// @nodoc
class __$$SystemFileImplCopyWithImpl<$Res>
    extends _$SystemFileCopyWithImpl<$Res, _$SystemFileImpl>
    implements _$$SystemFileImplCopyWith<$Res> {
  __$$SystemFileImplCopyWithImpl(
      _$SystemFileImpl _value, $Res Function(_$SystemFileImpl) _then)
      : super(_value, _then);

  /// Create a copy of SystemFile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? path = null,
    Object? filename = null,
    Object? attachmentType = freezed,
    Object? createdAt = null,
    Object? originalPath = null,
    Object? fileSize = freezed,
    Object? mimeType = freezed,
    Object? createdById = freezed,
    Object? lastModifiedAt = freezed,
    Object? lastModifiedById = freezed,
    Object? deletedAt = freezed,
    Object? deletedById = freezed,
    Object? isCopiedToOutputPath = null,
  }) {
    return _then(_$SystemFileImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      filename: null == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
      attachmentType: freezed == attachmentType
          ? _value.attachmentType
          : attachmentType // ignore: cast_nullable_to_non_nullable
              as SystemFileAttachmentType?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      originalPath: null == originalPath
          ? _value.originalPath
          : originalPath // ignore: cast_nullable_to_non_nullable
              as String,
      fileSize: freezed == fileSize
          ? _value.fileSize
          : fileSize // ignore: cast_nullable_to_non_nullable
              as int?,
      mimeType: freezed == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String?,
      createdById: freezed == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int?,
      lastModifiedAt: freezed == lastModifiedAt
          ? _value.lastModifiedAt
          : lastModifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastModifiedById: freezed == lastModifiedById
          ? _value.lastModifiedById
          : lastModifiedById // ignore: cast_nullable_to_non_nullable
              as int?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deletedById: freezed == deletedById
          ? _value.deletedById
          : deletedById // ignore: cast_nullable_to_non_nullable
              as int?,
      isCopiedToOutputPath: null == isCopiedToOutputPath
          ? _value.isCopiedToOutputPath
          : isCopiedToOutputPath // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SystemFileImpl extends _SystemFile {
  const _$SystemFileImpl(
      {required this.id,
      required this.path,
      required this.filename,
      required this.attachmentType,
      required this.createdAt,
      required this.originalPath,
      this.fileSize,
      this.mimeType,
      this.createdById,
      this.lastModifiedAt,
      this.lastModifiedById,
      this.deletedAt,
      this.deletedById,
      this.isCopiedToOutputPath = false})
      : super._();

  factory _$SystemFileImpl.fromJson(Map<String, dynamic> json) =>
      _$$SystemFileImplFromJson(json);

  @override
  final String id;
  @override
  final String path;
  @override
  final String filename;
  @override
  final SystemFileAttachmentType? attachmentType;
  @override
  final DateTime createdAt;
  @override
  final String originalPath;
  @override
  final int? fileSize;
  @override
  final String? mimeType;
  @override
  final int? createdById;
  @override
  final DateTime? lastModifiedAt;
  @override
  final int? lastModifiedById;
  @override
  final DateTime? deletedAt;
  @override
  final int? deletedById;
  @override
  @JsonKey()
  final bool isCopiedToOutputPath;

  @override
  String toString() {
    return 'SystemFile(id: $id, path: $path, filename: $filename, attachmentType: $attachmentType, createdAt: $createdAt, originalPath: $originalPath, fileSize: $fileSize, mimeType: $mimeType, createdById: $createdById, lastModifiedAt: $lastModifiedAt, lastModifiedById: $lastModifiedById, deletedAt: $deletedAt, deletedById: $deletedById, isCopiedToOutputPath: $isCopiedToOutputPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SystemFileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.filename, filename) ||
                other.filename == filename) &&
            (identical(other.attachmentType, attachmentType) ||
                other.attachmentType == attachmentType) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.originalPath, originalPath) ||
                other.originalPath == originalPath) &&
            (identical(other.fileSize, fileSize) ||
                other.fileSize == fileSize) &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.lastModifiedAt, lastModifiedAt) ||
                other.lastModifiedAt == lastModifiedAt) &&
            (identical(other.lastModifiedById, lastModifiedById) ||
                other.lastModifiedById == lastModifiedById) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.deletedById, deletedById) ||
                other.deletedById == deletedById) &&
            (identical(other.isCopiedToOutputPath, isCopiedToOutputPath) ||
                other.isCopiedToOutputPath == isCopiedToOutputPath));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      path,
      filename,
      attachmentType,
      createdAt,
      originalPath,
      fileSize,
      mimeType,
      createdById,
      lastModifiedAt,
      lastModifiedById,
      deletedAt,
      deletedById,
      isCopiedToOutputPath);

  /// Create a copy of SystemFile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SystemFileImplCopyWith<_$SystemFileImpl> get copyWith =>
      __$$SystemFileImplCopyWithImpl<_$SystemFileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SystemFileImplToJson(
      this,
    );
  }
}

abstract class _SystemFile extends SystemFile {
  const factory _SystemFile(
      {required final String id,
      required final String path,
      required final String filename,
      required final SystemFileAttachmentType? attachmentType,
      required final DateTime createdAt,
      required final String originalPath,
      final int? fileSize,
      final String? mimeType,
      final int? createdById,
      final DateTime? lastModifiedAt,
      final int? lastModifiedById,
      final DateTime? deletedAt,
      final int? deletedById,
      final bool isCopiedToOutputPath}) = _$SystemFileImpl;
  const _SystemFile._() : super._();

  factory _SystemFile.fromJson(Map<String, dynamic> json) =
      _$SystemFileImpl.fromJson;

  @override
  String get id;
  @override
  String get path;
  @override
  String get filename;
  @override
  SystemFileAttachmentType? get attachmentType;
  @override
  DateTime get createdAt;
  @override
  String get originalPath;
  @override
  int? get fileSize;
  @override
  String? get mimeType;
  @override
  int? get createdById;
  @override
  DateTime? get lastModifiedAt;
  @override
  int? get lastModifiedById;
  @override
  DateTime? get deletedAt;
  @override
  int? get deletedById;
  @override
  bool get isCopiedToOutputPath;

  /// Create a copy of SystemFile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SystemFileImplCopyWith<_$SystemFileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
