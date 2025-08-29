import 'package:elbdesk_client/elbdesk_client.dart';

List<TableFieldConfig> {{#camelCase}}{{feature_name}}{{/camelCase}}TableDefaultColumns = [
  TableFieldConfig(
    width: 100,
    fieldKey: {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.name.name,
  ),
  TableFieldConfig(
    width: 150,
    fieldKey: {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.description.name,
  ),
  TableFieldConfig(
    width: 150,
    fieldKey: {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.createdAt.name,
  ),
  TableFieldConfig(
    width: 150,
    fieldKey: {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.createdBy.name,
  ),
]; 
