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

enum BearerField implements _i1.SerializableModel {
  id,
  type,
  bearerName,
  description,
  longText,
  costCenterCode,
  createdAt,
  createdBy,
  editingSince,
  editingBy,
  deletedAt,
  isDraft;

  static BearerField fromJson(String name) {
    switch (name) {
      case 'id':
        return BearerField.id;
      case 'type':
        return BearerField.type;
      case 'bearerName':
        return BearerField.bearerName;
      case 'description':
        return BearerField.description;
      case 'longText':
        return BearerField.longText;
      case 'costCenterCode':
        return BearerField.costCenterCode;
      case 'createdAt':
        return BearerField.createdAt;
      case 'createdBy':
        return BearerField.createdBy;
      case 'editingSince':
        return BearerField.editingSince;
      case 'editingBy':
        return BearerField.editingBy;
      case 'deletedAt':
        return BearerField.deletedAt;
      case 'isDraft':
        return BearerField.isDraft;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "BearerField"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
