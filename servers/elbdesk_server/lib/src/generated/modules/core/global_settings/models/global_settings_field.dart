/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

enum GlobalSettingsField implements _i1.SerializableModel {
  id,
  outputPath,
  aeEndpointPath,
  createdAt,
  createdBy,
  lastModifiedAt,
  lastModifiedBy,
  deletedAt,
  isDraft;

  static GlobalSettingsField fromJson(String name) {
    switch (name) {
      case 'id':
        return GlobalSettingsField.id;
      case 'outputPath':
        return GlobalSettingsField.outputPath;
      case 'aeEndpointPath':
        return GlobalSettingsField.aeEndpointPath;
      case 'createdAt':
        return GlobalSettingsField.createdAt;
      case 'createdBy':
        return GlobalSettingsField.createdBy;
      case 'lastModifiedAt':
        return GlobalSettingsField.lastModifiedAt;
      case 'lastModifiedBy':
        return GlobalSettingsField.lastModifiedBy;
      case 'deletedAt':
        return GlobalSettingsField.deletedAt;
      case 'isDraft':
        return GlobalSettingsField.isDraft;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "GlobalSettingsField"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
