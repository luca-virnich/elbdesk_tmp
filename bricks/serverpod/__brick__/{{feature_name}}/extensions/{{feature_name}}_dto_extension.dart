import 'package:elbdesk_server/src/generated/protocol.dart';

/// Extension on {{#pascalCase}}{{feature_name}}{{/pascalCase}}DTO to provide field value access functionality
extension {{#pascalCase}}{{feature_name}}{{/pascalCase}}DTOExtension on {{#pascalCase}}{{feature_name}}{{/pascalCase}}DTO {
  /// Gets the string value for a given field from this {{feature_name}}.
  ///
  /// Returns the string value for the specified field, or null if the field
  /// doesn't support string value extraction.
  String? getFieldValue({{#pascalCase}}{{feature_name}}{{/pascalCase}}Field field) {
    switch (field) {
      case {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.name:
        return name;
      case {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.description:
        return description;
      case {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.id:
      case {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.createdAt:
      case {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.createdBy:
      case {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.lastModifiedAt:
      case {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.lastModifiedBy:
      case {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.isDraft:
      case {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.deletedAt:
        return null;
    }
  }
} 
