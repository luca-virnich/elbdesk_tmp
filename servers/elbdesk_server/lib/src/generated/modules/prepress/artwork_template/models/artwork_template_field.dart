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

enum ArtworkTemplateField implements _i1.SerializableModel {
  id,
  description,
  customer,
  templateType,
  artworkTemplateSelection,
  artworkTemplatePreSelection,
  trappNormal,
  trappBlack,
  trappBilder,
  trappSonderfarben,
  trappRueckzug,
  anschnitt,
  layers,
  createdAt,
  createdBy,
  lastModifiedAt,
  lastModifiedBy,
  deletedAt,
  isDraft;

  static ArtworkTemplateField fromJson(String name) {
    switch (name) {
      case 'id':
        return ArtworkTemplateField.id;
      case 'description':
        return ArtworkTemplateField.description;
      case 'customer':
        return ArtworkTemplateField.customer;
      case 'templateType':
        return ArtworkTemplateField.templateType;
      case 'artworkTemplateSelection':
        return ArtworkTemplateField.artworkTemplateSelection;
      case 'artworkTemplatePreSelection':
        return ArtworkTemplateField.artworkTemplatePreSelection;
      case 'trappNormal':
        return ArtworkTemplateField.trappNormal;
      case 'trappBlack':
        return ArtworkTemplateField.trappBlack;
      case 'trappBilder':
        return ArtworkTemplateField.trappBilder;
      case 'trappSonderfarben':
        return ArtworkTemplateField.trappSonderfarben;
      case 'trappRueckzug':
        return ArtworkTemplateField.trappRueckzug;
      case 'anschnitt':
        return ArtworkTemplateField.anschnitt;
      case 'layers':
        return ArtworkTemplateField.layers;
      case 'createdAt':
        return ArtworkTemplateField.createdAt;
      case 'createdBy':
        return ArtworkTemplateField.createdBy;
      case 'lastModifiedAt':
        return ArtworkTemplateField.lastModifiedAt;
      case 'lastModifiedBy':
        return ArtworkTemplateField.lastModifiedBy;
      case 'deletedAt':
        return ArtworkTemplateField.deletedAt;
      case 'isDraft':
        return ArtworkTemplateField.isDraft;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "ArtworkTemplateField"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
