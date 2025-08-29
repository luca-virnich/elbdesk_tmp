import 'package:elbdesk_backend_core_client/elbdesk_backend_core_client.dart';

/// Default configuration for the ServerpodLog table
///
/// This configuration is used for the initial setup of the table
final serverpodLogDefaultConfig = [
  TableFieldConfig(
    width: 180,
    fieldKey: ServerpodLogField.time.name,
  ),
  TableFieldConfig(
    width: 100,
    fieldKey: ServerpodLogField.logLevel.name,
  ),
  TableFieldConfig(
    width: 400,
    fieldKey: ServerpodLogField.message.name,
  ),
  TableFieldConfig(
    width: 300,
    fieldKey: ServerpodLogField.error.name,
  ),
  TableFieldConfig(
    width: 150,
    fieldKey: ServerpodLogField.reference.name,
  ),
  TableFieldConfig(
    width: 150,
    fieldKey: ServerpodLogField.serverId.name,
  ),
];
