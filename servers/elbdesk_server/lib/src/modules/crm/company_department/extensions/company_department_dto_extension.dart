import 'package:elbdesk_server/src/generated/protocol.dart';

/// Extension on CompanyDepartmentDTO to provide field value access functionality
extension CompanyDepartmentDTOExtension on CompanyDepartmentDTO {
  /// Gets the string value for a given field from this company_department.
  ///
  /// Returns the string value for the specified field, or null if the field
  /// doesn't support string value extraction.
  String? getFieldValue(CompanyDepartmentField field) {
    switch (field) {
      case CompanyDepartmentField.name:
        return name;
      case CompanyDepartmentField.description:
        return description;
      case CompanyDepartmentField.id:
      case CompanyDepartmentField.createdAt:
      case CompanyDepartmentField.createdBy:
      case CompanyDepartmentField.lastModifiedAt:
      case CompanyDepartmentField.lastModifiedBy:
      case CompanyDepartmentField.isDraft:
      case CompanyDepartmentField.deletedAt:
        return null;
    }
  }
} 
