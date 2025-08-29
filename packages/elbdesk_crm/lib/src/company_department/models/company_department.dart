import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_department.freezed.dart';
part 'company_department.g.dart';

/// CompanyDepartment
///
/// This is the frontend CompanyDepartment model
///
@freezed
class CompanyDepartment with _$CompanyDepartment, HasMetaData {
  const factory CompanyDepartment({
    required String name,
    required String description,
    required List<CompanyEmployee> companyEmployees,
    required Contact? company,
    required DataMeta meta,
    required int companyId,
    int? id,
  }) = _CompanyDepartment;

  factory CompanyDepartment.fromJson(Map<String, Object?> json) =>
      _$CompanyDepartmentFromJson(json);

  factory CompanyDepartment.fromDTO(CompanyDepartmentDTO dto) {
    final dataMeta = DataMeta.fromDTO(dto);

    return CompanyDepartment(
      id: dto.id,
      name: dto.name ?? '',
      description: dto.description ?? '',
      company: dto.company != null ? Contact.fromDTO(dto.company!) : null,
      companyEmployees: dto.employees != null
          ? dto.employees!
              .map((t) => CompanyEmployee.fromDTO(t.companyEmployee!))
              .toList()
          : [],
      meta: dataMeta,
      companyId: dto.companyId,
    );
  }

  const CompanyDepartment._();

  CompanyDepartmentDTO toDTO() {
    return CompanyDepartmentDTO(
      isDraft: meta.isDraft,
      id: id,
      name: name,
      description: description,
      createdAt: meta.createdAt!,
      createdById: meta.createdById,
      companyId: companyId,
    );
  }
}

class CompanyDepartmentAdditionalData implements AdditionalEntityData {
  const CompanyDepartmentAdditionalData({
    required this.name,
    required this.companyId,
    this.description,
  });

  factory CompanyDepartmentAdditionalData.fromJson(Map<String, dynamic> json) {
    return CompanyDepartmentAdditionalData(
      name: json['name'] as String,
      description: json['description'] as String?,
      companyId: json['companyId'] as int,
    );
  }

  final String name;
  final String? description;
  final int companyId;

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'companyId': companyId,
    };
  }
}
