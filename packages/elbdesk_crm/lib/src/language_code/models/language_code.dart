import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'language_code.freezed.dart';
part 'language_code.g.dart';

@freezed
class LanguageCode with _$LanguageCode, HasMetaData {
  const factory LanguageCode({
    required String code,
    required String name,
    required DataMeta meta,
    required bool isPrimary,
    int? id,
  }) = _LanguageCode;

  const LanguageCode._();

  factory LanguageCode.fromJson(Map<String, Object?> json) =>
      _$LanguageCodeFromJson(json);

  /// Creates a [LanguageCode] from a [LanguageCodeDTO]
  factory LanguageCode.fromDTO(LanguageCodeDTO dto) {
    final dataMeta = DataMeta.fromDTO(dto);
    return LanguageCode(
      meta: dataMeta,
      id: dto.id,
      code: dto.code,
      name: dto.languageName,
      isPrimary: dto.isPrimary,
    );
  }

  factory LanguageCode.initial() {
    final dataMeta = DataMeta.initial();
    return LanguageCode(
      meta: dataMeta,
      id: null,
      code: '',
      name: '',
      isPrimary: false,
    );
  }

  LanguageCodeDTO toDTO() => LanguageCodeDTO(
        code: code,
        languageName: name,
        id: id,
        isDraft: meta.isDraft,
        lastModifiedAt: meta.lastModifiedAt,
        createdAt: meta.createdAt!,
        createdById: meta.createdById,
        editingSession: meta.editingSessionId,
        isPrimary: isPrimary,
      );
}
