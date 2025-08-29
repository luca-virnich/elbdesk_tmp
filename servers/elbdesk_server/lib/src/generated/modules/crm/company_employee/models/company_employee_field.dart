/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

enum CompanyEmployeeField implements _i1.SerializableModel {
  id,
  company,
  employee,
  position,
  department,
  active,
  note,
  filterByEmployeeContactIdOrFullName,
  employeeContactCustomId,
  employeeContactFullName,
  employeeContactAddress,
  employeeContactAddress2,
  employeeContactPostCode,
  employeeContactCity,
  employeeContactState,
  employeeContactPhone,
  employeeContactEmail,
  employeeContactMobile,
  employeeContactCountryCode,
  employeeContactLanguageCode,
  filterByCompanyContactIdOrFullName,
  companyContactCustomId,
  companyContactFullName,
  companyContactAddress,
  companyContactAddress2,
  companyContactPostCode,
  companyContactCity,
  companyContactState,
  companyContactPhone,
  companyContactEmail,
  companyContactMobile,
  companyContactCountryCode,
  companyContactLanguageCode,
  actions,
  createdAt,
  createdBy,
  lastModifiedAt,
  lastModifiedBy,
  deletedAt,
  isDraft;

  static CompanyEmployeeField fromJson(String name) {
    switch (name) {
      case 'id':
        return CompanyEmployeeField.id;
      case 'company':
        return CompanyEmployeeField.company;
      case 'employee':
        return CompanyEmployeeField.employee;
      case 'position':
        return CompanyEmployeeField.position;
      case 'department':
        return CompanyEmployeeField.department;
      case 'active':
        return CompanyEmployeeField.active;
      case 'note':
        return CompanyEmployeeField.note;
      case 'filterByEmployeeContactIdOrFullName':
        return CompanyEmployeeField.filterByEmployeeContactIdOrFullName;
      case 'employeeContactCustomId':
        return CompanyEmployeeField.employeeContactCustomId;
      case 'employeeContactFullName':
        return CompanyEmployeeField.employeeContactFullName;
      case 'employeeContactAddress':
        return CompanyEmployeeField.employeeContactAddress;
      case 'employeeContactAddress2':
        return CompanyEmployeeField.employeeContactAddress2;
      case 'employeeContactPostCode':
        return CompanyEmployeeField.employeeContactPostCode;
      case 'employeeContactCity':
        return CompanyEmployeeField.employeeContactCity;
      case 'employeeContactState':
        return CompanyEmployeeField.employeeContactState;
      case 'employeeContactPhone':
        return CompanyEmployeeField.employeeContactPhone;
      case 'employeeContactEmail':
        return CompanyEmployeeField.employeeContactEmail;
      case 'employeeContactMobile':
        return CompanyEmployeeField.employeeContactMobile;
      case 'employeeContactCountryCode':
        return CompanyEmployeeField.employeeContactCountryCode;
      case 'employeeContactLanguageCode':
        return CompanyEmployeeField.employeeContactLanguageCode;
      case 'filterByCompanyContactIdOrFullName':
        return CompanyEmployeeField.filterByCompanyContactIdOrFullName;
      case 'companyContactCustomId':
        return CompanyEmployeeField.companyContactCustomId;
      case 'companyContactFullName':
        return CompanyEmployeeField.companyContactFullName;
      case 'companyContactAddress':
        return CompanyEmployeeField.companyContactAddress;
      case 'companyContactAddress2':
        return CompanyEmployeeField.companyContactAddress2;
      case 'companyContactPostCode':
        return CompanyEmployeeField.companyContactPostCode;
      case 'companyContactCity':
        return CompanyEmployeeField.companyContactCity;
      case 'companyContactState':
        return CompanyEmployeeField.companyContactState;
      case 'companyContactPhone':
        return CompanyEmployeeField.companyContactPhone;
      case 'companyContactEmail':
        return CompanyEmployeeField.companyContactEmail;
      case 'companyContactMobile':
        return CompanyEmployeeField.companyContactMobile;
      case 'companyContactCountryCode':
        return CompanyEmployeeField.companyContactCountryCode;
      case 'companyContactLanguageCode':
        return CompanyEmployeeField.companyContactLanguageCode;
      case 'actions':
        return CompanyEmployeeField.actions;
      case 'createdAt':
        return CompanyEmployeeField.createdAt;
      case 'createdBy':
        return CompanyEmployeeField.createdBy;
      case 'lastModifiedAt':
        return CompanyEmployeeField.lastModifiedAt;
      case 'lastModifiedBy':
        return CompanyEmployeeField.lastModifiedBy;
      case 'deletedAt':
        return CompanyEmployeeField.deletedAt;
      case 'isDraft':
        return CompanyEmployeeField.isDraft;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "CompanyEmployeeField"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
