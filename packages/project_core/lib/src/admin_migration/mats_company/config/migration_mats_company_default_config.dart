import 'package:elbdesk_backend_core_client/elbdesk_backend_core_client.dart';
import 'package:elbdesk_client/elbdesk_client.dart';

/// Default configuration for the MigrationMatsCompany table
///
/// This configuration is used for the initial setup of the table
final migrationMatsCompanyDefaultConfig = [
  TableFieldConfig(
    width: 100,
    fieldKey: MigrationMatsCompanyField.idAccount.name,
  ),
  TableFieldConfig(
    width: 200,
    fieldKey: MigrationMatsCompanyField.account.name,
  ),
  TableFieldConfig(
    width: 200,
    fieldKey: MigrationMatsCompanyField.account2.name,
  ),
  TableFieldConfig(
    width: 200,
    fieldKey: MigrationMatsCompanyField.shippingStreet1.name,
  ),
  TableFieldConfig(
    width: 200,
    fieldKey: MigrationMatsCompanyField.shippingStreet2.name,
  ),
  TableFieldConfig(
    width: 100,
    fieldKey: MigrationMatsCompanyField.shippingPostalCode.name,
  ),
  TableFieldConfig(
    width: 150,
    fieldKey: MigrationMatsCompanyField.shippingCity.name,
  ),
  TableFieldConfig(
    width: 150,
    fieldKey: MigrationMatsCompanyField.shippingState.name,
  ),
  TableFieldConfig(
    width: 100,
    fieldKey: MigrationMatsCompanyField.shippingCountry.name,
  ),
  TableFieldConfig(
    width: 150,
    fieldKey: MigrationMatsCompanyField.phone1.name,
  ),
  TableFieldConfig(
    width: 150,
    fieldKey: MigrationMatsCompanyField.phone2.name,
  ),
  TableFieldConfig(
    width: 150,
    fieldKey: MigrationMatsCompanyField.fax.name,
  ),
  TableFieldConfig(
    width: 200,
    fieldKey: MigrationMatsCompanyField.email.name,
  ),
  TableFieldConfig(
    width: 200,
    fieldKey: MigrationMatsCompanyField.website.name,
  ),
  TableFieldConfig(
    width: 200,
    fieldKey: MigrationMatsCompanyField.isMigrated.name,
  ),
];
