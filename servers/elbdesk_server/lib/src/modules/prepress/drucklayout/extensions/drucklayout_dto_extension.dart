import 'package:elbdesk_server/src/generated/protocol.dart';

/// Extension on DrucklayoutDTO to provide field value access functionality
extension DrucklayoutDTOExtension on DrucklayoutDTO {
  /// Gets the string value for a given field from this drucklayout.
  ///
  /// Returns the string value for the specified field, or null if the field
  /// doesn't support string value extraction.
  String? getFieldValue(DrucklayoutField field) {
    switch (field) {
      case DrucklayoutField.title:
        return title;
      case DrucklayoutField.description:
        return description;
      case DrucklayoutField.customerId:
        return customer?.id?.toString();
      case DrucklayoutField.id:
      case DrucklayoutField.drucklayoutPreSelection:
      case DrucklayoutField.drucklayoutSelection:
      case DrucklayoutField.createdAt:
      case DrucklayoutField.createdBy:
      case DrucklayoutField.lastModifiedAt:
      case DrucklayoutField.lastModifiedBy:
      case DrucklayoutField.isDraft:
      case DrucklayoutField.deletedAt:
        return null;
    }
  }
}
