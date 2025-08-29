import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';

/// Contact Default Config
///
/// This is the default configuration for the contact table. It is used to
/// configure the initial table fields and the width of each field.
///
final contactTableSelectAddressColumns = [
  TableFieldConfig(
    width: 80,
    fieldKey: ContactField.id.name,
  ),
  TableFieldConfig(
    width: 140,
    fieldKey: ContactField.selectContact.name,
  ),
  TableFieldConfig(
    width: 140,
    fieldKey: ContactField.fullName.name,
  ),
  TableFieldConfig(
    width: 140,
    fieldKey: ContactField.phone.name,
  ),
  TableFieldConfig(
    width: 140,
    fieldKey: ContactField.mobile.name,
  ),
  TableFieldConfig(
    width: 140,
    fieldKey: ContactField.email.name,
  ),
  TableFieldConfig(
    width: 140,
    fieldKey: ContactField.city.name,
  ),
  TableFieldConfig(
    width: 140,
    fieldKey: ContactField.countryCode.name,
  ),
  TableFieldConfig(
    width: 140,
    fieldKey: ContactField.customerId.name,
  ),
];
