import 'package:elbdesk_backend_core_client/elbdesk_backend_core_client.dart';
import 'package:elbdesk_client/elbdesk_client.dart';

/// Default configuration for the MigrationMatsPerson table
///
/// This configuration is used for the initial setup of the table
final migrationMatsPersonDefaultConfig = [
  TableFieldConfig(
    width: 100,
    fieldKey: MigrationMatsPersonField.idContact.name,
  ),
  TableFieldConfig(
    width: 150,
    fieldKey: MigrationMatsPersonField.nameFirst.name,
  ),
  TableFieldConfig(
    width: 150,
    fieldKey: MigrationMatsPersonField.nameLast.name,
  ),
  TableFieldConfig(
    width: 100,
    fieldKey: MigrationMatsPersonField.anrede.name,
  ),
  TableFieldConfig(
    width: 100,
    fieldKey: MigrationMatsPersonField.titel.name,
  ),
  TableFieldConfig(
    width: 150,
    fieldKey: MigrationMatsPersonField.department.name,
  ),
  TableFieldConfig(
    width: 150,
    fieldKey: MigrationMatsPersonField.position.name,
  ),
  TableFieldConfig(
    width: 150,
    fieldKey: MigrationMatsPersonField.email.name,
  ),
  TableFieldConfig(
    width: 120,
    fieldKey: MigrationMatsPersonField.telefon1.name,
  ),
  TableFieldConfig(
    width: 120,
    fieldKey: MigrationMatsPersonField.mobilTelefon.name,
  ),
  TableFieldConfig(
    width: 150,
    fieldKey: MigrationMatsPersonField.primaryCity.name,
  ),
  TableFieldConfig(
    width: 100,
    fieldKey: MigrationMatsPersonField.primaryPostalCode.name,
  ),
  TableFieldConfig(
    width: 100,
    fieldKey: MigrationMatsPersonField.status.name,
  ),
  TableFieldConfig(
    width: 100,
    fieldKey: MigrationMatsPersonField.isPerson.name,
  ),
  TableFieldConfig(
    width: 100,
    fieldKey: MigrationMatsPersonField.isMigrated.name,
  ),
];
