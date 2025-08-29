/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

enum DrucklayoutField implements _i1.SerializableModel {
  id,
  title,
  description,
  customerId,
  drucklayoutPreSelection,
  drucklayoutSelection,
  createdAt,
  createdBy,
  lastModifiedAt,
  lastModifiedBy,
  isDraft,
  deletedAt;

  static DrucklayoutField fromJson(String name) {
    switch (name) {
      case 'id':
        return DrucklayoutField.id;
      case 'title':
        return DrucklayoutField.title;
      case 'description':
        return DrucklayoutField.description;
      case 'customerId':
        return DrucklayoutField.customerId;
      case 'drucklayoutPreSelection':
        return DrucklayoutField.drucklayoutPreSelection;
      case 'drucklayoutSelection':
        return DrucklayoutField.drucklayoutSelection;
      case 'createdAt':
        return DrucklayoutField.createdAt;
      case 'createdBy':
        return DrucklayoutField.createdBy;
      case 'lastModifiedAt':
        return DrucklayoutField.lastModifiedAt;
      case 'lastModifiedBy':
        return DrucklayoutField.lastModifiedBy;
      case 'isDraft':
        return DrucklayoutField.isDraft;
      case 'deletedAt':
        return DrucklayoutField.deletedAt;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "DrucklayoutField"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
