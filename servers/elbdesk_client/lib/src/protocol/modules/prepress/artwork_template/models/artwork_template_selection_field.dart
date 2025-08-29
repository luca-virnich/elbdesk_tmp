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

enum ArtworkTemplateSelectionField implements _i1.SerializableModel {
  id,
  description,
  artworkTemplatePreSelectionId,
  createdAt,
  createdBy,
  lastModifiedAt,
  lastModifiedBy,
  deletedAt,
  isDraft;

  static ArtworkTemplateSelectionField fromJson(String name) {
    switch (name) {
      case 'id':
        return ArtworkTemplateSelectionField.id;
      case 'description':
        return ArtworkTemplateSelectionField.description;
      case 'artworkTemplatePreSelectionId':
        return ArtworkTemplateSelectionField.artworkTemplatePreSelectionId;
      case 'createdAt':
        return ArtworkTemplateSelectionField.createdAt;
      case 'createdBy':
        return ArtworkTemplateSelectionField.createdBy;
      case 'lastModifiedAt':
        return ArtworkTemplateSelectionField.lastModifiedAt;
      case 'lastModifiedBy':
        return ArtworkTemplateSelectionField.lastModifiedBy;
      case 'deletedAt':
        return ArtworkTemplateSelectionField.deletedAt;
      case 'isDraft':
        return ArtworkTemplateSelectionField.isDraft;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "ArtworkTemplateSelectionField"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
