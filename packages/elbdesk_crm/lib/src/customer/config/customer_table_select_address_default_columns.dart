import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';

final customerTableSelectAddressDefaultColumns = [
  TableFieldConfig(
    width: 100,
    fieldKey: CustomerField.customId.name,
  ),
  TableFieldConfig(
    width: 140,
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
    width: 140,
    fieldKey: CustomerField.city.name,
  ),
  TableFieldConfig(
    width: 140,
    fieldKey: CustomerField.country.name,
  ),
];
