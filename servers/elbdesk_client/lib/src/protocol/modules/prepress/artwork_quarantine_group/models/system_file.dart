/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class SystemFileDTO implements _i1.SerializableModel {
  SystemFileDTO._({
    required this.id,
    required this.path,
    required this.filename,
    this.originalPath,
    this.attachmentType,
    this.fileSize,
    this.mimeType,
    required this.isCopiedToOutputPath,
    required this.createdAt,
    this.createdById,
    this.lastModifiedAt,
    this.lastModifiedById,
    this.deletedAt,
    this.deletedById,
  });

  factory SystemFileDTO({
    required String id,
    required String path,
    required String filename,
    String? originalPath,
    String? attachmentType,
    int? fileSize,
    String? mimeType,
    required bool isCopiedToOutputPath,
    required DateTime createdAt,
    int? createdById,
    DateTime? lastModifiedAt,
    int? lastModifiedById,
    DateTime? deletedAt,
    int? deletedById,
  }) = _SystemFileDTOImpl;

  factory SystemFileDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return SystemFileDTO(
      id: jsonSerialization['id'] as String,
      path: jsonSerialization['path'] as String,
      filename: jsonSerialization['filename'] as String,
      originalPath: jsonSerialization['originalPath'] as String?,
      attachmentType: jsonSerialization['attachmentType'] as String?,
      fileSize: jsonSerialization['fileSize'] as int?,
      mimeType: jsonSerialization['mimeType'] as String?,
      isCopiedToOutputPath: jsonSerialization['isCopiedToOutputPath'] as bool,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      createdById: jsonSerialization['createdById'] as int?,
      lastModifiedAt: jsonSerialization['lastModifiedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastModifiedAt']),
      lastModifiedById: jsonSerialization['lastModifiedById'] as int?,
      deletedAt: jsonSerialization['deletedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['deletedAt']),
      deletedById: jsonSerialization['deletedById'] as int?,
    );
  }

  String id;

  String path;

  String filename;

  String? originalPath;

  String? attachmentType;

  int? fileSize;

  String? mimeType;

  bool isCopiedToOutputPath;

  DateTime createdAt;

  int? createdById;

  DateTime? lastModifiedAt;

  int? lastModifiedById;

  DateTime? deletedAt;

  int? deletedById;

  /// Returns a shallow copy of this [SystemFileDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SystemFileDTO copyWith({
    String? id,
    String? path,
    String? filename,
    String? originalPath,
    String? attachmentType,
    int? fileSize,
    String? mimeType,
    bool? isCopiedToOutputPath,
    DateTime? createdAt,
    int? createdById,
    DateTime? lastModifiedAt,
    int? lastModifiedById,
    DateTime? deletedAt,
    int? deletedById,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'path': path,
      'filename': filename,
      if (originalPath != null) 'originalPath': originalPath,
      if (attachmentType != null) 'attachmentType': attachmentType,
      if (fileSize != null) 'fileSize': fileSize,
      if (mimeType != null) 'mimeType': mimeType,
      'isCopiedToOutputPath': isCopiedToOutputPath,
      'createdAt': createdAt.toJson(),
      if (createdById != null) 'createdById': createdById,
      if (lastModifiedAt != null) 'lastModifiedAt': lastModifiedAt?.toJson(),
      if (lastModifiedById != null) 'lastModifiedById': lastModifiedById,
      if (deletedAt != null) 'deletedAt': deletedAt?.toJson(),
      if (deletedById != null) 'deletedById': deletedById,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SystemFileDTOImpl extends SystemFileDTO {
  _SystemFileDTOImpl({
    required String id,
    required String path,
    required String filename,
    String? originalPath,
    String? attachmentType,
    int? fileSize,
    String? mimeType,
    required bool isCopiedToOutputPath,
    required DateTime createdAt,
    int? createdById,
    DateTime? lastModifiedAt,
    int? lastModifiedById,
    DateTime? deletedAt,
    int? deletedById,
  }) : super._(
          id: id,
          path: path,
          filename: filename,
          originalPath: originalPath,
          attachmentType: attachmentType,
          fileSize: fileSize,
          mimeType: mimeType,
          isCopiedToOutputPath: isCopiedToOutputPath,
          createdAt: createdAt,
          createdById: createdById,
          lastModifiedAt: lastModifiedAt,
          lastModifiedById: lastModifiedById,
          deletedAt: deletedAt,
          deletedById: deletedById,
        );

  /// Returns a shallow copy of this [SystemFileDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SystemFileDTO copyWith({
    String? id,
    String? path,
    String? filename,
    Object? originalPath = _Undefined,
    Object? attachmentType = _Undefined,
    Object? fileSize = _Undefined,
    Object? mimeType = _Undefined,
    bool? isCopiedToOutputPath,
    DateTime? createdAt,
    Object? createdById = _Undefined,
    Object? lastModifiedAt = _Undefined,
    Object? lastModifiedById = _Undefined,
    Object? deletedAt = _Undefined,
    Object? deletedById = _Undefined,
  }) {
    return SystemFileDTO(
      id: id ?? this.id,
      path: path ?? this.path,
      filename: filename ?? this.filename,
      originalPath: originalPath is String? ? originalPath : this.originalPath,
      attachmentType:
          attachmentType is String? ? attachmentType : this.attachmentType,
      fileSize: fileSize is int? ? fileSize : this.fileSize,
      mimeType: mimeType is String? ? mimeType : this.mimeType,
      isCopiedToOutputPath: isCopiedToOutputPath ?? this.isCopiedToOutputPath,
      createdAt: createdAt ?? this.createdAt,
      createdById: createdById is int? ? createdById : this.createdById,
      lastModifiedAt:
          lastModifiedAt is DateTime? ? lastModifiedAt : this.lastModifiedAt,
      lastModifiedById:
          lastModifiedById is int? ? lastModifiedById : this.lastModifiedById,
      deletedAt: deletedAt is DateTime? ? deletedAt : this.deletedAt,
      deletedById: deletedById is int? ? deletedById : this.deletedById,
    );
  }
}
