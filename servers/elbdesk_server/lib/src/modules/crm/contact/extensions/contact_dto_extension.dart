import 'package:elbdesk_server/src/generated/protocol.dart';

/// Extension on ContactDTO to provide field value access functionality
extension ContactDTOExtension on ContactDTO {
  /// Gets the string value for a given field from this contact.
  ///
  /// Returns the string value for the specified field, or null if the field
  /// doesn't support string value extraction.
  String? getFieldValue(ContactField field) {
    switch (field) {
      case ContactField.firstName:
        return firstName;
      case ContactField.lastName:
        return lastName;

      case ContactField.fullName:
        return fullName;
      case ContactField.importantNote:
        return importantNote;
      case ContactField.address:
        return address;
      case ContactField.address2:
        return address2;
      case ContactField.address3:
        return address3;
      case ContactField.postCode:
        return postCode;
      case ContactField.city:
        return city;
      case ContactField.state:
        return state;
      case ContactField.customIdString:
        return customIdString;
      case ContactField.phone:
        return phone;
      case ContactField.mobile:
        return mobile;
      case ContactField.email:
        return email;
      case ContactField.website:
        return website;
      case ContactField.customId:
      case ContactField.birthDate:
      case ContactField.countryCode:
      case ContactField.languageCode:
      case ContactField.salutationCode:
      case ContactField.customerCustomId:
      case ContactField.customer:
      case ContactField.customerId:
      case ContactField.createdBy:
      case ContactField.lastModifiedBy:
      case ContactField.id:
      case ContactField.type:
      case ContactField.createdAt:
      case ContactField.lastModifiedAt:
      case ContactField.selectContact:
      case ContactField.filterByIdOrFullName:
      case ContactField.actions:
      case ContactField.deletedAt:
      case ContactField.isDraft:
        return null;
    }
  }
}
