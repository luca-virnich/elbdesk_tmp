import 'package:elbdesk_backend_core_client/elbdesk_backend_core_client.dart';

/// Default configuration for the FlutterLog table
///
/// This configuration is used for the initial setup of the table
final flutterLogDefaultConfig = [
  TableFieldConfig(
    width: 180,
    fieldKey: FlutterLogField.time.name,
  ),
  TableFieldConfig(
    width: 400,
    fieldKey: FlutterLogField.exception.name,
  ),
  TableFieldConfig(
    width: 300,
    fieldKey: FlutterLogField.context.name,
  ),
  TableFieldConfig(
    width: 300,
    fieldKey: FlutterLogField.stack.name,
  ),
  TableFieldConfig(
    width: 150,
    fieldKey: FlutterLogField.platform.name,
  ),
  TableFieldConfig(
    width: 150,
    fieldKey: FlutterLogField.appVersion.name,
  ),
];
