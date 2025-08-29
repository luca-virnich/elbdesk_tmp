import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';

/// Customer Table Default Config
///
/// This is the default configuration for the Customer Table. It is used to
/// configure the table fields and their width.
///
/// The initial customer table will always use this configuration.
final customerTableSelectCustomerDefaultColumns = [
  TableFieldConfig(
    width: 100,
    fieldKey: CustomerField.customId.name,
  ),
  TableFieldConfig(
    width: 150,
    fieldKey: CustomerField.customerName.name,
  ),
  TableFieldConfig(
    width: 160,
    fieldKey: CustomerField.address.name,
  ),
  TableFieldConfig(
    width: 140,
    fieldKey: CustomerField.postCode.name,
  ),
  TableFieldConfig(
    width: 150,
    fieldKey: CustomerField.city.name,
  ),
  TableFieldConfig(
    width: 140,
    fieldKey: CustomerField.country.name,
  ),
];
