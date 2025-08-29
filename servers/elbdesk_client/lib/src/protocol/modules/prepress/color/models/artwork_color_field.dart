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

enum ArtworkColorField implements _i1.SerializableModel {
  id,
  colorName,
  shortName,
  color,
  colorPalette,
  l,
  a,
  b,
  colorSpecType,
  colorType,
  verarbeitungsEbene,
  printProcess,
  screenLineature,
  screenAngle,
  screenPointForm,
  boost,
  customText,
  actions,
  move,
  createdAt,
  createdBy,
  lastModifiedAt,
  lastModifiedBy,
  deletedAt,
  isDraft;

  static ArtworkColorField fromJson(String name) {
    switch (name) {
      case 'id':
        return ArtworkColorField.id;
      case 'colorName':
        return ArtworkColorField.colorName;
      case 'shortName':
        return ArtworkColorField.shortName;
      case 'color':
        return ArtworkColorField.color;
      case 'colorPalette':
        return ArtworkColorField.colorPalette;
      case 'l':
        return ArtworkColorField.l;
      case 'a':
        return ArtworkColorField.a;
      case 'b':
        return ArtworkColorField.b;
      case 'colorSpecType':
        return ArtworkColorField.colorSpecType;
      case 'colorType':
        return ArtworkColorField.colorType;
      case 'verarbeitungsEbene':
        return ArtworkColorField.verarbeitungsEbene;
      case 'printProcess':
        return ArtworkColorField.printProcess;
      case 'screenLineature':
        return ArtworkColorField.screenLineature;
      case 'screenAngle':
        return ArtworkColorField.screenAngle;
      case 'screenPointForm':
        return ArtworkColorField.screenPointForm;
      case 'boost':
        return ArtworkColorField.boost;
      case 'customText':
        return ArtworkColorField.customText;
      case 'actions':
        return ArtworkColorField.actions;
      case 'move':
        return ArtworkColorField.move;
      case 'createdAt':
        return ArtworkColorField.createdAt;
      case 'createdBy':
        return ArtworkColorField.createdBy;
      case 'lastModifiedAt':
        return ArtworkColorField.lastModifiedAt;
      case 'lastModifiedBy':
        return ArtworkColorField.lastModifiedBy;
      case 'deletedAt':
        return ArtworkColorField.deletedAt;
      case 'isDraft':
        return ArtworkColorField.isDraft;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "ArtworkColorField"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
