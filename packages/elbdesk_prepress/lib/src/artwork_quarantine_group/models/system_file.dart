import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'system_file.freezed.dart';
part 'system_file.g.dart';

/// System File model
///
/// Represents a file on the clients file system
@freezed
class SystemFile with _$SystemFile {
  const factory SystemFile({
    required String id,
    required String path,
    required String filename,
    required SystemFileAttachmentType? attachmentType,
    required DateTime createdAt,
    required String originalPath,
    int? fileSize,
    String? mimeType,
    int? createdById,
    DateTime? lastModifiedAt,
    int? lastModifiedById,
    DateTime? deletedAt,
    int? deletedById,
    @Default(false) bool isCopiedToOutputPath,
  }) = _SystemFile;

  const SystemFile._();

  factory SystemFile.fromJson(Map<String, Object?> json) =>
      _$SystemFileFromJson(json);

  /// From DTO
  factory SystemFile.fromDTO(SystemFileDTO dto) {
    return SystemFile(
      id: dto.id,
      path: dto.path,
      filename: dto.filename,
      originalPath: dto.originalPath ?? '',
      attachmentType: Parser.enumFromString(
        SystemFileAttachmentType.values,
        dto.attachmentType,
      ),
      fileSize: dto.fileSize,
      mimeType: dto.mimeType,
      createdAt: dto.createdAt,
      createdById: dto.createdById,
      lastModifiedAt: dto.lastModifiedAt,
      lastModifiedById: dto.lastModifiedById,
      deletedAt: dto.deletedAt,
      deletedById: dto.deletedById,
      isCopiedToOutputPath: dto.isCopiedToOutputPath,
    );
  }

  /// To DTO
  SystemFileDTO toDTO() {
    return SystemFileDTO(
      id: id,
      path: path,
      filename: filename,
      originalPath: originalPath,
      attachmentType: attachmentType?.name,
      fileSize: fileSize,
      mimeType: mimeType,
      createdAt: createdAt,
      createdById: createdById,
      lastModifiedAt: lastModifiedAt,
      lastModifiedById: lastModifiedById,
      deletedAt: deletedAt,
      deletedById: deletedById,
      isCopiedToOutputPath: isCopiedToOutputPath,
    );
  }
}
