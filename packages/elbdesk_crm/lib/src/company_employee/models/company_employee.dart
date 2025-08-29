import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_employee.freezed.dart';
part 'company_employee.g.dart';

/// CompanyEmployee
/// This is the app side Contact model. It is used to store contact information
/// for a contact during runtime. The ContactDTO is fetched from the server and
/// converted to a Contact object.
///
/// To parse the ContactDTO to and from a Contact object, the fromDTO and toDTO
/// methods are used.
///
@freezed
class CompanyEmployee with _$CompanyEmployee, HasMetaData {
  /// CompanyEmployee constructor
  const factory CompanyEmployee({
    required Contact company,
    required Contact employee,
    required String position,
    required List<CompanyDepartment>? departments,
    required bool active,
    required String note,
    required DataMeta meta,
    int? id,
  }) = _CompanyEmployee;

  const CompanyEmployee._();

  factory CompanyEmployee.fromJson(Map<String, Object?> json) =>
      _$CompanyEmployeeFromJson(json);

  factory CompanyEmployee.fromDTO(CompanyEmployeeDTO dto) {
    final dataMeta = DataMeta.fromDTO(dto);
    return CompanyEmployee(
      company: Contact.fromDTO(dto.company!),
      employee: Contact.fromDTO(dto.employee!),
      position: dto.position,
      departments: dto.departments
          ?.map((jt) => CompanyDepartment.fromDTO(jt.companyDepartment!))
          .toList(),
      id: dto.id,
      active: dto.active,
      note: dto.note,
      meta: dataMeta,
    );
  }

  CompanyEmployeeDTO toDTO() {
    return CompanyEmployeeDTO(
      id: meta.id,
      companyId: company.meta.id!,
      isDraft: meta.isDraft,
      company: company.toDTO(),
      employee: employee.toDTO(),
      position: position,
      departments: departments
          ?.map(
            (t) => CompanyEmployeeDepartmentJT(
              companyEmployeeId: meta.id!,
              companyDepartmentId: t.meta.id!,
            ),
          )
          .toList(),
      active: active,
      note: note,
      createdAt: meta.createdAt!,
      createdById: meta.createdById,
      employeeId: employee.meta.id!,
      editingSince: meta.editingSince,
      editingById: meta.editingById,
      editingSession: meta.editingSessionId,
      deletedAt: meta.deletedAt,
      deletedById: meta.deletedById,
    );
  }
}

class CompanyEmployeeAdditionalData implements AdditionalEntityData {
  const CompanyEmployeeAdditionalData({
    required this.companyName,
    required this.employeeName,
  });

  factory CompanyEmployeeAdditionalData.fromJson(Map<String, dynamic> json) {
    return CompanyEmployeeAdditionalData(
      companyName: json['companyName'] as String?,
      employeeName: json['employeeName'] as String?,
    );
  }

  final String? companyName;
  final String? employeeName;

  @override
  Map<String, dynamic> toJson() {
    return {
      'companyName': companyName,
      'employeeName': employeeName,
    };
  }
}
