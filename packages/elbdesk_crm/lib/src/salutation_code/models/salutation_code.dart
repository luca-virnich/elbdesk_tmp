import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'salutation_code.freezed.dart';
part 'salutation_code.g.dart';

@freezed
class SalutationCode with _$SalutationCode, HasMetaData {
  const factory SalutationCode({
    required String code,
    required String description,
    required bool isPrimaryPerson,
    required bool isPrimaryCompany,
    required DataMeta meta,
    int? id,
  }) = _SalutationCode;

  const SalutationCode._();

  factory SalutationCode.fromJson(Map<String, Object?> json) =>
      _$SalutationCodeFromJson(json);

  /// Creates a [SalutationCode] from a [SalutationCodeDTO]
  factory SalutationCode.fromDTO(SalutationCodeDTO dto) {
    final dataMeta = DataMeta.fromDTO(dto);
    return SalutationCode(
      meta: dataMeta,
      id: dto.id,
      code: dto.code,
      description: dto.description,
      isPrimaryPerson: dto.isPrimaryPerson,
      isPrimaryCompany: dto.isPrimaryCompany,
    );
  }

  factory SalutationCode.initial() => SalutationCode(
        meta: DataMeta.initial(),
        code: '',
        description: '',
        isPrimaryPerson: false,
        isPrimaryCompany: false,
      );

  SalutationCodeDTO toDTO() => SalutationCodeDTO(
        code: code,
        description: description,
        id: id,
        createdAt: meta.createdAt!,
        isDraft: meta.isDraft,
        isPrimaryPerson: isPrimaryPerson,
        isPrimaryCompany: isPrimaryCompany,
      );
}
