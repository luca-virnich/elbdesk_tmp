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

enum PrepressColorPaletteField implements _i1.SerializableModel {
  id,
  paletteName,
  description,
  customer,
  customerId,
  createdAt,
  createdBy,
  lastModifiedAt,
  lastModifiedBy,
  deletedAt,
  isDraft;

  static PrepressColorPaletteField fromJson(String name) {
    switch (name) {
      case 'id':
        return PrepressColorPaletteField.id;
      case 'paletteName':
        return PrepressColorPaletteField.paletteName;
      case 'description':
        return PrepressColorPaletteField.description;
      case 'customer':
        return PrepressColorPaletteField.customer;
      case 'customerId':
        return PrepressColorPaletteField.customerId;
      case 'createdAt':
        return PrepressColorPaletteField.createdAt;
      case 'createdBy':
        return PrepressColorPaletteField.createdBy;
      case 'lastModifiedAt':
        return PrepressColorPaletteField.lastModifiedAt;
      case 'lastModifiedBy':
        return PrepressColorPaletteField.lastModifiedBy;
      case 'deletedAt':
        return PrepressColorPaletteField.deletedAt;
      case 'isDraft':
        return PrepressColorPaletteField.isDraft;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "PrepressColorPaletteField"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
