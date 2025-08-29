import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'department_code.freezed.dart';
part 'department_code.g.dart';

@freezed
class DepartmentCode with _$DepartmentCode, HasMetaData {
  const factory DepartmentCode({
    required String code,
    required String description,
    required DataMeta meta,
    int? id,
  }) = _DepartmentCode;

  const DepartmentCode._();

  factory DepartmentCode.fromJson(Map<String, Object?> json) =>
      _$DepartmentCodeFromJson(json);

  /// Creates a [DepartmentCode] from a [DepartmentCodeDTO]
  factory DepartmentCode.fromDTO(DepartmentCodeDTO dto) {
    final dataMeta = DataMeta.fromDTO(dto);
    return DepartmentCode(
      meta: dataMeta,
      id: dto.id,
      code: dto.code,
      description: dto.description,
    );
  }

  factory DepartmentCode.initial() => DepartmentCode(
        meta: DataMeta.initial(),
        code: '',
        description: '',
      );

  DepartmentCodeDTO toDTO() => DepartmentCodeDTO(
        code: code,
        description: description,
        id: id,
        createdAt: meta.createdAt!,
        isDraft: meta.isDraft,
      );
}
